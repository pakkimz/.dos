colorscheme gummybears

" change cursor shape in different mode
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

let mapleader = ' '
let g:move_map_keys = 0                                 " disable other keys vim-move and just use my mapping
let g:NERDTreeWinSize = 25
let g:highlightedyank_highlight_duration = 100
let g:comfortable_motion_no_default_key_mappings = 1    " disable default mapping
let g:tagbar_sort = 0                                   " order tags based on file order, don't sort alphabetically
let g:tagbar_width = 25
" let g:ag_highlight = 1
let g:ag_mapping_message = 0
let g:tern_show_signature_in_pum = 1
" let g:tern_show_argument_hints = "on_hold"

" let g:buffergator_viewport_split_policy = "B"
" let g:buffergator_split_size = 10

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }	" dont autostart
let g:syntastic_check_on_wq = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = 'eslint_d'

" let g:clang_auto = 1
" let g:clang_diagsopt = ''
" let g:clang_check_syntax_auto = 0
" let g:clang_enable_format_command = 0
" let g:clang_c_completeopt = 'menuone,noinsert'
" let g:clang_cpp_completeopt = 'menuone,noinsert'
