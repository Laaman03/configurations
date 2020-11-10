call plug#begin()

Plug 'neovim/nvim-lspconfig'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'mileszs/ack.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-sensible'
Plug 'jiangmiao/auto-pairs'

call plug#end()

" Omnisharp bandaid
au BufEnter Filetype cs :e<CR>

" my custom stuff

" preview fix for windows
if has('win32')
	command! -bang -nargs=? -complete=dir Files
		\ call fzf#vim#files(<q-args>, 
    \ {'options': ['--preview', 'type {}']}, <bang>0)
endif

" lsp
lua << EOF
local nvim_lsp = require('nvim_lsp')
local buf_set_keymap = vim.api.nvim_buf_set_keymap

local on_attach = function(_, bufnr)
	local opts = {noremap=true, silent=true}
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
	buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
	buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	buf_set_keymap(bufnr, 'n', ',rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	buf_set_keymap(bufnr, 'n', '[I', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	buf_set_keymap(bufnr, 'n', ',e', '<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>', opts)
end

local servers = {'pyls', 'tsserver'}
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup {
		on_attach = on_attach,
	}
end

EOF
"end lsp

hi Pmenu ctermbg=234 ctermfg=93
let mapleader = ","
set tabstop=2 noexpandtab shiftwidth=2
set completeopt=menuone,longest
set number numberwidth=3
set splitright
set synmaxcol=700
highlight Search ctermbg=darkcyan
nnoremap <leader>ch :noh<CR>
let g:lightline = {
  \ 'colorscheme': 'darcula',
  \ }
" python 4 width tab
autocmd FileType python setlocal expandtab shiftwidth=4

" cs 4 width tab
autocmd FileType cs setlocal expandtab shiftwidth=4

" no longer need status becuase of lightline
set noshowmode

nnoremap <leader>b :buffers<CR>:buffer<Space>

" edit and source vim rc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" map H and L to actually do stuff
nnoremap H ^
nnoremap L $

" enter normal fast
inoremap jk <esc>

" plugin shortcuts
nnoremap <leader>a :Ack 
nnoremap <leader>F :Files<CR>
nnoremap <leader>ps :! powershell -command ""<Left>

