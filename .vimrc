autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
set modeline
set modelines=5
autocmd FileType puppet,ruby,yaml,yml set shiftwidth=2 softtabstop=2 tabstop=2 expandtab
autocmd BufNewFile,BufRead *.t set filetype=ruby

filetype plugin indent on
syntax on    " Turn syntax highlighting on
set autoindent    " indent based on the previous line
set encoding=utf8 " Make vim utf8 aware and safe

" Turn off all bells
set noerrorbells
set novisualbell
set t_vb=

execute pathogen#infect()
filetype plugin indent on

" Nerdtree
let g:NERDTreeChDirMode=2         " make NERDTree dir the working directory
let g:NERDTreeMouseMode=3         " single click to open nodes
let g:NERDTreeDirArrows=1         " use unicode arrows instead of + and -
let g:NERDTreeMinimalUI=1         " hide help text
let g:NERDTreeIgnore=['\.o$']     " ignore object files

" Taken from
" https://github.com/carlhuda/janus/blob/master/janus/vim/tools/janus/after/plugin/nerdtree.vim
" " Pins NERDTree to the left hand side

augroup AuNERDTreeCmd
autocmd AuNERDTreeCmd FocusGained * call s:UpdateNERDTree()
augroup END

function! s:UpdateNERDTree(...)
  let stay = 0

  if(exists("a:1"))
    let stay = a:1
  end

  if exists("t:NERDTreeBufName")
    let nr = bufwinnr(t:NERDTreeBufName)
      if nr != -1
        exe nr . "wincmd w"
        exe substitute(mapcheck("R"), "<CR>", "", "")
        if !stay
	  wincmd p
        end
      endif
  endif
endfunction

" Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=0
let g:syntastic_auto_loc_list=1
hi DiffAdd cterm=bold ctermfg=2 ctermbg=0
hi DiffChange ctermfg=2 ctermbg=0 cterm=none
hi DiffDelete ctermfg=2 ctermbg=0 cterm=none
hi DiffText cterm=bold ctermfg=6 ctermbg=0

map <F2> :NERDTreeToggle<CR>
map <F5> :!clear; rock run %<CR>
