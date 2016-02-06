" Using vim-plug to manage plugins
call plug#begin('~/.vim/plugged')

" Status bar / buffer manager
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Code completion
" Requires installing CMake with Homebrew
" For c and js:
" ./install.py --clang-completer --tern-completer --gocode-completer
" (in YouCompleteMe folder)
Plug 'Valloric/YouCompleteMe'

" UltiSnips - code snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Surround - change surrounding elements ()'s, {}'s, ...
" Examples:
" 	cs"' changes surrounding " to '
" 	ysiw" puts quotes around the current word
Plug 'tpope/vim-surround'

" XML Edit
Plug 'sukima/xmledit'

" Jinja2 template highlighting
Plug 'Glench/Vim-Jinja2-Syntax'

" Bulk commenting
Plug 'tpope/vim-commentary'

" Syntax checking
" Virtualenv needs pyflakes, pep8, pep257, pylint, mccabe
Plug 'scrooloose/syntastic'

" Shell in vim
Plug 'Shougo/vimshell.vim'
" Required for vimshell
Plug 'Shougo/vimproc.vim'

" ctrl-p for finding stuff
Plug 'ctrlpvim/ctrlp.vim'

" Color Scheme
Plug 'vim-scripts/obsidian2.vim'

" Indent handling
Plug 'hynek/vim-python-pep8-indent'

" Format
Plug 'michaeljsmith/vim-indent-object'

call plug#end()


" Set the color scheme
colo obsidian2

" Turn on file type handling
filetype plugin indent on

" Turn syntax highlighting on
syntax on

" Show line numbers
set number

" Autoload changes when files change outsid of vim
set autoread

" Auto whitespace cleaning
autocmd BufWritePre * :%s/\s\+$//e

" Python spacing settings
autocmd FileType python set expandtab
autocmd FileType python set shiftwidth=4
autocmd FileType python set tabstop=8
autocmd FileType python set softtabstop=4
autocmd FileType python set autoindent

" Airline plugin (status bar and buffer manager)
let g:airline_theme = 'bubblegum'
let g:airline#extensions#tabline#enabled = 1
" This makes sure Airline loads even with a single buffer
set laststatus=2

" YouCompleteMe Configuration
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string
let g:ycm_autoclose_preview_window_after_insertion = 1 " Make sure buffer closes after selection

" UltiSnips Configuration
let g:UltiSnipsExpandTrigger       = "<c-j>"
let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-p>"
let g:UltiSnipsListSnippets        = "<c-k>" " List possible snippets based on current file

" Syntastic Configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = "✗✗"
let g:syntastic_warning_symbol = "!!"
" Flake8 line length
let g:syntastic_python_flake8_args = "--max-line-length=100"
" Ignore [invalid-name] pylint warnings. A bit limiting.
let g:syntastic_python_pylint_post_args='--disable=invalid-name'
