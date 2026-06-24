" Automatic install vim-plug
function! s:ShowBootstrapOnboarding() abort
  call confirm(
        \ "Vim plugins are installed.\n\n"
        \ . "For a better experience, you may also want to install these optional system packages:\n\n"
        \ . "  Fedora:        sudo dnf install ripgrep bat fd-find\n"
        \ . "  Debian/Ubuntu: sudo apt install ripgrep bat fd-find\n"
        \ . "  Arch:          sudo pacman -S ripgrep bat fd\n"
        \ . "  openSUSE:      sudo zypper install ripgrep bat fd\n"
        \ . "  macOS:         brew install ripgrep bat fd\n\n"
        \ . "Package names may vary by distribution.",
        \ "&OK",
        \ 1)
endfunction

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC | call <SID>ShowBootstrapOnboarding()
endif

" ALE completion must be set before ALE is loaded.
let g:ale_completion_enabled = 1

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'alvan/vim-closetag'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'hotoo/pangu.vim'
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

" Use fd/fdfind to feed fzf faster file candidates when available.
if executable('fd')
  let $FZF_DEFAULT_COMMAND = 'fd --type f --hidden --follow --exclude .git'
elseif executable('fdfind')
  let $FZF_DEFAULT_COMMAND = 'fdfind --type f --hidden --follow --exclude .git'
endif

" fzf owns file navigation and project search.
nnoremap <silent> <c-p> :Files<cr>
nnoremap <leader>s :Rg<space>

" ALE owns language-server actions where a project provides one.
nmap <silent> gd <Plug>(ale_go_to_definition)

augroup denny_vimrc
  autocmd!
  autocmd BufWritePre * %s/\s\+$//e
  autocmd FileType gitcommit setlocal spell
augroup END
let g:copilot_filetypes = {
      \ 'gitcommit': v:true,
      \ }
