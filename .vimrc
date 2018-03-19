" Automatic install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'vim-scripts/closetag.vim'
Plug 'kien/ctrlp.vim'
Plug 'msanders/snipmate.vim'
Plug 'scrooloose/syntastic'
Plug 'Lokaltog/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'davidhalter/jedi-vim'
Plug 'nvie/vim-flake8'
Plug 'hotoo/pangu.vim'

call plug#end()


" Global settings
set nu
set ai
set tabstop=4
set shiftwidth=4
set ic
set incsearch
set cursorline
set showcmd
set hlsearch
set history=1000
set wildmode=longest,list,full
set wildignorecase
set backspace=2
syntax on

" map Ctrl-L to be nohl, clear search highlight
nnoremap <c-l> :nohl<cr>

" close tag
let g:closetag_html_style=1
source ~/.vim/plugged/closetag.vim/plugin/closetag.vim

" disabling default ftplugins
let b:did_ftplugin = 1

autocmd BufWritePre * :%s/\s\+$//e
autocmd FileType gitcommit setlocal spell

" let g:jedi#completions_command = "<leader><Tab>"
