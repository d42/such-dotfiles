set encoding=utf-8             "
set laststatus=2               " always status line

source ~/.vimrc.bundles        " bundles
source ~/.vimrc.menu
" filetype plugin indent on
" syntax on                       " syntax highlighing

set shell=sh                  " syntastic hates fish
set number                      " Display line numbers
set numberwidth=1               " using only 1 column (and 1 space) while possible

" set title                       " show title in console title bar
" set t_Co=256                    " force colors
set clipboard+=unnamedplus       " share clipboard with X

let mapleader = ","
nnoremap ; :
let g:loaded_matchparen = 1       " disable matching parenthesis for great justice (or because it's slow as fuck). Use rainbow parentheses instead
set mouse=a
set hidden                      " keep buffers open
" set colorcolumn=80
set background=dark
colo Tomorrow-Night-Eighties

autocmd InsertEnter * set colorcolumn=80
autocmd InsertLeave * set colorcolumn=0
autocmd WinEnter    * set cursorline
autocmd WinLeave    * set nocursorline
autocmd InsertEnter * set nocursorline
autocmd InsertLeave * set cursorline

"
" Otherwise suggestions are not shown in the popup
let g:UltiSnipsUsePythonVersion=2
"
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
" set foldmethod=indent       " allow us to fold on indents
set foldlevel=99            " don't fold by default
set noautochdir               " auto change directory to currently edited file

set complete-=i   " disable scanning included files
set complete-=t   " disable searching tags

set synmaxcol=200

" don't outdent hashes
" inoremap # #



" Ignore these files when completing
set wildignore+=*.o,*.obj,.git,*.pyc
set wildignore+=eggs/**
set wildignore+=*.egg-info/**
set wildignore+=*.swp,*.bak
set wildignorecase " IgNoReCaSe :3


"""" Reading/Writing
set noautowrite             " Never write a file unless I request it.
set noautowriteall          " NEVER.
set autoread                " automatically re-read changed files.
set ffs=unix,dos,mac        " Try recognizing dos, unix, and mac line endings.
set noro                    " Disable read only

"""" Messages, Info, Status
" set noeb vb t_vb=
set confirm                 " Y-N-C prompt if closing with unsaved changes.
" set shortmess+=aoOtI        " Use [+]/[RO]/[w] for modified/readonly/written.
" set ruler                   " Show some info, even without statuslines.
set laststatus=2            " Always show statusline, even if only 1 window.
" set statusline=[%l,%v\ %P%M]\ %f\ %r%h%w\ (%{&ff})\}

" displays tabs with :set list & displays when a line runs off-screen
set listchars=tab:>-,eol:$,trail:-,precedes:<,extends:>
au syntax python set list
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
let g:airline#extensions#syntastic#enabled  = 1
let g:airline#extensions#hunks#enabled  = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''



" tagbar
let g:tagbar_left = 1
let g:tagbar_autofocus = 1
" let g:tagbar_autoclose = 1
let g:tagbar_type_javascript = {'ctagsbin' : '/usr/bin/jsctags'}
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tagbar#flags = 'f'

" youcompleteme
set pumheight=6             " Keep a small completion windo
let g:ycm_server_python_interpreter = '/usr/bin/python3'
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_register_as_syntastic_checker = 0
let g:ycm_filepath_completion_use_working_dir = 1
let g:ycm_add_preview_to_completeopt                = 1
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_autoclose_preview_window_after_insertion = 0
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_confirm_extra_conf = 1
let g:ycm_filetype_specific_completion_to_disable = {'rst':''}
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_extra_conf_globlist = ['~/projects/*']
let g:EclimCompletionMethod = 'omnifunc'

let g:UltiSnipsExpandTrigger = "<nop>"
let g:ulti_expand_or_jump_res = 0
function ExpandSnippetOrCarriageReturn()
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
        return snippet
    else
        return "\<CR>"
    endif
endfunction
inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>"



" vim-bookmarks
let g:bookmark_save_per_working_dir = 1

let g:niji_matching_filetypes = ['lisp', 'ruby', 'python']

" Viewdoc
let g:viewdoc_open = "topleft new"

" unite
let g:unite_source_buffer_time_format = "[%H:%M]"



" InstantRst
let g:instant_rst_slow = 1


" filetype-specific

" rst
au syntax rst set tw=80
au syntax vimwiki set colorcolumn=120

" html
au FileType html let b:loaded_delimitMate = 1
au FileType html set tabstop=2               " <tab> inserts 2 spaces 
au FileType html set shiftwidth=2            " but an indent level is 2 spaces wide.
au FileType html set softtabstop=2           " <BS> over an autoindent deletes both spaces.

au FileType pug set tabstop=2               " <tab> inserts 2 spaces 
au FileType pug set shiftwidth=2            " but an indent level is 2 spaces wide.
au FileType pug set softtabstop=2           " <BS> over an autoindent deletes both spaces.


au BufNewFile,BufRead *.classpath set filetype=eclipse_classpath
au BufNewFile,BufRead *.jinja set filetype=jinja.jinja2.html
let NERDTreeIgnore = ['\.pyc$']

" Command-mode mappings
" for when we forget to use sudo to open/edit a file
cmap w!! silent w !sudo tee %
command -nargs=* Py ViewDocPydoc <args>


" key mappings
nmap <leader>f :Unite file_rec/async -no-split<CR>

" Ex mode is not a cool guy
nnoremap Q <nop>

nmap <leader>b :Unite buffer<CR>
" nmap <leader>B :LustyBufferGrep<CR>
nmap <leader>n :Unite file_rec/neovim<CR>
nmap <leader>N :NERDTreeToggle<CR>
"-explorer-columns=git<CR>

nmap <leader>o :Unite outline<CR>
nmap <leader>O :Unite outline -no-split<CR>
nmap <leader>g :Unite grep:.::<CR>
nmap <leader>m :Unite menu<CR>
nmap -  :YcmCompleter GoToDefinition<CR>


let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_ignore_pattern = ['\.*.swp']

" autocmd! BufWritePost * Neomake
autocmd! BufReadPost fugitive://* set bufhidden=delete
" let g:neomake_python_pylama_args = ['--format', 'pep8', '--ignore', 'E501']
tnoremap <Esc> <C-\><C-n>

let g:localvimrc_persistent = 1
let g:localvimrc_sandbox = 0

" nvim-qt gnuj
" command -nargs=? Guifont call rpcnotify(0, 'Gui', 'SetFont', "<args>") | let g:Guifont="<args>"
"
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('py', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
