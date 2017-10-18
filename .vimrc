"vimrc by wjl
set nu
syntax on
set encoding=utf8

"for indent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
set expandtab

"for C
set cindent

"for searching
set showmatch
set ignorecase
set smartcase
set hlsearch
set incsearch

"remember the last position
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

"config for python
let python_highlight_all=1

"Quickly Run
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'python'
        exec "!python3 %"
    endif
endfunc

map j gj
map k gk
