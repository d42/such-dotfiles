 set nocompatible               " be iMproved
 set encoding=utf-8

 set laststatus=2
 set lazyredraw
 set rtp+=~/.vim/bundle/vundle/
 source ~/.vimrc.bundles

filetype plugin indent on
syntax on                     " syntax highlighing
set number                    " Display line numbers
set numberwidth=1             " using only 1 column (and 1 space) while possible
set background=dark           " We are using dark background in vim
set title                     " show title in console title bar
set t_Co=256
set clipboard=unnamedplus     " share clipboard with X
au FileType html let b:loaded_delimitMate = 1

filetype plugin on
set omnifunc=syntaxcomplete#Complete

let mapleader = ","
let loaded_matchparen = 1 " disable matching parenthesis for great justice (or because it's slow as fuck). Use rainbow parentheses instead
set mouse=a
set hidden
set colorcolumn=80
colo molokai


" for when we forget to use sudo to open/edit a file
cmap w!! silent w !sudo tee %

" Ignore these files when completing
set wildignore+=*.o,*.obj,.git,*.pyc
set wildignore+=eggs/**
set wildignore+=*.egg-info/**
set wildignore+=*.swp,*.bak


nnoremap ; :
nmap <F7> :NERDTreeToggle<CR>
nmap <leader>g :GundoToggle<CR>
nnoremap <leader>b :LustyBufferExplorer<CR>
nnoremap <leader>f :LustyBufferGrep<CR>
map <F6> :TagbarToggle<CR>
noremap <leader>n :LustyFilesystemExplorerFromHere<CR>
set pumheight=6             " Keep a small completion windo



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
set autochdir               " auto change directory to currently edited file

" don't outdent hashes
inoremap # #


" close preview window automatically when we move around
"autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
autocmd bufwritepost .vimrc source $MYVIMRC
autocmd bufwritepost .vimrc.bundle source $MYVIMRC



"""" Reading/Writing
set noautowrite             " Never write a file unless I request it.
set noautowriteall          " NEVER.
set noautoread              " Don't automatically re-read changed files.
set ffs=unix,dos,mac        " Try recognizing dos, unix, and mac line endings.
set noro                    " Disable read only

"""" Messages, Info, Status
set ls=2                    " allways show status line
set vb t_vb=                " Disable all bells.  I hate ringing/flashing.
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
set cursorline

""" Searching and Patterns
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set smarttab                " Handle tabs more intelligently 
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex



let g:acp_completeoptPreview                        = 0
"let g:ycm_key_list_select_completion                = ['<TAB>']
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_filepath_completion_use_working_dir       = 1
let g:airline_powerline_fonts = 1
let g:tagbar_left                                   = 1
let g:tagbar_autofocus                              = 1
let g:tagbar_autoclose                              = 1
let g:alternateExtensions_h                         = "cpp,cxx,c,cc,CC"

let g:tagbar_type_javascript = {
    \ 'ctagsbin' : '/usr/bin/jsctags'
\ }

" Load up virtualenv's vimrc if it exists
if filereadable($VIRTUAL_ENV . '/.vimrc')
    source $VIRTUAL_ENV/.vimrc
endif

"let g:rbpt_loadcmd_toggle = 1

let g:rainbow_active = 1 
let g:rainbow_operators = 1

noremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
autocmd! BufNewFile * silent! 0r ~/.vim/skel/tmpl.%:e


let g:syntastic_python_checkers = ['python', 'pep8', 'flake8']
"let g:syntastic_quiet_warnings=1
"let g:syntastic_quiet_messages = {'level': 'warnings'}


"YouCompleteMe stuff
let g:ycm_collect_identifiers_from_tags_files = 1
imap <C-J> <esc><Plug>snipMateNextOrTrigger
let g:UltiSnipsExpandTrigger="<c-j>"
let g:ycm_confirm_extra_conf = 0
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_filetype_specific_completion_to_disable = {'rst':''}
let g:ycm_add_preview_to_completeopt                = 0



" display-lines instead of real-lines
nnoremap k gk
nnoremap j gj




let g:airline_theme='wombat'
let g:UltiSnipsSnippetsDir = '~/.vimrc/UltiSnips'

 " glorious tags
 "
let g:tagbar_type_css = {
\ 'ctagstype' : 'Css',
    \ 'kinds'     : [
        \ 'c:classes',
        \ 's:selectors',
        \ 'i:identities'
    \ ]
\ }

if executable('coffeetags')
  let g:tagbar_type_coffee = {
        \ 'ctagsbin' : 'coffeetags',
        \ 'ctagsargs' : '',
        \ 'kinds' : [
        \ 'f:functions',
        \ 'o:object',
        \ ],
        \ 'sro' : ".",
        \ 'kind2scope' : {
        \ 'f' : 'object',
        \ 'o' : 'object',
        \ }
        \ }
endif

au syntax rst set tw=80
"au BufRead,BufNewFile *.pde set filetype=arduino
"au BufRead,BufNewFile *.ino set filetype=arduino
au BufRead,BufNewFile *.nsm set filetype=nasm
