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
"for python header --start
autocmd BufNewFile *.py 0r ~/.vim/vim_python_header
autocmd BufNewFile *.py ks|call FileName()|'s
autocmd BufNewFile *.py ks|call CreatedTime()|'s

fun FileName()
    if line("$") > 10
        let l = 10
    else
        let l = line("$")
    endif 
    exe "1," . l . "g/File Name:.*/s/File Name:.*/File Name: " .expand("%")  
endfun 

fun CreatedTime()
    if line("$") > 10
        let l = 10
    else
        let l = line("$")
    endif 
    exe "1," . l . "g/Created Time:.*/s/Created Time:.*/Created Time: " .strftime("%Y-%m-%d %T") 
endfun 
"for python header --end

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
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
:nnoremap <space> za

set cursorcolumn
set cursorline
hi cursorcolumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
