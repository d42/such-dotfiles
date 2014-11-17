set nocompatible               " be iMproved
set encoding=utf-8             "
set laststatus=2               " always status line

set lazyredraw                 " tl;dr redraw only on :redraw
set rtp+=~/.vim/bundle/vundle/ " runtimepath
source ~/.vimrc.bundles        " bundles
filetype plugin indent on
syntax on                       " syntax highlighing
" monitor some files :V
autocmd bufwritepost .vimrc source $MYVIMRC
autocmd bufwritepost .vimrc.bundle source $MYVIMRC

filetype plugin indent on
syntax on                       " syntax highlighing
set shell=bash                  " syntastic hates fish
set number                      " Display line numbers
set numberwidth=1               " using only 1 column (and 1 space) while possible
"set background=dark            " We are using dark background in vim
set title                       " show title in console title bar
set t_Co=256                    " force colors
set clipboard=unnamedplus       " share clipboard with X

let mapleader =","
nnoremap ; :
let loaded_matchparen = 1       " disable matching parenthesis for great justice (or because it's slow as fuck). Use rainbow parentheses instead
set mouse=a
set hidden                      " keep buffers open
set colorcolumn=80
colo molokai



""" Moving Around/Editing
set nostartofline           " Avoid moving cursor to BOL when jumping around
set virtualedit=block       " Let cursor move past the last char in <C-v> mode
set scrolloff=3             " Keep 3 context lines above and below the cursor
set backspace=2             " Allow backspacing over autoindent, EOL, and BOL
set showmatch               " Briefly jump to a paren once it's balanced
set nowrap                  " don't wrap text
set linebreak               " don't wrap textin the middle of a word
set autoindent              " always set autoindenting on
set smartindent             " use smart indent if there is no indent file
set tabstop=4               " <tab> inserts 4 spaces 
set shiftwidth=4            " but an indent level is 2 spaces wide.
set softtabstop=4           " <BS> over an autoindent deletes both spaces.
set expandtab               " Use spaces, not tabs, for autoindent/tab key.
set shiftround              " rounds indent to a multiple of shiftwidth
"set matchpairs+=<:>         " show matching <> (html mainly) as well
set foldmethod=indent       " allow us to fold on indents
set foldlevel=99            " don't fold by default
"set autochdir               " auto change directory to currently edited file

" don't outdent hashes
inoremap # #



" Ignore these files when completing
set wildignore+=*.o,*.obj,.git,*.pyc
set wildignore+=eggs/**
set wildignore+=*.egg-info/**
set wildignore+=*.swp,*.bak


"""" Reading/Writing
set noautowrite             " Never write a file unless I request it.
set noautowriteall          " NEVER.
set noautoread              " Don't automatically re-read changed files.
set ffs=unix,dos,mac        " Try recognizing dos, unix, and mac line endings.
set noro                    " Disable read only

"""" Messages, Info, Status
set ls=2                    " allways show status line
set noeb vb t_vb=
set confirm                 " Y-N-C prompt if closing with unsaved changes.
set showcmd                 " Show incomplete normal mode commands as I type.
set report=0                " : commands always print changed line count.
set shortmess+=aoOtI        " Use [+]/[RO]/[w] for modified/readonly/written.
set ruler                   " Show some info, even without statuslines.
set laststatus=2            " Always show statusline, even if only 1 window.
set statusline=[%l,%v\ %P%M]\ %f\ %r%h%w\ (%{&ff})\}

" displays tabs with :set list & displays when a line runs off-screen
set listchars=tab:>-,eol:$,trail:-,precedes:<,extends:>
set list
set cursorline " cursor line colors

""" Searching and Patterns
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set smarttab                " Handle tabs more intelligently 
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex



" airline
let g:airline_powerline_fonts = 1
let g:airline_theme='wombat'



" tagbar
let g:tagbar_left = 1
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
let g:tagbar_type_javascript = {'ctagsbin' : '/usr/bin/jsctags'}

" youcompleteme
set pumheight=6             " Keep a small completion windo
let g:acp_completeoptPreview                        = 0
let g:UltiSnipsExpandTrigger = "<c-j>"
let g:ycm_add_preview_to_completeopt                = 0
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_autoclose_preview_window_after_insertion = 0
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_filepath_completion_use_working_dir       = 1
let g:ycm_filetype_specific_completion_to_disable = {'rst':''}
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
"let g:ycm_key_list_select_completion                = ['<TAB>']
"let g:ycm_path_to_python_interpreter = '/usr/bin/python'


" vim-bookmarks
let g:bookmark_save_per_working_dir = 1




"Rainbow brackets
let g:rainbow_active = 1 
let g:rainbow_operators = 1

" syntastic
let g:syntastic_python_checkers = ['python', 'pep8', 'flake8']
"let g:syntastic_quiet_warnings=1
"let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_enable_highlighting=0

" Viewdoc
let g:viewdoc_open = "topleft new"

" unite
let g:unite_source_buffer_time_format = "[%H:%M]"



" InstantRst
let g:instant_rst_slow = 1


" filetype-specific

" rst
au syntax rst set tw=80

" html
au FileType html let b:loaded_delimitMate = 1

" Command-mode mappings
" for when we forget to use sudo to open/edit a file
cmap w!! silent w !sudo tee %


" key mappings
nmap <leader>f :Unite file_rec/async -no-split<CR>

nmap <leader>b :LustyBufferExplorer<CR>
nmap <leader>B :LustyBufferGrep<CR>
nmap <leader>n :LustyFilesystemExplorerFromHere<CR>
nmap <leader>N :LustyFilesystemExplorer<CR>

nmap <leader>o :Unite outline<CR>
nmap <leader>O :Unite outline -no-split<CR>
nmap <leader>g :Unite grep:.::<CR>
nmap <leader>u :GundoToggle<CR>
nmap <leader>t :VimFilerExplore<CR>
nmap <leader>m ma
nmap <leader>q :Unite quickfix<CR>
nmap -  :YcmCompleter GoToDefinition<CR>
"set autochdir               " auto change directory to currently edited file
