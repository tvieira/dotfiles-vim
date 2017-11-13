" make vim more secure
set exrc
set secure
set nocompatible
set nocp
set hidden
set nospell
set nofoldenable

" pathogen load
filetype off
execute pathogen#infect()
execute pathogen#helptags()
syntax on
filetype plugin indent on

" don't use backup nor swap files
set noswapfile
set nobackup
set nowritebackup

" set color scheme
set term=xterm-256color
set t_Co=256
let g:solarized_termcolors=256
let g:solarized_termtrans=1
set background=dark
colorscheme solarized

" set powerline
set guifont=Roboto\ Mono:h15
let g:airline_powerline_fonts = 1
let g:airline_theme = 'solarized'
let g:Powerline_symbols = 'fancy'
set fileformat=unix
set encoding=utf-8
set fillchars+=stl:\ ,stlnc:\
set termencoding=utf-8

" allow cursor keys in insert mode
set esckeys

" mail line wrapping
au BufRead /tmp/mutt-* set tw=72

" allow backspace in insert mode
set backspace=indent,eol,start

" don't add empty lines at the end of files
set binary
set noeol

" don't bell or blink
set noerrorbells
set vb t_vb=

" vertical to the right, horizontal below
set splitright
set splitbelow

" enhance command-line completion
set wildmenu

" optimize for fast terminal connection
set ttyfast

" enable line numbers
set number

" highlight current line
"set cursorline

" make tabs as wide as two spaces
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

" highlight searches
set hlsearch

" set backspace to behave like normal
set bs=2

" don't reset cursor to start of line when moving around
set nostartofline

" show the cursor position
set ruler

" don't show the intro message when starting VIm
set shortmess=atI

" show the current mode
set showmode

" show the filename in the window titlebar
set title

" start scrolling 5 lines before the horizontal window border
set scrolloff=5

" Make the command line two lines high and change the statusline display to
" something that looks useful.
set laststatus=2
set statusline=[%l,%v\ %P%M]\ %f\ %r%h%w\ (%{&ff})\ %{fugitive#statusline()}

" set the ignored files
set wildmode=list:longest,full
set wildignore=*~,*.swp
set wildignore+=a.out,*.a,*.o,*.class
set wildignore+=*.aux,*.idx,*.ilg,*.ind,*.lof,*.lot,*.out,*.toc
set wildignore+=*.tar,*.gz,*.zip
set wildignore+=.git/*,.gitkeep,.svn/*,.hg/*
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*
set wildignore+=.git/*
set wildignore+=*.dll,*.o,*.pyc,*.bak,*.exe,*.jpg,*.jpeg,*.png,*.gif,*$py.class,*.class,*/*.dSYM/*,*.dylib

" virtualenv support
let g:pymode_virtualenv = 1

" disable pylint checking every save
let g:pymode_lint_write = 1

" set key 'R' for run python code
let g:pymode_run_key = 'R'

" disable folding
let g:pymode_folding = 0

" ignore few errors
let g:pymode_lint_ignore = "C"

" show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list

" setting NERDTree to start automatically when vim starts.
 autocmd StdinReadPre * let s:std_in=1
 autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" NERDTree settings
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$', '\.dSYM$']
let NERDTreeShowHidden=1
let NERDTreeMapOpenInTab='<ENTER>'
let NERDTreeTabsToggle=1
let g:NERDTreeWinSize = 28
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeQuitOnOpen = 1

" function that helps trailing space on saving
fun! TrimWhitespace()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
command! TrimWhitespace call TrimWhitespace()
" autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
noremap <F5> :TrimWhitespace<CR>

" sse relative line numbers
if exists("&relativenumber")
    set relativenumber
    au BufReadPost * set relativenumber
endif

" map NERDTree toggle
nmap <silent> <C-D> :NERDTreeToggle<CR>

" NERDTree on <leader>t and <leader>f
nnoremap <leader>t :NERDTree<CR>
nnoremap <leader>f :NERDTreeFind<CR>

" Quit window on <leader>q
nnoremap <leader>q :q<CR>

" Easy switching
nnoremap <leader>Th :set ft=htmljinja<CR>
nnoremap <leader>Tp :set ft=python<CR>

" tab navigation
map  <C-w>l :tabn<CR>
map  <C-w>h :tabp<CR>
map  <C-w>n :tabnew<CR>

" quicker window switching
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" colorcolumns
if version >= 703
  autocmd FileType * setlocal colorcolumn=0
  " autocmd FileType ruby,python,javascript,c,cpp,objc,rst
  "  \ let &colorcolumn="80,".join(range(84,300),",")
  autocmd FileType ruby,python,javascript,c,cpp,objc,rst let &colorcolumn="79"
endif


" python support
" --------------
"  don't highlight exceptions and builtins. I love to override them in local
"  scopes and it sucks ass if it's highlighted then. And for exceptions I
"  don't really want to have different colors for my own exceptions ;-)
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8
\ formatoptions=croqj softtabstop=4 textwidth=74 comments=:#\:,:#
let python_highlight_all=1
let python_highlight_exceptions=0
let python_highlight_builtins=0
let python_slow_sync=1

let g:syntastic_python_checkers=['flake8', 'python']

" Don't warn on
"   E121 continuation line indentation is not a multiple of four
"   E128 continuation line under-indented for visual indent
"   E711 comparison to None should be 'if cond is not None:'
"   E301 expected 1 blank line, found 0
"   E261 at least two spaces before inline comment
"   E241 multiple spaces after ':'
"   E124 closing bracket does not match visual indentation
"   E126 continuation line over-indented for hanging indent
"   E721 do not compare types, use 'isinstance()'
let g:syntastic_python_flake8_args='--ignore=E121,E128,E711,E301,E261,E241,E124,E126,E721
    \ --max-line-length=79'

" template language support (SGML / XML too)
" ------------------------------------------
" and disable that stupid html rendering (like making stuff bold etc)
autocmd FileType xml,html,htmljinja,htmldjango setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType html,htmljinja,htmldjango imap <buffer> <c-e> <Plug>SparkupExecute
autocmd FileType html,htmljinja,htmldjango imap <buffer> <c-l> <Plug>SparkupNext
autocmd FileType html setlocal commentstring=<!--\ %s\ -->
autocmd FileType htmljinja setlocal commentstring={#\ %s\ #}
let html_no_rendering=1
let g:syntastic_html_checkers = []

" C/Obj-C/C++
autocmd FileType c setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType cpp setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType objc setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType c setlocal commentstring=/*\ %s\ */
autocmd FileType cpp,objc setlocal commentstring=//\ %s
let c_no_curly_error=1
let g:syntastic_cpp_include_dirs = ['include', '../include']
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_c_include_dirs = ['include', '../include']
let g:syntastic_c_compiler = 'clang'

" Octave/Matlab
autocmd FileType matlab setlocal tabstop=8 softtabstop=2 shiftwidth=2 expandtab

" vim
" ---
autocmd FileType vim setlocal expandtab shiftwidth=2 tabstop=8 softtabstop=2

" Javascript
" ----------
autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal commentstring=//\ %s
autocmd FileType javascript noremap <buffer> <leader>r :call JsBeautify()<cr>
autocmd FileType javascript let b:javascript_fold = 0
let javascript_enable_domhtmlcss=1
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_javascript_jshint_args='--config ~/.vim/extern-cfg/jshint.json'

" JSON
" ----
autocmd FileType json setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" YAML support
" ------------
autocmd FileType yaml setlocal expandtab shiftwidth=2 tabstop=8 softtabstop=2
autocmd BufNewFile,BufRead *.sls setlocal ft=yaml
