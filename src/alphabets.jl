const GAPS			= IntSet('.','-')

const DNA_4			= IntSet('A','C','G','T','a','c','g','t')
const DNA_4_GAPPED		= IntSet('A','C','G','T','a','c','g','t','.','-')

const RNA_4			= IntSet('A','C','G','U','a','c','g','u')
const RNA_4_GAPPED		= IntSet('A','C','G','U','a','c','g','u','.','-')

const DNA_AMBIGUOUS		= IntSet('A','C','G','T','a','c','g','t',
				 'R','r','Y','y','W','w','S','s','M','m',
				 'K','k','H','h','B','b','V','v','D','d','N','n','X','x')
const DNA_GAPPED_AMBIGUOUS	= IntSet('A','C','G','T','a','c','g','t',
				 'R','r','Y','y','W','w','S','s','M','m',
				 'K','k','H','h','B','b','V','v','D','d',
				 'N','n','X','x','.','-')

const RNA_AMBIGUOUS		= IntSet('A','C','G','U','a','c','g','u',
				 'R','r','Y','y','W','w','S','s','M','m',
				 'K','k','H','h','B','b','V','v','D','d','N','n','X','x')
const RNA_GAPPED_AMBIGUOUS	= IntSet('A','C','G','U','a','c','g','u',
				 'R','r','Y','y','W','w','S','s','M','m',
				 'K','k','H','h','B','b','V','v','D','d',
				 'N','n','X','x','.','-')

const DNA_COMPLEMENT = Nucleotide[1:128]
      #DNA_COMPLEMENT['.'] = '.'
      #DNA_COMPLEMENT['-'] = '-'
      DNA_COMPLEMENT['A'] = 'T'
      DNA_COMPLEMENT['B'] = 'V'
      DNA_COMPLEMENT['C'] = 'G'
      DNA_COMPLEMENT['D'] = 'H'
      DNA_COMPLEMENT['G'] = 'C'
      DNA_COMPLEMENT['H'] = 'D'
      DNA_COMPLEMENT['K'] = 'M'
      DNA_COMPLEMENT['M'] = 'K'
      DNA_COMPLEMENT['T'] = 'A'
      DNA_COMPLEMENT['V'] = 'B'
      #DNA_COMPLEMENT['S'] = 'S'
      #DNA_COMPLEMENT['W'] = 'W'
      DNA_COMPLEMENT['R'] = 'Y'
      DNA_COMPLEMENT['Y'] = 'R'
      #DNA_COMPLEMENT['N'] = 'N'
      #DNA_COMPLEMENT['X'] = 'X'
      DNA_COMPLEMENT['a'] = 't'
      DNA_COMPLEMENT['b'] = 'v'
      DNA_COMPLEMENT['c'] = 'g'
      DNA_COMPLEMENT['d'] = 'h'
      DNA_COMPLEMENT['g'] = 'c'
      DNA_COMPLEMENT['h'] = 'd'
      DNA_COMPLEMENT['k'] = 'm'
      DNA_COMPLEMENT['m'] = 'k'
      DNA_COMPLEMENT['t'] = 'a'
      DNA_COMPLEMENT['v'] = 'b'
      #DNA_COMPLEMENT['s'] = 's'
      #DNA_COMPLEMENT['w'] = 'w'
      DNA_COMPLEMENT['r'] = 'y'
      DNA_COMPLEMENT['y'] = 'r'
      #DNA_COMPLEMENT['x'] = 'x'
      #DNA_COMPLEMENT['n'] = 'n'

const RNA_COMPLEMENT = Nucleotide[1:128]
      #RNA_COMPLEMENT['.'] = '.'
      #RNA_COMPLEMENT['-'] = '-'
      RNA_COMPLEMENT['A'] = 'U'
      RNA_COMPLEMENT['B'] = 'V'
      RNA_COMPLEMENT['C'] = 'G'
      RNA_COMPLEMENT['D'] = 'H'
      RNA_COMPLEMENT['G'] = 'C'
      RNA_COMPLEMENT['H'] = 'D'
      RNA_COMPLEMENT['K'] = 'M'
      RNA_COMPLEMENT['M'] = 'K'
      RNA_COMPLEMENT['U'] = 'A'
      RNA_COMPLEMENT['V'] = 'B'
      #RNA_COMPLEMENT['S'] = 'S'
      #RNA_COMPLEMENT['W'] = 'W'
      RNA_COMPLEMENT['R'] = 'Y'
      RNA_COMPLEMENT['Y'] = 'R'
      #RNA_COMPLEMENT['N'] = 'N'
      #RNA_COMPLEMENT['X'] = 'X'
      RNA_COMPLEMENT['a'] = 'u'
      RNA_COMPLEMENT['b'] = 'v'
      RNA_COMPLEMENT['c'] = 'g'
      RNA_COMPLEMENT['d'] = 'h'
      RNA_COMPLEMENT['g'] = 'c'
      RNA_COMPLEMENT['h'] = 'd'
      RNA_COMPLEMENT['k'] = 'm'
      RNA_COMPLEMENT['m'] = 'k'
      RNA_COMPLEMENT['u'] = 'a'
      RNA_COMPLEMENT['v'] = 'b'
      #RNA_COMPLEMENT['s'] = 's'
      #RNA_COMPLEMENT['w'] = 'w'
      RNA_COMPLEMENT['r'] = 'y'
      RNA_COMPLEMENT['y'] = 'r'
      #RNA_COMPLEMENT['x'] = 'x'
      #RNA_COMPLEMENT['n'] = 'n'

const NUCLEIC_IUPAC_AMBIGUOUS = (Nucleotide=>Array{Nucleotide,1})[
			'.'	=>	['.';'-'],
			'-'	=>	['.';'-'],
			'A'	=>	['A'],
			'C'	=>	['C'],
			'G'	=>	['G'],
			'T'	=>	['T';'U'],
			'U'	=>	['T';'U'],
			'R'	=>	['G';'A'],
			'Y'	=>	['T';'C';'U'],
			'M'	=>	['A';'C'],
			'K'	=>	['G';'T';'U'],
			'S'	=>	['G';'C'],
			'W'	=>	['A';'T';'U'],
			'H'	=>	['A';'C';'T';'U'],
			'B'	=>	['G';'C';'T';'U'],
			'V'	=>	['A';'C';'G'],
			'D'	=>	['A';'G';'T';'U'],
			'N'	=>	['A';'C';'T';'U';'G']	]

## For Use in Regex ##
const _AMBIGUOUS_NUCLEIC_IUPAC = (Nucleotide=>Array{Uint8,1})[
			'T'	=>	['T';'U'],
			'U'	=>	['T';'U'],
			'R'	=>	['R';'G';'A'],
			'Y'	=>	['Y';'T';'C';'U'],
			'M'	=>	['M';'A';'C'],
			'K'	=>	['K';'G';'T';'U'],
			'S'	=>	['S';'G';'C'],
			'W'	=>	['W';'A';'T';'U'],
			'H'	=>	['W';'M';'Y';'H';'A';'C';'T';'U'],
			'B'	=>	['S';'K';'B';'G';'C';'T';'U'],
			'V'	=>	['S';'M';'R';'V';'A';'C';'G'],
			'D'	=>	['W';'K';'R';'D';'A';'G';'T';'U'],
			'N'	=>	['X';'W';'S';'K';'M';'Y';'R';'N';'A';'C';'T';'U';'G'],
			'X'	=>	['X';'W';'S';'K';'M';'Y';'R';'N';'A';'C';'T';'U';'G'] ]

const AMINO_20			= IntSet('A','C','D','E','F','G','H','I','K','L','M','N','P','Q','R','S','T','V','W','Y',
					 'a','c','d','e','f','g','h','i','k','l','m','n','p','q','r','s','t','v','w','y')
const AMINO_GAPPED_20		= IntSet('-','.','A','C','D','E','F','G','H','I','K','L','M','N','P','Q','R','S','T','V','W','Y',
					 'a','c','d','e','f','g','h','i','k','l','m','n','p','q','r','s','t','v','w','y')
const AMINO_IUPAC		= IntSet('-','.','*','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O',
					 'P','Q','R','S','T','U','V','W','X','Y','Z','a','b','c','d','e','f','g','h','i',
					 'j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z')
const AMINO_IUPAC_EXTENDED	= IntSet('-','.','*','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O',
					 'P','Q','R','S','T','U','V','W','X','Y','Z','a','b','c','d','e','f','g','h','i',
					 'j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z')

const AMINO_1LETTER_TO_3 = (AminoAcid=>ASCIIString)[
		  'A'	=>	"ALA",
		  'B'	=>	"ASX",
		  'C'	=>	"CYS",
		  'D'	=>	"ASP",
		  'E'	=>	"GLU",
		  'F'	=>	"PHE",
		  'G'	=>	"GLY",
		  'H'	=>	"HYS",
		  'I'	=>	"ILE",
		  'J'	=>	"XLE",
		  'K'	=>	"LYS",
		  'L'	=>	"LEU",
		  'M'	=>	"MET",
		  'N'	=>	"ASN",
		  'O'	=>	"PYL",
		  'P'	=>	"PRO",
		  'Q'	=>	"GLN",
		  'R'	=>	"ARG",
		  'S'	=>	"SER",
		  'T'	=>	"THR",
		  'U'	=>	"SEC",
		  'V'	=>	"VAL",
		  'W'	=>	"TPR",
		  'X'	=>	"XXX",
		  'Y'	=>	"TYR",
		  'Z'	=>	"GLX" ]

const AMINO_3LETTERS_TO_1 = (ASCIIString=>AminoAcid)[
		  "ALA"	=>	'A',
		  "ASX"	=>	'B',
		  "CYS"	=>	'C',
 		  "ASP"	=>	'D',
		  "GLU"	=>	'E',
		  "PHE"	=>	'F',
		  "GLY"	=>	'G',
		  "HYS"	=>	'H',
		  "ILE"	=>	'I',
		  "XLE"	=>	'J',
		  "LYS"	=>	'K',
		  "LEU"	=>	'L',
		  "MET"	=>	'M',
		  "ASN"	=>	'N',
		  "PYL"	=>	'O',
		  "PRO"	=>	'P',
		  "GLN"	=>	'Q',
		  "ARG"	=>	'R',
		  "SER"	=>	'S',
		  "THR"	=>	'T',
		  "SEC"	=>	'U',
		  "VAL"	=>	'V',
		  "TPR"	=>	'W',
		  "XXX"	=>	'X',
		  "TYR"	=>	'Y',
		  "GLX"	=>	'Z' ]

const IUPAC_AMINO_EXTENDED = (AminoAcid=>Array{AminoAcid,1})[
		  '-'	=>	['-'; '.'],
		  '.'	=>	['-'; '.'],
		  '*'	=>	['*'],
		  'A'	=>	['A'],
		  'B'	=>	['N'; 'D'],
		  'C'	=>	['C'],
		  'D'	=>	['D'],
		  'E'	=>	['E'],
		  'F'	=>	['F'],
		  'G'	=>	['G'],
		  'H'	=>	['H'],
		  'I'	=>	['I'],
		  'J'	=>	['I'; 'L'],
		  'K'	=>	['K'],
		  'L'	=>	['L'],
		  'M'	=>	['M'],
		  'N'	=>	['N'],
		  'O'	=>	['O'],
		  'P'	=>	['P'],
		  'Q'	=>	['Q'],
		  'R'	=>	['R'],
		  'S'	=>	['S'],
		  'T'	=>	['T'],
		  'U'	=>	['U'],
		  'V'	=>	['V'],
		  'W'	=>	['W'],
		  'X'	=>	['A'; 'C'; 'D'; 'E'; 'F'; 'G'; 'H'; 'I'; 'K';
				 'L'; 'M'; 'N'; 'P'; 'Q'; 'R'; 'S'; 'T'; 'V'; 'W'; 'Y'],
		  'Y'	=>	['Y'],
		  'Z'	=>	['Q'; 'E'] ]

## For Use in Regex ##
const _AMBIGUOUS_AMINO_IUPAC = (AminoAcid=>Array{Uint8,1})[
		  'B'	=>	['B'; 'N'; 'D'],
		  'X'	=>	['X'; 'B'; 'Z'; 'A'; 'C'; 'D'; 'E'; 'F'; 'G'; 'H'; 'I'; 'K';
				 'L'; 'M'; 'N'; 'P'; 'Q'; 'R'; 'S'; 'T'; 'V'; 'W'; 'Y'],
		  'Z'	=>	['Z'; 'Q'; 'E'],
		  'J'	=>	['J'; 'L'; 'I'] ]