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

const _codons = (Vector{Nucleotide}=>Int)[nucleotide(['G','C','U'])=>53,nucleotide(['G','C','t'])=>53,nucleotide(['u','U','G'])=>4,nucleotide(['C','C','t'])=>21,nucleotide(['U','G','c'])=>14,
nucleotide(['u','U','U'])=>1,nucleotide(['C','u','U'])=>17,nucleotide(['C','A','T'])=>25,nucleotide(['c','T','T'])=>17,nucleotide(['c','T','G'])=>20,
nucleotide(['A','T','A'])=>35,nucleotide(['A','C','g'])=>40,nucleotide(['T','C','g'])=>8,nucleotide(['G','A','t'])=>57,nucleotide(['U','C','a'])=>7,
nucleotide(['U','C','G'])=>8,nucleotide(['C','G','c'])=>30,nucleotide(['G','A','U'])=>57,nucleotide(['t','C','A'])=>7,nucleotide(['t','G','C'])=>14,
nucleotide(['U','G','G'])=>16,nucleotide(['C','g','G'])=>32,nucleotide(['G','t','A'])=>51,nucleotide(['T','G','C'])=>14,nucleotide(['U','G','C'])=>14,
nucleotide(['g','C','T'])=>53,nucleotide(['T','G','a'])=>15,nucleotide(['C','C','a'])=>23,nucleotide(['G','C','c'])=>54,nucleotide(['C','A','a'])=>27,
nucleotide(['C','t','T'])=>17,nucleotide(['A','A','C'])=>42,nucleotide(['A','u','A'])=>35,nucleotide(['c','A','C'])=>26,nucleotide(['a','T','G'])=>36,
nucleotide(['A','A','a'])=>43,nucleotide(['u','U','C'])=>2,nucleotide(['G','A','G'])=>60,nucleotide(['G','a','G'])=>60,nucleotide(['g','A','C'])=>58,
nucleotide(['c','C','C'])=>22,nucleotide(['C','U','u'])=>17,nucleotide(['T','g','T'])=>13,nucleotide(['c','C','U'])=>21,nucleotide(['C','G','G'])=>32,
nucleotide(['a','T','C'])=>34,nucleotide(['A','G','t'])=>45,nucleotide(['A','C','a'])=>39,nucleotide(['c','A','U'])=>25,nucleotide(['a','C','G'])=>40,
nucleotide(['G','T','A'])=>51,nucleotide(['G','C','a'])=>55,nucleotide(['A','C','u'])=>37,nucleotide(['c','T','C'])=>18,nucleotide(['c','G','U'])=>29,
nucleotide(['a','T','A'])=>35,nucleotide(['T','t','T'])=>1,nucleotide(['A','U','U'])=>33,nucleotide(['g','T','G'])=>52,nucleotide(['C','T','G'])=>20,
nucleotide(['C','a','U'])=>25,nucleotide(['a','C','C'])=>38,nucleotide(['G','g','T'])=>61,nucleotide(['u','A','C'])=>10,nucleotide(['a','C','A'])=>39,
nucleotide(['U','c','U'])=>5,nucleotide(['G','U','u'])=>49,nucleotide(['A','A','A'])=>43,nucleotide(['G','T','a'])=>51,nucleotide(['G','T','G'])=>52,
nucleotide(['a','U','U'])=>33,nucleotide(['C','C','C'])=>22,nucleotide(['U','C','g'])=>8,nucleotide(['C','G','t'])=>29,nucleotide(['A','t','G'])=>36,
nucleotide(['G','G','t'])=>61,nucleotide(['A','C','G'])=>40,nucleotide(['a','A','A'])=>43,nucleotide(['A','T','T'])=>33,nucleotide(['G','G','u'])=>61,
nucleotide(['C','U','A'])=>19,nucleotide(['g','C','A'])=>55,nucleotide(['G','G','c'])=>62,nucleotide(['U','U','C'])=>2,nucleotide(['A','a','G'])=>44,
nucleotide(['G','a','C'])=>58,nucleotide(['U','C','A'])=>7,nucleotide(['A','u','G'])=>36,nucleotide(['A','U','u'])=>33,nucleotide(['a','C','U'])=>37,
nucleotide(['C','T','g'])=>20,nucleotide(['T','T','g'])=>4,nucleotide(['T','C','G'])=>8,nucleotide(['T','t','A'])=>3,nucleotide(['U','a','U'])=>9,
nucleotide(['C','C','U'])=>21,nucleotide(['A','a','C'])=>42,nucleotide(['g','C','U'])=>53,nucleotide(['c','G','T'])=>29,nucleotide(['C','g','U'])=>29,
nucleotide(['C','t','A'])=>19,nucleotide(['A','C','c'])=>38,nucleotide(['t','A','G'])=>12,nucleotide(['A','A','T'])=>41,nucleotide(['A','g','A'])=>47,
nucleotide(['C','g','C'])=>30,nucleotide(['G','A','a'])=>59,nucleotide(['G','G','g'])=>64,nucleotide(['T','T','G'])=>4,nucleotide(['G','c','A'])=>55,
nucleotide(['A','T','t'])=>33,nucleotide(['C','C','u'])=>21,nucleotide(['A','T','c'])=>34,nucleotide(['A','U','c'])=>34,nucleotide(['G','C','C'])=>54,
nucleotide(['U','G','a'])=>15,nucleotide(['t','C','G'])=>8,nucleotide(['t','A','C'])=>10,nucleotide(['G','U','g'])=>52,nucleotide(['C','c','T'])=>21,
nucleotide(['C','C','g'])=>24,nucleotide(['U','G','u'])=>13,nucleotide(['A','T','g'])=>36,nucleotide(['G','U','c'])=>50,nucleotide(['A','G','T'])=>45,
nucleotide(['U','G','A'])=>15,nucleotide(['G','C','u'])=>53,nucleotide(['A','t','C'])=>34,nucleotide(['c','G','A'])=>31,nucleotide(['g','G','U'])=>61,
nucleotide(['G','u','C'])=>50,nucleotide(['T','t','G'])=>4,nucleotide(['C','G','a'])=>31,nucleotide(['A','c','G'])=>40,nucleotide(['C','A','C'])=>26,
nucleotide(['G','U','U'])=>49,nucleotide(['C','C','T'])=>21,nucleotide(['C','a','C'])=>26,nucleotide(['C','a','A'])=>27,nucleotide(['A','A','u'])=>41,
nucleotide(['G','U','G'])=>52,nucleotide(['a','U','C'])=>34,nucleotide(['T','a','A'])=>11,nucleotide(['a','A','C'])=>42,nucleotide(['G','U','A'])=>51,
nucleotide(['g','G','A'])=>63,nucleotide(['G','A','g'])=>60,nucleotide(['C','u','G'])=>20,nucleotide(['A','g','T'])=>45,nucleotide(['U','c','G'])=>8,
nucleotide(['G','T','C'])=>50,nucleotide(['C','g','A'])=>31,nucleotide(['a','G','C'])=>46,nucleotide(['U','U','G'])=>4,nucleotide(['G','A','A'])=>59,
nucleotide(['U','U','U'])=>1,nucleotide(['U','C','C'])=>6,nucleotide(['T','a','T'])=>9,nucleotide(['u','A','A'])=>11,nucleotide(['G','g','G'])=>64,
nucleotide(['g','A','A'])=>59,nucleotide(['c','G','G'])=>32,nucleotide(['G','c','G'])=>56,nucleotide(['U','c','A'])=>7,nucleotide(['A','G','G'])=>48,
nucleotide(['G','g','A'])=>63,nucleotide(['G','C','A'])=>55,nucleotide(['a','A','U'])=>41,nucleotide(['u','G','A'])=>15,nucleotide(['c','U','A'])=>19,
nucleotide(['g','G','G'])=>64,nucleotide(['A','a','U'])=>41,nucleotide(['T','C','A'])=>7,nucleotide(['G','C','G'])=>56,nucleotide(['U','A','u'])=>9,
nucleotide(['u','G','U'])=>13,nucleotide(['c','A','G'])=>28,nucleotide(['C','A','u'])=>25,nucleotide(['c','U','C'])=>18,nucleotide(['G','u','G'])=>52,
nucleotide(['a','U','A'])=>35,nucleotide(['a','G','U'])=>45,nucleotide(['G','G','C'])=>62,nucleotide(['t','T','A'])=>3,nucleotide(['T','A','G'])=>12,
nucleotide(['A','U','C'])=>34,nucleotide(['C','a','T'])=>25,nucleotide(['A','U','a'])=>35,nucleotide(['a','A','G'])=>44,nucleotide(['G','A','c'])=>58,
nucleotide(['A','A','g'])=>44,nucleotide(['G','G','G'])=>64,nucleotide(['C','g','T'])=>29,nucleotide(['U','C','U'])=>5,nucleotide(['T','T','t'])=>1,
nucleotide(['t','G','A'])=>15,nucleotide(['T','a','C'])=>10,nucleotide(['T','A','g'])=>12,nucleotide(['U','A','C'])=>10,nucleotide(['c','C','T'])=>21,
nucleotide(['T','T','T'])=>1,nucleotide(['C','G','T'])=>29,nucleotide(['G','U','a'])=>51,nucleotide(['T','c','G'])=>8,nucleotide(['c','G','C'])=>30,
nucleotide(['U','u','C'])=>2,nucleotide(['U','A','G'])=>12,nucleotide(['A','g','G'])=>48,nucleotide(['T','T','C'])=>2,nucleotide(['g','G','T'])=>61,
nucleotide(['U','a','C'])=>10,nucleotide(['t','G','T'])=>13,nucleotide(['c','C','G'])=>24,nucleotide(['A','G','c'])=>46,nucleotide(['A','G','g'])=>48,
nucleotide(['U','A','c'])=>10,nucleotide(['u','C','C'])=>6,nucleotide(['A','A','t'])=>41,nucleotide(['T','G','c'])=>14,nucleotide(['U','u','U'])=>1,
nucleotide(['c','U','G'])=>20,nucleotide(['G','a','A'])=>59,nucleotide(['g','T','T'])=>49,nucleotide(['G','u','U'])=>49,nucleotide(['C','G','C'])=>30,
nucleotide(['C','U','G'])=>20,nucleotide(['g','G','C'])=>62,nucleotide(['C','T','T'])=>17,nucleotide(['A','A','c'])=>42,nucleotide(['G','u','A'])=>51,
nucleotide(['U','U','u'])=>1,nucleotide(['g','U','G'])=>52,nucleotide(['a','U','G'])=>36,nucleotide(['t','C','C'])=>6,nucleotide(['u','C','U'])=>5,
nucleotide(['C','A','U'])=>25,nucleotide(['g','A','U'])=>57,nucleotide(['A','g','U'])=>45,nucleotide(['T','C','C'])=>6,nucleotide(['T','g','C'])=>14,
nucleotide(['C','c','G'])=>24,nucleotide(['a','C','T'])=>37,nucleotide(['g','C','C'])=>54,nucleotide(['C','G','A'])=>31,nucleotide(['u','A','G'])=>12,
nucleotide(['U','U','A'])=>3,nucleotide(['A','G','A'])=>47,nucleotide(['t','G','G'])=>16,nucleotide(['U','G','g'])=>16,nucleotide(['G','a','U'])=>57,
nucleotide(['c','U','U'])=>17,nucleotide(['T','G','g'])=>16,nucleotide(['C','T','c'])=>18,nucleotide(['G','c','T'])=>53,nucleotide(['C','u','C'])=>18,
nucleotide(['G','T','c'])=>50,nucleotide(['T','A','t'])=>9,nucleotide(['C','c','U'])=>21,nucleotide(['C','U','C'])=>18,nucleotide(['U','G','U'])=>13,
nucleotide(['G','A','C'])=>58,nucleotide(['u','C','A'])=>7,nucleotide(['G','c','C'])=>54,nucleotide(['T','A','T'])=>9,nucleotide(['u','A','U'])=>9,
nucleotide(['U','a','G'])=>12,nucleotide(['T','g','A'])=>15,nucleotide(['c','T','A'])=>19,nucleotide(['A','u','U'])=>33,nucleotide(['c','A','T'])=>25,
nucleotide(['T','a','G'])=>12,nucleotide(['a','G','G'])=>48,nucleotide(['a','G','T'])=>45,nucleotide(['T','t','C'])=>2,nucleotide(['G','T','g'])=>52,
nucleotide(['t','A','A'])=>11,nucleotide(['G','t','C'])=>50,nucleotide(['T','g','G'])=>16,nucleotide(['T','T','c'])=>2,nucleotide(['A','c','T'])=>37,
nucleotide(['A','t','T'])=>33,nucleotide(['g','T','C'])=>50,nucleotide(['t','T','C'])=>2,nucleotide(['a','T','T'])=>33,nucleotide(['T','T','A'])=>3,
nucleotide(['T','c','C'])=>6,nucleotide(['T','T','a'])=>3,nucleotide(['T','G','G'])=>16,nucleotide(['T','G','T'])=>13,nucleotide(['A','G','U'])=>45,
nucleotide(['g','C','G'])=>56,nucleotide(['c','C','A'])=>23,nucleotide(['u','G','C'])=>14,nucleotide(['C','C','G'])=>24,nucleotide(['T','A','a'])=>11,
nucleotide(['g','A','T'])=>57,nucleotide(['T','G','A'])=>15,nucleotide(['g','A','G'])=>60,nucleotide(['A','c','C'])=>38,nucleotide(['C','u','A'])=>19,
nucleotide(['t','A','T'])=>9,nucleotide(['A','U','A'])=>35,nucleotide(['A','T','G'])=>36,nucleotide(['T','c','A'])=>7,nucleotide(['G','A','u'])=>57,
nucleotide(['A','U','G'])=>36,nucleotide(['G','c','U'])=>53,nucleotide(['G','G','T'])=>61,nucleotide(['A','G','a'])=>47,nucleotide(['T','C','t'])=>5,
nucleotide(['U','a','A'])=>11,nucleotide(['G','C','g'])=>56,nucleotide(['C','G','u'])=>29,nucleotide(['A','g','C'])=>46,nucleotide(['g','U','C'])=>50,
nucleotide(['U','A','U'])=>9,nucleotide(['c','A','A'])=>27,nucleotide(['A','A','G'])=>44,nucleotide(['C','G','g'])=>32,nucleotide(['C','a','G'])=>28,
nucleotide(['g','T','A'])=>51,nucleotide(['u','G','G'])=>16,nucleotide(['C','A','t'])=>25,nucleotide(['U','U','a'])=>3,nucleotide(['T','c','T'])=>5,
nucleotide(['U','g','U'])=>13,nucleotide(['t','T','G'])=>4,nucleotide(['C','T','t'])=>17,nucleotide(['A','A','U'])=>41,nucleotide(['a','A','T'])=>41,
nucleotide(['A','u','C'])=>34,nucleotide(['T','C','c'])=>6,nucleotide(['g','U','A'])=>51,nucleotide(['C','U','U'])=>17,nucleotide(['A','U','g'])=>36,
nucleotide(['C','U','a'])=>19,nucleotide(['A','a','T'])=>41,nucleotide(['U','c','C'])=>6,nucleotide(['C','A','g'])=>28,nucleotide(['T','C','a'])=>7,
nucleotide(['A','T','a'])=>35,nucleotide(['A','G','C'])=>46,nucleotide(['G','A','T'])=>57,nucleotide(['U','g','G'])=>16,nucleotide(['A','G','u'])=>45,
nucleotide(['U','C','u'])=>5,nucleotide(['A','C','t'])=>37,nucleotide(['U','g','C'])=>14,nucleotide(['G','T','t'])=>49,nucleotide(['C','A','c'])=>26,
nucleotide(['C','U','c'])=>18,nucleotide(['U','U','g'])=>4,nucleotide(['C','t','G'])=>20,nucleotide(['A','a','A'])=>43,nucleotide(['A','T','C'])=>34,
nucleotide(['C','A','A'])=>27,nucleotide(['U','A','a'])=>11,nucleotide(['t','C','T'])=>5,nucleotide(['a','G','A'])=>47,nucleotide(['C','c','A'])=>23,
nucleotide(['G','t','T'])=>49,nucleotide(['U','u','G'])=>4,nucleotide(['A','c','A'])=>39,nucleotide(['U','C','c'])=>6,nucleotide(['C','C','A'])=>23,
nucleotide(['u','U','A'])=>3,nucleotide(['G','U','C'])=>50,nucleotide(['T','A','A'])=>11,nucleotide(['U','U','c'])=>2,nucleotide(['C','T','a'])=>19,
nucleotide(['G','G','U'])=>61,nucleotide(['u','C','G'])=>8,nucleotide(['U','A','g'])=>12,nucleotide(['A','C','T'])=>37,nucleotide(['C','A','G'])=>28,
nucleotide(['C','G','U'])=>29,nucleotide(['G','g','C'])=>62,nucleotide(['U','g','A'])=>15,nucleotide(['G','a','T'])=>57,nucleotide(['G','g','U'])=>61,
nucleotide(['G','G','a'])=>63,nucleotide(['A','c','U'])=>37,nucleotide(['C','c','C'])=>22,nucleotide(['A','C','U'])=>37,nucleotide(['A','C','C'])=>38,
nucleotide(['U','u','A'])=>3,nucleotide(['G','G','A'])=>63,nucleotide(['T','C','T'])=>5,nucleotide(['U','A','A'])=>11,nucleotide(['C','C','c'])=>22,
nucleotide(['G','C','T'])=>53,nucleotide(['C','T','C'])=>18,nucleotide(['T','A','c'])=>10,nucleotide(['T','A','C'])=>10,nucleotide(['g','U','U'])=>49,
nucleotide(['T','G','t'])=>13,nucleotide(['G','t','G'])=>52,nucleotide(['C','T','A'])=>19,nucleotide(['A','t','A'])=>35,nucleotide(['C','U','g'])=>20,
nucleotide(['C','t','C'])=>18,nucleotide(['A','C','A'])=>39,nucleotide(['t','T','T'])=>1,nucleotide(['G','T','T'])=>49]


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
