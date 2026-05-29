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

Plug 'alvan/vim-closetag'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'davidhalter/jedi-vim'
Plug 'hotoo/pangu.vim'
Plug 'mileszs/ack.vim'
Plug 'dense-analysis/ale'
Plug 'github/copilot.vim'

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
filetype plugin indent on

" map Ctrl-L to clear search highlight and redraw the screen
nnoremap <c-l> :nohlsearch<bar>diffupdate<cr><c-l>

" close tag
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

augroup denny_vimrc
  autocmd!
  autocmd BufWritePre * %s/\s\+$//e
  autocmd FileType gitcommit setlocal spell
augroup END
let g:copilot_filetypes = {
      \ 'gitcommit': v:true,
      \ }


" let g:jedi#completions_command = "<leader><Tab>"
