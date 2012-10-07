set nocompatible
"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin

syntax on

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
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set nobackup

set ignorecase
set smartcase
set gdefault
set incsearch
"set showmatch
set hlsearch

set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

set foldmethod=syntax

" assign leader key
let mapleader="-"

" hide swap and backups from netrw
let g:netrw_list_hide = "\\~$,\\.swp$"

" hide annoying red highlights for java code
let java_allow_cpp_keywords=1

" shortcuts for deleting and changing without putting in register
nmap <silent> <Leader>d "_d
nmap <silent> <Leader>c "_c

" replace with register
nmap <silent> <Leader>pw "_dwP
nmap <silent> <Leader>pe "_deP

" shortcut to cleanout whitespace
nnoremap <Leader>wh :%s/ \+$//<Cr>

" shortcut to convert tabs
nnoremap <Leader>tab :%s/\t/    /<Cr>

" auto reselect after indenting
vnoremap < <gv
vnoremap > >gv

" disable arrow keys in normal mode
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" remap go to mark to work with swedish keyboard
noremap ' `
noremap ` '

" remap go to tag to work with swedish keyboard
noremap <C-G> <C-]>

" auto insert matching parenthesis
" inoremap        (  ()<Left>
" skip over ) in insertmode when pressing )
" inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
" auto insert matching }
" inoremap {      {}<Left>
" inoremap {<CR>  {<CR>}<Esc>O
" inoremap {{     {
" inoremap {}     {}

" adaptations for swedish keyboard layout
nnoremap ö [
nnoremap ä [
nnoremap Ö {
nnoremap Ä }

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

if has("gui_running")
    if has("win32")
        set guifont=Consolas:h10:b:cANSI
    else
        "set guifont=Bitstream\ Vera\ Sans\ Mono\ Bold\ 9
        set guifont=Menlo\ for\ Powerline\ 9
    endif
    set guioptions-=T
    colorscheme desert
else
    colorscheme evening
endif

noremap <F5> :exec "silent !./build.sh " . v:servername<CR>

let g:Powerline_symbols = 'fancy'

call pathogen#infect()
