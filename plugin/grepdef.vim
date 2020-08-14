function! g:GrepDef(args)
  let ftype = &filetype
  let grepdef = get(g:, 'grepdef_path', 'grepdef')

  let version_cmd = grepdef . ' --version'
  let version_out = system(version_cmd)
  if version_out =~? '^No search symbol'
    " Version 1
    let grepdef_cmd = grepdef . ' --type ' . ftype . ' ' . a:args
  else
    " Version 2+
    let grepdef_cmd = grepdef . ' --type ' . ftype . ' --line-number ' . a:args
  endif

  echom grepdef_cmd
  let out = system(grepdef_cmd)
  cgete out
  copen
endfunction
