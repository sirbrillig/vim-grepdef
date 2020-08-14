function! g:GrepDef(args)
  let ftype = &filetype
  let cmd = 'grepdef --type ' . ftype . ' --line-number ' . a:args
  echom cmd
  let out = system(cmd)
  cgete out
  copen
endfunction
