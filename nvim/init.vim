" teal's custom neovim configuration file
" a refactored extension of vim

" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall
endif

" install plugins through vim-plug
call plug#begin('~/.config/nvim/plugged')

	Plug 'https://github.com/j-james/vim-heresy.git'

	" fluff
	Plug 'https://github.com/rakr/vim-one.git'
	Plug 'https://github.com/joshdick/onedark.vim.git'
	Plug 'https://github.com/flazz/vim-colorschemes.git'
	Plug 'https://github.com/itchyny/lightline.vim.git'
	" Plug 'https://github.com/vim-airline/vim-airline.git'

	" functionality
	Plug 'https://github.com/tpope/vim-sleuth.git'
	Plug 'https://github.com/terryma/vim-multiple-cursors.git'
	" Plug 'https://github.com/tpope/vim-eunuch.git'
	" Plug 'https://github.com/tpope/vim-surround.git'	
	" Plug 'https://github.com/tpope/vim-vinegar.git'
	" Plug 'https://github.com/scrooloose/nerdtree.git'

	" linting
	" Plug 'https://github.com/dense-analysis/ale.git'
	" Plug 'https://github.com/scrooloose/syntastic.git'

	" languages
	Plug 'https://github.com/airblade/vim-gitgutter.git'
	" Plug 'https://github.com/tpope/vim-fugitive.git'
	" Plug 'https://github.com/xuhdev/vim-latex-live-preview.git', {'for':'tex'}

call plug#end()

" colorscheme
syntax on
" colorscheme one
" set background=dark
" colorscheme onedark

" specifies the width of a tab character
set tabstop=4
set softtabstop=4
set shiftwidth=4
" note: vim-sleuth is in charge of picking tabs or spaces based on context
" by default tabs are used

" end files with a newline
set listchars=eol:$

" enable mouse support
set mouse=a

" wrap left and right
set whichwrap+=<,>,[,]

" remap : to ;
nnoremap ; :

" don't save netrw history
let g:netrw_dirhistmax=0

