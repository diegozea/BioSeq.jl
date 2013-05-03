const _index = [1,2,3,4,5,6,0,0,7,8,9,10,11,12,13,14,0,0,0,0,15,16,17,18]

const _amino = reinterpret(AminoAcid,[0x46  0x46  0x46  0x46  0x46  0x46  0x46  0x46  0x46  0x46  0x46  0x46  0x46  0x46  0x46  0x46  0x46  0x46;
 0x46  0x46  0x46  0x46  0x46  0x46  0x46  0x46  0x46  0x46  0x46  0x46  0x46  0x46  0x46  0x46  0x46  0x46;
 0x4c  0x4c  0x4c  0x4c  0x4c  0x4c  0x4c  0x4c  0x4c  0x4c  0x4c  0x4c  0x4c  0x4c  0x4c  0x4c  0x2a  0x4c;
 0x4c  0x4c  0x4c  0x4c  0x4c  0x4c  0x4c  0x4c  0x4c  0x4c  0x4c  0x4c  0x4c  0x4c  0x4c  0x4c  0x4c  0x4c;
 0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53;
 0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53;
 0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x2a  0x53  0x53;
 0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53;
 0x59  0x59  0x59  0x59  0x59  0x59  0x59  0x59  0x59  0x59  0x59  0x59  0x59  0x59  0x59  0x59  0x59  0x59;
 0x59  0x59  0x59  0x59  0x59  0x59  0x59  0x59  0x59  0x59  0x59  0x59  0x59  0x59  0x59  0x59  0x59  0x59;
 0x2a  0x2a  0x2a  0x2a  0x2a  0x51  0x2a  0x2a  0x2a  0x2a  0x2a  0x59  0x2a  0x2a  0x2a  0x2a  0x2a  0x2a;
 0x2a  0x2a  0x2a  0x2a  0x2a  0x51  0x2a  0x2a  0x2a  0x2a  0x2a  0x2a  0x51  0x4c  0x2a  0x4c  0x2a  0x2a;
 0x43  0x43  0x43  0x43  0x43  0x43  0x43  0x43  0x43  0x43  0x43  0x43  0x43  0x43  0x43  0x43  0x43  0x43;
 0x43  0x43  0x43  0x43  0x43  0x43  0x43  0x43  0x43  0x43  0x43  0x43  0x43  0x43  0x43  0x43  0x43  0x43;
 0x2a  0x57  0x57  0x57  0x57  0x2a  0x57  0x43  0x2a  0x2a  0x57  0x57  0x2a  0x2a  0x57  0x2a  0x2a  0x57;
 0x57  0x57  0x57  0x57  0x57  0x57  0x57  0x57  0x57  0x57  0x57  0x57  0x57  0x57  0x57  0x57  0x57  0x57;
 0x4c  0x4c  0x54  0x4c  0x4c  0x4c  0x4c  0x4c  0x4c  0x4c  0x4c  0x4c  0x4c  0x4c  0x4c  0x4c  0x4c  0x4c;
 0x4c  0x4c  0x54  0x4c  0x4c  0x4c  0x4c  0x4c  0x4c  0x4c  0x4c  0x4c  0x4c  0x4c  0x4c  0x4c  0x4c  0x4c;
 0x4c  0x4c  0x54  0x4c  0x4c  0x4c  0x4c  0x4c  0x4c  0x4c  0x4c  0x4c  0x4c  0x4c  0x4c  0x4c  0x4c  0x4c;
 0x4c  0x4c  0x54  0x4c  0x4c  0x4c  0x4c  0x4c  0x4c  0x53  0x4c  0x4c  0x4c  0x4c  0x4c  0x4c  0x4c  0x4c;
 0x50  0x50  0x50  0x50  0x50  0x50  0x50  0x50  0x50  0x50  0x50  0x50  0x50  0x50  0x50  0x50  0x50  0x50;
 0x50  0x50  0x50  0x50  0x50  0x50  0x50  0x50  0x50  0x50  0x50  0x50  0x50  0x50  0x50  0x50  0x50  0x50;
 0x50  0x50  0x50  0x50  0x50  0x50  0x50  0x50  0x50  0x50  0x50  0x50  0x50  0x50  0x50  0x50  0x50  0x50;
 0x50  0x50  0x50  0x50  0x50  0x50  0x50  0x50  0x50  0x50  0x50  0x50  0x50  0x50  0x50  0x50  0x50  0x50;
 0x48  0x48  0x48  0x48  0x48  0x48  0x48  0x48  0x48  0x48  0x48  0x48  0x48  0x48  0x48  0x48  0x48  0x48;
 0x48  0x48  0x48  0x48  0x48  0x48  0x48  0x48  0x48  0x48  0x48  0x48  0x48  0x48  0x48  0x48  0x48  0x48;
 0x51  0x51  0x51  0x51  0x51  0x51  0x51  0x51  0x51  0x51  0x51  0x51  0x51  0x51  0x51  0x51  0x51  0x51;
 0x51  0x51  0x51  0x51  0x51  0x51  0x51  0x51  0x51  0x51  0x51  0x51  0x51  0x51  0x51  0x51  0x51  0x51;
 0x52  0x52  0x52  0x52  0x52  0x52  0x52  0x52  0x52  0x52  0x52  0x52  0x52  0x52  0x52  0x52  0x52  0x52;
 0x52  0x52  0x52  0x52  0x52  0x52  0x52  0x52  0x52  0x52  0x52  0x52  0x52  0x52  0x52  0x52  0x52  0x52;
 0x52  0x52  0x52  0x52  0x52  0x52  0x52  0x52  0x52  0x52  0x52  0x52  0x52  0x52  0x52  0x52  0x52  0x52;
 0x52  0x52  0x52  0x52  0x52  0x52  0x52  0x52  0x52  0x52  0x52  0x52  0x52  0x52  0x52  0x52  0x52  0x52;
 0x49  0x49  0x49  0x49  0x49  0x49  0x49  0x49  0x49  0x49  0x49  0x49  0x49  0x49  0x49  0x49  0x49  0x49;
 0x49  0x49  0x49  0x49  0x49  0x49  0x49  0x49  0x49  0x49  0x49  0x49  0x49  0x49  0x49  0x49  0x49  0x49;
 0x49  0x4d  0x4d  0x49  0x4d  0x49  0x49  0x49  0x49  0x49  0x4d  0x49  0x49  0x49  0x4d  0x49  0x49  0x49;
 0x4d  0x4d  0x4d  0x4d  0x4d  0x4d  0x4d  0x4d  0x4d  0x4d  0x4d  0x4d  0x4d  0x4d  0x4d  0x4d  0x4d  0x4d;
 0x54  0x54  0x54  0x54  0x54  0x54  0x54  0x54  0x54  0x54  0x54  0x54  0x54  0x54  0x54  0x54  0x54  0x54;
 0x54  0x54  0x54  0x54  0x54  0x54  0x54  0x54  0x54  0x54  0x54  0x54  0x54  0x54  0x54  0x54  0x54  0x54;
 0x54  0x54  0x54  0x54  0x54  0x54  0x54  0x54  0x54  0x54  0x54  0x54  0x54  0x54  0x54  0x54  0x54  0x54;
 0x54  0x54  0x54  0x54  0x54  0x54  0x54  0x54  0x54  0x54  0x54  0x54  0x54  0x54  0x54  0x54  0x54  0x54;
 0x4e  0x4e  0x4e  0x4e  0x4e  0x4e  0x4e  0x4e  0x4e  0x4e  0x4e  0x4e  0x4e  0x4e  0x4e  0x4e  0x4e  0x4e;
 0x4e  0x4e  0x4e  0x4e  0x4e  0x4e  0x4e  0x4e  0x4e  0x4e  0x4e  0x4e  0x4e  0x4e  0x4e  0x4e  0x4e  0x4e;
 0x4b  0x4b  0x4b  0x4b  0x4b  0x4b  0x4e  0x4b  0x4b  0x4b  0x4b  0x4e  0x4b  0x4b  0x4e  0x4b  0x4b  0x4b;
 0x4b  0x4b  0x4b  0x4b  0x4b  0x4b  0x4b  0x4b  0x4b  0x4b  0x4b  0x4b  0x4b  0x4b  0x4b  0x4b  0x4b  0x4b;
 0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53;
 0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53  0x53;
 0x52  0x2a  0x52  0x52  0x53  0x52  0x53  0x52  0x52  0x52  0x47  0x53  0x52  0x52  0x53  0x52  0x52  0x53;
 0x52  0x2a  0x52  0x52  0x53  0x52  0x53  0x52  0x52  0x52  0x47  0x53  0x52  0x52  0x53  0x52  0x52  0x4b;
 0x56  0x56  0x56  0x56  0x56  0x56  0x56  0x56  0x56  0x56  0x56  0x56  0x56  0x56  0x56  0x56  0x56  0x56;
 0x56  0x56  0x56  0x56  0x56  0x56  0x56  0x56  0x56  0x56  0x56  0x56  0x56  0x56  0x56  0x56  0x56  0x56;
 0x56  0x56  0x56  0x56  0x56  0x56  0x56  0x56  0x56  0x56  0x56  0x56  0x56  0x56  0x56  0x56  0x56  0x56;
 0x56  0x56  0x56  0x56  0x56  0x56  0x56  0x56  0x56  0x56  0x56  0x56  0x56  0x56  0x56  0x56  0x56  0x56;
 0x41  0x41  0x41  0x41  0x41  0x41  0x41  0x41  0x41  0x41  0x41  0x41  0x41  0x41  0x41  0x41  0x41  0x41;
 0x41  0x41  0x41  0x41  0x41  0x41  0x41  0x41  0x41  0x41  0x41  0x41  0x41  0x41  0x41  0x41  0x41  0x41;
 0x41  0x41  0x41  0x41  0x41  0x41  0x41  0x41  0x41  0x41  0x41  0x41  0x41  0x41  0x41  0x41  0x41  0x41;
 0x41  0x41  0x41  0x41  0x41  0x41  0x41  0x41  0x41  0x41  0x41  0x41  0x41  0x41  0x41  0x41  0x41  0x41;
 0x44  0x44  0x44  0x44  0x44  0x44  0x44  0x44  0x44  0x44  0x44  0x44  0x44  0x44  0x44  0x44  0x44  0x44;
 0x44  0x44  0x44  0x44  0x44  0x44  0x44  0x44  0x44  0x44  0x44  0x44  0x44  0x44  0x44  0x44  0x44  0x44;
 0x45  0x45  0x45  0x45  0x45  0x45  0x45  0x45  0x45  0x45  0x45  0x45  0x45  0x45  0x45  0x45  0x45  0x45;
 0x45  0x45  0x45  0x45  0x45  0x45  0x45  0x45  0x45  0x45  0x45  0x45  0x45  0x45  0x45  0x45  0x45  0x45;
 0x47  0x47  0x47  0x47  0x47  0x47  0x47  0x47  0x47  0x47  0x47  0x47  0x47  0x47  0x47  0x47  0x47  0x47;
 0x47  0x47  0x47  0x47  0x47  0x47  0x47  0x47  0x47  0x47  0x47  0x47  0x47  0x47  0x47  0x47  0x47  0x47;
 0x47  0x47  0x47  0x47  0x47  0x47  0x47  0x47  0x47  0x47  0x47  0x47  0x47  0x47  0x47  0x47  0x47  0x47;
 0x47  0x47  0x47  0x47  0x47  0x47  0x47  0x47  0x47  0x47  0x47  0x47  0x47  0x47  0x47  0x47  0x47  0x47])

const _start = convert(BitArray,[false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false;
 false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false;
 false  false  false   true  false  false  false  false  false  false  false  false  false  false  false  false  false  false;
  true  false  false   true   true  false  false  false   true  false   true  false  false  false  false  false  false   true;
 false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false;
 false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false;
 false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false;
 false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false;
 false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false;
 false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false;
 false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false;
 false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false;
 false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false;
 false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false;
 false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false;
 false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false;
 false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false;
 false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false;
 false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false;
  true  false  false   true  false  false  false  false   true   true  false  false  false  false  false  false  false   true;
 false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false;
 false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false;
 false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false;
 false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false;
 false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false;
 false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false;
 false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false;
 false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false;
 false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false;
 false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false;
 false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false;
 false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false;
 false   true  false   true   true  false  false  false   true  false  false  false  false  false  false  false   true  false;
 false   true  false   true   true  false  false  false   true  false  false  false  false  false  false  false  false  false;
 false   true   true   true   true  false  false  false   true  false   true  false  false  false  false  false  false  false;
  true   true   true   true   true   true   true   true   true   true   true   true   true   true   true   true   true   true;
 false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false;
 false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false;
 false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false;
 false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false;
 false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false;
 false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false;
 false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false;
 false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false;
 false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false;
 false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false;
 false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false;
 false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false;
 false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false;
 false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false;
 false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false;
 false   true  false   true   true  false   true  false   true  false   true  false  false  false   true  false   true   true;
 false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false;
 false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false;
 false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false;
 false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false;
 false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false;
 false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false;
 false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false;
 false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false;
 false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false;
 false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false;
 false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false;
 false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false  false])

const _codons = (Vector{Nucleotide}=>Int)[['G','C','U']=>53,['G','C','t']=>53,['u','U','G']=>4,['C','C','t']=>21,['U','G','c']=>14,
['u','U','U']=>1,['C','u','U']=>17,['C','A','T']=>25,['c','T','T']=>17,['c','T','G']=>20,
['A','T','A']=>35,['A','C','g']=>40,['T','C','g']=>8,['G','A','t']=>57,['U','C','a']=>7,
['U','C','G']=>8,['C','G','c']=>30,['G','A','U']=>57,['t','C','A']=>7,['t','G','C']=>14,
['U','G','G']=>16,['C','g','G']=>32,['G','t','A']=>51,['T','G','C']=>14,['U','G','C']=>14,
['g','C','T']=>53,['T','G','a']=>15,['C','C','a']=>23,['G','C','c']=>54,['C','A','a']=>27,
['C','t','T']=>17,['A','A','C']=>42,['A','u','A']=>35,['c','A','C']=>26,['a','T','G']=>36,
['A','A','a']=>43,['u','U','C']=>2,['G','A','G']=>60,['G','a','G']=>60,['g','A','C']=>58,
['c','C','C']=>22,['C','U','u']=>17,['T','g','T']=>13,['c','C','U']=>21,['C','G','G']=>32,
['a','T','C']=>34,['A','G','t']=>45,['A','C','a']=>39,['c','A','U']=>25,['a','C','G']=>40,
['G','T','A']=>51,['G','C','a']=>55,['A','C','u']=>37,['c','T','C']=>18,['c','G','U']=>29,
['a','T','A']=>35,['T','t','T']=>1,['A','U','U']=>33,['g','T','G']=>52,['C','T','G']=>20,
['C','a','U']=>25,['a','C','C']=>38,['G','g','T']=>61,['u','A','C']=>10,['a','C','A']=>39,
['U','c','U']=>5,['G','U','u']=>49,['A','A','A']=>43,['G','T','a']=>51,['G','T','G']=>52,
['a','U','U']=>33,['C','C','C']=>22,['U','C','g']=>8,['C','G','t']=>29,['A','t','G']=>36,
['G','G','t']=>61,['A','C','G']=>40,['a','A','A']=>43,['A','T','T']=>33,['G','G','u']=>61,
['C','U','A']=>19,['g','C','A']=>55,['G','G','c']=>62,['U','U','C']=>2,['A','a','G']=>44,
['G','a','C']=>58,['U','C','A']=>7,['A','u','G']=>36,['A','U','u']=>33,['a','C','U']=>37,
['C','T','g']=>20,['T','T','g']=>4,['T','C','G']=>8,['T','t','A']=>3,['U','a','U']=>9,
['C','C','U']=>21,['A','a','C']=>42,['g','C','U']=>53,['c','G','T']=>29,['C','g','U']=>29,
['C','t','A']=>19,['A','C','c']=>38,['t','A','G']=>12,['A','A','T']=>41,['A','g','A']=>47,
['C','g','C']=>30,['G','A','a']=>59,['G','G','g']=>64,['T','T','G']=>4,['G','c','A']=>55,
['A','T','t']=>33,['C','C','u']=>21,['A','T','c']=>34,['A','U','c']=>34,['G','C','C']=>54,
['U','G','a']=>15,['t','C','G']=>8,['t','A','C']=>10,['G','U','g']=>52,['C','c','T']=>21,
['C','C','g']=>24,['U','G','u']=>13,['A','T','g']=>36,['G','U','c']=>50,['A','G','T']=>45,
['U','G','A']=>15,['G','C','u']=>53,['A','t','C']=>34,['c','G','A']=>31,['g','G','U']=>61,
['G','u','C']=>50,['T','t','G']=>4,['C','G','a']=>31,['A','c','G']=>40,['C','A','C']=>26,
['G','U','U']=>49,['C','C','T']=>21,['C','a','C']=>26,['C','a','A']=>27,['A','A','u']=>41,
['G','U','G']=>52,['a','U','C']=>34,['T','a','A']=>11,['a','A','C']=>42,['G','U','A']=>51,
['g','G','A']=>63,['G','A','g']=>60,['C','u','G']=>20,['A','g','T']=>45,['U','c','G']=>8,
['G','T','C']=>50,['C','g','A']=>31,['a','G','C']=>46,['U','U','G']=>4,['G','A','A']=>59,
['U','U','U']=>1,['U','C','C']=>6,['T','a','T']=>9,['u','A','A']=>11,['G','g','G']=>64,
['g','A','A']=>59,['c','G','G']=>32,['G','c','G']=>56,['U','c','A']=>7,['A','G','G']=>48,
['G','g','A']=>63,['G','C','A']=>55,['a','A','U']=>41,['u','G','A']=>15,['c','U','A']=>19,
['g','G','G']=>64,['A','a','U']=>41,['T','C','A']=>7,['G','C','G']=>56,['U','A','u']=>9,
['u','G','U']=>13,['c','A','G']=>28,['C','A','u']=>25,['c','U','C']=>18,['G','u','G']=>52,
['a','U','A']=>35,['a','G','U']=>45,['G','G','C']=>62,['t','T','A']=>3,['T','A','G']=>12,
['A','U','C']=>34,['C','a','T']=>25,['A','U','a']=>35,['a','A','G']=>44,['G','A','c']=>58,
['A','A','g']=>44,['G','G','G']=>64,['C','g','T']=>29,['U','C','U']=>5,['T','T','t']=>1,
['t','G','A']=>15,['T','a','C']=>10,['T','A','g']=>12,['U','A','C']=>10,['c','C','T']=>21,
['T','T','T']=>1,['C','G','T']=>29,['G','U','a']=>51,['T','c','G']=>8,['c','G','C']=>30,
['U','u','C']=>2,['U','A','G']=>12,['A','g','G']=>48,['T','T','C']=>2,['g','G','T']=>61,
['U','a','C']=>10,['t','G','T']=>13,['c','C','G']=>24,['A','G','c']=>46,['A','G','g']=>48,
['U','A','c']=>10,['u','C','C']=>6,['A','A','t']=>41,['T','G','c']=>14,['U','u','U']=>1,
['c','U','G']=>20,['G','a','A']=>59,['g','T','T']=>49,['G','u','U']=>49,['C','G','C']=>30,
['C','U','G']=>20,['g','G','C']=>62,['C','T','T']=>17,['A','A','c']=>42,['G','u','A']=>51,
['U','U','u']=>1,['g','U','G']=>52,['a','U','G']=>36,['t','C','C']=>6,['u','C','U']=>5,
['C','A','U']=>25,['g','A','U']=>57,['A','g','U']=>45,['T','C','C']=>6,['T','g','C']=>14,
['C','c','G']=>24,['a','C','T']=>37,['g','C','C']=>54,['C','G','A']=>31,['u','A','G']=>12,
['U','U','A']=>3,['A','G','A']=>47,['t','G','G']=>16,['U','G','g']=>16,['G','a','U']=>57,
['c','U','U']=>17,['T','G','g']=>16,['C','T','c']=>18,['G','c','T']=>53,['C','u','C']=>18,
['G','T','c']=>50,['T','A','t']=>9,['C','c','U']=>21,['C','U','C']=>18,['U','G','U']=>13,
['G','A','C']=>58,['u','C','A']=>7,['G','c','C']=>54,['T','A','T']=>9,['u','A','U']=>9,
['U','a','G']=>12,['T','g','A']=>15,['c','T','A']=>19,['A','u','U']=>33,['c','A','T']=>25,
['T','a','G']=>12,['a','G','G']=>48,['a','G','T']=>45,['T','t','C']=>2,['G','T','g']=>52,
['t','A','A']=>11,['G','t','C']=>50,['T','g','G']=>16,['T','T','c']=>2,['A','c','T']=>37,
['A','t','T']=>33,['g','T','C']=>50,['t','T','C']=>2,['a','T','T']=>33,['T','T','A']=>3,
['T','c','C']=>6,['T','T','a']=>3,['T','G','G']=>16,['T','G','T']=>13,['A','G','U']=>45,
['g','C','G']=>56,['c','C','A']=>23,['u','G','C']=>14,['C','C','G']=>24,['T','A','a']=>11,
['g','A','T']=>57,['T','G','A']=>15,['g','A','G']=>60,['A','c','C']=>38,['C','u','A']=>19,
['t','A','T']=>9,['A','U','A']=>35,['A','T','G']=>36,['T','c','A']=>7,['G','A','u']=>57,
['A','U','G']=>36,['G','c','U']=>53,['G','G','T']=>61,['A','G','a']=>47,['T','C','t']=>5,
['U','a','A']=>11,['G','C','g']=>56,['C','G','u']=>29,['A','g','C']=>46,['g','U','C']=>50,
['U','A','U']=>9,['c','A','A']=>27,['A','A','G']=>44,['C','G','g']=>32,['C','a','G']=>28,
['g','T','A']=>51,['u','G','G']=>16,['C','A','t']=>25,['U','U','a']=>3,['T','c','T']=>5,
['U','g','U']=>13,['t','T','G']=>4,['C','T','t']=>17,['A','A','U']=>41,['a','A','T']=>41,
['A','u','C']=>34,['T','C','c']=>6,['g','U','A']=>51,['C','U','U']=>17,['A','U','g']=>36,
['C','U','a']=>19,['A','a','T']=>41,['U','c','C']=>6,['C','A','g']=>28,['T','C','a']=>7,
['A','T','a']=>35,['A','G','C']=>46,['G','A','T']=>57,['U','g','G']=>16,['A','G','u']=>45,
['U','C','u']=>5,['A','C','t']=>37,['U','g','C']=>14,['G','T','t']=>49,['C','A','c']=>26,
['C','U','c']=>18,['U','U','g']=>4,['C','t','G']=>20,['A','a','A']=>43,['A','T','C']=>34,
['C','A','A']=>27,['U','A','a']=>11,['t','C','T']=>5,['a','G','A']=>47,['C','c','A']=>23,
['G','t','T']=>49,['U','u','G']=>4,['A','c','A']=>39,['U','C','c']=>6,['C','C','A']=>23,
['u','U','A']=>3,['G','U','C']=>50,['T','A','A']=>11,['U','U','c']=>2,['C','T','a']=>19,
['G','G','U']=>61,['u','C','G']=>8,['U','A','g']=>12,['A','C','T']=>37,['C','A','G']=>28,
['C','G','U']=>29,['G','g','C']=>62,['U','g','A']=>15,['G','a','T']=>57,['G','g','U']=>61,
['G','G','a']=>63,['A','c','U']=>37,['C','c','C']=>22,['A','C','U']=>37,['A','C','C']=>38,
['U','u','A']=>3,['G','G','A']=>63,['T','C','T']=>5,['U','A','A']=>11,['C','C','c']=>22,
['G','C','T']=>53,['C','T','C']=>18,['T','A','c']=>10,['T','A','C']=>10,['g','U','U']=>49,
['T','G','t']=>13,['G','t','G']=>52,['C','T','A']=>19,['A','t','A']=>35,['C','U','g']=>20,
['C','t','C']=>18,['A','C','A']=>39,['t','T','T']=>1,['G','T','T']=>49]

immutable CodonTables
  ids::Vector{Int}
  amino::Matrix{AminoAcid}
  start::BitArray{2}
  codons::Dict{Vector{Nucleotide},Int}
  
  CodonTables(t::Vector{Int},a::Matrix{AminoAcid},s::BitArray{2},c::Dict{Vector{Nucleotide},Int}) = new(t,a,s,c)
end

const CODON_TABLES = CodonTables(_index,_amino,_start, _codons );


function show(io::IO,ct::CodonTables)
  println("Table IDs:")
  println([1:length(ct.ids)][ct.ids .!= 0])
  println(CODON_TABLES.amino)
  println("Codons IDs:")
  print(collect(CODON_TABLES.codons))
end

codon2aa(codon,tableid::Int) = CODON_TABLES.amino[ CODON_TABLES.codons[codon] , CODON_TABLES.ids[tableid] ]

function isstop(seq,tableid::Int)
  idx = CODON_TABLES.ids[tableid]
  len = length(seq)
  if len==3
    return( CODON_TABLES.amino[ CODON_TABLES.codons[ seq ] , idx ] == '*' )
  else
    ncod = int(floor(len/3))
    out = falses(ncod)
    for i in 1:ncod
      out[i] = CODON_TABLES.amino[ CODON_TABLES.codons[ seq[(3i - 2):(3i)] ] , idx ] == '*'
    end
  return(out)
  end
end

isstop(tableid::Int) = CODON_TABLES.amino[ : , CODON_TABLES.ids[tableid] ] .== '*'

function isstart(seq,tableid::Int)
  idx = CODON_TABLES.ids[tableid]
  len = length(seq)
  if len==3
    return( CODON_TABLES.start[ CODON_TABLES.codons[ seq ] , idx ] )
  else
    ncod = int(floor(len/3))
    out = falses(ncod)
    for i in 1:ncod
      out[i] = CODON_TABLES.start[ CODON_TABLES.codons[ seq[(3i - 2):(3i)] ] , idx ]
    end
  return(out)
  end
end

isstart(tableid::Int) = CODON_TABLES.start[ : , CODON_TABLES.ids[tableid] ]

function translateCDS(seq,tableid::Int)
  len = length(seq)
  idx = CODON_TABLES.ids[tableid]
  if len%3 == 0 
    if CODON_TABLES.start[ CODON_TABLES.codons[  seq[1:3] ] , idx ] 
      if CODON_TABLES.amino[ CODON_TABLES.codons[ seq[len-2:len] ] , idx ] == '*'
	out = Array( AminoAcid, div(len,3)-1 )
	ind = 1
	out[ ind ] = 'M'
	for i in 4:3:len-5
	  ind += 1
	  out[ ind ] = CODON_TABLES.amino[ CODON_TABLES.codons[ seq[i:i+2] ] , idx ]
	  if out[ ind ] == '*'
	    throw("$(seq[i:i+2]) at $i is a stop codon on Table $tableid")
	  end
	end
	return(out)
      else
	throw("$(seq[len-2:len]) is not a valid stop codon on Table $tableid")
      end
    else
      throw("$(seq[1:3]) is not a valid start codon on Table $tableid")
    end
  else
    throw("CDS length must be a multiple of three")
  end
end

function translatetostop(seq,tableid::Int)
  idx = CODON_TABLES.ids[tableid]
  out = AminoAcid[]
  for i in 1:3:length(seq)-2
    aa = CODON_TABLES.amino[ CODON_TABLES.codons[ seq[i:i+2] ] , idx ]
    if aa != '*'
      push!( out , aa )
    else
      return(out)
    end
  end
  return(out)
end

function translate(seq,tableid::Int)
  idx = CODON_TABLES.ids[tableid]
  out = AminoAcid[]
  for i in 1:3:length(seq)-2
    push!( out , CODON_TABLES.amino[ CODON_TABLES.codons[ seq[i:i+2] ] , idx ] )
  end
  return(out)
end
