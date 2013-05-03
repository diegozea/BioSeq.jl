module BioSeq


  ## Dependencies ##
  using Base.Intrinsics

  # import Base.convert, Base.show
  importall Base

  ## Exported methods and types #print(io,char(x))#
  export BioUnit,
	uppercase!,
	lowercase!,
	swap!,
	swap,
	in,
	check,
	Nucleotide, ## For Nucleotides
	nt,
	nucleotide,
	@nt_str,
	@ntr_str,
	dna2rna!,
	dna2rna,
	rna2dna!,
	rna2dna,
	complement!,
	complement,
	reversecomplement!,
	reversecomplement,
	GAPS,
	DNA_4,
	DNA_4_GAPPED,
	RNA_4,
	RNA_4_GAPPED,
	DNA_AMBIGUOUS,
	DNA_GAPPED_AMBIGUOUS,
	RNA_AMBIGUOUS,
	RNA_GAPPED_AMBIGUOUS,
	DNA_COMPLEMENT,
	RNA_COMPLEMENT,
	NUCLEIC_IUPAC_AMBIGUOUS,
	AminoAcid, ## For Amino Acids
	aa,
	aminoacid,
	@aa_str,
	@aar_str,
	AMINO_20,
	AMINO_20_UPPERCASE,
	AMINO_GAPPED_20,
	AMINO_IUPAC,
	AMINO_IUPAC_EXTENDED,
	AMINO_1LETTER_TO_3,
	AMINO_3LETTERS_TO_1,
	IUPAC_AMINO_EXTENDED,
	Nucleotide2bitSeq, ## 2-bit DNA
	Nucleotide2bitBase,
	Nucleotide2bit,
	percentGC,
	nucleotide2bit,
	@nt2_str,
	isadenine,
	iscytosine,
	isthymine,
	isguanine,
	isweak,
	isstrong,
	ispyrimidine,
	ispurine,
	Nucleotide8bit, # A Bit-Level Coding Scheme for Nucleotides
	nucleotide8bit,
	@nt8_str,
	isknown,
	CODON_TABLES, # translate nt to aa
	codon2aa,
	isstop,
	isstart,
	translateCDS,
	translatetostop,
	translate,
	_codons,
	@prosite_str # Prosite patterns

  ## Load files ##
  include(Pkg.dir("BioSeq", "src", "biounits.jl"))
  include(Pkg.dir("BioSeq", "src", "stringlike.jl"))
  include(Pkg.dir("BioSeq", "src", "alphabetsfunc.jl"))
  include(Pkg.dir("BioSeq", "src", "alphabets.jl"))
  include(Pkg.dir("BioSeq", "src", "prosite.jl"))
  include(Pkg.dir("BioSeq", "src", "functions.jl"))
  include(Pkg.dir("BioSeq", "src", "dna2.jl"))
  include(Pkg.dir("BioSeq", "src", "bitlevelnucleotide.jl"))
  include(Pkg.dir("BioSeq", "src", "translate.jl"))
end
