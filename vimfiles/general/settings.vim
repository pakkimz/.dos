" for gvim default window size
set lines=40
set columns=80

set termguicolors                                       " enable true colors support
set synmaxcol=500                                       " syntax coloring lines that are too long just slows down the world
set regexpengine=1																			" fixes slow speed due to syntax highlighting
set updatetime=300
set nonumber
set showcmd                                             " showing command history
set noshowmode                                          " hide the insert status
set noruler																							" hide info in bottom of screen
set statusline=⠀  																			" blank statusline u2800(ctrl+v)
set matchtime=3
set ttimeoutlen=10                                      " faster sequance esc+O
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab																						" tab in insert mode use shiftwidth instead of softtabstop
set shiftround																					" >> always same as tab size even after inserting space
set noexpandtab
set backspace=indent,eol,start													" set backspace to delete normally
set textwidth=106
set autoindent                                          " no use smartindent
set breakindent
set linebreak																						" wrap word
set linespace=0                                         " only works in gui
set mouse=a
set signcolumn=yes
set wildmenu
set wildmode=full																				" just use regular wildmode
set wildoptions=pum																			" use popup menu in wildmode as in neovim
set wildcharm=<C-z>                                     " make mru and buffer working
set whichwrap+=<,>,h,l,[,]
set virtualedit=block																		" block selection in visual mode
set nostartofline                                       " sometimes cursor jumping back
set hlsearch
set incsearch																						" highlighting word when search '/'
set ignorecase
set smartcase
set confirm																							" ask to save buffer
set autowrite		                                        " automatically save before commands like :next and :make
set complete-=i                                         " get rid system include in auto completion
set shortmess=atIc																			" use abbreviation, truncate message, disable intro message and ins-completion-menu
set pumheight=10																				" makes popup menu smaller
set laststatus=1
set scrolloff=2
set sidescrolloff=2
set splitbelow
set splitright
set undofile
set history=1000
set backup
set writebackup																					" make backup before overwriting the current buffer
set backupcopy=yes																			" overwrite the original backup file
set viminfo='20,\"100,s10,h                             " dont store more than 100 lines, h: disable hlsearch, s10 max KB
set undodir^=~\vimfiles\.vim\tmp\undo
set directory=~\vimfiles\.vim\tmp\swap
set backupdir=~\vimfiles\.vim\tmp\backup
set dictionary=~\vimfiles\dict\words										"	<c-x><c-k>
set path=.,**																						" :find current and all the children
set hidden																							" moving buffer without saving it
set belloff=all
set completeopt=menuone,noinsert
set ttyfast
set lazyredraw
set t_md=																								" disable bold font
