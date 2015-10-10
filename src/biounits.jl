abstract BioUnit                <: Integer

bitstype 8 AminoAcid            <: BioUnit
bitstype 8 Nucleotide           <: BioUnit

## Conversions ##

convert{T<:BioUnit}(::Type{T}, value::UInt8) = box(T,unbox(UInt8,value));
convert{T<:BioUnit}(::Type{UInt8}, value::T) = box(UInt8,unbox(T,value));

const _types = (Int8, Int16, UInt16, Int32, UInt32, Char, Int64, UInt64, Float32, Float64, Bool)

for t in _types
    @eval convert{T<:BioUnit}(::Type{$t}, x::T) = convert($t,UInt8(x))
    @eval convert{T<:BioUnit}(::Type{T},  x::$t)= convert(T,UInt8(x))
end

## Conversions ##

aminoacid{T<:Number}(value::T)   = convert(AminoAcid, value)
nucleotide{T<:Number}(value::T)   = convert(Nucleotide,value)

aminoacid(value::Char)   = convert(AminoAcid, Int(value))
nucleotide(value::Char)   = convert(Nucleotide, Int(value))

aminoacid(vec::Vector)  = convert(Vector{AminoAcid}, vec)
nucleotide(vec::Vector)  = convert(Vector{Nucleotide},vec)

aminoacid(str::ASCIIString)  = convert(Vector{AminoAcid}, str)
nucleotide(str::ASCIIString)  = convert(Vector{Nucleotide},str)

aminoacid(mat::Matrix)  = convert(Matrix{AminoAcid}, mat)
nucleotide(mat::Matrix)  = convert(Matrix{Nucleotide},mat)

macro aa_str(s);  :(reinterpret(AminoAcid,  @b_str($s) )); end

macro nt_str(s);  :(reinterpret(Nucleotide, @b_str($s) )); end

## Promotion rules ##

promote_rule{Tb<:BioUnit,T<:Number}(::Type{Tb}, ::Type{T}) = T
promote_rule{T<:BioUnit}(::Type{T}, ::Type{Union{}}) = T

## Comparisons ##

=={T<:BioUnit}(x::T, y::T) = ==(UInt8(x),UInt8(y))
!={T<:BioUnit}(x::T, y::T) = !=(UInt8(x),UInt8(y))
<{T<:BioUnit}(x::T, y::T)  = <( UInt8(x),UInt8(y))
<={T<:BioUnit}(x::T, y::T) = <=(UInt8(x),UInt8(y))

## Bitwise Operations ##

~{T<:BioUnit}(x::T)            = convert(T,~UInt8(x))
(&){T<:BioUnit}(x::T, y::T)    = convert(T,(&)(UInt8(x),UInt8(y)))
|{T<:BioUnit}(x::T, y::T)      = convert(T,|(UInt8(x),UInt8(y)))
($){T<:BioUnit}(x::T, y::T)    = convert(T,($)(UInt8(x),UInt8(y)))
<<{T<:BioUnit}(x::T, y::Int32) = convert(T,<<(UInt8(x),y))
>>{T<:BioUnit}(x::T, y::Int32) = convert(T,>>(UInt8(x),y))
>>>{T<:BioUnit}(x::T, y::Int32)= convert(T,>>>(UInt8(x),y))

## Characteristics ##

typemin{T<:BioUnit}(::Type{T}) = convert(T, 0x00 )
typemax{T<:BioUnit}(::Type{T}) = convert(T, 0xff )

## Show as Character ##

show{T<:BioUnit}(io::IO,x::T) = (write(io,UInt8(x)); nothing)

## Bits representation ##

bits{T<:BioUnit}(x::T) = bin(reinterpret(UInt8,x),8)

## Array & Strings ##

convert{N}(::Type{Array{AminoAcid,N}}, x::Array{AminoAcid,N}) = x
convert{N}(::Type{Array{Nucleotide,N}}, x::Array{Nucleotide,N}) = x

convert{N}(::Type{Array{AminoAcid,N}}, x::Array{Nucleotide,N}) = reinterpret(AminoAcid,s)
convert{N}(::Type{Array{Nucleotide,N}}, x::Array{AminoAcid,N}) = reinterpret(Nucleotide,s)

convert{N}(::Type{Array{UInt8,N}},s::Array{AminoAcid,N}) = reinterpret(UInt8,s)
convert{N}(::Type{Array{AminoAcid,N}},s::Array{UInt8,N}) = reinterpret(AminoAcid,s)

convert{N}(::Type{Array{UInt8,N}},s::Array{Nucleotide,N}) = reinterpret(UInt8,s)
convert{N}(::Type{Array{Nucleotide,N}},s::Array{UInt8,N}) = reinterpret(Nucleotide,s)

convert{T<:BioUnit}(::Type{ASCIIString}, seq::Vector{T}) = ASCIIString(reinterpret(UInt8,copy(seq)))
convert{T<:BioUnit}(::Type{Vector{T}}, str::ASCIIString) = reinterpret(T,copy(str.data))

bytestring{T<:BioUnit}(seq::Vector{T}) = bytestring(reinterpret(UInt8,seq))

## HASH (for Julia 0.3)
hash{T<:BioUnit}(x::T) = hash(UInt8(x))
hash{T<:BioUnit}(seq::Vector{T}) = hash(bytestring(seq))
