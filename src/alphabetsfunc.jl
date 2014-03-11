using BioSeq
importall Base, BioSeq

immutable Alphabet{ T <: BioUnit }
  alphabet::Array{T,1}
  indice::Array{Uint8,1}
  case_sensitive::Bool
  
  Alphabet{T <: BioUnit}(alphabet::Array{T,1},indices::Array{Uint8,1},case_sensitive::Bool) = new(alphabet,indices,case_sensitive)
end

function alphabet{T <: BioUnit}(seq::Array{T,1}, case_sensitive::Bool)
  indices = zeros(Uint8, 256 )
  if case_sensitive
    seq = unique(seq)
    indices[seq] = 1:length(seq)
  else
    seq = unique(lowercase(seq))
    indices[seq] = 1:length(seq)
    seq = uppercase!(seq)
    indices[seq] = 1:length(seq)
  end
  
  Alphabet{T}(seq,indices,case_sensitive)
end

length{T <: BioUnit}(ab::Alphabet{T}) = length(ab.alphabet)

start{T <: BioUnit}(ab::Alphabet{T}) = 1
next{T <: BioUnit}(ab::Alphabet{T},i::Int) = (ab.alphabet[i],i+1)
done{T <: BioUnit}(ab::Alphabet{T},i::Int) = (i > length(ab))

join{T <: BioUnit}(ab::Alphabet{T}) = join(ab.alphabet)

function show{T <: BioUnit}(io::IO,ab::Alphabet{T})
  println(io,"Case $(ab.case_sensitive ? "S":"Ins")ensitive Alphabet{$(T)} of $(length(ab)) elements:\n")
  println(io," indice   : $(length(ab.indice))-element $Uint8 Array")
  println(io," alphabet : $(length(ab.alphabet))-element $T Array\n")
  println(" alphabet\t\t\tindice[alphabet]")
  println(io," $T ($Int)\t\tUint8 ($Int)\n")
  for letter in ab
    println(io," $letter ($(int(letter))) \t\t\t$(ab.indice[letter]) ($(int(ab.indice[letter])))")
  end
end

getindex{T <: BioUnit, I <: Union(Uint8,Int)}(ab::Alphabet{T}, i::I ) = ab.alphabet[ i ]
getindex{T <: BioUnit, I <: Union(Uint8,Int)}(ab::Alphabet{T}, i::AbstractArray{I} ) = ab.alphabet[ i ]
getindex{T <: BioUnit}(ab::Alphabet{T}, i::T ) = ab.indice[ i ]
getindex{T <: BioUnit}(ab::Alphabet{T}, i::AbstractArray{T} ) = ab.indice[ i ]

in{T <: BioUnit}(element::T, ab::Alphabet{T}) = ab.indice[element] != 0

## Is In Alphabet ? ##

function isin{T,A<:Union(IntSet,Set,Alphabet)}(s::AbstractArray{T},y::A)
  res = BitArray(size(s))
  for i in 1:length(s)
    res[i] = in(s[i],y)
  end
  res
end

function isin{T,A<:Associative}(s::AbstractArray{T},y::A)
  res = BitArray(size(s))
  for i in 1:length(s)
    res[i] = haskey(y,s[i])
  end
  res
end

isin(s::ASCIIString,y)= isin(s.data,y)

## Check Alphabet ##

function check{T,A<:Union(IntSet,Set,Alphabet)}(s::AbstractArray{T},y::A)
  for x in s
    if !in(x,y)
      println("$(char(x)) is not in this Alphabet")
      return(false)
    end
  end
  true
end

function check{T,A<:Associative}(s::AbstractArray{T},y::A)
  for x in s
    if !haskey(y,x)
      println("$(char(x)) is not in this Alphabet")
      return(false)
    end
  end
  true
end

check(s::ASCIIString,y)= check(s.data,y)

## Interchange between Dic and Array values ##

function swap!{T<:Number}(s::AbstractArray{T},y::Dict{T,T})
  for i in 1:length(s)
    s[i] = get(y,s[i],s[i])
  end
  s
end

function swap{T,Tk,Tv}(s::AbstractArray{T},y::Dict{Tk,Tv})
  res = similar(s,Tv)
  for i in 1:length(s)
    res[i] = get(y,s[i],s[i])
  end
  res
end

swap!{T<:Integer,Tv}(s::AbstractArray{T},y::Array{Tv}) = (for i in length(s) s[i] = y[s[i]] end)
swap{T<:Integer,Tv}(s::AbstractArray{T},y::Array{Tv}) = [y[b] for b in s]

swap(s::ASCIIString,y)= ASCIIString(convert(Vector{Uint8},swap(s.data,y)))

## TODO: rand
