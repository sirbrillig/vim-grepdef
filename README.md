A vim plugin for [grepdef](https://github.com/sirbrillig/grepdef): search for symbol definitions in various programming languages

This adds the command `:GrepDef <symbol> [path]`

This also adds the mapping `<Leader>d` to run grepdef on the symbol under the cursor.

Currently this supports only php and javascript.

## Installation

If using [Pathogen](https://github.com/tpope/vim-pathogen):

```
cd ~/.vim/bundle
git clone https://github.com/sirbrillig/vim-grepdef.git
```

If using [Vim-Plug](https://github.com/junegunn/vim-plug), add the following to your vimrc inside the plugin block:

```
Plug 'sirbrillig/vim-grepdef'
```
