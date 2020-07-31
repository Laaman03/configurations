call plug#begin('~/.local/plugged')

Plug 'preservim/nerdtree'
Plug 'pprovost/vim-ps1'
Plug 'autozimu/LanguageClient-neovim', {
	\ 'branch': 'next',
	\ 'do': 'bash install.sh',
	\ }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'

call plug#end()

" no longer need status becuase of lightline
set noshowmode

" lsp setup
set hidden
let g:LanguageClient_serverCommands = {
\ 'javascript': ['/home/wfarris/bin/js-ts-langserver'],
\ 'python': ['/home/wfarris/bin/pyls'],
\ }

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>


set number numberwidth=2
set expandtab
let mapleader = "-"
nnoremap <space> za

" edit and source vim rc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" map H and L to actually do stuff
nnoremap H ^
nnoremap L $

" enter normal fast
inoremap jk <esc>

" \c = set comment
autocmd FileType javascript nnoremap <buffer> <leader>c I//<esc>
autocmd FileType python nnoremap <buffer> <leader>c I#<esc>

" - > opens nerd tree
map <leader>t :NERDTreeToggle<CR>

" js 2 width tab
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2
