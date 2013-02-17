## Is In Alphabet ? ##

function in{T}(s::AbstractArray{T},y::Union(IntSet,Set,Associative))
  res = BitArray(size(s))
  for i in 1:length(s)
    res[i] = has(y,s[i])
  end
  res
end

in(s::ASCIIString,y)= in(s.data,y)

## Check Alphabet ##

function check{T}(s::AbstractArray{T},y::Union(IntSet,Set,Associative))
  for x in s
    if !has(y,x)
      error("$x not in this $(typeof(y))")
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

swap(s::ASCIIString,y)= ASCIIString(convert(Vector{Uint8},swap(s.data,y)))

## TODO: rand
