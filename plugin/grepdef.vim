function! g:GrepDef(args)
  let ftype = &filetype
  let grepdef = get(g:, 'grepdef_path', 'grepdef')
  let options = []

  let version_cmd = grepdef . ' --version'
  let version_out = system(version_cmd)
  if version_out !~? '^No search symbol'
    " grepdef Version 2+
    call add(options, '--line-number')
  endif

  if ftype !=? '' && a:args !~ '--type'
    call add(options, '--type ' . ftype)
  endif

  let grepdef_cmd = grepdef . ' ' . join(options, ' ') . ' ' . a:args
  echom grepdef_cmd
  let grepdef_output = system(grepdef_cmd)
  if strlen(grepdef_output) < 1
    echohl ErrorMsg | echom 'No results found' | echohl None
    return
  endif

  if v:shell_error
    echohl ErrorMsg | echom 'There was an error running grepdef:' | echohl None
    echo grepdef_output
    return
  endif

  cgete grepdef_output
  copen
endfunction

command! -nargs=* -complete=file GrepDef :call g:GrepDef(<q-args>)
nnoremap <Leader>d :GrepDef <cword><CR>
