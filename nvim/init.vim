" teal's custom neovim configuration file
" a refactored extension of vim

" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif

" install plugins thorugh vim-plug
call plug#begin('~/.config/nvim/plugged')

    Plug 'https://github.com/j-james/vim-heresy.git'
    Plug 'https://github.com/jceb/vim-orgmode.git'
    " editor
    Plug 'https://github.com/joshdick/onedark.vim.git'
    Plug 'https://github.com/rakr/vim-one.git'
    Plug 'https://github.com/flazz/vim-colorschemes.git'
    "Plug 'https://github.com/scrooloose/nerdtree.git'
    Plug 'https://github.com/tpope/vim-vinegar.git'
    Plug 'https://github.com/itchyny/lightline.vim.git'
    " Plug 'https://github.com/vim-airline/vim-airline.git'

    " functionality
    Plug 'https://github.com/tpope/vim-eunuch.git'
    Plug 'https://github.com/tpope/vim-surround.git'
    Plug 'https://github.com/terryma/vim-multiple-cursors.git'

    " language
    " Plug 'https://github.com/dense-analysis/ale.git'
    " Plug 'https://github.com/scrooloose/syntastic.git'

    " git
    Plug 'https://github.com/tpope/vim-fugitive.git'
    Plug 'https://github.com/airblade/vim-gitgutter.git'

    " latex
    Plug 'https://github.com/xuhdev/vim-latex-live-preview.git', { 'for': 'tex' }

call plug#end()

" colorscheme
syntax on
" colorscheme one
" set background=dark
" colorscheme onedark

" use four spaces instead of tabs
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" end files with a newline
set listchars=eol:$

