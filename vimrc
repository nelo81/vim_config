" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available"

if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

call plug#begin('~/.vim/plugged')

Plug 'https://github.com/scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'dyng/ctrlsf.vim'
Plug 'hzchirs/vim-material'

call plug#end()

set nocompatible
set showmode
set showcmd
set encoding=utf-8
set t_Co=256
set autoindent
set tabstop=2
set shiftwidth=4
set expandtab
set softtabstop=2
set number
set cursorline
set textwidth=80
set wrap
set linebreak
set wrapmargin=2
set scrolloff=0
set laststatus=2
set ruler
set showmatch
set hlsearch
set incsearch
set ignorecase
set nobackup
set noswapfile
set autochdir
set noerrorbells
set visualbell
set history=1000
set autoread
set listchars=tab:»■,trail:■
set list

syntax enable
set background=dark
colors vim-material
let g:material_style='oceanic'

if (has('termguicolors'))
  set termguicolors
endif
filetype plugin indent on

nnoremap <F3> :NERDTreeToggle<CR>
nnoremap <C-f> :CtrlSF 

let g:ctrlsf_ackprg = 'ag'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
