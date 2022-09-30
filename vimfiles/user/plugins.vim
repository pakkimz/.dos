syntax on
syntax sync minlines=256

filetype plugin indent on																	" all in one line

call plug#begin('~\vimfiles\plugged\')
Plug 'tsuyoshicho/transparency.vim'
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }				" need ctags / npm jsctags
Plug 'pakkimz/jellybeans.vim'
Plug 'pakkimz/Strips'
Plug 'sheerun/vim-polyglot'																" mandatory
Plug 'Raimondi/delimitMate'                               " C-g g to escape
Plug 'preservim/nerdtree'
Plug 'PhilRunninger/nerdtree-visual-selection'
Plug 'ryanoasis/vim-devicons'
Plug 'rking/ag.vim'
Plug 'matze/vim-move'
Plug 'yuttie/comfortable-motion.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'nelstrom/vim-visual-star-search'
Plug 'romainl/vim-tinyMRU'
Plug 'vim-scripts/zoom.vim'
Plug 'vim-scripts/loremipsum'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'christoomey/vim-titlecase'
Plug 'junegunn/vim-easy-align'
Plug 'tommcdo/vim-exchange'															  " exchange word cxiw,cxx,X,cxc
Plug 'wellle/targets.vim'																  " more powerful ci) ...
Plug 'lfilho/cosco.vim'																	  " alt+;
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'                                   " put this on the last
" Plug 'tpope/vim-fugitive'
" Plug 'Yggdroot/indentLine'															" need expandtab to make it works
" Plug 'gregsexton/MatchTag'
Plug 'ap/vim-css-color'
Plug 'ivalkeen/vim-simpledb', { 'for' : 'sql' }
" ----------LSP----------
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'omgitsmoe/asyncomplete-buffer.vim'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
call plug#end()
