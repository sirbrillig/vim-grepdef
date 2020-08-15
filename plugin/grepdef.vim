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
  let out = system(grepdef_cmd)
  if strlen(out) < 1
    echohl ErrorMsg | echom 'No results found' | echohl None
  else
    cgete out
    copen
  endif
endfunction
