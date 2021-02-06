" move between tags
runtime! macros/matchit.vim
" plugin vim-repeat adding support to related plugins
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)
" resize splits when the window is resized
autocmd VimResized * :wincmd =
" save when losing focus
autocmd FocusLost * :silent! wall
" remove set hidden to properly remove netrw with bd command
autocmd FileType netrw setl bufhidden=wipe
" remove any trailing whitespace that is in the file
autocmd BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif
" auto remove multiple empty lines at the end of line
autocmd BufWrite * :%s/\(\s*\n\)\+\%$//ge
" replace groups or function of empty or whitespaces-only lines with one empty line
autocmd BufWrite * :%s/\(\s*\n\)\{3,}/\r\r/ge
" disable autocomment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" meaningful backup name
autocmd BufWritePre * let &bex = '@' . strftime("%F.%H:%M")
" when switching buffers, preserve window view.
autocmd BufLeave * if !&diff | let b:winview = winsaveview() | endif
autocmd BufEnter * if exists('b:winview') && !&diff | call winrestview(b:winview) | unlet! b:winview | endif
