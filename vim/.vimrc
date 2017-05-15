syntax on
filetype plugin indent on

let mapleader = ' '

" Configure airline before installing
let g:airline_powerline_fonts = 1 " TODO: detect this?
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_format = '%s '
let g:airline#extensions#tabline#buffer_nr_show = 1
"let g:airline#extensions#tabline#fnamecollapse = 0
"let g:airline#extensions#tabline#fnamemod = ':t'

" Configure NERDTree
let NERDTreeShowHidden = 1
let NERDTreeMouseMode = 2
let NERDTreeMinimalUI = 1

" Ignore things
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/bower_components/*,*/node_modules/*
set wildignore+=*/vendor/*,*/.git/*,*/.hg/*,*/.svn/*,*/log/*,*/tmp/*

" Configure syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
let g:syntastic_javascript_checkers = ['eslint']

"disable syntastic on a per buffer basis (some work files blow it up)
function! SyntasticDisableBuffer()
    let b:syntastic_skip_checks = 1
    SyntasticReset
    echo 'Syntastic disabled for this buffer'
endfunction

function! SyntasticEnableBuffer()
    let b:syntastic_skip_checks = 0
    SyntasticReset
    echo 'Syntastic enabled for this buffer'
endfunction

command! SyntasticDisableBuffer call SyntasticDisableBuffer()
command! SyntasticEnableBuffer call SyntasticEnableBuffer()

map <leader>l :SyntasticDisableBuffer<CR>
map <leader>L :SyntasticEnableBuffer<CR>

call plug#begin('~/.vim/plugged')
Plug 'bling/vim-airline'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
if v:version < 705 && !has('patch-7.4.785')
      Plug 'vim-scripts/PreserveNoEOL'
endif
Plug 'editorconfig/editorconfig-vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
Plug 'mhinz/vim-signify'
Plug 'mattn/emmet-vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'chase/vim-ansible-yaml'
Plug 'wavded/vim-stylus'
Plug 'klen/python-mode', {'for': 'python'}
Plug 'terryma/vim-multiple-cursors'
Plug 'wting/rust.vim', {'for': 'rust'}
Plug 'vim-scripts/dbext.vim'
Plug 'krisajenkins/vim-pipe'
Plug 'krisajenkins/vim-postgresql-syntax'
Plug 'mileszs/ack.vim'

" My own area -- gnarf
Plug 'vim-syntastic/syntastic'
Plug 'sickill/vim-monokai'
let g:NumberToggleTrigger = "<leader>n"
Plug 'jeffkreeftmeijer/vim-numbertoggle'
call plug#end()

colorscheme monokai

map <leader><Left> :NERDTreeToggle<CR>
nnoremap <leader>b :CtrlPBuffer<CR>

" airline is showing us this INSERT/VISUAL so we don't need it
set noshowmode

nmap <D-[> :bprev!<CR>
vmap <D-[> <Esc>:bprev!<CR>
nmap <D-]> :bnext!<CR>
vmap <D-]> <Esc>:bnext!<CR>
nmap <D-t> :enew!<CR>
vmap <D-t> <Esc>:enew!<CR>

nmap <leader>[ :bprev!<CR>
vmap <leader>[ <Esc>:bprev!<CR>
nmap <leader>] :bnext!<CR>
vmap <leader>] <Esc>:bnext!<CR>
nmap <C-t> :enew!<CR>
vmap <C-t> <Esc>:enew!<CR>

nmap <leader>p "+p
vmap <leader>d "+d
vmap <leader>g "+g

" Fix page up and down
map <PageUp> <C-U>
map <PageDown> <C-D>
imap <PageUp> <C-O><C-U>
imap <PageDown> <C-O><C-D>
