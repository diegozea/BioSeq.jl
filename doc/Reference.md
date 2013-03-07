BioSeq
=========

Package for working with Biological Sequences and Alignments on Julia

-----------------------------------------

Types:

	BioUnit

Abstract type for creation of Biological Units of 8-bit

	Nucleotide

8-bit bits type for Nucleotides (ribo-and deoxyribonucleic acids) as a subtype for BioUnit.
Vectors of Nucleotides can be used as DNA or RNA Sequences and Matrices as Alignments

	AminoAcid

8-bit bits type for Amino Acids as a subtype of BioUnit
Vectors of Amino Acids can be used as Protein Sequences and Matrices as Alignments

	DNA2Seq

DNA Sequence of 2 bits, only for A C T G.
Contains 2 `BitVector` named `b1` and `b2`:

b1\b2 | false | true 
--------|--------|-------
**false** |   T   |  G
**true**  |   C   |  A


String-like behavior for BioUnit Arrays
-----------------------------------------

	lowercase{T<:BioUnit}(x::T)
	lowercase!{T<:BioUnit}(s::AbstractArray{T})
	lowercase{T<:BioUnit}(s::AbstractArray{T})

Conversion of BioUnit and BioUnit Arrays to lowercase

	uppercase{T<:BioUnit}(x::T)
	uppercase!{T<:BioUnit}(s::AbstractArray{T})
	uppercase{T<:BioUnit}(s::AbstractArray{T})

Conversion of BioUnit and BioUnit Arrays to uppercase

	repeat{T<:BioUnit}(s::Vector{T}, n::Int)

Repeat n times an BioUnit Vector

	repeat{T<:BioUnit}(x::T, n::Int)

Repeat BioUnit for generate an BioUnit Vector

AminoAcid
----------

	aa(x)
	aa(vec::Vector)
	aa(str::ASCIIString)
	aa(mat::Matrix)

Converts to Nucleotide or Nucleotide Array
AminoAcid Vector for Protein Sequence and Matrix for Alignments

	@aa_str

Creates a AminoAcid Vector (Protein Sequence) using aa" ... " (but string interpolation is only supported for Julia 0.1)


Nucleotide
----------

	nt(x)
	nt(vec::Vector)
	nt(str::ASCIIString)
	nt(mat::Matrix)
	nt(seq::DNA2Seq)

Converts to Nucleotide or Nucleotide Array
Nucleotide Vector for DNA or RNA Sequence and Matrix for Alignments

	@nt_str

Creates a Nucleotide Vector (DNA or RNA Sequence) using nt" ... " (but string interpolation is only supported for Julia 0.1)

	dna2rna!(x)
	dna2rna(x)
	rna2dna!(x)
	rna2dna(x)

All this functions interchange between T and U and are case insensitive. If you know your sequence is all uppercase or all lowercase, `swap!(seq,'T','U')` or `swap!(seq,'t','u')` are faster choices.

	complement!(x,d)
	complement(x,d)
	reversecomplement!(x,d)
	reversecomplement(x,d)

This functions give us the complement sequence or the reverse complement. d can be `RNA_COMPLEMENT` or `DNA_COMPLEMENT` or a user defined Array indexed with Nucleotides keys.

DNA2Seq
-------

	DNA2Seq(len::Int)

Initialize a DNA2Seq with Thymines of length len

	dna2seq(x)

Converts to DNA2Seq

	@dna2_str

Creates a 2-bit DNA sequence using dna2" ... "

	nt(seq::DNA2Seq)

Converts from DNA2Seq to Nucleotide Vector

	complement!(seq::DNA2Seq)
	complement(seq::DNA2Seq)
	reversecomplement!(seq::DNA2Seq)
	reversecomplement(seq::DNA2Seq)

This functions give us the complement sequence or the reverse complement for a 2-bit DNA sequence.

	percentGC(seq::DNA2Seq)

Fastest GC content estimation for 2-bit DNA sequence

Matching on BioUnit Vectors
----------------------------

The next functions works as in String but on BioUnit Vectors:

	ismatch{T<:BioUnit}(r::Regex, s::Vector{T})
	match{T<:BioUnit}(re::Regex, s::Vector{T}, idx::Integer)
	match{T<:BioUnit}(r::Regex, s::Vector{T})
	search{T<:BioUnit}(s::Vector{T}, r::Regex, idx::Integer)
	search{T<:BioUnit}(s::Vector{T}, r::Regex)
	search{T<:BioUnit}(s::Vector{T}, c, i::Integer)
	search{T<:BioUnit}(s::Vector{T}, c)
	each_match{T<:BioUnit}(re::Regex, s::Vector{T}, ovr::Bool)
	each_match{T<:BioUnit}(re::Regex, s::Vector{T})
	replace{T<:BioUnit}(s::Vector{T}, pattern, r, limit::Integer)
	replace{T<:BioUnit}(s::Vector{T}, pat, r)

Swap between BioUnits on Arrays
---------------------------------

	swap!{T<:BioUnit,Tp<:Integer,Tc<:Integer}(x::AbstractArray{T},p::Tp,c::Tc)
	swap{T<:BioUnit,Tp<:Integer,Tc<:Integer}(x::AbstractArray{T},p::Tp,c::Tc)

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

	swap{T,Tk,Tv}(s::AbstractArray{T},y::Array)
	swap!{T<:Number}(s::AbstractArray{T},y::Array)

Interchange a character for other on a Array (keys must be the indexes)


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
