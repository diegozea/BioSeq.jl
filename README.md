BioSeq.jl
=========
Version 0.0.0

Package for working with Nucleotides and Amino Acids on Julia

# Installation

```
Pkg.init() # Only the first time you install a Julia's Package

Pkg.add("BioSeq") # Install BioSeq.jl

using BioSeq # Starting to use BioSeq
```

# Features

* 2-bit DNA sequence `DNA2Seq` for saving memory
  * Faster vectorized test for calculate percentage of GC, and test A C T G on `DNA2Seq`
* 8-bit bitstype `Nucleotide` and `AminoAcid`
  * Vectors of this types can be used as DNA, RNA or Protein Sequences
    * Some string's functions working for Sequences:
      * Case conversions
      * Matching functions (search, replace and others)
	* IUPAC Regex is available for matching functions
  * Alignments can be represented as Matrices of this types
* Tools for using IntSet/Set/Dict as alphabets
  * Common alphabets as IntSet, including extended IUPAC
  * Dicts for generate complement for nucleotide sequences or change between 3 letter and 1 letter alphabets on Proteins
  * Test for characters on alphabet
  * Check for all characters on alphabet
  * Swap for alphabet conversions

# Demo

```
julia> using BioSeq

julia> ## Protein ##

julia> prot = aa"MHPAVFLSL";

julia> check(prot,AMINO_IUPAC) ## Check alphabet

julia> m = search(prot,aar"MX{2,3}V") ## Using IUPAC REGEX
1:5

julia> three = swap(prot,AMINO_1LETTER_TO_3) ## Swap for interchange between alphabets
9-element ASCIIString Array:
 "MET"
 "HYS"
 "PRO"
 "ALA"
 "VAL"
 "PHE"
 "LEU"
 "SER"
 "LEU"

julia> ## Nucleotide ##

julia> seq = nt"gattaca"
7-element Nucleotide Array:
 g
 a
 t
 t
 a
 c
 a

julia> uppercase!(seq)
7-element Nucleotide Array:
 G
 A
 T
 T
 A
 C
 A

julia> reversecomplement!(seq,DNA_COMPLEMENT) # Reverse complement
7-element Nucleotide Array:
 T
 G
 T
 A
 A
 T
 C

julia> match(ntr"TNT",seq) # IUPAC REGEX
RegexMatch("TGT")

julia> swap!(seq,'T','U') # or dna2rna!(seq)
7-element Nucleotide Array:
 U
 G
 U
 A
 A
 U
 C

julia> seq2bit = dna2seq("ACTG") # Creates a DNA sequence of 2 bits
4 bp DNA2Seq:
 A
 C
 T
 G

julia> reversecomplement!(seq2bit)
4 bp DNA2Seq:
 C
 A
 G
 T

julia> nucleotide(seq2bit) # Convert into Nucleotide Vector (8-bit Sequence)
4-element Nucleotide Array:
 G
 T
 C
 A

```

# Documentation

* [Library-style function reference](https://github.com/diegozea/BioSeq.jl/blob/master/doc/Reference.md)
