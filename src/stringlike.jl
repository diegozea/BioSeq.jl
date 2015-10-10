## To Lower Case ##

rem{T<:BioUnit}(x::T, y::Type{UInt8}) = rem(UInt8(x), y)

function lowercase!{T<:BioUnit}(s::AbstractArray{T})
  for i = 1:length(s)
    if 'A' <= Char(s[i]) <= 'Z'
      s[i] += 32
    end
  end
  return s
end

lowercase{T<:BioUnit}(s::AbstractArray{T}) = lowercase!(copy(s))

## To Upper Case ##

function uppercase!{T<:BioUnit}(s::AbstractArray{T})
  for i = 1:length(s)
    if 'a' <= Char(s[i]) <= 'z'
      s[i] -= 32
    end
  end
  return s
end

uppercase{T<:BioUnit}(s::AbstractArray{T}) = uppercase!(copy(s))

## Upper and Lower for BioUnit ##

uppercase{T<:BioUnit}(x::T) = convert(T,uppercase(Char(x)))
lowercase{T<:BioUnit}(x::T) = convert(T,lowercase(Char(x))) # Faster but unsafe: convert( T , x | 32 )

## Matching ##

# _unsafe_ascii makes a faster conversion, but violates immutability
_unsafe_ascii{T<:BioUnit}(seq::Vector{T}) = ASCIIString( reinterpret(UInt8,seq) )

ismatch{T<:BioUnit}(r::Regex, s::Vector{T}) = ismatch(r, _unsafe_ascii(s))

match{T<:BioUnit}(re::Regex, s::Vector{T}, idx::Integer) = match(re,_unsafe_ascii(s),idx)
match{T<:BioUnit}(r::Regex, s::Vector{T}) = match(r, _unsafe_ascii(s), 1)

search{T<:BioUnit}(s::Vector{T}, r::Regex, idx::Integer) = search(_unsafe_ascii(s),r,idx)
search{T<:BioUnit}(s::Vector{T}, r::Regex) = search(_unsafe_ascii(s),r,1)

search{T<:BioUnit}(s::Vector{T}, c, i) = search(_unsafe_ascii(s),c,i)
search{T<:BioUnit}(s::Vector{T}, c) = search(_unsafe_ascii(s),c,1)

eachmatch{T<:BioUnit}(re::Regex, s::Vector{T}, ovr::Bool) = Base.RegexMatchIterator(re,_unsafe_ascii(s),ovr)
eachmatch{T<:BioUnit}(re::Regex, s::Vector{T}) = Base.RegexMatchIterator(re,_unsafe_ascii(s),false)

## Some String Function ##

repeat{T<:BioUnit}(s::Vector{T}, n::Int) = vec(repmat(s,n,1))

repeat{T<:BioUnit}(x::T, n::Int) = fill(x,n)

function swap!{T<:BioUnit,Tp<:Union{Integer, Char},Tc<:Union{Integer, Char}}(x::AbstractArray{T},p::Tp,c::Tc)
  pat = convert(T,p)
  cha = convert(T,c)
  for i in 1:length(x)
    if x[i] == pat
      x[i] = cha
    end
  end
  return x
end

swap{T<:BioUnit,Tp<:Union{Integer, Char},Tc<:Union{Integer, Char}}(x::AbstractArray{T},p::Tp,c::Tc) = swap!(copy(x),p,c)

function replace{T<:BioUnit}(s::Vector{T}, pattern, r, limit::Integer)
    cases = 0
    range = search(s,pattern)
    st = range.start
    en = range.stop
    if st==0
      return(s)
    else
      res = T[]
      pre = 1
    end
    while st != 0
	if cases == limit; break; end
        if (st-1) >= pre
	  append!(res,s[pre:(st-1)])
	end
	isa(r,Vector) ? append!(res,r) : push!(res,r)
	pre = en + 1
        range = search(s,pattern,pre)
	st = range.start
	en = range.stop
        cases += 1
    end
    if pre<=length(s); append!(res,s[pre:end]) end
    res
end

replace{T<:BioUnit}(s::Vector{T}, pat, r) = replace(s, pat, r, -1)
