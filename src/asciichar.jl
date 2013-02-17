## ASCIIChar ##

abstract ASCIIChar <: Integer

## Conversions ##

convert{T<:ASCIIChar}(::Type{T}, x::Uint8)  = box(T,unbox(Uint8,x))
convert{T<:ASCIIChar}(::Type{T}, x::Int8)   = box(T,unbox(Uint8,x))
convert{T<:ASCIIChar}(::Type{T}, x::Int16)  = box(T,trunc8(unbox(Int16,x)))
convert{T<:ASCIIChar}(::Type{T}, x::Uint16) = box(T,trunc8(unbox(Uint16,x)))
convert{T<:ASCIIChar}(::Type{T}, x::Int32)  = box(T,trunc8(unbox(Int32,x)))
convert{T<:ASCIIChar}(::Type{T}, x::Char)  = box(T,trunc8(unbox(Char,x)))
convert{T<:ASCIIChar}(::Type{T}, x::Uint32) = box(T,trunc8(unbox(Uint32,x)))
convert{T<:ASCIIChar}(::Type{T}, x::Int64)  = box(T,trunc8(unbox(Int64,x)))
convert{T<:ASCIIChar}(::Type{T}, x::Uint64) = box(T,trunc8(unbox(Uint64,x)))
convert{T<:ASCIIChar}(::Type{T}, x::Int128) = box(T,trunc8(unbox(Int128,x)))
convert{T<:ASCIIChar}(::Type{T}, x::Uint128)= box(T,trunc8(unbox(Uint128,x)))
convert{T<:ASCIIChar}(::Type{T}, x::Float32)= box(T,trunc8(checked_fptoui32(unbox(Float32,x))))
convert{T<:ASCIIChar}(::Type{T}, x::Float64)= box(T,trunc8(checked_fptoui64(unbox(Float64,x))))

convert{T<:ASCIIChar}(::Type{Uint8}, x::T)  = box(Uint8,unbox(T,x))
convert{T<:ASCIIChar}(::Type{Int8}, x::T)   = box(Int8,unbox(T,x))
convert{T<:ASCIIChar}(::Type{Int16}, x::T)  = box(Int16,zext16(unbox(T,x)))
convert{T<:ASCIIChar}(::Type{Uint16}, x::T) = box(Uint16,zext16(unbox(T,x)))
convert{T<:ASCIIChar}(::Type{Int32}, x::T)  = box(Int32,zext32(unbox(T,x)))
convert{T<:ASCIIChar}(::Type{Char}, x::T)  = box(Char,zext32(unbox(T,x)))
convert{T<:ASCIIChar}(::Type{Uint32}, x::T) = box(Uint32,zext32(unbox(T,x)))
convert{T<:ASCIIChar}(::Type{Int64}, x::T)  = box(Int64,zext64(unbox(T,x)))
convert{T<:ASCIIChar}(::Type{Uint64}, x::T) = box(Uint64,zext64(unbox(T,x)))
convert{T<:ASCIIChar}(::Type{Int128}, x::T) = box(Int128,zext_int(Uint128,unbox(T,x)))
convert{T<:ASCIIChar}(::Type{Uint128}, x::T)= box(Uint128,zext_int(Uint128,unbox(T,x)))
convert{T<:ASCIIChar}(::Type{Float32}, x::T)= box(Float32,uitofp32(unbox(T,x)))
convert{T<:ASCIIChar}(::Type{Float64}, x::T)= box(Float64,uitofp64(unbox(T,x)))

integer(x::ASCIIChar) = int(x)
unsigned(x::ASCIIChar) = uint(x)

## Operations ##

-{T<:ASCIIChar}(x::T, y::Int) = convert(T,( int(x) - y ))
+{T<:ASCIIChar}(x::T, y::Int) = convert(T,( int(x) + y ))
-{T<:ASCIIChar}(x::Int, y::T) = y - x
+{T<:ASCIIChar}(x::Int, y::T) = y + x

## Comparisons ##

=={T<:ASCIIChar}(x::T, y::T) = eq_int(unbox(T,x),unbox(T,y))
!={T<:ASCIIChar}(x::T, y::T) = ne_int(unbox(T,x),unbox(T,y))
<{T<:ASCIIChar}(x::T, y::T) = ult_int(unbox(T,x),unbox(T,y))
<={T<:ASCIIChar}(x::T, y::T) = ule_int(unbox(T,x),unbox(T,y))

## Promotion rules ##

promote_rule{Tb<:ASCIIChar,T<:Number}(::Type{Tb}, ::Type{T}) = T
promote_rule{T<:ASCIIChar}(::Type{T}, ::Type{None}) = T

## Bitwise Operations ##

~{T<:ASCIIChar}(x::T) = box(T,not_int(unbox(T,x)))
(&){T<:ASCIIChar}(x::T, y::T) = box(T,and_int(unbox(T,x),unbox(T,y)))
|{T<:ASCIIChar}(x::T, y::T) = box(T,or_int(unbox(T,x),unbox(T,y)))
($){T<:ASCIIChar}(x::T, y::T) = box(T,xor_int(unbox(T,x),unbox(T,y)))
<<{T<:ASCIIChar}(x::T, y::Int32) = box(T,shl_int(unbox(T,x),unbox(Int32,y)))
>>{T<:ASCIIChar}(x::T, y::Int32) = box(T,lshr_int(unbox(T,x),unbox(Int32,y)))
>>>{T<:ASCIIChar}(x::T, y::Int32) = box(T,lshr_int(unbox(T,x),unbox(Int32,y)))

## Characteristics ##

typemin{T<:ASCIIChar}(::Type{T}) = convert(T,0x00)
typemax{T<:ASCIIChar}(::Type{T}) = convert(T,0xff)

## Show as Character ##

show{T<:ASCIIChar}(io::IO,x::T) = (write(io,x); nothing)

## Bits representation ##

bits{T<:ASCIIChar}(x::T) = bin(reinterpret(Uint8,x),8)

## Array & Strings ##

convert{T<:Union(Uint8,ASCIIChar)}(::Type{Vector{T}}, x::Vector{Union(Uint8,ASCIIChar)}) = reinterpret(T,x)
convert{T<:Union(Uint8,ASCIIChar)}(::Type{Matrix{T}}, x::Matrix{Union(Uint8,ASCIIChar)}) = reinterpret(T,x)

convert{T<:ASCIIChar}(::Type{ASCIIString}, s::Vector{T}) = ASCIIString(reinterpret(Uint8,copy(s)))
convert{T<:ASCIIChar}(::Type{Vector{T}}, s::ASCIIString) = reinterpret(T,copy(s.data))

bytestring{T<:ASCIIChar}(s::Vector{T}) = bytestring(reinterpret(Uint8,s))

## libc character class testing functions ##

iswascii(c::ASCIIChar) = c < 0x80

for f = (:iswalnum, :iswalpha, :iswblank, :iswcntrl, :iswdigit,
         :iswgraph, :iswlower, :iswprint, :iswpunct, :iswspace,
         :iswupper, :iswxdigit )
    @eval ($f{T<:ASCIIChar})(c::T) = bool(ccall($(expr(:quote,f)), Int32, (T,), c))
end