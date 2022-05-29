let g:python3_host_prog='/usr/bin/python3'
syntax on
set number
set norelativenumber
set nocursorline
set wrap
set showcmd
set wildmenu

set hlsearch
exec "nohlsearch"
set incsearch
map ,. :nohlsearch<CR>

set ignorecase
set smartcase

filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse=a
set encoding=utf-8
let &t_ut=''
let t_Co=256
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set list
set listchars=tab:\|\ ,trail:-
set scrolloff=6
set tw=0
set indentexpr=
set backspace=indent,eol,start
" set foldmethod=indent
" set foldlevel=99
set laststatus=2
set autochdir
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" Key settings
map s <nop>
map <LEADER> <nop>
imap jk <Esc>
map \ :
map \\ :!
map S :w<CR>
map Q :q<CR>
map R :source $MYVIMRC<CR>
map <C-j> 10j
map <C-k> 10k
map []\ tu:e ~/.config/nvim/init.vim<CR>

" split
map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sj :set splitbelow<CR>:split<CR>
map sk :set nosplitbelow<CR>:split<CR>
 
map <space>l <C-w>l
map <space>h <C-w>h
map <space>j <C-w>j
map <space>k <C-w>k

map <up> :res +2<CR>
map <down> :res -2<CR>
map <left> :vertical resize-2<CR>
map <right> :vertical resize+2<CR>

map sv <C-w>t<C-w>H
map sg <C-w>t<C-w>K

" tab
map tu :tabe<CR>
map tl :+tabnext<CR>
map th :-tabnext<CR>

" plug shortcuts
map tt :NERDTree<CR>

call plug#begin('~/.config/nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
" Plug 'tanvirtin/monokai.nvim'
" Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'ayu-theme/ayu-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'voldikss/vim-translator'
call plug#end()

" ===== coc.nvim =====
let g:coc_global_extensions = [
      \ 'coc-json',
      \ 'coc-vimlsp',
      \ 'coc-pyright',
      \ 'coc-jedi',
      \ 'coc-clangd']
set hidden
set updatetime=100
set shortmess+=c
set signcolumn=number

" use <TAB> to choice
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
inoremap <silent><expr> <c-space> coc#refresh()
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)


" ===== ayu color scheme =====
set termguicolors     " enable true colors support
" let ayucolor="mirage" " for mirage version of theme
let ayucolor="dark"
colorscheme ayu
" IndentLine {{
let g:indentLine_char = ''
let g:indentLine_first_char = ''
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
" }}
