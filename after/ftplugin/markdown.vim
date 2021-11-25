setlocal commentstring=<!--%s-->
setlocal formatoptions=ljnqro
setlocal comments=bn:>,bfOn::,bfOn:-,bfOn:*,bfOn:+,bfOn:a.,bfOn:b.,bfOn:c.,bfOn:d.,bfOn:e.,bfOn:f.,bfOn:g.,bfOn:h.,bfOn:i.,bfOn:j.,bfOn:k.,bfOn:l.,bfOn:m.,bfOn:n.,bfOn:o.,bfOn:p.,bfOn:q.,bfOn:r.,bfOn:s.,bfOn:t.,bfOn:u.,bfOn:v.,bfOn:w.,bfOn:x.,bfOn:y.,bfOn:z.,bfOn:A.,bfOn:B.,bfOn:C.,bfOn:D.,bfOn:E.,bfOn:F.,bfOn:G.,bfOn:H.,bfOn:I.,bfOn:J.,bfOn:K.,bfOn:L.,bfOn:M.,bfOn:N.,bfOn:O.,bfOn:P.,bfOn:Q.,bfOn:R.,bfOn:S.,bfOn:T.,bfOn:U.,bfOn:V.,bfOn:W.,bfOn:X.,bfOn:Y.,bfOn:Z.,bfOn:0.,bfOn:1.,bfOn:2.,bfOn:3.,bfOn:4.,bfOn:5.,bfOn:6.,bfOn:7.,bfOn:8.,bfOn:9.
setlocal foldmethod=expr
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal tabstop=4
setlocal iskeyword-=-
setlocal iskeyword+=\\
setlocal textwidth=72
setlocal wrapmargin=0
setlocal iskeyword-=$
setlocal matchpairs=(:),{:},[:]
setlocal foldexpr=MdFold()


function! MdFold() abort
  let line = getline(v:lnum)

  if line =~# '^#\+ ' && s:NotCodeBlock(v:lnum)
    return ">" . match(line, ' ')
  endif

  " let nextline = getline(v:lnum + 1)
  " if (line =~ '^.\+$') && (nextline =~ '^=\+$') && s:NotCodeBlock(v:lnum + 1)
  "   return ">1"
  " endif

  " if (line =~ '^.\+$') && (nextline =~ '^-\+$') && s:NotCodeBlock(v:lnum + 1)
  "   return ">2"
  " endif

  return "="
endfunction


function! s:NotCodeBlock(lnum) abort
  return synIDattr(synID(v:lnum, 1, 1), 'name') !=# 'mdCodeBlock'
endfunction
