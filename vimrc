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
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'luochen1990/rainbow'
Plug 'mbbill/undotree'
Plug 'fatih/vim-go', { 'for' : 'go' }
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'kien/ctrlp.vim'
Plug 'chiel92/vim-autoformat'

call plug#end()

" mouse support
set mouse=a
set ttymouse=xterm2

" for local vimrc
set exrc
set secure

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
set incsearch
set hlsearch

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
"if exists('$TMUX')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"endif

set t_Co=256
set termguicolors
colo 1989
set background=dark
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE

set number
set colorcolumn=100
highlight clear SignColumn
highlight clear LineNr

set laststatus=2
set showtabline=2

" rainbow brackets
let g:rainbow_active = 1

if has('gui_running')
  set guioptions=gi
  set guifont=Droid\ Sans\ Mono\ Dotted\ for\ Powerline\ 10
endif

" set spell
set spell spelllang=en_us
set nospell

" clipboard
nnoremap <Leader>y "+y
nnoremap <Leader>Y "+Y
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
set pastetoggle=<F2>

" key bindings for managing tabs & windows
nmap <F8> :TagbarToggle<cr>
map <F9>  :tabnew<cr>
map <F10> :tabprev<cr>
map <F11> :tabnext<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" airline options
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline_powerline_fonts = 1
let g:airline_theme='minimalist'

" NERDTree
map <C-n> :NERDTreeToggle<cr>
" close vim if only window is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" git
nmap <F7> :GitGutterLineHighlightsToggle<cr>
set updatetime=500

" autoformat config
noremap <F3> :Autoformat<CR>
au BufWrite *.py :Autoformat

" cscope
set cst
" example cscope refresh function, to put in .exrc
"function Refresh_cs()
"    exec '!find . \( -path "./src/*" -or -path "./test/*" \) -name "*.[cxhsS]" -print > cscope.files'
"    exec '!cscope -Rbq'
"    cs reset
"    echom "CScope refresh done"
"endfunction
"map <F5> :call Refresh_cs()<CR><CR><CR><CR>
"cs add cscope.out

function Remove_trail()
  :%s/\s\+$//e
endfunction

nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>a :cs find a <C-R>=expand("<cword>")<CR><CR>

" Using 'CTRL-spacebar' then a search type makes the vim window
" split horizontally, with search result displayed in
" the new window.

nmap <C-@><C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@><C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-@><C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>a :scs find a <C-R>=expand("<cword>")<CR><CR>

" Hitting CTRL-space *twice* before the search type does a vertical
" split instead of a horizontal one

"nmap <C-Space><C-Space>s
"  \:vert scs find s <C-R>=expand("<cword>")<CR><CR>
"nmap <C-Space><C-Space>g
"  \:vert scs find g <C-R>=expand("<cword>")<CR><CR>
"nmap <C-Space><C-Space>c
"  \:vert scs find c <C-R>=expand("<cword>")<CR><CR>
"nmap <C-Space><C-Space>t
"  \:vert scs find t <C-R>=expand("<cword>")<CR><CR>
"nmap <C-Space><C-Space>e
"  \:vert scs find e <C-R>=expand("<cword>")<CR><CR>
"nmap <C-Space><C-Space>i
"  \:vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
"nmap <C-Space><C-Space>d
"  \:vert scs find d <C-R>=expand("<cword>")<CR><CR>
"nmap <C-Space><C-Space>a
"  \:vert scs find a <C-R>=expand("<cword>")<CR><CR>
"

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

" python
let g:pymode_virtualenv = 1
