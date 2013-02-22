" vim: set filetype=vim foldmethod=marker foldlevel=1 et tw=78:"{{{

" Pathogen {{{
" runtime ~/.vim/bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
execute pathogen#helptags()
" }}}

" Powerline {{{
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
" }}}

" Ctrl-P {{{
let g:ctrlp_use_caching=1
let g:ctrlp_cmd='CtrlPMixed'
let g:ctrlp_working_path_mode='c'
let g:ctrlp_custom_ignore={
  \ 'dir':  '\v[\/]\.(git|hg|svn|yardoc)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }
let g:ctrlp_by_filename=1
let g:ctrlp_max_files = 20000
let g:ctrlp_max_depth = 40

nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>m :CtrlPMRUFiles<CR>
nnoremap <Leader>cp :CtrlPCurFile<CR>
nnoremap <Leader>cr :CtrlPRoot<CR>
" }}}

" Snippets {{{
let g:snippets_dir="~/.vim/my_snips/"
let g:snips_author="Max Roeleveld"
let g:snips_company="Hotels.nl"
" autocmd bufwritepost snippet :call ReloadSnippets(snippets_dir, &filetype)<CR>
" }}}

" Syntastic {{{
let g:syntastic_phpcs_conf="--standard=Hotelsnl --tab-width=2"
noremap <leader>st :SyntasticToggleMode<CR>
noremap <leader>sc :SyntasticCheck<CR>
noremap <leader>se :Errors<CR>
" }}}

" UI {{{
set bg=dark
colorscheme xoria256

" Disable underline which cterm doesn't need.
hi CursorLine ctermbg=238 cterm=NONE

" A nice EOL guide column.
if exists("&colorcolumn")
  set colorcolumn=80
  hi ColorColumn ctermbg=237 guibg=#232526
endif

set number
set ruler

" Allow me to switch between number and relativenumber. Vim >= 7.3
function! SwitchNumbering()
  if exists("&relativenumber")
    if &number && ! &relativenumber
      set relativenumber
    elseif ! &number && &relativenumber
      set number
    endif
  else
    echo "Your VIM doesn't support relativenumber!"
  endif
endfunction
nnoremap <leader>nn :call SwitchNumbering()<CR>

set cursorline
nnoremap <leader>c :set cursorline!<CR>
nnoremap <leader>C :set cursorcolumn!<CR>

set cmdheight=3 " Give us some room for feedback. Prevents 90% of 'Press enter
                " to continue'.
" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=

" Casing and wrapping
set ignorecase smartcase
set nowrap " We just CODE to the correct width, bitches!
set whichwrap+=<,>,h,l
set linebreak
set showbreak=~\ \ \ 

" Split stuff
set equalalways
set eadirection=hor
set splitright

" Resize windows on metawindow resize
autocmd VimResized * exe "normal! \<c-w>="

" Toggle invisible chars
noremap <leader>i :set list!<CR>
" }}}

" Keys {{{
let mapleader=","
" }}}

" Coding defaults {{{
set tabstop=2
set shiftwidth=2
set nosmartindent " As smartindent conflicts with filetype
set nocindent
set smarttab
set expandtab
set shiftround
" }}}

" Movement {{{
" Quick jumping between splits and buffers
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l

" For everyone who uses wrap
nnoremap j gj
nnoremap k gk

" Highlighting search
set showmatch
set matchpairs+=<:>
set hlsearch
set incsearch

nnoremap <leader>n :nohlsearch<CR> " Setting it to enter mucked with error windows.
noremap <leader>h :let @/ = ""<CR> " clear search pattern to disable hlsearch
" }}}

" Editing {{{
" Why didn't I think of these earlier?
inoremap <C-E> <End>
inoremap <C-A> <Home>

" Uppercase / lowercase current word
nnoremap <Leader>U viwU
nnoremap <Leader>u viwu

" Write with sudo
cnoremap w!! w !sudo tee % >/dev/null

" Paste with auto-indent
nnoremap <Leader>p p'[v']=
nnoremap <Leader>P P'[v']=
nnoremap <Leader>pp :set paste!<CR>

" If I want help, I'll ask for it (instead of inadvertly hit my F1 when I
" actually wanted ESC)
noremap <F1> <Esc>

" Faster escape
set ttimeoutlen=10
augroup FastEscape
  autocmd!
  au InsertEnter * set timeoutlen=0
  au InsertLeave * set timeoutlen=1000
augroup END

" Folding
set foldmethod=indent
set foldlevel=100

" See :help fo-table for letter meaning
set formatoptions=lcqn
" }}}

" Paths and backups {{{
" Directories that have // at the end will be expanded to the full file path
" See: http://stackoverflow.com/questions/4331776/change-vim-swap-backup-undo-file-name/4331812#4331812

" Move temporary files to ~/.vimtmp/ instead of current dir
if ! isdirectory(expand('~/.vimtmp'))
   call mkdir(expand('~/.vimtmp'))
endif
if isdirectory(expand('~/.vimtmp'))
   set directory=~/.vimtmp//
else
   set directory=.,/var/tmp//,/tmp//
endif

" Save tons of history and undo (Thanks, Arnout)
set history=10000
set undolevels=10000

" Set persistent undo, only works on >73
if exists("&undodir") && exists("&undofile")
  " Setup persistently store the undo folder
  if ! isdirectory(expand('~/.vimundo'))
    call mkdir(expand('~/.vimundo'))
  endif
  set undodir=~/.vimundo
  set undofile
endif

set backupskip=/tmp/*,/private/tmp/*" 
if ! isdirectory(expand('~/.vimbackup'))
  call mkdir(expand('~/.vimbackup'))
endif
set backupdir=~/.vimbackup//
" }}}

" Filetype stuff {{{
augroup Filetypes
  autocmd!
  autocmd BufRead,BufNewFile *.smarty setlocal ft=smarty.html
  autocmd BufRead,BufNewFile,BufEnter *.json setlocal ft=javascript
  autocmd BufRead,BufNewFile,BufEnter *.ejs setlocal ft=javascript
  autocmd BufRead,BufNewFile,BufEnter *.md setlocal ft=markdown
  autocmd BufRead,BufNewFile,BufEnter *.tt2 set ft=tt2html
  autocmd BufRead,BufNewFile,BufEnter .tmux.conf*,tmux.conf* set ft=tmux
  autocmd BufRead,BufEnter */hotelmodules-*/*.class setlocal ft=php
  autocmd FileType markdown setlocal formatoptions+=t
  autocmd FileType perl setlocal tabstop=4 shiftwidth=4 
  autocmd FileType php setlocal keywordprg=pman
augroup END

" Disable auto-php-folding if PIV is plugged in
let g:DisableAutoPHPFolding=1
let g:PHP_vintage_case_default_indent = 1
let php_noShortTags=0
let php_sql_query=0
let php_htmlInStrings=0
let php_folding=0
let PHP_outdentphpescape=0

set wildignore+=*.so,*.swp,*.zip,*/tmp/*,.git/*
" Editing the .vimrc file {{{
" From http://github.com/devjj/vim-config/blob/master/.vimrc After editing, run
augroup Vimrc
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC | exec 'echom "vimrc reloaded after save."'
  " autocmd BufWritePost $MYVIMRC source $MYVIMRC | call Pl#ReloadColorscheme() | exec 'echom "vimrc reloaded after save."'
augroup END

noremap <Leader>vv :vsplit $MYVIMRC<CR>
noremap <Leader>V :source $MYVIMRC<CR>:filetype detect<CR>:echom 'vimrc reloaded'<CR>
" }}}"}}}
