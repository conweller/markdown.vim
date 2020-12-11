function! MarkdownLevel()
    let l:max_level = 6
    let l:line = getline(v:lnum)
    if l:line =~ '^#\+ .*$'
        let l:num_pound = count(l:line, '#')
        return ">".l:num_pound
    else
        return "="
    endif
endfunction

