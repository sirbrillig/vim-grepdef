# vim-grepdef

A vim plugin for [grepdef](https://github.com/sirbrillig/grepdef): search for symbol definitions in various programming languages

This adds the command `:GrepDef <symbol> [path]`

This also adds the mapping `<Leader>d` to run grepdef on the symbol under the cursor.

The filetype will automatically be detected.

## Installation

You must have [grepdef](https://github.com/sirbrillig/grepdef) installed.

If using [Pathogen](https://github.com/tpope/vim-pathogen):

```
cd ~/.vim/bundle
git clone https://github.com/sirbrillig/vim-grepdef.git
```

If using [Vim-Plug](https://github.com/junegunn/vim-plug), add the following to your vimrc inside the plugin block:

```
Plug 'sirbrillig/vim-grepdef'
```

## Configuration

If needed, you can set the path to `grepdef` executable by setting the `g:grepdef_path` variable.

## FAQ

### Can I automatically close the quickfix buffer after going to the definition?

Yes, add the following to your vimrc (this will affect all quickfix buffers, not just grepdef):

```
" Auto close quickfix buffer after selecting an entry if there is only one entry
function! CloseQuickFixIfOneEntry()
	if len(getqflist()) < 2 | ccl | endif
endfunction
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>:call CloseQuickFixIfOneEntry()<CR>
```
