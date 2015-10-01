execute pathogen#infect()
syntax on
filetype plugin indent on

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP

" Good bye Ex-Mode :<
nnoremap Q <nop>

"Add a new empty line shift enter
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
nmap <c-s> :w<CR> 
imap <c-s> <Esc>:w<CR>l 
vmap <c-s> <Esc>:w<CR> 
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

set number
set tabstop=4 shiftwidth=4 expandtab
set mouse=a
let mapleader = "\<Space>"
set background=dark
set t_Co=256
"colorscheme wombat256mod
colorscheme bvemu
"colorscheme devbox-dark-256
""colorscheme desert
"colorscheme desertEx
"colorscheme mophiaSmoke
nnoremap <F6> :UndotreeToggle<cr>
let Tlist_Show_One_File = 1
noremap <leader>h :set hlsearch! hlsearch?<CR>
if has("persistent_undo")
     set undodir='~/.undodir/'
     set undofile
endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
map <C-t> :TlistToggle<CR>

"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" PHP "
let g:phpcomplete_index_composer_command = "composer"
source ~/.vim/php-doc.vim 
autocmd  FileType  php setlocal omnifunc=phpcomplete_extended#CompletePHP
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

inoremap <C-L> <ESC>:call PhpDocSingle()<CR>i 
nnoremap <C-L> :call PhpDocSingle()<CR> 
vnoremap <C-L> :call PhpDocRange()<CR> 

" Put at the very end of your .vimrc file.

function! PhpSyntaxOverride()
   hi! def link phpDocTags  phpDefine
   hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END
