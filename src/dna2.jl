type DNA2Seq
  b1::BitVector
  b2::BitVector
  DNA2Seq(b1::BitVector,b2::BitVector) = new(b1,b2)
end

DNA2Seq(len::Int) = DNA2Seq(falses(len),falses(len))

function DNA2Seq(b1::Bool,b2::Bool)
  bitvec1 = b1 ? trues(1) : falses(1)
  bitvec2 = b2 ? trues(1) : falses(1)
  DNA2Seq(bitvec1,bitvec2)
end

show(io::IO,s::DNA2Seq) = show(io,(s.b1,s.b2)) ## Make it better

length(s::DNA2Seq) = length(s.b1)

ref(s::DNA2Seq,ind::Int)  = DNA2Seq(ref(s.b1,ind),ref(s.b2,ind))
ref(s::DNA2Seq,ind...)    = DNA2Seq(ref(s.b1,ind...),ref(s.b2,ind...))

isequal(S1::DNA2Seq, S2::DNA2Seq) = isequal(S1.b1,S2.b1) && isequal(S1.b2,S2.b2)

promote_rule{T<:Integer}(::Type{DNA2Seq}, ::Type{T} ) = T
promote_rule{T<:Integer}(::Type{T}, ::Type{DNA2Seq} ) = T

isequal{T<:Integer}(S1::DNA2Seq, S2::T) = isequal(promote(S1,S2)...)
isequal{T<:Integer}(S1::T, S2::DNA2Seq) = isequal(promote(S1,S2)...)

const _convert_mat = ['T' 'G'; 'C' 'A']

function convert{T<:Integer}(::Type{Array{T,1}},s::DNA2Seq)
  len = length(s)
  out = Array(T,len)
  for i in 1:len
    out[i] = _convert_mat[s.b1[i]+1,s.b2[i]+1]
  end
  out
end

function convert{T<:Integer}(::Type{T},s::DNA2Seq)
  if length(s) == 1
    return(convert(T,_convert_mat[s.b1[1]+1,s.b2[1]+1]))
  else
    throw(BoundsError())
  end
end

const _ind_convert = zeros(Int,128)
_ind_convert['A'] = 1
_ind_convert['a'] = 1
_ind_convert['C'] = 2
_ind_convert['c'] = 2
_ind_convert['G'] = 3
_ind_convert['g'] = 3
_ind_convert['T'] = 4
_ind_convert['t'] = 4

const _b1_bool_convert = zeros(Bool,4)
const _b2_bool_convert = zeros(Bool,4)
_b1_bool_convert[1] = true
_b2_bool_convert[1] = true
_b1_bool_convert[2] = true
_b2_bool_convert[3] = true

function convert{T<:Integer}(::Type{DNA2Seq},s::Vector{T})
  len::Int = length(s)
  b1 = falses(len)
  b2 = falses(len)
  for i in 1:len
    j::Int = s[i]
    if j | 32 != 116 # 't'
      j = _ind_convert[j]
      b1[i] = _b1_bool_convert[j]
      b2[i] = _b2_bool_convert[j]
    end
  end
  DNA2Seq(b1,b2)
end

function convert{T<:Integer}(::Type{DNA2Seq},s::T)
  DNA2Seq(_b1_bool_convert[_ind_convert[s]],_b2_bool_convert[_ind_convert[s]])
end

complement!(seq::DNA2Seq) = DNA2Seq(~seq.b1,~seq.b2)
complement(seq::DNA2Seq) = DNA2Seq(~copy(seq.b1),~copy(seq.b2))

reversecomplement!(seq::DNA2Seq) = DNA2Seq(~reverse!(seq.b1),~reverse!(seq.b2))
reversecomplement(seq::DNA2Seq) = DNA2Seq(~reverse!(copy(seq.b1)),~reverse!(copy(seq.b2)))

function percentGC(seq::DNA2Seq)
  len = length(seq)
  sum = 0
  for i in 1:len
    if seq.b1[i] != seq.b2[i]
      sum += 1
    end
  end
  sum/len
end

start(s::DNA2Seq) = 1
next(s::DNA2Seq,i) = (s[i],i+1)
done(s::DNA2Seq,i) = (i > length(s))

dna2seq(x) = convert(DNA2Seq,x)
macro dna2_str(s);   ex = interp_parse_bytes(s); :(dna2seq(($ex).data)); end

convert(::Type{ASCIIString}, seq::DNA2Seq) = ASCIIString(convert(Vector{Uint8},seq))
convert(::Type{DNA2Seq}, str::ASCIIString) = dna2seq(str.data)

bytestring(seq::DNA2Seq) = bytestring(convert(Vector{Uint8},seq))

nt(seq::DNA2Seq)  = convert(Vector{Nucleotide},seq)

function assign(s::DNA2Seq,x,val...)
  inseq = convert(DNA2Seq,x)
  assign(s.b1,inseq.b1,val...)
  assign(s.b2,inseq.b2,val...)
end

isempty(s::DNA2Seq) = length(s) == 0

function show(io::IO,seq::DNA2Seq)
  len = length(seq)
  print(len)
  println(" bp DNA2Seq:")
  if len > 0
    screen = tty_rows() > 6 ? tty_rows() - 5 : tty_rows()
    if length(seq) <= screen
      print(" ")
      print(char(seq[1]))
      if(len>1)
	for i in 2:len
	  print("\n")
	  print(" ")
	  print(char(seq[i]))
	end
      end
    else
      partlen = int((screen)/2) - 1
      for i in 1:partlen
	print(" ")
	println(char(seq[i]))
      end
      print(" \u22ee")
      for i in (len-partlen):len
	print("\n")
	print(" ")
	print(char(seq[i]))
      end
    end
  end
end

function write(io::IO,seq::DNA2Seq)
  for bp in seq
    write(io,char(bp))
  end
end

