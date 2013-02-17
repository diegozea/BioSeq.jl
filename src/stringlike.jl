## To Lower Case ##

function lowercase!{T<:ASCIIChar}(s::AbstractArray{T})
  for i = 1:length(s)
    if 'A' <= char(s[i]) <= 'Z'
      s[i] += 32
    end
  end
  return s
end

lowercase{T<:ASCIIChar}(s::AbstractArray{T}) = lowercase!(copy(s))

## To Upper Case ##

function uppercase!{T<:ASCIIChar}(s::AbstractArray{T})
  for i = 1:length(s)
    if 'a' <= char(s[i]) <= 'z'
      s[i] -= 32
    end
  end
  return s
end

uppercase{T<:ASCIIChar}(s::AbstractArray{T}) = uppercase!(copy(s))

## Upper and Lower for ASCIIChar ##

uppercase{T<:ASCIIChar}(x::T) = convert(T,uppercase(uint8(x)))
lowercase{T<:ASCIIChar}(x::T) = convert(T,lowercase(uint8(x)))

## Matching ##

ismatch{T<:ASCIIChar}(r::Regex, s::Vector{T}) = ismatch(r, bytestring(s))

match{T<:ASCIIChar}(re::Regex, s::Vector{T}, idx::Integer) = match(re,bytestring(s),idx)
match{T<:ASCIIChar}(r::Regex, s::Vector{T}) = match(r, bytestring(s), 1)

search{T<:ASCIIChar}(s::Vector{T}, r::Regex, idx::Integer) = search(bytestring(s),r,idx)
search{T<:ASCIIChar}(s::Vector{T}, r::Regex) = search(bytestring(s),r,1)

search{T<:ASCIIChar}(s::Vector{T}, c, i) = search(reinterpret(Uint8,s),c,i)
search{T<:ASCIIChar}(s::Vector{T}, c) = search(reinterpret(Uint8,s),c,1)

each_match{T<:ASCIIChar}(re::Regex, s::Vector{T}, ovr::Bool) = RegexMatchIterator(re,bytestring(s),ovr)
each_match{T<:ASCIIChar}(re::Regex, s::Vector{T}) = RegexMatchIterator(re,bytestring(s),false)

## Some String Function ##

repeat{T<:ASCIIChar}(s::Vector{T}, n::Int) = vec(repmat(s,n,1))

repeat{T<:ASCIIChar}(x::T, n::Int) = fill(x,n)

function swap!{T<:ASCIIChar,Tp<:Integer,Tc<:Integer}(x::AbstractArray{T},p::Tp,c::Tc)
  pat = convert(T,p)
  cha = convert(T,c)
  for i in 1:length(x)
    if x[i] == pat
      x[i] = cha
    end
  end
  return x
end

swap{T<:ASCIIChar,Tp<:Integer,Tc<:Integer}(x::AbstractArray{T},p::Tp,c::Tc) = swap!(copy(x),p,c)

function replace{T<:ASCIIChar}(s::Vector{T}, pattern, r, limit::Integer)
    cases = 0
    range = search(s,pattern)
    st = range.start
    en = range.start + range.len - 1
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
	en = range.start + range.len - 1
        cases += 1
    end
    if pre<=length(s); append!(res,s[pre:end]) end
    res
end

replace{T<:ASCIIChar}(s::Vector{T}, pat, r) = replace(s, pat, r, -1)