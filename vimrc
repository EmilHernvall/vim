set nocompatible

syntax on

set ttyfast

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set nowrap

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=full
"set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set nobackup

set list
set listchars=trail:»,tab:→»

set ignorecase
set smartcase
set gdefault
set incsearch
"set showmatch
set hlsearch

set textwidth=79
set formatoptions=qrn1
set colorcolumn=80

set foldmethod=syntax
set foldlevelstart=10

" assign leader key
let mapleader="-"

" hide swap and backups from netrw
let g:netrw_list_hide = "\\~$,\\.swp$"

" hide annoying red highlights for java code
let java_allow_cpp_keywords=1

" shortcuts for deleting and changing without putting in register
" nmap <silent> <Leader>d "_d
" nmap <silent> <Leader>c "_c

" for navigating between errors
map <Leader>q :copen<cr><C-W>J
noremap <silent> <leader>w :w \| exec "silent !./build.sh " . v:servername<CR>
map <Leader>e :ccl<cr>
map <Leader>a :cf<cr>
map <leader>s :cp<cr>
map <leader>d :cn<cr>

" shortcut to cleanout whitespace
nnoremap <Leader>wh :exec "%s/ \\+$// <bar> nohl"<CR>

" shortcut to convert tabs
nnoremap <Leader>tab :%s/\t/    /<Cr>

" shortcuts for inserting package names in java
nnoremap <Leader>mod a<C-R>=join(split(expand('%:h'), "/")[1:],".")<CR><ESC>

" auto reselect after indenting
vnoremap < <gv
vnoremap > >gv

" disable arrow keys in normal mode
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" remap go to tag to work with swedish keyboard
noremap <C-G> <C-]>

" quick navigation keys
" nnoremap <silent> ö :set nohlsearch<cr>?\v(\{\|\})<Cr>:let @/=""<cr>:set hlsearch<cr>
" nnoremap <silent> ä :set nohlsearch<cr>/\v(\{\|\})<Cr>:let @/=""<cr>:set hlsearch<cr>
nnoremap <silent> ö :set nohlsearch<cr>:let @/='\v(\{\|\})'<Cr>:keepjumps normal N<Cr>:let @/=""<cr>:set hlsearch<cr>
nnoremap <silent> ä :set nohlsearch<cr>:let @/='\v(\{\|\})'<Cr>:keepjumps normal n<Cr>:let @/=""<cr>:set hlsearch<cr>
nnoremap <silent> Ö :keepjumps normal {<cr>
nnoremap <silent> Ä :keepjumps normal }<cr>
vnoremap <silent> Ö {
vnoremap <silent> Ä }

" disable some stuff
nnoremap K <nop>
vnoremap K <nop>

" quick quitting
command Q qall!

if has("autocmd")

    " Enable file type detection.
    " Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent indenting.
    filetype plugin indent on

    " Put these in an autocmd group, so that we can delete them easily.
    augroup vimrcEx
    au!

    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    " Also don't do it when the mark is in the first line, that is the default
    " position when opening a file.
    autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

    augroup END

else

    set autoindent
    set smartindent

endif " has("autocmd")

colorscheme desert
if has("gui_running")
    set guifont=Menlo\ for\ Powerline\ 10
    set guioptions-=T
endif

" function keys
" =============

noremap <F6> :nohl<CR>

map <F10> :set paste<CR>
map <F11> :set nopaste<CR>
imap <F10> <C-O>:set paste<CR>
imap <F11> <nop>
set pastetoggle=<F11>

" plugin related settings and bindings
let g:Powerline_symbols = 'fancy'

nnoremap <silent> <Leader>P :YRShow<CR>
nnoremap <silent> <space> :CtrlPBuffer<CR>

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.class,*.pyc
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](\.build|\.git|\.hg|\.svn|out|build|node_modules|target)$',
    \ 'file': '\v\.(class|pyc|exe|so|dll)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }
  let g:ctrlp_user_command = ['.git', 'cd %s ; git ls-files . -co --exclude-standard', 'find %s -type f']

call pathogen#infect()

autocmd BufNewFile,BufRead *.morpheme set syntax=scheme
