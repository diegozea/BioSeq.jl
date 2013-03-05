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

aa{T<:Number}(value::T)   = convert(AminoAcid, value)
nt{T<:Number}(value::T)   = convert(Nucleotide,value)

aa(vec::Vector)  = convert(Vector{AminoAcid}, vec)
nt(vec::Vector)  = convert(Vector{Nucleotide},vec)

aa(str::ASCIIString)  = convert(Vector{AminoAcid}, str)
nt(str::ASCIIString)  = convert(Vector{Nucleotide},str)

aa(mat::Matrix)  = convert(Matrix{AminoAcid}, mat)
nt(mat::Matrix)  = convert(Matrix{Nucleotide},mat)

function interp_parse(s::String, unescape::Function, printer::Function)
  sx = {}
    i = j = start(s)
    while !done(s,j)
        c, k = next(s,j)
        if c == '$'
            if !isempty(s[i:j-1])
                push!(sx, unescape(s[i:j-1]))
            end
            ex, j = parse(s,k,false)
            if isa(ex,Expr) && is(ex.head,:continue)
                throw(ParseError("incomplete expression"))
            end
            push!(sx, esc(ex))
            i = j
        elseif c == '\\' && !done(s,k)
            if s[k] == '$'
                if !isempty(s[i:j-1])
                    push!(sx, unescape(s[i:j-1]))
                end
                i = k
            end
            c, j = next(s,k)
        else
            j = k
        end
    end
    if !isempty(s[i:])
        push!(sx, unescape(s[i:j-1]))
    end
    length(sx) == 1 && isa(sx[1],ByteString) ? sx[1] :
        Expr(:call, :sprint, printer, sx...)
end

function interp_parse_bytes(s::String)
    writer(io,x...) = for w=x; write(io,w); end
    interp_parse(s, unescape_string, writer)
end

macro aa_str(s);   ex = interp_parse_bytes(s); :(reinterpret(AminoAcid, ($ex).data)); end

macro nt_str(s);   ex = interp_parse_bytes(s); :(reinterpret(Nucleotide,($ex).data)); end

## Promotion rules ##

promote_rule{Tb<:BioUnit,T<:Number}(::Type{Tb}, ::Type{T}) = T
promote_rule{T<:BioUnit}(::Type{T}, ::Type{None}) = T

## Operations ##

-{T<:BioUnit}(x::T, y::Int) = convert(T,( int(x) - y ))
+{T<:BioUnit}(x::T, y::Int) = convert(T,( int(x) + y ))
-{T<:BioUnit}(x::Int, y::T) = y - x
+{T<:BioUnit}(x::Int, y::T) = y + x

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

typemin{T<:BioUnit}(::Type{T}) = convert(T,0x00)
typemax{T<:BioUnit}(::Type{T}) = convert(T,0xff)

## Show as Character ##

show{T<:BioUnit}(io::IO,x::T) = (write(io,uint8(x)); nothing)

## Bits representation ##

bits{T<:BioUnit}(x::T) = bin(reinterpret(Uint8,x),8)

## Array & Strings ##

convert{T<:Union(Uint8,BioUnit)}(::Type{Vector{T}}, seq::Vector{Union(Uint8,BioUnit)}) = reinterpret(T,seq)
convert{T<:Union(Uint8,BioUnit)}(::Type{Matrix{T}}, aln::Matrix{Union(Uint8,BioUnit)}) = reinterpret(T,aln)

convert{T<:BioUnit}(::Type{ASCIIString}, seq::Vector{T}) = ASCIIString(reinterpret(Uint8,copy(seq)))
convert{T<:BioUnit}(::Type{Vector{T}}, str::ASCIIString) = reinterpret(T,copy(str.data))

bytestring{T<:BioUnit}(seq::Vector{T}) = bytestring(reinterpret(Uint8,seq))
