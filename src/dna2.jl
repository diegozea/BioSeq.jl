abstract DNA2

## 2-bit DNA Seq Type ##

type DNA2Seq <: DNA2
  b1::BitVector
  b2::BitVector
  DNA2Seq(b1::BitVector,b2::BitVector) = new(b1,b2)
end

DNA2Seq(len::Int) = DNA2Seq(BitArray(len),BitArray(len))

## DNA2Base Type ##

type DNA2Base <: DNA2
  b1::Bool
  b2::Bool
  DNA2Base(b1::Bool,b2::Bool) = new(b1,b2)
end

## Selection ##

ref(s::DNA2Seq,ind::Int)  = DNA2Base(ref(s.b1,ind),ref(s.b2,ind))

ref(s::DNA2Seq,ind...)    = DNA2Seq(ref(s.b1,ind...),ref(s.b2,ind...))

## Assignation ##

function assign(s::DNA2Seq,x::DNA2Base,ind...)
  assign(s.b1,x.b1,ind...)
  assign(s.b2,x.b2,ind...)
end

function assign(s::DNA2Seq,x,ind...)
  inseq = convert(DNA2Base,x)
  assign(s.b1,inseq.b1,ind...)
  assign(s.b2,inseq.b2,ind...)
end

## Copy ##

copy(seq::DNA2Seq) = DNA2Seq(copy(seq.b1),copy(seq.b2))

## length ##

length(s::DNA2Seq) = length(s.b1)

## Convertions ##

##	A	C	T	G
## b1	0	0	1	1
## b2	0	1	0	1

const _convert_to_char = ['A' 'C';'T' 'G']

function convert{T<:Integer}(::Type{Array{T,1}},s::DNA2Seq)
  len = length(s)
  out = Array(T,len)
  for i in 1:len
    out[i] = _convert_to_char[s.b1[i]+1,s.b2[i]+1]
  end
  out
end

function convert{T<:Integer}(::Type{T},s::DNA2Base)
    convert(T,_convert_to_char[s.b1+1,s.b2+1])
end

const _convert_to_base2 = Array(DNA2Base,7)

_convert_to_base2[1] = DNA2Base(false,false)
_convert_to_base2[3] = DNA2Base(false,true)
_convert_to_base2[4] = DNA2Base(true,false)
_convert_to_base2[7] = DNA2Base(true,true)

function convert{T<:Integer}(::Type{DNA2Seq},s::Vector{T})
  len = length(s)
  seq = DNA2Seq(len)
  for i in 1:len
    seq[i] = _convert_to_base2[s[i] & 7]
  end
  seq
end

function convert{T<:Integer}(::Type{DNA2Base},s::T)
  _convert_to_base2[s & 7]
end

dna2{T<:Integer}(x::Vector{T}) = convert(DNA2Seq,x)
dna2{T<:Integer}(x::T) = convert(DNA2Base,x)

macro dna2_str(s);  :(dna2(@b_str($s))); end

convert(::Type{ASCIIString}, seq::DNA2Seq) = ASCIIString(convert(Vector{Uint8},seq))
convert(::Type{DNA2Seq}, str::ASCIIString) = dna2(str.data)

bytestring(seq::DNA2Seq) = bytestring(convert(Vector{Uint8},seq))

dna2(x::ASCIIString) = convert(DNA2Seq,x)

nucleotide(seq::DNA2Seq)  = convert(Vector{Nucleotide},seq)

## == ##

promote_rule{T<:Integer,B<:DNA2}(::Type{B}, ::Type{T} ) = T
promote_rule{T<:Integer,B<:DNA2}(::Type{T}, ::Type{B} ) = T

isequal{T<:DNA2}(S1::T, S2::T) = isequal(S1.b1,S2.b1) && isequal(S1.b2,S2.b2)

isequal{T<:Integer,B<:DNA2}(S1::B, S2::T) = isequal(promote(S1,S2)...)
isequal{T<:Integer,B<:DNA2}(S1::T, S2::B) = isequal(promote(S1,S2)...)

## Loop ##

isempty(s::DNA2Seq) = length(s) == 0

start(s::DNA2Seq) = 1
next(s::DNA2Seq,i) = (s[i],i+1)
done(s::DNA2Seq,i) = (i > length(s))

## Write and Show ##

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

show(io::IO,x::DNA2Base) = (write(io,uint8(x)); nothing)

## Complement ##

complement!{T<:DNA2}(seq::T) = (seq.b1 = ~seq.b1 ; seq)
complement{T<:DNA2}(seq::T) = complement!(copy(seq))

reversecomplement!{T<:DNA2}(seq::T) = (reverse!(seq.b1); seq.b1 = ~seq.b1; reverse!(seq.b2); seq )
reversecomplement{T<:DNA2}(seq::T) = reversecomplement!(copy(seq))

## Faster using bit level parallelism:

##	A	C	T	G
## b1	0	0	1	1
## b2	0	1	0	1

## A: ~ (b1 | b2)
isadenine{T<:DNA2}(seq::T)	= ~ ( seq.b1 | seq.b2 )
## G: b1 & b2
isguanine{T<:DNA2}(seq::T)	= seq.b1 & seq.b2
## C: ~b1 & b2
iscytosine{T<:DNA2}(seq::T)	= ~seq.b1 & seq.b2
## T: b1 & ~b2
isthymine{T<:DNA2}(seq::T)	= seq.b1 & ~seq.b2
## AT: ~b2
isweak{T<:DNA2}(seq::T)		= ~seq.b2
## CG: b2
isstrong{T<:DNA2}(seq::T)	= seq.b2
## CT: b1 $ b2
ispyrimidine{T<:DNA2}(seq::T)	= seq.b1 $ seq.b2
## AG: ~( b1 $ b2 )
ispurine{T<:DNA2}(seq::T)	= ~( seq.b1 $ seq.b2 )

function percentGC(seq::DNA2Seq)
  len = length(seq)
  c2 = seq.b2.chunks
  chunks_len = length(c2)
  sum_ones = 0
  for i in 1:chunks_len
    sum_ones += count_ones(c2[i])
  end
  sum_ones/len
end



