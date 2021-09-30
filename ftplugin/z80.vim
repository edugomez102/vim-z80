if exists("b:loaded_ftplugin")
   finish
endif

let b:loaded_ftplugin=1

setlocal tabstop=8
setlocal shiftwidth=8

setlocal foldmethod=marker
setlocal commentstring=;;%s

function! s:IndentLabel()
    let saved_unnamed_register = @@

    if getline('.') =~ "^\s*[a-zA-Z0-9_.]+:$"
        echom "ok"
        normal! V:s/\s+//g
    endif

    let @@ = saved_unnamed_register
endfunction

inoremap <buffer> :normal! all s:IndentLabel()

call tcomment#type#Define('z80', '; %s')

set tabstop=3
set shiftwidth=3
set expandtab

set foldmethod=indent

let g:vista_default_executive = 'ctags'
" hi Folded ctermbg=236 ctermfg=179 cterm=NONE
