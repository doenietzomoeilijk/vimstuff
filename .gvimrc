" vim: set filetype=vim foldmethod=marker foldlevel=1 et tw=78:

" UI {{{
set guioptions-=T " No toolbar
set guioptions-=r " No right scrollbar
set guioptions-=L " No left scrollbar
set guioptions+=g " Grey menu items instead of hiding them
set guioptions+=i " Icons are nifty
set guitablabel=%M%t
" }}}

" MacVim specific {{{
if has('gui_macvim')
  behave xterm
  set selectmode=
  set keymodel=
  set mousemodel=popup_setpos
  let macvim_skip_cmd_opt_movement = 1
  let macvim_hig_shift_movement = 1
  let g:netrw_browsex_viewer='open'
  map <S-D-[> :tabprevious<CR>
  map <S-D-]> :tabnext<CR>

  set fuoptions=maxvert,maxhorz,background:Normal " Fullscreen options

  set linespace=0
  " set gfn=EnvyCodeR:h13
  " set gfn=Anonymous\ Pro\ for\ Powerline:h15
  " set gfn=Inconsolata-dz:h12
  set gfn=Source\ Code\ Pro\ Light\ for\ Powerline:h12
endif
" }}}
