" Setting up NeoBundle - the vim plugin bundler
set nocompatible               " Be iMproved

" NeoBundle check and auto install
let iCanHazNeoBundle=1
let NeoBundle_readme=expand('~/.vim/bundle/neobundle.vim/README.md')
if !filereadable(NeoBundle_readme)
    echo "Installing NeoBundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
    let iCanHazNeoBundle=0
endif

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc'

" My Bundles here:
"
" Note: You don't set neobundle setting in .gvimrc!
" Original repos on github
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'msanders/snipmate.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'tpope/vim-surround'
" vim-scripts repos
NeoBundle 'closetag.vim'

filetype plugin indent on     " Required!
"
" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" Installation check.
if iCanHazNeoBundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :NeoBundleInstall
endif

NeoBundleCheck

" Global settings
set nu
set ai
set tabstop=4
set shiftwidth=4
set ic
set incsearch
set cursorline
set showcmd
set history=1000

" map Ctel-L to be nohl, clear search highlight
nnoremap <c-l> :nohl<cr>

" close tag                                                                     
let g:closetag_html_style=1
source ~/.vim/bundle/closetag.vim/plugin/closetag.vim

