# ## http://prosite.expasy.org/scanprosite/scanprosite-doc.html#pattern_syntax
# ## Pattern syntax:

# 1 The standard IUPAC one-letter codes for the amino acids are used in PROSITE.
# 2 The symbol `x' is used for a position where any amino acid is accepted.
# 3 Ambiguities are indicated by listing the acceptable amino acids for a given position, between square brackets `[ ]'. For example: [ALT] stands for Ala or Leu or Thr.
# 4 Ambiguities are also indicated by listing between a pair of curly brackets `{ }' the amino acids that are not accepted at a given position. For example: {AM} stands for any amino acid except Ala and Met.
# 5 Each element in a pattern is separated from its neighbor by a `-'.
# 6 Repetition of an element of the pattern can be indicated by following that element with a numerical value or, if it is a gap ('x'), by a numerical range between parentheses.
#     Examples:
#         x(3) corresponds to x-x-x 
#         x(2,4) corresponds to x-x or x-x-x or x-x-x-x 
#         A(3) corresponds to A-A-A 
#     Note: You can only use a range with 'x', i.e. A(2,4) is not a valid pattern element.
# 7 When a pattern is restricted to either the N- or C-terminal of a sequence, that pattern either starts with a `<' symbol or respectively ends with a `>' symbol. In some rare cases (e.g. PS00267 or PS00539), '>' can also occur inside square brackets for the C-terminal element. 'F-[GSTV]-P-R-L-[G>]' means that either 'F-[GSTV]-P-R-L-G' or 'F-[GSTV]-P-R-L>' are considered. 

# ## Extended syntax allowed on BioSeq:

# If your pattern consists of one-letter amino acid codes only, without any ambiguous residues, you need not specify the '-', i.e. you can directly copy/paste peptide sequences into the text field.
# Example: M-A-S-K-E can be written as MASKE.
# To search all sequences which do not contain a certain amino acid, e.g Cys, you can use <{C}*>. 

const _prosite_alpha = IntSet('A','C','D','E','F','G','H','I','K','L','M','N','P','Q','R','S','T','V','W','Y',
		              '[',']','{','}','(',')','<','>',',','x','-','*',
		              '1','2','3','4','5','6','7','8','9','0')

const _prosite_dict = uint8([1:255])
_prosite_dict['('] = '{'
_prosite_dict[')'] = '}'
_prosite_dict['<'] = '^'
_prosite_dict['>'] = '$'

# Function for the { } syntax for excluding amino acids [ See pattern syntax 4 ]
function _exclude(s::ASCIIString)
  if search(s,'x')!=0
    throw("All possible amino acids are being excluded")
  end
  possibles = copy(AMINO_20_UPPERCASE)
  setdiff!(possibles,s.data)
  ascii(uint8(collect(possibles)))
end

function _element_parser(elem::ASCIIString)
  firstchar = char(elem.data[1])
  if length(elem) == 1
    if 'x' == firstchar
      return("[ACDEFGHIKLMNPQRSTVWY]") # [ See Pattern syntax 2 ]
    else
      if contains(AMINO_20_UPPERCASE, firstchar )
	return( elem )
      else
	throw("$firstchar isn't in xACDEFGHIKLMNPQRSTVWY")
      end
    end
  else
    if firstchar == '[' && search(elem,'>')!=0
      cap = match( r"\[(.+)>\]$" , elem )
      return("($( cap.captures[1] ).*)?\$") # [ See rare cases on pattern syntax 7 ]
    elseif firstchar!='x' && search(elem,',')!=0
      throw("You can only use a range with 'x'") # [ See Note on Pattern Syntax 6 ]
    elseif search(elem,'{')!=0 # [ See pattern syntax 4 ]
      cap = match( r"(<*)\{(.+)\}([\(>]*.*)" , elem )
      elem = string(cap.captures[1],"[",_exclude(cap.captures[2]),"]",cap.captures[3])
    else
      elem = replace(elem,'x',"[ACDEFGHIKLMNPQRSTVWY]")
      return(ascii(_prosite_dict[elem.data])) # Replace ( ) to { } and < > to ^ $
    end
  end
end

# Prosite pattern string to regex string
function _prosite2regex(str::ASCIIString)
  # Split elements  [ See Pattern syntax 5 ]
  elements = split(str,'-')
  if length(elements)==1
    # Without '-' can be something like <{C}*> or a sequence [ See extended syntax ]
    if str[1] == '<'
      values = _exclude( match( r"<\{(.+)\}\*>", str ).captures[1] )
      return( "^[$(values)]+\$" )
    else
      return( _element_parser( str ) )
    end
  else
    return( string( [ _element_parser(elem) for elem in elements ]... ) )
  end
end

macro prosite_str(pattern, flags...)
  check(pattern,_prosite_alpha)
  out = _prosite2regex(pattern)
  Regex(out,flags...)
end
