"====================================================================
"=========================== Vundle Stuff ==========================

set nocompatible              " be iMproved, required
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" ========================= Add plugins here ========================
" ========= After adding a plugin: vim +PluginInstall +qall =========
Plugin 'chriskempson/base16-vim'
Plugin 'hynek/vim-python-pep8-indent'

call vundle#end()
filetype plugin indent on
"====================== End of  Vundle Stuff ========================
"====================================================================
set autoindent
set cindent
set shiftwidth=4
set softtabstop=4
set expandtab
filetype indent plugin on

autocmd FileType make set noexpandtab shiftwidth=4 softtabstop=0

" show line numbers
set number
" corrects for a black-background terminal by lightening all colours (expecially blue!)
let base16colorspace=256  " Access colors present in 256 colorspace
syntax enable
set background=dark
colorscheme base16-bright


autocmd FileType tex set expandtab shiftwidth=2 softtabstop=2

