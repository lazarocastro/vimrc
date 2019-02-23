" Lazaro's vimrc config
" ============================================================================
" http://github.com/lazarocastro/vimrc
" Based from Fisa-vim-config
" http://fisadev.github.io/fisa-vim-config/
" version: 8.3.1
" ============================================================================

" Vim-Plug Initialization
" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
" Avoid modify this section, unless you are very sure of what you are doing
let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.vim/autoload/plug.vim')
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !mkdir -p ~/.vim/autoload
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

" Manually Load Vim-Plug The First Time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif

" Obscure hacks done, you can now modify the rest of the .vimrc as you wish :)
" <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

" Plugins From Github and Vim-scripts Repos
" ================================================================================================
call plug#begin('~/.vim/plugged')               " Active Plugins
Plug 'Valloric/MatchTagAlways'                  " Always highlight enclosing tags
Plug 'chr4/nginx.vim'                           " Improved nginx vim plugin
Plug 'thiagoalessio/rainbow_levels.vim'         " highlights code by indentation level
Plug 'ekalinin/Dockerfile.vim'                  " Dockerfile syntax file & snippets
Plug 'morhetz/gruvbox'                          " Gruvbox colorscheme
Plug 'arielrossanigo/dir-configs-override.vim'  " Override configs by directory
Plug 'scrooloose/nerdtree'                      " Better file browser
Plug 'scrooloose/nerdcommenter'                 " Code commenter
Plug 'majutsushi/tagbar'                        " Class/module browser
Plug 'ctrlpvim/ctrlp.vim'                       " Code and files fuzzy finder
Plug 'fisadev/vim-ctrlp-cmdpalette'             " Extension to ctrlp, for fuzzy command finder
Plug 'mattn/emmet-vim'                          " Zen coding
Plug 'motemen/git-vim'                          " Git integration
Plug 'kien/tabman.vim'                          " Tab list panel
Plug 'vim-airline/vim-airline'                  " Airline
Plug 'vim-airline/vim-airline-themes'           " Airline themes
Plug 'fisadev/fisa-vim-colorscheme'             " Terminal Vim with 256 colors colorscheme
Plug 'rosenfeld/conque-term'                    " Consoles as buffers
Plug 'fisadev/FixedTaskList.vim'                " Pending tasks list
Plug 'tpope/vim-surround'                       " Surround
Plug 'Townk/vim-autoclose'                      " Autoclose
Plug 'michaeljsmith/vim-indent-object'          " Indent text object
Plug 'jeetsukumaran/vim-indentwise'             " Indentation based movements
Plug 'davidhalter/jedi-vim'                     " Python autocompletion, go to definition.
Plug 'Shougo/neocomplcache.vim'                 " Better autocompletion
Plug 'MarcWeber/vim-addon-mw-utils'             " TODO
Plug 'tomtom/tlib_vim'
Plug 'honza/vim-snippets'
Plug 'garbas/vim-snipmate'
Plug 'mhinz/vim-signify'                        " Git/mercurial/others diff icons of the file lines
Plug 'fisadev/vim-isort'                        " Automatically sort python imports
Plug 'fisadev/dragvisuals.vim'                  " Drag visual blocks arround
Plug 't9md/vim-choosewin'                       " Window chooser
Plug 'scrooloose/syntastic'                     " Python and other languages code checker
Plug 'lilydjwg/colorizer'                       " Paint css colors with the real color
Plug 'vim-scripts/IndexedSearch'                " Search results counter
Plug 'vim-scripts/matchit.zip'                  " XML/HTML tags navigation
Plug 'vim-scripts/YankRing.vim'                 " Yank history navigation
Plug 'mileszs/ack.vim'                          " Ack code search (requires ack was installed in the OS)
if has('python')
    Plug 'pignacio/vim-yapf-format'             " YAPF formatter for Python
endif
call plug#end()                                 " Tell vim-plug we finished declaring plugins
" ================================================================================================

" Install Plugins The First Time Vim Runs
" ============================================================================
if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif

" Basic Settings
" ============================================================================
" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden
set nocompatible
filetype plugin on      " Allow Plugins By File Type (required for plugins!)
filetype indent on      " Allow Plugins By File Type (required for plugins!)
syntax on               " Syntax Highlight On
set incsearch           " incremental search
set hlsearch            " highlighted search results
set ignorecase          " Ignore case when searching...
set smartcase           " ...unless we type a capital
set number              " Show Line Numbers
set relativenumber      " Show Relative Numbers
set laststatus=2        " Always Show Status Bar
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab           " Tabs and Spaces Handling
let mapleader = ","     " Leader Key

" Set to show invisibles (tabs & trailing spaces) & their highlight color
" ============================================================================
"set list listchars=tab:»\ ,trail:·
set showbreak=↪\
set list listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨

" Toggle highlighting of search results
" ============================================================================

nnoremap <leader><space> :nohlsearch<cr>

" Disabled Arrows
" ============================================================================
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Foldmark
" ============================================================================
" You can create a fold on your code inclunding a comment like that:
" html:
" <!-- HTML foldmark {{{ -->
"   CODE
" <!-- }}} -->
" bash, python, ruby:
" # BASH foldmark {{{
"   CODE
" # }}}
" Them you press 'zc' to close fold and 'zo' to open and 'zi' to
" disable/enable fold.
set fdm=marker
set foldmarker={{{,}}}

" Window
" ============================================================================
" set winwidth=84
" set winheight=5
" set winminheight=5
" set winheight=999

" Tab Length Exceptions On Some File Types
" ============================================================================
autocmd FileType python,doctest set ai ts=4 sw=4 sts=4 et
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType html syntax sync fromstart
autocmd FileType htmldjango setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType shellscript setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2

" Tab Navigation Mappings
" ============================================================================
map tn :tabn<CR>
map tp :tabp<CR>
map tm :tabm
map tt :tabnew
map ts :tab split<CR>
map <C-S-Right> :tabn<CR>
imap <C-S-Right> <ESC>:tabn<CR>
map <C-S-Left> :tabp<CR>
imap <C-S-Left> <ESC>:tabp<CR>

" Old Autocomplete Keyboard Shortcut
" ============================================================================
imap <C-J> <C-X><C-O>

" Comment This Line To Enable Autocompletion Preview Window
" ============================================================================
" (displays documentation related to the selected completion option)
" Disabled by default because preview makes the window flicker
set completeopt-=preview

" Save As Sudo
" ============================================================================
ca w!! w !sudo tee "%"

" Simple Recursive Grep
" ============================================================================
nmap ,r :Ack
nmap ,wr :Ack <cword><CR>

" Use 256 Colors When Possible
" ============================================================================
if (&term =~? 'mlterm\|xterm\|xterm-256\|screen-256') || has('nvim')
	let &t_Co = 256
    colorscheme gruvbox
    set background=dark
else
    colorscheme delek
endif
" colors for gvim
if has('gui_running')
    colorscheme gruvbox
    set background=dark
endif

" Gvim Settings
" ============================================================================
set vb t_vb=        " Disable beeping
set guioptions-=m   " Remove menu bar
set guioptions-=T   " Remove toolbar
set guioptions-=r   " Remove right-hand scroll bar
set guioptions-=L   " Remove left-hand scroll bar

" Scrolling
" ============================================================================
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1
set mouse=a

" Autocompletion of Files and Commands Behaves Like Shell
" ============================================================================
" (complete only the common part, list the options that match)
set wildmode=list:longest

" Better Backup, Swap and Undos Storage
" ============================================================================
set directory=~/.vim/dirs/tmp               " directory to place swap files in
set backup                                  " make backup files
set backupdir=~/.vim/dirs/backups           " where to put backup files
set undofile                                " persistent undos
set undodir=~/.vim/dirs/undos               " undo after you re-open the file
set viminfo+=n~/.vim/dirs/viminfo
let g:yankring_history_dir = '~/.vim/dirs/' " store yankring history file
" Create Needed Directories if They Don't Exist
if !isdirectory(&backupdir)
    call mkdir(&backupdir, "p")
endif
if !isdirectory(&directory)
    call mkdir(&directory, "p")
endif
if !isdirectory(&undodir)
    call mkdir(&undodir, "p")
endif

" Rainbow Levels
" ============================================================================
" Creating a mapping to turn it on and off:
map <leader>l :RainbowLevelsToggle<cr>

" Quicker Method to Run Python Code Inside Vim
" ============================================================================
" For default Python2 common in Linux
"map <F5> <Esc>:w<CR>:!clear;python %<CR>
" For Python 3
"map <F6> <Esc>:w<CR>:!clear;python3 %<CR>

" Tagbar
" ============================================================================
" toggle tagbar display
map <F4> :TagbarToggle<CR>
" autofocus on tagbar open
let g:tagbar_autofocus = 1

" NERDTree
" ============================================================================
" toggle nerdtree display
map <F3> :NERDTreeToggle<CR>
" don't show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

" Tasklist
" ============================================================================
" show pending tasks list
map <F2> :TaskList<CR>

" CtrlP
" ============================================================================
" file finder mapping
let g:ctrlp_map = ',e'
" tags (symbols) in current file finder mapping
nmap ,g :CtrlPBufTag<CR>
" tags (symbols) in all files finder mapping
nmap ,G :CtrlPBufTagAll<CR>
" general code finder in all files mapping
nmap ,f :CtrlPLine<CR>
" recent files finder mapping
nmap ,m :CtrlPMRUFiles<CR>
" commands finder mapping
nmap ,c :CtrlPCmdPalette<CR>
" to be able to call CtrlP with default search text
function! CtrlPWithSearchText(search_text, ctrlp_command_end)
    execute ':CtrlP' . a:ctrlp_command_end
    call feedkeys(a:search_text)
endfunction
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
    \ 'AcceptSelection("t")': ['<cr>'],
    \ }
" same as previous mappings, but calling with current word as default text
nmap ,wg :call CtrlPWithSearchText(expand('<cword>'), 'BufTag')<CR>
nmap ,wG :call CtrlPWithSearchText(expand('<cword>'), 'BufTagAll')<CR>
nmap ,wf :call CtrlPWithSearchText(expand('<cword>'), 'Line')<CR>
nmap ,we :call CtrlPWithSearchText(expand('<cword>'), '')<CR>
nmap ,pe :call CtrlPWithSearchText(expand('<cfile>'), '')<CR>
nmap ,wm :call CtrlPWithSearchText(expand('<cword>'), 'MRUFiles')<CR>
nmap ,wc :call CtrlPWithSearchText(expand('<cword>'), 'CmdPalette')<CR>
" don't change working directory
let g:ctrlp_working_path_mode = 0
" ignore these files and folders on file finder
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn|node_modules)$',
  \ 'file': '\.pyc$\|\.pyo$',
  \ }

" Syntastic
" ============================================================================
" show list of errors and warnings on the current file
" nmap <leader>e :Errors<CR>
" check also when just opened the file
let g:syntastic_check_on_open = 1
" don't put icons on the sign column (it hides the vcs status icons of signify)
let g:syntastic_enable_signs = 0
" custom icons (enable them if you use a patched font, and enable the previous
" setting)
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'

" Jedi-Vim
" ============================================================================
let g:jedi#goto_command = ',d'
" Find ocurrences
let g:jedi#usages_command = ',o'
" Find assignments
let g:jedi#goto_assignments_command = ',a'
" Go to definition in new tab
nmap ,D :tab split<CR>:call jedi#goto()<CR>

" NeoComplCache
" ============================================================================
" most of them not documented because I'm not sure how they work
" (docs aren't good, had to do a lot of trial and error to make
" it play nice)
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_ignore_case = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_enable_fuzzy_completion = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_fuzzy_completion_start_length = 1
let g:neocomplcache_auto_completion_start_length = 1
let g:neocomplcache_manual_completion_start_length = 1
let g:neocomplcache_min_keyword_length = 1
let g:neocomplcache_min_syntax_length = 1
" complete with workds from any opened file
let g:neocomplcache_same_filetype_lists = {}
let g:neocomplcache_same_filetype_lists._ = '_'

" TabMan
" ============================================================================
" mappings to toggle display, and to focus on it
let g:tabman_toggle = 'tl'
let g:tabman_focus  = 'tf'

" Autoclose
" ============================================================================
" Fix to let ESC work as espected with Autoclose plugin
let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}

" DragVisuals
" ============================================================================
" mappings to move blocks in 4 directions
vmap <expr> <S-M-LEFT> DVB_Drag('left')
vmap <expr> <S-M-RIGHT> DVB_Drag('right')
vmap <expr> <S-M-DOWN> DVB_Drag('down')
vmap <expr> <S-M-UP> DVB_Drag('up')
" mapping to duplicate block
vmap <expr> D DVB_Duplicate()

" Signify
" ============================================================================
" this first setting decides in which order try to guess your current vcs
" UPDATE it to reflect your preferences, it will speed up opening files
let g:signify_vcs_list = [ 'git', 'hg' ]
" mappings to jump to changed blocks
nmap <leader>sn <plug>(signify-next-hunk)
nmap <leader>sp <plug>(signify-prev-hunk)
" nicer colors
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227

" Window Chooser
" ============================================================================
" mapping
nmap  -  <Plug>(choosewin)
" show big letters
let g:choosewin_overlay_enable = 1

" Airline
" ============================================================================
let g:airline_powerline_fonts = 0
let g:airline_theme = 'gruvbox'
let g:airline#extensions#whitespace#enabled = 0

" to use fancy symbols for airline, uncomment the following lines and use a
" patched font (more info on the README.rst)
if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'

" Aliases
" ============================================================================
cab W w
cab Q q
cab Wq wq
cab wQ wq
cab WQ wq
cab t tab drop
cab T tab drop
cab tabe tab drop
cab Tabe tab drop
cab E e

" Adding Quotes Manually
" ============================================================================
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel

" Jenkinsfile VIM syntax highlighting
" ============================================================================
au BufNewFile,BufRead Jenkinsfile setf groovy

" MatchTagAlways
" ============================================================================
" This option holds all the filetypes for which this plugin will try to find
" and highlight enclosing tags. You can find out what the current file's
" filetype is in Vim with :set ft?. Don't forget that question mark at the
" end!
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'php' : 1,
    \}
" Jumps to the enclosing tag if the tag is visible.
nnoremap <leader>% :MtaJumpToOtherTag<cr>
