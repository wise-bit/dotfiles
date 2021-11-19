" wisebit's vimrc

set nocompatible

" Turn on syntax highlighting
syntax on

set noundofile
set number

" Show file stats
set ruler

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status barset laststatus=2

" Last line
set showmode
set showcmd

" Blink cursor on error
set visualbell

" Delete instead of cut
nnoremap d "_d
vnoremap d "_d

" Cursor motion
set scrolloff=5
set backspace=indent,eol,start

" Status bar
set laststatus=2

" Tab stop
set shiftwidth=4
set softtabstop=4