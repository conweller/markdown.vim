let b:current_syntax = 'markdown'
syn clear
syn spell toplevel
syn sync minlines=100
syn sync maxlines=200


syn match mdBlockquote  /\(^\s*>\ze \|^\s*>$\)/ conceal cchar=┃
syn match mdTodo  /\c\(TODO\|FIXME\|XXX\)/
syn match mdLink  /\\\@<!\[\([^\]]*\n*\)*\]\\\@<!([^)]*\\\@<!)/ contains=@NoSpell,mdBlockquote
syn match mdBullet  /^\s*>\=\s\=\(+\|-\|\*\|\a\.\|\A\.\|\d\.\)\ze\s/ contains=mdBlockquote
syn match mdNewline  /\\$/

syn match mdDefinition  /^\s*\zs.*\n\s*:\s/ contains=mdDefOperator,@Spell
syn match mdDefOperator  /^\s*:\s/ contained

syn match mdEmphOperator contained /\\\@<!\*/

syn region mdComment start=/^\s*\\\@<!<!--\s\=/ end=/\s\=-->/  keepend  contains=mdTodo,@Spell

syn region mdItalic start=/\\\@<!\*\ze\S/ end=/\S\zs\\\@<!\*/  keepend contains=mdEmphOperator,mdBlockquote,@Spell
syn region mdBold start=/\\\@<!\*\*\ze\S/ end=/\S\zs\\\@<!\*\*/  keepend contains=mdEmphOperator,mdBlockquote,@Spell
syn region mdBoldItalic start=/\\\@<!\*\*\*\ze\S/ end=/\S\zs\\\@<!\*\*\*/  keepend contains=mdEmphOperator,mdBlockquote,@Spell


syn match mdHeader /^#\+ .*$/  keepend  contains=mdHeaderSymbol,mdMath,mdItalic,mdBold,mdCode,@Spell
syn match mdHeaderSymbol  contained /#/ conceal cchar=§


syn match mdMathWord contained /\w/ contains=@NoSpell
syn match mdMathKeyWord contained /\\\w*/ contains=@NoSpell
syn region mdMath start=/\\\@<!\$/ end=/\\\@<!\$/ keepend contains=@NoSpell,mdMathWord,mdMathKeyWord,mdBlockquote
syn region mdMathBlock start=/\\\@<!\$\$/ end=/\\\@<!\$\$/ keepend contains=@NoSpell,mdMathWord,mdMathKeyWord,mdBlockquote

syn region mdFrontmatter start=/\%1l^---\+$/ end=/^---\+$/ keepend contains=@NoSpell

syn region mdCode start=/\\\@<!`/ end=/\\\@<!`/  keepend contains=@NoSpell,mdBlockquote
syn region mdCodeBlock start=/\\\@<!```/ end=/\\\@<!```/  keepend contains=@NoSpell,mdBlockquote,mdCodeBlockPython,mdCodeBlockJulia,mdCodeBlockC

if exists('b:current_syntax')
    unlet b:current_syntax
end
syn include @Python syntax/python.vim
syn region mdCodeBlockPython contained start=/\\\@<!```\s*python\zs$/ end=/\ze\\\@<!```/  contains=mdBlockquote,@Python
let b:current_syntax = 'markdown'

if exists('b:current_syntax')
    unlet b:current_syntax
end
syn include @Julia syntax/julia.vim
syn region mdCodeBlockJulia contained start=/\\\@<!```\s*julia\zs$/ end=/\ze\\\@<!```/  contains=@NoSpell,mdBlockquote,@Julia
let b:current_syntax = 'markdown'

if exists('b:current_syntax')
    unlet b:current_syntax
end
syn include @C syntax/c.vim
syn region mdCodeBlockC contained start=/\\\@<!```\s*c\zs$/ end=/\ze\\\@<!```/  contains=@NoSpell,mdBlockquote,@C
let b:current_syntax = 'markdown'



hi def link mdLink htmlLink
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
hi def link mdHeader Title
hi def link mdHeaderSymbol operator
hi def link mdMathBlock mdMath
hi def link mdMath Constant
hi def link mdBullet Operator
hi def link mdDefinition htmlBoldItalic
hi def link mdMathWord Normal
hi def link mdMathKeyWord mdMath

let b:current_syntax = 'markdown'
