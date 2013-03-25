using BioSeq
using Test

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

@test [ seq', seqII' ] == [ seq seqII ]' == vcat( seq', seqII' ) == nucleotide([ "ACTG".data', "TGAC".data' ])

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

@test [x.match for x in [each_match(aar"A",aa"ACAC")...]] == [ "A"; "A" ]
@test [x.match for x in [each_match(ntr"A",nt"ACAC")...]] == [ "A"; "A" ]

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

@test sum(in(nt"ACTGactg", DNA_4 )) == 8
@test sum(in(nt"MCTGactg", DNA_4 )) == 7

@test swap(nt"ACTG", DNA_COMPLEMENT) == nt"TGAC"
@test swap(aa"MHAC", AMINO_1LETTER_TO_3) == [ "MET"; "HYS"; "ALA"; "CYS" ]

## Test for DNA2Seq ##

##	A	C	T	G
## b1	0	0	1	1
## b2	0	1	0	1

@test dna2"ACTG".b1 == [false, false, true, true]

@test dna2"ACTG".b2 == [false, true, false, true]

@test dna2"ACTG" == dna2("ACTG")

@test dna2"ACTG"[2] == 'C'

@test nucleotide(DNA2Seq(10)) == nt"AAAAAAAAAA"

@test length(DNA2Seq(10)[1:3])==3

@test complement(dna2"ACTG") == dna2"TGAC"

@test reversecomplement(dna2"ACTG") == dna2"CAGT"

@test percentGC(dna2"AACC") == 0.5

seq = dna2"ACTG"
ntseq = nucleotide(seq)
@test isadenine(seq) == (ntseq .== 'A')
@test iscytosine(seq) == (ntseq .== 'C')
@test isthymine(seq) == (ntseq .== 'T')
@test isguanine(seq) == (ntseq .== 'G')
@test isweak(seq) == ((ntseq .== 'A') | (ntseq .== 'T'))
@test isstrong(seq) == ((ntseq .== 'C') | (ntseq .== 'G'))
@test ispyrimidine(seq) == ((ntseq .== 'C') | (ntseq .== 'T'))
@test ispurine(seq) == ((ntseq .== 'A') | (ntseq .== 'G'))


