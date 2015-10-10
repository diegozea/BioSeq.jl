using BioSeq
using Base.Test

@test nucleotide('A') == nucleotide(65) == nucleotide(0x41)
@test aminoacid('A') == aminoacid(65) == aminoacid(0x41)

@test nt"AC" == nucleotide([65; 67]) == [ nucleotide('A'); nucleotide('C') ]
@test aa"AC" == aminoacid([65; 67]) == [ aminoacid('A'); aminoacid('C') ]

@test nt"ACTG" == nucleotide("ACTG")
@test aa"ACTG" == aminoacid("ACTG")

@test aminoacid('A') + 32 == 32 + aminoacid('A') == aminoacid('a')
@test nucleotide('A') + 32 == 32 + nucleotide('A') == nucleotide('a')

@test aminoacid('a') - 32 == -32 + aminoacid('a') == aminoacid('A')
@test nucleotide('a') - 32 == -32 + nucleotide('a') == nucleotide('A')

# # but string interpolation is only supported for Julia 0.1
# seq = nt"TG"
# @test nt"AC$seq" == nt"ACTG"
#
# seq = aa"HM"
# @test aa"AC$seq" == aa"ACHM"

@test nt"ACTG" == nucleotide("ACTG")
@test aa"ACTG" == aminoacid("ACTG")

seq   = nt"ACTG"
seqII = nt"TGAC"

@test [ seq'; seqII' ] == [ seq seqII ]' == vcat( seq', seqII' ) == nucleotide([ "ACTG".data'; "TGAC".data' ])

@test nt"ACUG" == dna2rna(nt"ACTG")
@test nt"ACTG" == rna2dna(nt"ACUG")

@test nt"TGAC" == complement(nt"ACTG",DNA_COMPLEMENT)
@test nt"UGAC" == complement(nt"ACUG",RNA_COMPLEMENT)

@test nt"CAGT" == reversecomplement(nt"ACTG",DNA_COMPLEMENT)
@test nt"CAGU" == reversecomplement(nt"ACUG",RNA_COMPLEMENT)

@test aa"acmh" == lowercase(aa"ACmh")
@test nt"actg" == lowercase(nt"ACtg")

@test aa"ACMH" == uppercase(aa"ACmh")
@test nt"ACTG" == uppercase(nt"ACtg")

@test aminoacid('A') == uppercase(aminoacid('a'))
@test nucleotide('A') == uppercase(nucleotide('a'))

@test aminoacid('a') == lowercase(aminoacid('A'))
@test nucleotide('a') == lowercase(nucleotide('A'))

@test ismatch(aar"X",aa"ACMH") == true
@test ismatch(ntr"N",nt"ACTG") == true

@test match(aar"X",aa"ACMH").match == "A"
@test match(ntr"N",nt"ACTG").match == "A"

@test match(aar"X",aa"ACMH",2).match == "C"
@test match(ntr"N",nt"ACTG",2).match == "C"

@test search(aa"ACAC",'A') == 1
@test search(nt"ACAC",'A') == 1

@test search(aa"ACAC",'A',2) == 3
@test search(nt"ACAC",'A',2) == 3

@test search(aa"ACAC",aar"A") == 1:1
@test search(nt"ACAC",ntr"A") == 1:1

@test search(aa"ACAC",aar"A",2) == 3:3
@test search(nt"ACAC",ntr"A",2) == 3:3

@test [x.match for x in [eachmatch(aar"A",aa"ACAC")...]] == [ "A"; "A" ]
@test [x.match for x in [eachmatch(ntr"A",nt"ACAC")...]] == [ "A"; "A" ]

@test repeat(aa"A",3) == aa"AAA"
@test repeat(nt"A",3) == nt"AAA"

@test repeat(aa"AC",2) == aa"ACAC"
@test repeat(nt"AC",2) == nt"ACAC"

@test swap(aa"ACMH",'H','X') == aa"ACMX"
@test swap(nt"ACTG",'T','U') == nt"ACUG"

@test replace(aa"ACAC",r"A",aa"M") == aa"MCMC"
@test replace(aa"ACAC",r"AC",aa"M") == aa"MM"
@test replace(aa"ACAC",r"ACA",aa"M") == aa"MC"
@test replace(aa"ACAC",r"A",aa"TH") == aa"THCTHC"

@test sum(isin(nt"ACTGactg", NUCLEIC_IUPAC )) == 8
@test sum(isin(nt"ECTGactg", NUCLEIC_IUPAC )) == 7

@test swap(nt"ACTG", DNA_COMPLEMENT) == nt"TGAC"
@test swap(aa"MHAC", AMINO_1LETTER_TO_3) == [ "MET"; "HYS"; "ALA"; "CYS" ]

## Test for Nucleotide2bitSeq ##

##	A	C	T	G
## b1	0	0	1	1
## b2	0	1	0	1

@test nt2"ACTG".b1 == [false, false, true, true]
@test nt2"ACTG".b2 == [false, true, false, true]

@test nt2"ACTG" == nucleotide2bit("ACTG")
@test nt2"ACTG"[2] == 'C'

@test nt2"ACTG" == nt2"actg" == nt2"ACUG" == nt2"acug"

@test nucleotide(Nucleotide2bitSeq(10)) == nt"AAAAAAAAAA"

@test length(Nucleotide2bitSeq(10)[1:3])==3

@test complement(nt2"ACTG") == nt2"TGAC"
@test reversecomplement(nt2"ACTG") == nt2"CAGT"

@test percentGC(nt2"AACC") == 0.5

seq = nt2"ACTG"
ntseq = nucleotide(seq)
@test isadenine(seq) == (ntseq .== 'A')
@test iscytosine(seq) == (ntseq .== 'C')
@test isthymine(seq) == (ntseq .== 'T')
@test isguanine(seq) == (ntseq .== 'G')
@test isweak(seq) == ((ntseq .== 'A') | (ntseq .== 'T'))
@test isstrong(seq) == ((ntseq .== 'C') | (ntseq .== 'G'))
@test ispyrimidine(seq) == ((ntseq .== 'C') | (ntseq .== 'T'))
@test ispurine(seq) == ((ntseq .== 'A') | (ntseq .== 'G'))

## Test for Prosite Patterns ##

@test ismatch(prosite"M-[ALT]",aa"HML")
@test ismatch(prosite"M-{ALT}",aa"HMM")
@test ismatch(prosite"M-{ALT}",aa"HMM")
@test ismatch(prosite"M-x(2,10)-M",aa"MALHM")
@test ismatch(prosite"x(3)",aa"ALM")
@test ismatch(prosite"x(2,4)",aa"ALM")
@test ismatch(prosite"x(3)",aa"AAA")
@test ismatch(prosite"<A-L",aa"ALMH")
@test ismatch(prosite"<A-L",aa"LALMH") == false
@test ismatch(prosite"F-[GSTV]-P-R-L-[G>]",aa"FVPRLGH")
@test ismatch(prosite"F-[GSTV]-P-R-L-[G>]",aa"FVPRL")
@test ismatch(prosite"F-[GSTV]-P-R-L-[G>]",aa"FVPRLLL") == false
@test ismatch(prosite"M-A-S-K-E",aa"MASKE")
@test ismatch(prosite"MASKE",aa"MASKE")
@test ismatch(prosite"<{C}*>",aa"FVLRPHM")
@test ismatch(prosite"<{C}*>",aa"FVLRPHCM") == false
@test ismatch(prosite"[AC]-x-V-x(4)-{ED}",aa"AHVRLPLG")
@test ismatch(prosite"<A-x-[ST](2)-x(0,1)-V",aa"AHTSV")

## Test Translate ##

@test codon2aa(nt"GTG",1) == 'V'
@test isstart(nt"GTG",2)
@test isstop(nt"TGA",1)
@test isstart(nt"GTGGTAATGTGAAAGTAG",2) == reverse( isstop(nt"GTGGTAATGTGAAAGTAG",1) )
@test translateCDS(nt"GTGGTAATGTGAAAGTAG",2) == aa"MVMWK"
@test translatetostop(nt"GTGGTAATGTGAAAGTAG",1) == aa"VVM"

@test translate(nt"GTGGTAATGTGAAAGTAG",1) == aa"VVM*K*"
@test translate(nt2"GTGGTAATGTGAAAGTAG",1) == aa"VVM*K*"
@test translate(nt8"GTGGTAATGTGAAAGTAG",1) == aa"VVM*K*"

## Test for 8 bit Bit-Level Coding Scheme Nucleotides ##

@test nt8"ACTG" == nt8"actg" == nt8"ACUG" == nt8"acug"
@test nt8"ACTG" == nt"ACTG"

@test nt8"ACTG" == nucleotide8bit("ACTG")
@test nt8"ACTG"[2] == 'C'

@test nucleotide(nt8"ACTG") == nt"ACTG"

@test length(nt8"AAACCCTTT"[1:3])==3

@test percentGC(nt8"AACC") == 0.5

seq = nt8"ACTG"
ntseq = nucleotide(seq)
@test isadenine(seq) == (ntseq .== 'A')
@test iscytosine(seq) == (ntseq .== 'C')
@test isthymine(seq) == (ntseq .== 'T')
@test isguanine(seq) == (ntseq .== 'G')
@test ispyrimidine(seq) == ((ntseq .== 'C') | (ntseq .== 'T'))
@test ispurine(seq) == ((ntseq .== 'A') | (ntseq .== 'G'))

# # TO DO:
# @test nt8"ACTG" == nt"ACUG"
# @test nt8"ACTG" == nt2"ACTG"
# @test complement(nt8"ACTG") == nt8"TGAC"
# @test reversecomplement(nt8"ACTG") == nt8"CAGT"
# @test isweak(seq) == ((ntseq .== 'A') | (ntseq .== 'T'))
# @test isstrong(seq) == ((ntseq .== 'C') | (ntseq .== 'G'))

