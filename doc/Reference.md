BioSeq
=========

Package for working with Biological Sequences and Alignments on Julia

-----------------------------------------

Types:

	ASCIIChar

Abstract type for creation of 8-bit print-as-Char bitstypes
All basic operations defined for Char are defined for ASCIIChar too
* Conversion and promotion between types
* Sum and subtraction of Int values
* Comparisons
* Bitwise operations
* libc character class testing functions

	Nucleotide

Bits type for Nucleotides (ribo-and deoxyribonucleic acids) as a subtype for ASCIIChar.
Vectors of Nucleotides can be used as DNA or RNA Sequences and Matrices as Alignments

	AminoAcid

Bits type for Amino Acids as a subtype of ASCIIChar
Vectors of Amino Acids can be used as Protein Sequences and Matrices as Alignments

String-like behavior for ASCIIChar Arrays
-----------------------------------------

	lowercase{T<:ASCIIChar}(x::T)
	lowercase!{T<:ASCIIChar}(s::AbstractArray{T})
	lowercase{T<:ASCIIChar}(s::AbstractArray{T})

Conversion of ASCIIChar and ASCIIChar Arrays to lowercase

	uppercase{T<:ASCIIChar}(x::T)
	uppercase!{T<:ASCIIChar}(s::AbstractArray{T})
	uppercase{T<:ASCIIChar}(s::AbstractArray{T})

Conversion of ASCIIChar and ASCIIChar Arrays to uppercase

	repeat{T<:ASCIIChar}(s::Vector{T}, n::Int)

Repeat n times an ASCIIChar Vector

	repeat{T<:ASCIIChar}(x::T, n::Int)

Repeat ASCIIChar for generate an ASCIIChar Vector

AminoAcid
----------

	aa(x)
	aa(s::ASCIIString)
	aa(x::AbstractArray)

Converts to AminoAcid or AminoAcid Array

	@aa_str

Creates a AminoAcid Vector (Protein Sequence)

	aaseq(x)

Convert to AminoAcid Vector (Sequence)

	aaaln(x)

Convert to AminoAcid Matrix (Alignment)

Nucleotide
----------

	nt(x)
	nt(s::ASCIIString)
	nt(x::AbstractArray)

Converts to Nucleotide or Nucleotide Array

	@nt_str

Creates a Nucleotide Vector (DNA or RNA Sequence)

	ntseq(x)

Convert to Nucleotide Vector (Sequence)

	ntaln(x)

Convert to Nucleotide Matrix (Alignment)

	dna2rna!(x)
	dna2rna(x)
	rna2dna!(x)
	rna2dna(x)

All this functions interchange between T and U and are case insensitive. If you know your sequence is all uppercase or all lowercase, `swap!(seq,'T','U')` or `swap!(seq,'t','u')` are faster choices.

	complement!(x,d::Dict)
	complement(x,d::Dict)
	reversecomplement!(x,d::Dict)
	reversecomplement(x,d::Dict)

This functions give us the complement sequence or the reverse complement. d::Dict can be `RNA_COMPLEMENT` or `DNA_COMPLEMENT` or a user defined Dict.

Matching on ASCIIChar Vectors
----------------------------

The next functions works as in String but on ASCIIChar Vectors:

	ismatch{T<:ASCIIChar}(r::Regex, s::Vector{T})
	match{T<:ASCIIChar}(re::Regex, s::Vector{T}, idx::Integer)
	match{T<:ASCIIChar}(r::Regex, s::Vector{T})
	search{T<:ASCIIChar}(s::Vector{T}, r::Regex, idx::Integer)
	search{T<:ASCIIChar}(s::Vector{T}, r::Regex)
	search{T<:ASCIIChar}(s::Vector{T}, c, i::Integer)
	search{T<:ASCIIChar}(s::Vector{T}, c)
	each_match{T<:ASCIIChar}(re::Regex, s::Vector{T}, ovr::Bool)
	each_match{T<:ASCIIChar}(re::Regex, s::Vector{T})
	replace{T<:ASCIIChar}(s::Vector{T}, pattern, r, limit::Integer)
	replace{T<:ASCIIChar}(s::Vector{T}, pat, r)

Swap between ASCIIChars on Arrays
---------------------------------

	swap!{T<:ASCIIChar,Tp<:Integer,Tc<:Integer}(x::AbstractArray{T},p::Tp,c::Tc)
	swap{T<:ASCIIChar,Tp<:Integer,Tc<:Integer}(x::AbstractArray{T},p::Tp,c::Tc)

Interchange a character for other


IUPAC REGEX
-----------

	@aar_str

Creates a IUPAC regex for amino acids using `aar"..."`

	@ntr_str

Creates a IUPAC regex for nucleotides using `ntr"..."`

Functions for Alphabets
-----------------------

You can create an alphabet as an IntSet, Set or Dict.
IntSet is the most efficient.

	in{T}(s::AbstractArray{T},y::Union(IntSet,Set,Associative))

Test for characters on an alphabet

	check{T}(s::AbstractArray{T},y::Union(IntSet,Set,Associative))

Check for characters on an alphabet

	swap{T,Tk,Tv}(s::AbstractArray{T},y::Dict{Tk,Tv})
	swap!{T<:Number}(s::AbstractArray{T},y::Dict{T,T})

Interchange a character for other on a Dict

Nucleotide Alphabets
--------------------

	GAPS
	DNA_4
	DNA_4_GAPPED
	RNA_4
	RNA_4_GAPPED
	DNA_AMBIGUOUS
	DNA_GAPPED_AMBIGUOUS
	RNA_AMBIGUOUS
	RNA_GAPPED_AMBIGUOUS
	DNA_COMPLEMENT
	RNA_COMPLEMENT
	NUCLEIC_IUPAC_AMBIGUOUS
	
	
Protein Alphabets
-----------------

	GAPS
	AMINO_20
	AMINO_GAPPED_20
	AMINO_IUPAC
	AMINO_IUPAC_EXTENDED
	AMINO_1LETTER_TO_3
	AMINO_3LETTERS_TO_1
	IUPAC_AMINO_EXTENDED
