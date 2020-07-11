"==============================================
"== teal's custom neovim configuration file ===
"==             vim, but better             ===
"==============================================

" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	autocmd VimEnter * PlugInstall
endif

"===========
" vim-plug =
"===========
call plug#begin('~/.config/nvim/plugged')

	Plug 'https://github.com/j-james/vim-heresy'

	" fluff
	Plug 'https://github.com/joshdick/onedark.vim'
	Plug 'https://github.com/itchyny/lightline.vim'

	" functionality
	Plug 'https://github.com/tpope/vim-sleuth'
	Plug 'https://github.com/terryma/vim-multiple-cursors'
	" Plug 'https://github.com/tpope/vim-eunuch'
	" Plug 'https://github.com/tpope/vim-surround'
	" Plug 'https://github.com/tpope/vim-vinegar'
	" Plug 'https://github.com/scrooloose/nerdtree'

	" linting
	" Plug 'https://github.com/dense-analysis/ale'
	" Plug 'https://github.com/scrooloose/syntastic'

	" languages
	Plug 'https://github.com/airblade/vim-gitgutter'
	" Plug 'https://github.com/tpope/vim-fugitive'
	Plug 'https://github.com/fatih/vim-go', {'for':'go'}
	Plug 'https://github.com/alaviss/nim.nvim', {'for':'nim'}
	Plug 'https://github.com/xuhdev/vim-latex-live-preview', {'for':'tex'}

call plug#end()

" colorscheme
syntax on
colorscheme onedark
highlight Normal ctermbg=black
highlight Comment cterm=italic
" let g:lightline = {'colorscheme':'onedark'}

" turn on line numbers
set number

" specifies the width of a tab character
set tabstop=4
set softtabstop=4
set shiftwidth=4

" note: vim-sleuth picks tabs / spaces based on context
" but defaults to tabs (change to spaces by setting expandtab)

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
