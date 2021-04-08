" toggle error vim syntastic
function! ToggleErrors()
	let old_last_winnr = winnr('$')
	lclose
	if old_last_winnr == winnr('$')
		Errors
	endif
endfunction

" remove any trailing whitespace that is in the file and preserve cursor position
function! StripTrailingWhitespaces()
  if !&binary && &filetype != 'diff'
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//ge
    call winrestview(l:save)
  endif
endfun

" replace groups or function of empty or whitespaces-only lines with one empty line and preserve cursor position
function! StripTrailingFunc()
  if !&binary && &filetype != 'diff'
    let l:save = winsaveview()
    keeppatterns %s/\(\s*\n\)\{3,}/\r\r/ge
    call winrestview(l:save)
  endif
endfun

" auto remove multiple empty lines at the end of line and preserve cursor position
function! StripTrailingEOL()
  if !&binary && &filetype != 'diff'
    let l:save = winsaveview()
    keeppatterns %s/\(\s*\n\)\+\%$//ge
    call winrestview(l:save)
  endif
endfun
