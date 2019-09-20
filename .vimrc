"
" VIM && GVIM config
"

" setting up Vundle
set nocompatible
filetype off

if empty(glob("~/.vim/autoload/plug.vim"))
  " Ensure all needed directories exist  (Thanks @kapadiamush)
  execute '!mkdir -p ~/.vim/plugged'
  execute '!mkdir -p ~/.vim/autoload'
  " Download the actual plugin manager
  execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'flazz/vim-colorschemes'
Plug 'majutsushi/tagbar', { 'for': 'cpp' }
Plug 'scrooloose/syntastic', { 'for': 'cpp' }
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'luochen1990/rainbow'
Plug 'mbbill/undotree'
Plug 'rakr/vim-one'
Plug 'fatih/vim-go', { 'for' : 'go' }
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'sophacles/vim-processing', { 'for': 'processing' }

call plug#end()

" mouse support
set mouse=a
set ttymouse=xterm2

" tab & backspace
set bs=2
set expandtab
set shiftwidth=2
set tabstop=2
set wildmenu
set scrolloff=5
set nobackup
set nowb
set noswapfile
set showmatch

" indent
set autoindent
set smartindent
syntax on
filetype plugin on
let c_space_errors=1

" folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

" visuals
"set t_Co=256
let &t_8f="\e[38;2;%ld;%ld;%ldm"
let &t_8b="\e[48;2;%ld;%ld;%ldm"
set termguicolors
set background=dark
colo 1989
"colo one
set number
set colorcolumn=80
highlight clear SignColumn
highlight clear LineNr

" airline options
set laststatus=2
set showtabline=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline_powerline_fonts = 1
"let g:airline_theme='one'
let g:airline_theme='minimalist'

" completion
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
   \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

highlight Pmenu ctermbg=238 gui=bold

" cscope
set cst
nmap <C-Space>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-Space>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-Space>d :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>a :cs find a <C-R>=expand("<cword>")<CR><CR>

" rainbow brackets
let g:rainbow_active = 1

if has('gui_running')
  set guioptions=gi
  set guifont=Droid\ Sans\ Mono\ Dotted\ for\ Powerline\ 12
  set vb t_vb=
endif

" set spell
set spell spelllang=en_us
set nospell

" key bindings for managing tabs & windows
nmap <F8> :TagbarToggle<cr>
map <F9>  :tabnew<cr>
map <F10> :tabprev<cr>
map <F11> :tabnext<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" NERDTree
map <C-b> :NERDTreeToggle<cr>
" close vim if only window is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" git
nmap <F7> :GitGutterLineHighlightsToggle<cr>
set updatetime=250

" undotree
nnoremap <F5> :UndotreeToggle<cr>

" clipboard
nnoremap <Leader>y "+y
nnoremap <Leader>Y "+Y
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
set pastetoggle=<F2>

" lang specific

" go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:syntastic_mode_go_checkers = ['golint', 'govet', 'errcheck']

" rust
let g:tagbar_type_rust = {
    \ 'ctagstype' : 'rust',
    \ 'kinds' : [
        \'T:types,type definitions',
        \'f:functions,function definitions',
        \'g:enum,enumeration names',
        \'s:structure names',
        \'m:modules,module names',
        \'c:consts,static constants',
        \'t:traits,traits',
        \'i:impls,trait implementations',
    \]
    \}
