set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"""""""""""""""""""""""PLUGINS"""""""""""""""""""""""""
"++++++++++++++++++++++fzf++++++++++++++++++++++++++++
Plugin 'junegunn/fzf.vim'

"++++++++++++++++++++++Dracula+++++++++++++++++++++++++
Plugin 'dracula/vim'
let g:dracula_italic = 0
"++++++++++++++++++++++SuperTab++++++++++++++++++++++++
Plugin 'ervandew/supertab'

"++++++++++++++++++++++Syntastic++++++++++++++++++++++++
Plugin 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_compiler_options = ' -std=c++0x'
let g:syntastic_python_checkers = ['python3']

"++++++++++++++++++++++Airline++++++++++++++++++++++++++
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
" old was bubblegum
let g:airline_theme='dracula'
let g:bufferline_echo = 0
"++++++++++++++++++++Fugitive+++++++++++++++++++++++++
Plugin 'tpop/vim-fugitive'
"++++++++++++++++++Auto-Pairs+++++++++++++++++++++++++
Plugin 'jiangmiao/auto-pairs'
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'
"++++++++++++++++++ALE+++++++++++++++++++++++++
"Plugin 'w0rp/ale'
"let g:ale_completion_enabled = 1
"++++++++++++++++++Sneak+++++++++++++++++++++++++
Plugin 'justinmk/vim-sneak'
"++++++++++++++++++NerdCommenter+++++++++++++++++++++++++
Plugin 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""
call vundle#end()
filetype plugin indent on
"++++++++++++++++++Configuration+++++++++++++++++++++++
" line numbering
set number
" Keep more info in memory to speed things up
set hidden
set history=100

" Indento-jawns
" filetype indent on

"set nowrap
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4
"set shiftwidth=2
"set expandtab
"set smartindent
"set autoindent

" auto remove white space
autocmd BufWritePre * :%s/\s\+$//e

" make backspace work in insert mode
set backspace=indent,eol,start

" keep swapfiles (backups) in vimtemp
set swapfile
set dir =~/.vim/vimtemp

:set laststatus=2

set noshowmode

syntax on

" old was elflord
colorscheme dracula

set timeoutlen=1000 ttimeoutlen=0
