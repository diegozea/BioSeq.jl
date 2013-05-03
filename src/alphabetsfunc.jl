## Is In Alphabet ? ##

function in{T,A<:Union(IntSet,Set)}(s::AbstractArray{T},y::A)
  res = BitArray(size(s))
  for i in 1:length(s)
    res[i] = contains(y,s[i])
  end
  res
end

function in{T,A<:Associative}(s::AbstractArray{T},y::A)
  res = BitArray(size(s))
  for i in 1:length(s)
    res[i] = haskey(y,s[i])
  end
  res
end

in(s::ASCIIString,y)= in(s.data,y)

## Check Alphabet ##

function check{T,A<:Union(IntSet,Set)}(s::AbstractArray{T},y::A)
  for x in s
    if !contains(y,x)
      error("$(char(x)) not in this Alphabet")
    end
  end
end

function check{T,A<:Associative}(s::AbstractArray{T},y::A)
  for x in s
    if !haskey(y,x)
      error("$(char(x)) not in this Alphabet")
    end
  end
end

check(s::ASCIIString,y)= check(s.data,y)

## Interchange between Dic values ##

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
