set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" Keep Plugin commands between vundle#begin/end.

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"
"
"
Plugin 'scrooloose/nerdtree'
Plugin 'python-mode/python-mode'
Plugin 'vim-syntastic/syntastic'
Plugin 'godlygeek/tabular'
Plugin 'chase/vim-ansible-yaml'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'rodjek/vim-puppet'
Plugin 'tpope/vim-sensible'
Plugin 'MicahElliott/Rocannon'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" Change default colors to 'torte' setting
colors torte
"
" Change default font for gvim
if has('gui_running')
    set guifont=Monospace\ 12
endif
"
"

" Recommended general settings START
syntax on
filetype plugin indent on   " required
set tabstop=4 shiftwidth=4 smarttab expandtab softtabstop=4
set autoindent number cursorline showmatch
" Recommended general settings END

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ===========================================================
" NERDTree BLOCK BEGIN ======================================
" ===========================================================
" For mouse click in NERDTree
:set mouse=a
let g:NERDTreeMouseMode=3 


" How can I open a NERDTree automatically when vim starts up?
autocmd vimenter * NERDTree

" How can I open a NERDTree automatically when vim starts up if no files were
" specified?
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" How can I map a specific key or shortcut to open NERDTree?
map <C-n> :NERDTreeToggle<CR>

" How can I close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" ===========================================================
" NERDTree BLOCK END   ======================================
" ===========================================================

" ===========================================================
" syntastic BLOCK BEGIN   ===================================
" ===========================================================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" ===========================================================
" syntastic BLOCK END   =====================================
" ===========================================================

" ===========================================================
" Tab movement stuff BLOCK BEGIN   ===================================
" ===========================================================
" With the following mappings (which require gvim), you can press Ctrl-Left or
" Ctrl-Right to go to the previous or next tabs, and can press Alt-Left or
" Alt-Right to move the current tab to the left or right.
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>
"
nnoremap <C-Up> :tabnew<CR>
nnoremap <C-Down> :tabclose<CR>
nnoremap <F2> :tabonly<CR>
" ===========================================================
" Tab movement stuff BLOCK END   ===================================
" ===========================================================
