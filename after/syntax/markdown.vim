let b:current_syntax = 'markdown'
syn clear
syn spell toplevel
syn sync minlines=100
syn sync maxlines=200


syn match mdBlockquote  /\(^\s*\zs>\ze \|^\s*\zs>$\)/
syn match mdTodo  /\(\<TODO\>\|\<FIXME\>\|\<XXX\>\)/
syn match mdDone  /\(\<DONE\>\)/

syn match mdRawLink  /\\\@<!<[^<>]*\\\@<!>/ contains=@NoSpell,mdBlockquote

syn match mdLink  /\\\@<!\[.\{-}\_.\{-}\\\@<!\](.*\\\@<!)/ contains=@NoSpell,mdBlockquote

syn match mdBullet  /^\(\s*>\=\s*\(+\|-\|\*\|\a\.\|\A\.\|\d\.\)\s\)\+/ contains=mdBlockquote
syn match mdNewline  /\\$/

syn match mdDefinition  /^\s*\zs.*\n\s*:\s/ contains=mdDefOperator,@Spell
syn match mdDefOperator  /^\s*:\s/ contained

syn match mdEmphOperator contained /\\\@<!\*/ conceal

syn region mdComment start=/^\s*\\\@<!<!--\s\=/ end=/\s\=-->/  keepend  contains=mdTodo,mdDone,@Spell

syn region mdItalic start=/\\\@<!\*\ze\S/ end=/\S\zs\\\@<!\*/  keepend contains=mdBlockquote,@Spell,mdMath
syn region mdBold start=/\\\@<!\*\*\ze\S/ end=/\S\zs\\\@<!\*\*/  keepend contains=mdBlockquote,@Spell,mdMath
syn region mdBoldItalic start=/\\\@<!\*\*\*\ze\S/ end=/\S\zs\\\@<!\*\*\*/  keepend contains=mdBlockquote,@Spell,mdMath



for i in range(1, 7)
    exe 'syn match mdH'.i.' /^'.repeat('#', i).' .*$/  keepend  contains=mdHeaderSymbol,mdMath,mdBoldItalic,mdItalic,mdBold,mdCode,@Spell,mdTodo,mdDone'
    if i > 1
        exe 'hi def link mdH'.i.' mdH1'
    end
endfor
syn match mdHeaderSymbol  contained /#/



" syn include @Tex syntax/tex.vim

syn region mdMath start=/\\\@<!\$/ end=/\\\@<!\$/ keepend contains=mdBlockquote,mdMathDelim,mdMathBold
syn region mdMathBlock start=/\\\@<!\$\$/ end=/\\\@<!\$\$/ keepend contains=mdBlockquote,mdMathDelim,mdMathBold
syn region mdCodeMathBlock start=/\\\@<!```{=tex}/  end=/\\\@<!```/ keepend contains=mdBlockquote,mdMathDelim,mdMathBold
syn match mdMathDelim /\\\@<!\$/ conceal contained

syn region mdCode start=/\\\@<!`/ end=/\\\@<!`/  keepend contains=@NoSpell,mdBlockquote,mdCodeDelim
syn region mdCodeBlock start=/\\\@<!```/ end=/\\\@<!```/  keepend contains=@NoSpell,mdBlockquote,mdCodeBlockPython,mdCodeBlockJulia,mdCodeBlockC,mdCodeDelim

syn match mdCodeDelim /\\\@<!\`\(``.*\)\=/ contained conceal

if exists('b:current_syntax')
    unlet b:current_syntax
end
syn include @Python syntax/python.vim
syn region mdCodeBlockPython contained start=/\\\@<!```\s*python3\=\zs$/ end=/\ze\\\@<!```/  contains=mdBlockquote,@Python
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

if exists('b:current_syntax')
    unlet b:current_syntax
end
syn include @Yaml syntax/yaml.vim
syn region mdFrontmatter start=/\%1l^---\+$/ end=/^---\+$/ keepend contains=@NoSpell,@Yaml
let b:current_syntax = 'markdown'


hi def link mdLink htmlLink
hi def link mdRawLink mdLink
hi def link mdOperator Operator
hi def link mdNewline mdOperator
hi def link mdDefOperator mdOperator
hi def link mdEmphOperator Normal
hi def link mdBlockquote Comment
hi def link mdBold htmlBold
hi def link mdItalic htmlItalic
hi def link mdBoldItalic htmlBoldItalic
hi def link mdComment Comment
hi def link mdTodo Todo
hi def link mdDone Todo
hi def link mdCode String
hi def link mdCodeBlock mdCode
hi def link mdH1 htmlH1
hi def link mdHeaderSymbol mdH1
hi def link mdMathBlock mdMath
hi def link mdCodeMathBlock mdMath
hi def link mdMath Type
hi def link mdBullet mdOperator
hi def link mdMathDelim mdMath
hi def link mdCodeDelim mdCode
hi def link mdDefinition htmlBoldItalic


let b:current_syntax = 'markdown'
