function _tomatrix(s::Array{String,1},t::Type)
  row = length(s)
  col = length(s[1])
  out = Array(t,row,col)
  for i in 1:row
    for j in 1:col
      out[i,j] = s[i][j]
    end
  end
  out'
end

function _codon_to_dict!(codon::Vector{Nucleotide},dict::Dict{Vector{Nucleotide},Int},i::Int)
    uppercase!(codon)
    dict[ copy(codon) ] = i
    for j in [ 1:2 , 2:3, 1:1, 2:2 , 3:3 , 1:3 ]
      uppercase!(codon)
      lowercase!(sub(codon,j))
      dict[ copy(codon) ] = i
    end
end

function _codon_to_ind(codones::Array{Char,2})
   _codon_to_int = Dict{Vector{Nucleotide},Int}()
  for i in 1:64
    codon = nucleotide(vec(codones[i,:]))
    _codon_to_dict!(codon,_codon_to_int,i)
    dna2rna!(codon)
    _codon_to_dict!(codon,_codon_to_int,i)
  end
  _codon_to_int
end

function _map_to_id(ids::Array{Int,1})
  out = zeros(Int,max(ids))
  for i in 1:length(ids)
    out[ids[i]] = i
  end
  out
end

function _parse_gc(fh::IOStream)
  ids = Int[]
  amino = String[]
  start = String[]
  base1 = ""
  base2 = ""
  base3 = ""
  
  r_comment = r"^--"
  r_id = r"id\s+(\d+)\s+,"
  r_amino = r"\s+ncbieaa\s+\"(.+)\""
  r_start = r"\s+sncbieaa\s+\"(.+)\""
  r_base1 = r"\s+-- Base1\s+(\S+)"
  r_base2 = r"\s+-- Base2\s+(\S+)"
  r_base3 = r"\s+-- Base3\s+(\S+)"
  
  for line in eachline(fh)
    if(!ismatch(r_comment,line))
      if(ismatch(r_id,line))
	push!(ids,int(match(r_id,line).captures[1]::ASCIIString))
      elseif(ismatch(r_amino,line))
	push!(amino,match(r_amino,line).captures[1]::ASCIIString)
      elseif(ismatch(r_start,line))
	push!(start,match(r_start,line).captures[1]::ASCIIString)
      elseif base1=="" && ismatch(r_base1,line)
	base1 = match(r_base1,line).captures[1]::ASCIIString
      elseif base2=="" && ismatch(r_base2,line)
	base2 = match(r_base2,line).captures[1]::ASCIIString
      elseif base3=="" && ismatch(r_base3,line)
	base3 = match(r_base3,line).captures[1]::ASCIIString
      end
    end
  end
  
  _map_to_id(ids),
  _tomatrix(amino,AminoAcid),
  _tomatrix(start,AminoAcid) .== 'M' ,
  _codon_to_ind( [ collect(base1) collect(base2) collect(base3) ] )
  
end

immutable CodonTables
  ids::Vector{Int}
  amino::Matrix{AminoAcid}
  start::BitArray{2}
  codons::Dict{Vector{Nucleotide},Int}
  
  CodonTables(t::Vector{Int},a::Matrix{AminoAcid},s::BitArray{2},c::Dict{Vector{Nucleotide},Int}) = new(t,a,s,c)
end

CodonTables(fh::IOStream) = CodonTables(_parse_gc(fh)...)

fh = open(Pkg.dir("BioSeq", "data", "gc.prt"),"r")

const CODON_TABLES = CodonTables(fh);

close(fh)

function show(io::IO,ct::CodonTables)
  println("Table IDs:")
  println([1:length(ct.ids)][ct.ids .!= 0])
  println(CODON_TABLES.amino)
  println("Codons IDs:")
  print(collect(CODON_TABLES.codons))
end

codon2aa(codon,tableid::Int) = CODON_TABLES.amino[ CODON_TABLES.codons[codon] , CODON_TABLES.ids[tableid] ]

function isstop(seq,tableid::Int)
  idx = CODON_TABLES.ids[tableid]
  len = length(seq)
  if len==3
    return( CODON_TABLES.amino[ CODON_TABLES.codons[ seq ] , idx ] == '*' )
  else
    ncod = int(floor(len/3))
    out = falses(ncod)
    for i in 1:ncod
      out[i] = CODON_TABLES.amino[ CODON_TABLES.codons[ seq[(3i - 2):(3i)] ] , idx ] == '*'
    end
  return(out)
  end
end

isstop(tableid::Int) = CODON_TABLES.amino[ : , CODON_TABLES.ids[tableid] ] .== '*'

function isstart(seq,tableid::Int)
  idx = CODON_TABLES.ids[tableid]
  len = length(seq)
  if len==3
    return( CODON_TABLES.start[ CODON_TABLES.codons[ seq ] , idx ] )
  else
    ncod = int(floor(len/3))
    out = falses(ncod)
    for i in 1:ncod
      out[i] = CODON_TABLES.start[ CODON_TABLES.codons[ seq[(3i - 2):(3i)] ] , idx ]
    end
  return(out)
  end
end

isstart(tableid::Int) = CODON_TABLES.start[ : , CODON_TABLES.ids[tableid] ]

function translateCDS(seq,tableid::Int)
  len = length(seq)
  idx = CODON_TABLES.ids[tableid]
  if len%3 == 0 
    if CODON_TABLES.start[ CODON_TABLES.codons[  seq[1:3] ] , idx ] 
      if CODON_TABLES.amino[ CODON_TABLES.codons[ seq[len-2:len] ] , idx ] == '*'
	out = Array( AminoAcid, div(len,3)-1 )
	ind = 1
	out[ ind ] = 'M'
	for i in 4:3:len-5
	  ind += 1
	  out[ ind ] = CODON_TABLES.amino[ CODON_TABLES.codons[ seq[i:i+2] ] , idx ]
	  if out[ ind ] == '*'
	    throw("$(seq[i:i+2]) at $i is a stop codon on Table $tableid")
	  end
	end
	return(out)
      else
	throw("$(seq[len-2:len]) is not a valid stop codon on Table $tableid")
      end
    else
      throw("$(seq[1:3]) is not a valid start codon on Table $tableid")
    end
  else
    throw("CDS length must be a multiple of three")
  end
end

function translatetostop(seq,tableid::Int)
  idx = CODON_TABLES.ids[tableid]
  out = AminoAcid[]
  for i in 1:3:length(seq)-2
    aa = CODON_TABLES.amino[ CODON_TABLES.codons[ seq[i:i+2] ] , idx ]
    if aa != '*'
      push!( out , aa )
    else
      return(out)
    end
  end
  return(out)
end

function translate(seq,tableid::Int)
  idx = CODON_TABLES.ids[tableid]
  out = AminoAcid[]
  for i in 1:3:length(seq)-2
    push!( out , CODON_TABLES.amino[ CODON_TABLES.codons[ seq[i:i+2] ] , idx ] )
  end
  return(out)
end
