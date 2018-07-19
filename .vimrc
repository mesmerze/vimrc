if has('vim_starting')
 " ensure that we always start with Vim defaults (as opposed to those set by the current system)
set all&
" this resets some values, eg 'history', so only do it once (that is why we check has('vim_starting'))
set nocompatible
endif

"set nocompatible 	      " be iMproved, required by Vundle too
filetype off                  " required by Vundle
set rtp+=~/.vim/bundle/Vundle.vim " set the runtime path to include Vundle
call vundle#begin()
Plugin 'gmarik/Vundle.vim'        " plugin manager
Plugin 'tpope/vim-fugitive'       " git integration
Plugin 'jpo/vim-railscasts-theme' " railscasts theme
Plugin 'joshdick/onedark.vim'     " color theme atom dark
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'airblade/vim-gitgutter'   " shows git diff changes to the left
Plugin 'bling/vim-airline'        " nice status line
Plugin 'rking/ag.vim'             " nice search
Plugin 'tpope/vim-rails'          " rails plugin
Plugin 'w0rp/ale'                 " Ale style checker
Plugin 'kchmck/vim-coffee-script'
Plugin 'scrooloose/nerdcommenter'
Plugin 'alvan/vim-closetag'


" Angular stuff
Plugin 'leafgarland/typescript-vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'quramy/tsuquyomi'


call vundle#end()            " required by Vundle
filetype plugin indent on    " required by Vundle
runtime macros/matchit.vim " smart way to show matching closing element pressing % on { shows } and so on
" VIM Settings
syntax on
set background=light
colorscheme PaperColor
highlight default link SignColumn LineNr

set shell=/bin/sh
set encoding=utf-8

set lazyredraw
set regexpengine=1

set timeoutlen=250                                             " used for mapping delays
"set fileformats+=mac                                           " uses special chars for OSX
set cursorline                                                 " shows cursorline
" set relativenumber                                             " shows relative numbers
set number                                                     " shows current line with relative numbers
set path+=**                                                   " allows find to look deep into folders during search
set wildmenu                                                   " lets you see what your other options for <TAB>
set hidden                                                     " allows to manage multiple buffers effectively
set hlsearch                                                   " highlights search items
set incsearch                                                  " highligths search items dynamically as they are typed
set ignorecase                                                 " the case of normal letters is ignored
set smartcase                                                  " overrides ignorecase if search contains uppercase chars
set nowrap                                                     " don't wrap lines
set tabstop=2                                                  " tab to two spaces
set shiftwidth=2                                               " identation in normal mode pressing < or >
set softtabstop=2                                              " set 'tab' as 2 spaces and removes 2 spaces on backspace
set expandtab                                                  " replaces tabs with spaces
set smarttab                                                   " needed for tabbing
set nofoldenable                                               " don't fold by default
set ruler                                                      " shows the cursor position
set laststatus=2                                               " shows status line
set synmaxcol=200                                              " maximum column in which to search for syntax items.  In long lines the
set autoindent                                                 " copy indent from current line when starting a new line
set smartindent                                                " does smart autoindenting
set nowritebackup                                              " to not write backup before save
set autoread                                                   " to autoread if file was changed outside from vim
set noswapfile                                                 " to not use swap files
set nobackup                                                   " to not write backup during overwriting file
set showcmd                                                    " shows command
set list                                                       " enables showing of hidden chars
set listchars=tab:▸\ ,eol:¬,trail:∙                            " shows hidden end of line. tabs and  trailing spaces
set foldmethod=syntax                                          " fold based on syntax
set foldnestmax=3                                              " deepest fold is 3 levels
set guioptions=
" autoformating
au BufWritePre * %s/\s\+$//e " removes trailing spaces
au BufNewFile * set noeol                                      " removes eol
au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>120v.\+',-1) " highlights more than 80 symbols
" netrw settings
let g:netrw_banner = 0       " removes banner
let g:netrw_browse_split = 2 " opens file in vsplit
let g:netrw_winsize = 40     " netrw winsize
let g:tex_fast= ""
" remap terminal mode
tnoremap <Esc> <C-\><C-n>
inoremap jj <ESC>

" closetag options
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.erb'
let g:closetag_close_shortcut = '<leader>>'

let g:ale_linters = {
\   'html': [],
\}

" function! ClipboardYank()
"     call system('xclip -i -selection clipboard', @@)
"   endfunction
"   function! ClipboardPaste()
"       let @@ = system('xclip -o -selection clipboard')
"     endfunction
"
"     vnoremap <silent> y y:call ClipboardYank()<cr>
"     vnoremap <silent> d d:call ClipboardYank()<cr>
"     nnoremap <silent> p :call ClipboardPaste()<cr>p
