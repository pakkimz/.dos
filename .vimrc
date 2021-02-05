" set guifont=FiraCode\ NF:h10
set guifont=CaskaydiaCove\ NF:h10
set guicursor+=a:blinkon0
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>

syntax on
syntax sync minlines=256

filetype plugin indent on                               " all in one line

call plug#begin('\Users\house\vimfiles\plugged\')
" Plug 'igungor/schellar'
Plug 'vim-syntastic/syntastic', { 'on': 'SyntasticToggleMode' }
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }      " sudo xbps-install ctags
Plug 'pakkimz/vim-gummybears-colorscheme'
Plug 'sheerun/vim-polyglot'                             " mandatory
Plug 'Raimondi/delimitMate'                             " jump c-g g or just repeat the action
Plug 'preservim/nerdtree'
Plug 'rking/ag.vim'
Plug 'matze/vim-move'
Plug 'yuttie/comfortable-motion.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'nelstrom/vim-visual-star-search'
Plug 'romainl/vim-tinyMRU'
" Plug 'henrik/vim-indexed-search'
" Plug 'unblevable/quick-scope'
" Plug 'PeterRincker/vim-searchlight'
" Plug 'jeetsukumaran/vim-buffergator'                    " leader-b for for buffer leader-t for tab
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-ragtag'																	" ctrl-x spaces or enter in html
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/loremipsum'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'vim-scripts/zoom.vim'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'wellle/targets.vim'																" more powerful ci) ...
Plug 'tommcdo/vim-exchange'															" exchange word cxiw,cxx,X,cxc
Plug 'lfilho/cosco.vim'																	" alt+;
" Plug 'AndrewRadev/splitjoin.vim'                        " gS and gJ split and join
" Plug 'Yggdroot/indentLine'															" need expandtab to make it works
" Plug 'ivalkeen/vim-simpledb'
" Plug 'gregsexton/MatchTag'
" Plug 'ap/vim-css-color'
" Plug 'justmao945/vim-clang', { 'for': ['c', 'cpp'] }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install', 'for': 'javascript' }
Plug 'captbaritone/better-indent-support-for-php-with-html', { 'for': 'php' }
call plug#end()

source C:\Users\house\vimfiles\general\settings.vim
source C:\Users\house\vimfiles\functions\functions.vim
source C:\Users\house\vimfiles\keys\mappings.vim
source C:\Users\house\vimfiles\commands\commands.vim
