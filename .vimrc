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
Plug 'majutsushi/tagbar'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/neocomplete.vim'
Plug 'oblitum/rainbow'
Plug 'mbbill/undotree'
Plug 'fatih/vim-go', { 'for' : 'go' }
Plug 'tpope/vim-markdown', { 'for': 'markdown' }

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
set t_Co=256
set background=dark
colo cobalt2
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
"let g:airline_theme=''

" neocomplete
let g:neocomplete#enable_at_startup = 1

" rainbow brackets
let g:rainbow_active = 1

if has('gui_running')
  set guioptions=gi
  set guifont=Droid\ Sans\ Mono\ Dotted\ for\ Powerline\ 12
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
map <C-n> :NERDTreeToggle<cr>

" git
nmap <F7> :GitGutterLineHighlightsToggle<cr>

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

