"
" VIM && GVIM config
"

" setting up Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-markdown'
Plugin 'airblade/vim-gitgutter'
Plugin 'flazz/vim-colorschemes'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'fatih/vim-go'
Plugin 'VimClojure'
Plugin 'rust-lang/rust.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'xero/blaquemagick.vim'
Plugin 'ryanpcmcquen/true-monochrome_vim'
Plugin 'sophacles/vim-processing'

call vundle#end()

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
"colo monochrome
set number
set colorcolumn=80
highligh clear SignColumn

" airline options
set laststatus=2
set showtabline=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline_powerline_fonts = 1
let g:airline_theme='monochrome'
"let g:airline_solarized_bg='dark'

" gvim specific ops
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
