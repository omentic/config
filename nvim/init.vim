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
	Plug 'https://github.com/tombh/novim-mode'
	Plug 'https://github.com/ms-jpq/chadtree' " , {'do': 'CHADdeps'}
	Plug 'https://github.com/tpope/vim-sleuth'
	Plug 'https://github.com/tpope/vim-commentary'
	Plug 'https://github.com/airblade/vim-gitgutter'
	" FIXME: devicons colors, chadtree offset, and ctrl+w/ctrl+t
	" FIXME: multiple cursors
	Plug 'https://github.com/romgrk/barbar.nvim'
	Plug 'https://github.com/nvim-lua/plenary.nvim'
	Plug 'https://github.com/nvim-telescope/telescope.nvim'
	" Plug 'https://github.com/mg979/vim-visual-multi'
	" Plug 'https://github.com/tpope/vim-surround'

	" Languages
	Plug 'https://github.com/ms-jpq/coq_nvim' " , {'do': 'COQdeps'}
	Plug 'https://github.com/ms-jpq/coq.artifacts'
	" FIXME: is tree-sitter working?
	Plug 'https://github.com/nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'https://github.com/neovim/nvim-lspconfig'
	Plug 'https://github.com/alaviss/nim.nvim', {'for': 'nim'}
	Plug 'https://github.com/KeitaNakamura/tex-conceal.vim'
	" Plug 'https://github.com/lervag/vimtex'

	" Theming
	Plug 'https://github.com/joshdick/onedark.vim'
	Plug 'https://github.com/itchyny/lightline.vim'
	" TODO: show space/tab indications on selection
	Plug 'https://github.com/lukas-reineke/indent-blankline.nvim'
	Plug 'https://github.com/kyazdani42/nvim-web-devicons' " ryanoasis/vim-devicons

call plug#end()

"===================
" Language Servers =
"===================

lua << EOF
require'lspconfig'.bashls.setup{}
require'lspconfig'.clangd.setup{}
require'lspconfig'.gopls.setup{}
require'lspconfig'.jedi_language_server.setup{}
require'lspconfig'.rust_analyzer.setup{}
require'lspconfig'.racket_langserver.setup{}
require'lspconfig'.nimls.setup{}
EOF

"===================
" Interface Tweaks =
"===================

" Enable syntax highlighting
syntax on
" Set colorscheme
colorscheme onedark
" Use the terminal's background as Neovim's background
highlight normal ctermbg=none
" Italicize comments, and make them at least moderately readable
highlight comment cterm=italic ctermfg=050505
highlight linenr ctermfg=grey
" Theme lightline to match colorscheme
" let g:lightline = {'colorscheme':'onedark'}
" Theme CHADtree to match-ish colorscheme
let g:chadtree_settings = {'theme.text_colour_set': 'nord'}
let g:coq_settings = {'auto_start': v:true, 'keymap.jump_to_mark': '', 'keymap.recommended': v:false}
let bufferline = {'animation': v:false, 'auto_hide': v:true}

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
set expandtab

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

" Add and remove words from dictionary
" FIXME: make more intuitive
inoremap <M-D> <C-O>zg
inoremap <M-S-D> <C-O>zug

" Toggle CHADtree with Ctrl+B
nnoremap <C-B> :CHADopen<CR>
inoremap <C-B> <C-O>:CHADopen<CR>
" TODO: make this main binding, Ctrl+B just opens sidebar
nnoremap <C-S-E> :CHADopen<CR>
inoremap <C-S-E> <C-O>:CHADopen<CR>

" Update plugins
nnoremap <C-S-X> :PlugUpdate<CR>
inoremap <C-S-X> <C-O>:PlugUpdate<CR>

" Open a new tab
" <silent> prevents brief flashes
nnoremap <silent> <C-T> :tabnew<CR>
inoremap <silent> <C-T> <C-O>:tabnew<CR>
snoremap <silent> <C-T> <C-O>:tabnew<CR>
" Cycle through tabs
nnoremap <silent> <C-S-T> :tabnext<CR>
inoremap <silent> <C-S-T> <C-O>:tabnext<CR>
snoremap <silent> <C-S-T> <C-O>:tabnext<CR>

" Comment out lines
nmap <C-/> gcc
imap <C-/> <C-O>gcc
smap <C-/> <C-O>gc

" Bugfix: Map <C-S-Z> to redo to avoid backgrounding Neovim
inoremap <silent> <C-S-Z> <C-O><C-R>
snoremap <silent> <C-S-Z> <Esc><C-O><C-R>

" Bugfix: Properly unindent in insert mode
inoremap <S-Tab> <C-O><<

" Bugfix: Don't assume links are tags
nnoremap <C-LeftMouse> gx
inoremap <C-LeftMouse> <C-O>gx

" Delete previous word (C-BackSpace is now mappable in kitty :) )
inoremap <C-BackSpace> <C-W>
" set backspace=indent,eol,start

" coq
ino <silent><expr> <Esc>   pumvisible() ? "\<C-e><Esc>" : "\<Esc>"
ino <silent><expr> <C-c>   pumvisible() ? "\<C-e><C-c>" : "\<C-c>"
ino <silent><expr> <BS>    pumvisible() ? "\<C-e><BS>"  : "\<BS>"
ino <silent><expr> <CR>    pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"
ino <silent><expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
ino <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<BS>"

" inoremap <C-O> <C-O>:edit<Space>

"=================
" Other Settings =
"=================

" End files with an (invisible) newline
"set listchars=eol:$
" FIXME: Show spaces
set listchars=space:⋅
set listchars=tab:→.
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

" Auto-close HTML tags
" inoremap <lt>/ </<C-X><C-O><Esc>==gi

set conceallevel=2
let g:tex_superscripts= "[0-9a-zA-W.,:;+-<>/()=]"
let g:tex_subscripts= "[0-9aehijklmnoprstuvx,+-/().]"
let g:tex_conceal='abdgm'
let g:vimtex_view_method = 'mupdf'
