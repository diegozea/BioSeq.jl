abstract Nucleotide2bit

## 2-bit DNA Seq Type ##

type Nucleotide2bitSeq <: Nucleotide2bit
  b1::BitVector
  b2::BitVector
  Nucleotide2bitSeq(b1::BitVector,b2::BitVector) = new(b1,b2)
end

Nucleotide2bitSeq(len::Int) = Nucleotide2bitSeq(BitArray(len),BitArray(len))

## Nucleotide2bitBase Type ##

immutable Nucleotide2bitBase <: Nucleotide2bit
  b1::Bool
  b2::Bool
  Nucleotide2bitBase(b1::Bool,b2::Bool) = new(b1,b2)
end

## Selection ##

getindex(s::Nucleotide2bitSeq,ind::Int)  = Nucleotide2bitBase(getindex(s.b1,ind),getindex(s.b2,ind))

getindex(s::Nucleotide2bitSeq,ind...)    = Nucleotide2bitSeq(getindex(s.b1,ind...),getindex(s.b2,ind...))

## Assignation ##

function setindex!(s::Nucleotide2bitSeq,x::Nucleotide2bitBase,ind...)
  setindex!(s.b1,x.b1,ind...)
  setindex!(s.b2,x.b2,ind...)
end

function setindex!(s::Nucleotide2bitSeq,x,ind...)
  inseq = convert(Nucleotide2bitBase,x)
  setindex!(s.b1,inseq.b1,ind...)
  setindex!(s.b2,inseq.b2,ind...)
end

## Copy ##

copy(seq::Nucleotide2bitSeq) = Nucleotide2bitSeq(copy(seq.b1),copy(seq.b2))

## length ##

length(s::Nucleotide2bitSeq) = length(s.b1)

## Convertions ##

##	A	C	T	G
## b1	0	0	1	1
## b2	0	1	0	1

const _convert_to_Char = ['A' 'C';'T' 'G']

function convert{T<:Union{Integer, Char}}(::Type{Array{T,1}},s::Nucleotide2bitSeq)
  len = length(s)
  out = Array(T,len)
  for i in 1:len
    out[i] = _convert_to_Char[s.b1[i]+1,s.b2[i]+1]
  end
  out
end

function convert{T<:Union{Integer, Char}}(::Type{T},s::Nucleotide2bitBase)
    convert(T,_convert_to_Char[s.b1+1,s.b2+1])
end

const _convert_to_base2_index = zeros(UInt8,256)
_convert_to_base2_index[Int('A')] = 1
_convert_to_base2_index[Int('a')] = 1
_convert_to_base2_index[Int('C')] = 2
_convert_to_base2_index[Int('c')] = 2
_convert_to_base2_index[Int('T')] = 3
_convert_to_base2_index[Int('t')] = 3
_convert_to_base2_index[Int('U')] = 3
_convert_to_base2_index[Int('u')] = 3
_convert_to_base2_index[Int('G')] = 4
_convert_to_base2_index[Int('g')] = 4

const _convert_to_base2 = Array(Nucleotide2bitBase,4)

_convert_to_base2[1] = Nucleotide2bitBase(false,false)
_convert_to_base2[2] = Nucleotide2bitBase(false,true)
_convert_to_base2[3] = Nucleotide2bitBase(true,false)
_convert_to_base2[4] = Nucleotide2bitBase(true,true)

function convert{T<:Union{Integer, Char}}(::Type{Nucleotide2bitSeq},s::Vector{T})
  len = length(s)
  seq = Nucleotide2bitSeq(len)
  for i in 1:len
    seq[i] = _convert_to_base2[ _convert_to_base2_index[ s[i] ] ]
  end
  seq
end

function convert{T<:Union{Integer, Char}}(::Type{Nucleotide2bitBase},s::T)
  _convert_to_base2[ _convert_to_base2_index[ s ] ]
end

nucleotide2bit{T<:Union{Integer, Char}}(x::Vector{T}) = convert(Nucleotide2bitSeq,x)
nucleotide2bit{T<:Union{Integer, Char}}(x::T) = convert(Nucleotide2bitBase,x)

macro nt2_str(s);  :(nucleotide2bit(@b_str($s))); end

convert(::Type{ASCIIString}, seq::Nucleotide2bitSeq) = ASCIIString(convert(Vector{UInt8},seq))
convert(::Type{Nucleotide2bitSeq}, str::ASCIIString) = nucleotide2bit(str.data)

bytestring(seq::Nucleotide2bitSeq) = bytestring(convert(Vector{UInt8},seq))

nucleotide2bit(x::ASCIIString) = convert(Nucleotide2bitSeq,x)

nucleotide(seq::Nucleotide2bitSeq)  = convert(Vector{Nucleotide},seq)

## == ##

promote_rule{T<:Union{Integer, Char},B<:Nucleotide2bit}(::Type{B}, ::Type{T} ) = T
promote_rule{T<:Union{Integer, Char},B<:Nucleotide2bit}(::Type{T}, ::Type{B} ) = T

promote_rule{T<:Union{Integer, Char}}(::Type{Nucleotide2bitSeq}, ::Type{Vector{T}} ) = Vector{T}
promote_rule{T<:Union{Integer, Char}}(::Type{Vector{T}}, ::Type{Nucleotide2bitSeq} ) = Vector{T}

=={T<:Nucleotide2bit}(S1::T, S2::T) = ==(S1.b1,S2.b1) && ==(S1.b2,S2.b2)


=={T<:Union{Integer, Char},B<:Nucleotide2bit}(S1::B, S2::T) = ==(promote(S1,S2)...)
=={T<:Union{Integer, Char},B<:Nucleotide2bit}(S1::T, S2::B) = ==(promote(S1,S2)...)

=={T<:Union{Integer, Char}}(S1::Nucleotide2bitSeq, S2::Vector{T}) = ==(promote(S1,S2)...)
=={T<:Union{Integer, Char}}(S1::Vector{T}, S2::Nucleotide2bitSeq) = ==(promote(S1,S2)...)

# Julia 0.2 compatibility
isequal{T<:Nucleotide2bit}(S1::T, S2::T) = isequal(S1.b1,S2.b1) && isequal(S1.b2,S2.b2)

isequal{T<:Union{Integer, Char},B<:Nucleotide2bit}(S1::B, S2::T) = isequal(promote(S1,S2)...)
isequal{T<:Union{Integer, Char},B<:Nucleotide2bit}(S1::T, S2::B) = isequal(promote(S1,S2)...)

isequal{T<:Union{Integer, Char}}(S1::Nucleotide2bitSeq, S2::Vector{T}) = isequal(promote(S1,S2)...)
isequal{T<:Union{Integer, Char}}(S1::Vector{T}, S2::Nucleotide2bitSeq) = isequal(promote(S1,S2)...)

## Loop ##

isempty(s::Nucleotide2bitSeq) = length(s) == 0

start(s::Nucleotide2bitSeq) = 1
next(s::Nucleotide2bitSeq,i) = (s[i],i+1)
done(s::Nucleotide2bitSeq,i) = (i > length(s))

## Write and Show ##

function show(io::IO,seq::Nucleotide2bitSeq)
  len = length(seq)
  print(len)
  println(" bp Nucleotide2bitSeq:")
  if len > 0
    screen = Base.tty_size()[1] > 6 ? Base.tty_size()[1] - 5 : Base.tty_size()[1]
    if length(seq) <= screen
      print(" ")
      print(Char(seq[1]))
      if(len>1)
	for i in 2:len
	  print("\n")
	  print(" ")
	  print(Char(seq[i]))
	end
      end
    else
      partlen = Int((screen)/2) - 1
      for i in 1:partlen
	print(" ")
	println(Char(seq[i]))
      end
      print(" \u22ee")
      for i in (len-partlen):len
	print("\n")
	print(" ")
	print(Char(seq[i]))
      end
    end
  end
end

function write(io::IO,seq::Nucleotide2bitSeq)
  for bp in seq
    write(io,Char(bp))
  end
end

show(io::IO,x::Nucleotide2bitBase) = (write(io,UInt8(x)); nothing)

## Complement ##

complement!{T<:Nucleotide2bit}(seq::T) = (seq.b1 = ~seq.b1 ; seq)
complement{T<:Nucleotide2bit}(seq::T) = complement!(copy(seq))

reversecomplement!{T<:Nucleotide2bit}(seq::T) = (reverse!(seq.b1); seq.b1 = ~seq.b1; reverse!(seq.b2); seq )
reversecomplement{T<:Nucleotide2bit}(seq::T) = reversecomplement!(copy(seq))

## Faster using bit level parallelism:

##	A	C	T	G
## b1	0	0	1	1
## b2	0	1	0	1

## A: ~ (b1 | b2)
isadenine{T<:Nucleotide2bit}(seq::T)	= ~ ( seq.b1 | seq.b2 )
## G: b1 & b2
isguanine{T<:Nucleotide2bit}(seq::T)	= seq.b1 & seq.b2
## C: ~b1 & b2
iscytosine{T<:Nucleotide2bit}(seq::T)	= ~seq.b1 & seq.b2
## T: b1 & ~b2
isthymine{T<:Nucleotide2bit}(seq::T)	= seq.b1 & ~seq.b2
## AT: ~b2
isweak{T<:Nucleotide2bit}(seq::T)		= ~seq.b2
## CG: b2
isstrong{T<:Nucleotide2bit}(seq::T)	= seq.b2
## CT: b1 $ b2
ispyrimidine{T<:Nucleotide2bit}(seq::T)	= seq.b1 $ seq.b2
## AG: ~( b1 $ b2 )
ispurine{T<:Nucleotide2bit}(seq::T)	= ~( seq.b1 $ seq.b2 )

function percentGC(seq::Nucleotide2bitSeq)
  len = length(seq)
  c2 = seq.b2.chunks
  chunks_len = length(c2)
  sum_ones = 0
  for i in 1:chunks_len
    sum_ones += count_ones(c2[i])
  end
  sum_ones/len
end

# Hash as Nucleotide
hash(seq::Nucleotide2bitSeq) = hash(nucleotide(seq))
hash(base::Nucleotide2bitBase) = hash(nucleotide(base))

# Hash Nucleotide2bitSeq as Vector{Nucleotide}
hash(seq::Nucleotide2bitSeq) = hash(nucleotide(seq))

==(S1::Nucleotide2bitSeq, S2::Vector{Nucleotide}) = ==(nucleotide(S1),S2)
==(S1::Vector{Nucleotide}, S2::Nucleotide2bitSeq) = ==(S1,nucleotide(S2))

# Julia 0.2 compatibility
isequal(S1::Nucleotide2bitSeq, S2::Vector{Nucleotide}) = isequal(nucleotide(S1),S2)
isequal(S1::Vector{Nucleotide}, S2::Nucleotide2bitSeq) = isequal(S1,nucleotide(S2))
