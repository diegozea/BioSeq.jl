using Test

@test nt('A') == nt(65) == nt(0x41)
@test aa('A') == aa(65) == aa(0x41)

@test nt"AC" == nt([65; 67]) == [ nt('A'); nt('C') ]
@test aa"AC" == aa([65; 67]) == [ aa('A'); aa('C') ]

@test nt"ACTG" == nt("ACTG")
@test aa"ACTG" == aa("ACTG")

@test integer(nt('A')) == integer(aa('A')) == integer('A')
@test unsigned(nt('A')) == unsigned(aa('A')) == unsigned('A')

@test aa('A') + 32 == 32 + aa('A') == aa('a')
@test nt('A') + 32 == 32 + nt('A') == nt('a')

@test aa('a') - 32 == -32 + aa('a') == aa('A')
@test aa('a') - 32 == -32 + aa('a') == aa('A')

seq = nt"TG"
@test nt"AC$seq" == nt"ACTG"

seq = aa"HM"
@test aa"AC$seq" == aa"ACHM"

@test nt"ACTG" == nt("ACTG") == ntseq("ACTG")
@test aa"ACTG" == aa("ACTG") == aaseq("ACTG")

seq   = nt"ACTG"
seqII = nt"TGAC"

@test [ seq', seqII' ] == [ seq seqII ]' == vcat( seq', seqII' ) == ntaln([ "ACTG".data', "TGAC".data' ])

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

@test aa('A') == uppercase(aa('a'))
@test nt('A') == uppercase(nt('a'))

@test aa('a') == lowercase(aa('A'))
@test nt('a') == lowercase(nt('A'))

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
