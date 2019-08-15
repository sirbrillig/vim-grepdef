command! -nargs=* -complete=file GrepDef :call g:GrepDef(<q-args>)
nnoremap <Leader>d :GrepDef <cword><CR>
