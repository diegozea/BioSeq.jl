abstract BioUnit                <: Integer

bitstype 8 AminoAcid            <: BioUnit
bitstype 8 Nucleotide           <: BioUnit

## Conversions ##

convert{T<:BioUnit}(::Type{T}, value::Uint8) = box(T,unbox(Uint8,value));
convert{T<:BioUnit}(::Type{Uint8}, value::T) = box(Uint8,unbox(T,value));

const _types = (Int8, Int16, Uint16, Int32, Uint32, Char, Int64, Uint64, Float32, Float64, Bool)

for t in _types
    @eval convert{T<:BioUnit}(::Type{$t}, x::T) = convert($t,uint8(x))
    @eval convert{T<:BioUnit}(::Type{T},  x::$t)= convert(T,uint8(x))
end

## Conversions ##

aminoacid{T<:Number}(value::T)   = convert(AminoAcid, value)
nucleotide{T<:Number}(value::T)   = convert(Nucleotide,value)

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
promote_rule{T<:BioUnit}(::Type{T}, ::Type{None}) = T

## Comparisons ##

=={T<:BioUnit}(x::T, y::T) = ==(uint8(x),uint8(y))
!={T<:BioUnit}(x::T, y::T) = !=(uint8(x),uint8(y))
<{T<:BioUnit}(x::T, y::T)  = <( uint8(x),uint8(y))
<={T<:BioUnit}(x::T, y::T) = <=(uint8(x),uint8(y))

## Bitwise Operations ##

~{T<:BioUnit}(x::T)            = convert(T,~uint8(x))
(&){T<:BioUnit}(x::T, y::T)    = convert(T,(&)(uint8(x),uint8(y)))
|{T<:BioUnit}(x::T, y::T)      = convert(T,|(uint8(x),uint8(y)))
($){T<:BioUnit}(x::T, y::T)    = convert(T,($)(uint8(x),uint8(y)))
<<{T<:BioUnit}(x::T, y::Int32) = convert(T,<<(uint8(x),y))
>>{T<:BioUnit}(x::T, y::Int32) = convert(T,>>(uint8(x),y))
>>>{T<:BioUnit}(x::T, y::Int32)= convert(T,>>>(uint8(x),y))

## Characteristics ##

typemin{T<:BioUnit}(::Type{T}) = convert(T, 0x00 )
typemax{T<:BioUnit}(::Type{T}) = convert(T, 0xff )

## Show as Character ##

show{T<:BioUnit}(io::IO,x::T) = (write(io,uint8(x)); nothing)

## Bits representation ##

bits{T<:BioUnit}(x::T) = bin(reinterpret(Uint8,x),8)

## Array & Strings ##

convert{N}(::Type{Array{AminoAcid,N}}, x::Array{AminoAcid,N}) = x
convert{N}(::Type{Array{Nucleotide,N}}, x::Array{Nucleotide,N}) = x

convert{N}(::Type{Array{AminoAcid,N}}, x::Array{Nucleotide,N}) = reinterpret(AminoAcid,s)
convert{N}(::Type{Array{Nucleotide,N}}, x::Array{AminoAcid,N}) = reinterpret(Nucleotide,s)

convert{N}(::Type{Array{Uint8,N}},s::Array{AminoAcid,N}) = reinterpret(Uint8,s)
convert{N}(::Type{Array{AminoAcid,N}},s::Array{Uint8,N}) = reinterpret(AminoAcid,s)

convert{N}(::Type{Array{Uint8,N}},s::Array{Nucleotide,N}) = reinterpret(Uint8,s)
convert{N}(::Type{Array{Nucleotide,N}},s::Array{Uint8,N}) = reinterpret(Nucleotide,s)

convert{T<:BioUnit}(::Type{ASCIIString}, seq::Vector{T}) = ASCIIString(reinterpret(Uint8,copy(seq)))
convert{T<:BioUnit}(::Type{Vector{T}}, str::ASCIIString) = reinterpret(T,copy(str.data))

bytestring{T<:BioUnit}(seq::Vector{T}) = bytestring(reinterpret(Uint8,seq))

## Deprecated ##

nt(x) = throw("Use nucleotide() instead of nt()")
aa(x) = throw("Use aminoacid() instead of aa()")

