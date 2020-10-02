syn clear
syn spell toplevel
syn sync minlines=100
syn sync maxlines=200



syn match mdTodo  /\c\(TODO\|FIXME\|XXX\)/
syn match mdLinkPath  /](\zs.*\ze)/ contains=@NoSpell
syn match mdLinkText  /\[\zs[^\[(\]]*\n*[^\[(\]]*\ze\](/
syn match mdBullet  /^\s*\(+ \|- \|\* \|\a\. \|\A\. \|\d\. \)/
syn match mdNewline  /\\$/

syn match mdDefinition  /^\s*\zs.*\n\s*:\s/ contains=mdDefOperator
syn match mdDefOperator  /^\s*:\s/ contained

syn match mdEmphOperator contained /\\\@<!\*/

syn region mdComment start=/^\s*\\\@<!<!--\s\=/ end=/\s\=-->/  keepend  contains=mdTodo

syn region mdCode start=/\\\@<!`/ end=/\\\@<!`/  keepend contains=@NoSpell
syn region mdCodeBlock start=/\\\@<!```/ end=/\\\@<!```/  keepend contains=@NoSpell


syn region mdItalic start=/\\\@<!\*\ze\S/ end=/\S\zs\\\@<!\*/  keepend contains=mdEmphOperator
syn region mdBold start=/\\\@<!\*\*\ze\S/ end=/\S\zs\\\@<!\*\*/  keepend contains=mdEmphOperator
syn region mdBoldItalic start=/\\\@<!\*\*\*\ze\S/ end=/\S\zs\\\@<!\*\*\*/  keepend contains=mdEmphOperator


syn match mdHeader /^#\+ .*$/  keepend  contains=mdHeaderSymbol
syn match mdHeaderSymbol  contained /#/


syn match mdMathWord contained /\w/ contains=@NoSpell
syn match mdMathKeyWord contained /\\\S*/ contains=@NoSpell
syn region mdMath start=/\\\@<!\$/ end=/\\\@<!\$/ keepend contains=@NoSpell,mdMathWord,mdMathKeyWord
syn region mdMathBlock start=/\\\@<!\$\$/ end=/\\\@<!\$\$/ keepend contains=@NoSpell,mdMathWord,mdMathKeyWord



syn region mdFrontmatter start=/\%1l^---\+$/ end=/^---\+$/ keepend contains=@NoSpell
syn match mdBlockquote  /^\s*\\\@<!>.*$/


hi def link mdLinkPath htmlLink
hi def link mdLinkText Normal
hi def link mdFrontmatter Comment
hi def link mdNewline Operator
hi def link mdDefOperator Operator
hi def link mdEmphOperator Operator
hi def link mdBlockquote Comment
hi def link mdBold htmlBold
hi def link mdItalic htmlItalic
hi def link mdBoldItalic htmlBoldItalic
hi def link mdComment Comment
hi def link mdTodo Todo
hi def link mdCode String
hi def link mdCodeBlock mdCode
hi def link mdCodeBlock mdCode
hi def link mdHeader Title
hi def link mdHeaderSymbol operator
hi def link mdMathBlock mdMath
hi def link mdMath PreProc
hi def link mdBullet Operator
hi def link mdDefinition htmlBoldItalic
hi def link mdMathWord Normal
hi def link mdMathKeyWord mdMath
