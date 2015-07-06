set nocompatible
filetype plugin indent on
syntax enable

" Make this rc file useable in isolation
if filereadable(expand("~/.vim/autoload/plug.vim"))

    call plug#begin('~/.vim/plugged')

    " Better status line
    Plug 'bling/vim-airline'
    set noshowmode
    let g:airline#extensions#tabline#enabled=1
    let g:airline_theme='raven'

    " Syntax checking
    Plug 'scrooloose/syntastic'
    let g:syntastic_python_checkers=['flake8']
    let g:syntastic_enable_signs=0
    let g:syntastic_tcl_nagelfar_args='-filter "*Unknown command \"::itcl::*"'

    call plug#end()

else

    set ruler

endif

" The standard diff colours are useless
if &diff
    highlight Normal ctermfg=White ctermbg=Black
    highlight DiffAdd ctermbg=DarkGreen
    highlight DiffDelete ctermbg=DarkRed
    highlight DiffChange ctermbg=DarkBlue
    highlight DiffText ctermfg=Black ctermbg=White
endif

" Indentation
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent

" Highlight trailing whitespace as an error.
match ErrorMsg '\s\+$'

" Searching
set showmatch
set incsearch
set hlsearch
set ignorecase
set smartcase

" Use C-L to clear highlights
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Wrapping
set textwidth=79

" Show what we're doing
set showcmd
set laststatus=2

" Command line completion
set wildmenu
set wildmode=list:longest
set wildignore=*.o,*.obj,*~

" Reload changed files
set autoread

" More useful backspace
set backspace=indent,eol,start

" We probably don't want options from included files
set complete-=i

" Remember more
set history=1000

" Give `%` more power
runtime! macros/matchit.vim

if has('nvim')

    " Allow easy escaping from the terminal emulator
    tnoremap <Esc> <C-\><C-n>
    tnoremap <C-w><C-w> <C-\><C-n><C-w><C-w>

endif
