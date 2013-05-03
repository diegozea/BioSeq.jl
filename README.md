BioSeq.jl
=========
<<<<<<< HEAD
Version 0.2.0
=======
Version 0.1.0
>>>>>>> 285d60a519ac5da55c7075d582b3d2ca1e5e10c7

**Package for working with Nucleotides and Amino Acids on [The Julia Language](http://julialang.org/)**

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
	* PROSITE patterns are available for matching functions
  * Alignments can be represented as Matrices of this types
  * DArray of this types can be used for parallel computation
  * Memory-mapped arrays of this types can be used for huge data
* 8-bit Bit-Level Coding Scheme for Nucleotides
* Translation methods and genetic codes
* Tools for using IntSet/Set/Dict as alphabets
  * Common alphabets as IntSet, including extended IUPAC
  * Dicts for generate complement for nucleotide sequences or change between 3 letter and 1 letter alphabets on Proteins
  * Test for characters on alphabet
  * Check for all characters on alphabet
  * Swap for alphabet conversions

# Documentation

* [Library-style function reference](https://github.com/diegozea/BioSeq.jl/blob/master/doc/Reference.md)

# Demo

```
julia> using BioSeq

julia> dnaseq = repeat( nt"GATTACA" , 2 )
14-element Nucleotide Array:
 G
 A
 T
 T
 A
 C
 A
 G
 A
 T
 T
 A
 C
 A

julia> protseq = translate(dnaseq,1)
4-element AminoAcid Array:
 D
 Y
 R
 L

julia> if ismatch( prosite"<D-x-[RM]" , protseq )
         threeletters = swap(protseq, AMINO_1LETTER_TO_3 )
       end
4-element ASCIIString Array:
 "ASP"
 "TYR"
 "ARG"
 "LEU"

```
Contributing
------------

**Fork and send a pull request or create a [GitHub issue](https://github.com/diegozea/BioSeq.jl/issues) for bug reports or feature requests**
