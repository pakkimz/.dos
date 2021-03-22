" '., gi, gv, go
nnoremap g. `.

" re select pasted text
nnoremap gV `[v`]

" make Y yank to end of line (like D or C)
nnoremap Y y$

" say Nop for q and Q
noremap q <Nop>
noremap Q <Nop>

" supertab. for 'cancel complete C-e' / 'C-y for yes'
inoremap <tab> <C-p>
inoremap <S-tab> <tab>

" map enter as ctrl-y in vim completion intrupt delimitMate_expand_cr
" inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"

" not working when completeopt not set to 'menu'
inoremap <expr> <C-k> ((pumvisible())?("\<C-p>"):("\<C-x><c-p>"))
inoremap <expr> <C-j> ((pumvisible())?("\<C-n>"):("\<C-x><c-n>"))

" easier scroll when wrap
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

" scroll in command mode
cnoremap <C-k> <C-p>
cnoremap <C-j> <C-n>

" intuitive moving buffer
nnoremap <C-l> :bnext<CR>
nnoremap <C-h> :bprevious<CR>

" add one space
nnoremap [s i<space><esc>l
nnoremap ]s a<space><esc>h

"easier horizontal scrolling
nnoremap zl zL
nnoremap zh zH

" re-select visual block after indenting
vnoremap < <gv
vnoremap > >gv

" paste multiple lines multiple times with simple ppppp
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" esc stuffs
inoremap <C-space> <Esc>`^
vnoremap <C-space> <Esc>gV
onoremap <C-space> <Esc>
cnoremap <C-space> <C-c>
nnoremap <C-space> <Esc>:noh<CR>

" increase value resize split defalut 1
nnoremap <silent><C-w>+ :resize +5<CR>
nnoremap <silent><C-w>- :resize -5<CR>
nnoremap <silent><C-w>> :vertical:resize +5<CR>
nnoremap <silent><C-w>< :vertical:resize -5<CR>

" play with leader
nnoremap <silent><leader>w :w!<CR>
nnoremap <silent><leader>W :wa!<CR>
nnoremap <silent><leader>x :x<CR>
nnoremap <silent><leader>q :q<CR>
nnoremap <silent><leader>Q :qa!<CR>
nnoremap <silent><leader>r :bd<CR>
nnoremap <silent><leader>R :bw!<CR>
nnoremap <silent><leader>o :%bd\|e#\|bd#<CR>
nnoremap <silent><leader>O :%bd!\|e#\|bd!#<CR>
nnoremap <leader>a :Ag!<space>
nnoremap <leader>e :e<Space>
nnoremap <leader>E :e <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <leader>f :find<Space>
nnoremap <leader>s :saveas<Space>
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" mru and buffer
nnoremap <leader>b :b <C-z>
nnoremap <leader>m :ME <C-z>

" clipboard install vim-gtk or alias vim-x11 or install xsel in neovim
nnoremap gy "+y
nnoremap gY "+y$
vnoremap gy "+y
nnoremap gd "+d
nnoremap gD "+D
vnoremap gd "+d
nnoremap gp "+p
nnoremap gP "+P
vnoremap gp "+p

" moving around in insert & command mode, ctrl+b & ctrl+e move beginning and end
inoremap <C-b> <Home>
inoremap <C-a> <End>
inoremap <A-h> <left>
inoremap <A-l> <right>
inoremap <A-k> <S-Left>
inoremap <A-j> <S-Right>
cnoremap <C-a> <End>
cnoremap <A-h> <left>
cnoremap <A-l> <right>
cnoremap <A-k> <S-Left>
cnoremap <A-j> <S-Right>

" vim indentline
" nnoremap <silent><F9> :IndentLinesToggle<CR>

" delimitmate
nnoremap <silent><F10> :DelimitMateSwitch<CR>

" tagbar
nnoremap <silent><F8> :TagbarToggle<CR>

" vim cosco
nnoremap <silent> <A-;> :CommaOrSemiColon<CR>
inoremap <silent> <A-;> <esc>:CommaOrSemiColon<CR>a

" vim syntastic
nnoremap <silent><F5> :SyntasticToggleMode<CR>
nnoremap <silent><C-s> :<C-u>call ToggleErrors()<CR>

" nerdtree
nnoremap gn :e .<CR>
nnoremap gN :e ~/<CR>
nnoremap <silent><C-n> :NERDTreeToggle . <Bar>wincmd p<Bar><CR>
nnoremap <silent><leader>d :bp<cr>:bd #<cr>

" vim-move mapping
vmap <C-j> <Plug>MoveBlockDown
vmap <C-k> <Plug>MoveBlockUp
nmap <C-j> <Plug>MoveLineDown
nmap <C-k> <Plug>MoveLineUp

" don't scroll too fast
nnoremap <silent> <C-d> :call comfortable_motion#flick(50)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(-50)<CR>
nnoremap <silent> <C-f> :call comfortable_motion#flick(100)<CR>
nnoremap <silent> <C-b> :call comfortable_motion#flick(-100)<CR>
