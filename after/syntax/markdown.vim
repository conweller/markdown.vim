syn clear
syn spell toplevel

syn match mdBlockquote  /^\s*>/
syn match mdNewline  /\\$/

syn match mdBullet  /^\s*+ \|^\s*- \|^\s*\* \|^\s*\a\. \|^\s*\A\. \|^\s*\d\. /

syn match mdEmphOperator contained /\*/

syn match mdTodo  contained /\c\(TODO\|FIXME\|XXX\)\=/
syn region mdComment start=/^\s*<!--\s\=/ end=/\s\=-->/  keepend  contains=mdTodo
syn region mdCode start=/`/ end=/`/  keepend contains=@NoSpell
syn region mdCodeBlock start=/```/ end=/```/  keepend contains=@NoSpell

syn region mdItalic start=/\*/ end=/\*/  keepend contains=mdEmphOperator
syn region mdBold start=/\*\*/ end=/\*\*/  keepend contains=mdEmphOperator

syn region mdHeader start=/^#/ end=/$/  keepend  contains=mdHeaderSymbol
syn match mdHeaderSymbol  contained /#/

syn region mdMath start=/\$/ end=/\$/ keepend contains=@NoSpell
syn region mdMathBlock start=/\$\$/ end=/\$\$/ keepend contains=@NoSpell

syn region mdFrontmatter start=/\%1l---\+$/ end=/^---\+$/ keepend contains=@NoSpell


hi! def link mdFrontmatter Comment
hi! def link mdNewline Operator
hi! def link mdEmphOperator Operator
hi! def link mdBlockquote Comment
hi! def link mdBold htmlBold
hi! def link mdItalic htmlItalic
hi! def link mdComment Comment
hi! def link mdTodo Todo
hi! def link mdCode String
hi! def link mdCodeBlock mdCode
hi! def link mdHeader Title
hi! def link mdHeaderSymbol operator
hi! def link mdMathBlock String
hi! def link mdMath String
hi! def link mdBullet Operator

