## AminoAcid ##

bitstype 8 AminoAcid <: ASCIIChar

## Conversions ##

aa(x) = convert(AminoAcid,x)
aa(x::FloatingPoint) = aa(iround(x))

aa(s::ASCIIString) = reinterpret(AminoAcid,copy(s.data))

aa(x::AbstractArray{AminoAcid}) = x
aa(x::AbstractArray)= iround_to(similar(x,AminoAcid), x)

macro aa_str(s);   ex = interp_parse_bytes(s); :(reinterpret(AminoAcid,($ex).data)); end

aaseq(x) = convert(Vector{AminoAcid},x)
aaaln(x) = convert(Matrix{AminoAcid},x)

## IUPAC Regex ##

macro aar_str(pattern, flags...)
  npat = Uint8[]
  flag_open = false
  for i in 1:length(pattern)
    elem = pattern[i]
    if elem=='[' && !flag_open && i!=1 && pattern[i-1]!='\\'
      flag_open = true
      push!(npat,elem)
    elseif elem=='[' && !flag_open && i==1
      flag_open = true
      push!(npat,elem)
    elseif flag_open && elem==']' && i!=1 && pattern[i-1]!='\\'
      flag_open = false
      push!(npat,elem)
    elseif has(_AMBIGUOUS_AMINO_IUPAC,elem)
      if !flag_open push!(npat,'[') end
      append!(npat,_AMBIGUOUS_AMINO_IUPAC[elem])
      if !flag_open push!(npat,']') end
    else
      push!(npat,elem)
    end
  end
  Regex(ASCIIString(npat),flags...)
end

