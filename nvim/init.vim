"================================
"== neovim configuration file ===
"================================

"===========
" vim-plug =
"===========

" Auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	autocmd VimEnter * PlugInstall
endif

" Install plugins
call plug#begin('~/.config/nvim/plugged')

	" Functionality
	Plug 'https://github.com/j-james/vim-heresy'
	Plug 'https://github.com/scrooloose/nerdtree'
	Plug 'https://github.com/airblade/vim-gitgutter'
	Plug 'https://github.com/tpope/vim-sleuth'
	" Plug 'https://github.com/tpope/vim-surround'
	" Plug 'https://github.com/terryma/vim-multiple-cursors'
	" Plug 'https://github.com/mg979/vim-visual-multi'

	" Languages
	Plug 'https://github.com/fatih/vim-go', {'for':'go'}
	Plug 'https://github.com/alaviss/nim.nvim', {'for':'nim'}
	Plug 'https://github.com/prabirshrestha/asyncomplete.vim', {'for':'nim'}
	" Plug 'https://github.com/dense-analysis/ale'

	" Theming
	Plug 'https://github.com/joshdick/onedark.vim'
	Plug 'https://github.com/itchyny/lightline.vim'
	Plug 'https://github.com/ryanoasis/vim-devicons'

call plug#end()

"=====================
" Colorscheme Tweaks =
"=====================

" Enable syntax highlighting
syntax on
" Set colorscheme
colorscheme onedark
" Use the terminal's background as Neovim's background
highlight normal ctermbg=none
" Italicize comments
highlight comment cterm=italic
" Theme lightline to match colorscheme
" let g:lightline = {'colorscheme':'onedark'}

"=======================
" Indentation Behavior =
"=======================
" Note: vim-sleuth picks tabs / spaces based on context
" but defaults to tabs

" Use four characters for tabs
set tabstop=4
" How many characters to jump when the tab key is pressed
set softtabstop=4
" Use four characters for indents
set shiftwidth=4
" Insert spaces when the tab key is pressed
" set expandtab

"==============
" Spell Check =
"==============

" Set spell check to English
autocmd filetype markdown,text setlocal spell spelllang=en
" Don't mark URL-like things as spelling errors
autocmd filetype markdown,text syntax match UrlNoSpell '\w\+:\/\/[^[:space:]]\+' contains=@NoSpell
" Don't match funky apostrophe marks as spelling errors
autocmd filetype markdown,text syntax match FunkyApostrophe '\w\+’[^[:space:]]\+' contains=@NoSpell
" Don't match capitalized words - proper nouns and the like
autocmd filetype markdown,text syntax match CapitalizedWords '\<\u\S*\>' contains=@NoSpell

"============
" Shortcuts =
"============
" Note: Most shortcuts are handled by vim-heresy,
" these are more personal preference / experimental

" Remap : to ;
nnoremap ; :

" Add word to dictionary
inoremap <C-M-D> <C-O>zg

" Toggle NERDTree with Ctrl+B
nnoremap <C-B> :NERDTreeToggle<CR>
inoremap <C-B> <C-O>:NERDTreeToggle<CR>

" Update plugins
nnoremap <C-U> :PlugUpdate<CR>
inoremap <C-U> <C-O>:PlugUpdate<CR>

" Open a new tab
" TODO: what does <silent> do?
nnoremap <silent> <C-T> :tabnew<CR>
inoremap <silent> <C-T> <C-O>:tabnew<CR>
snoremap <silent> <C-T> <C-O>:tabnew<CR>
" Cycle through tabs
nnoremap <silent> <C-Tab> :tabnext<CR>
inoremap <silent> <C-Tab> <C-O>:tabnext<CR>
snoremap <silent> <C-Tab> <C-O>:tabnext<CR>
" Cycle backwards through tabs
nnoremap <silent> <C-S-Tab> :tabprevious<CR>
inoremap <silent> <C-S-Tab> <C-O>:tabprevious<CR>
snoremap <silent> <C-S-Tab> <C-O>:tabprevious<CR>

"=================
" Other Settings =
"=================

" End files with an (invisible) newline
set listchars=eol:$
" Enable mouse support
set mouse=a
" Turn on line numbers
set number
" Wrap the cursor to the next line at the end of a line
set whichwrap+=<,>,[,]
" Remove trailing whitespace on save
" ???
" Don't save netrw history
let g:netrw_dirhistmax=0
" Don't hard break lines for mail posts (see: aerc)
autocmd filetype mail set textwidth=0
" Don't auto-collapse sections of files
set nofoldenable
" Ignore capitalization in search
set ignorecase

inoremap <lt>/ </<C-X><C-O><Esc>==gi

au User asyncomplete_setup call asyncomplete#register_source({
	\ 'name': 'nim',
	\ 'whitelist': ['nim'],
	\ 'completor': {opt, ctx -> nim#suggest#sug#GetAllCandidates({start, candidates -> asyncomplete#complete(opt['name'], ctx, start, candidates)})}
	\ })
