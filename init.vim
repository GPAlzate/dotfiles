" ------------------------ PLUGINS START --------------------------------------
call plug#begin('~/.vim/plugged')

" DISPLAY STUFF
Plug 'jacoborus/tender.vim'

" the root of it all
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'majutsushi/tagbar'

" NOTE: also need `brew install fzf`
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" ******** tpope ************

" auto comment shortcut
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

" auto complete paired things like brackets
Plug 'jiangmiao/auto-pairs'

" show diffs beside line numbers
Plug 'mhinz/vim-signify'

" vimtex
Plug 'lervag/vimtex'

call plug#end()
" ------------------------ PLUGINS END ----------------------------------------
set encoding=UTF-8

" Display
au ColorScheme * hi Normal ctermbg=None     " makes the background not grey
colorscheme tender
set laststatus=2
set relativenumber                      " relative line nums from current line
set number                              " show line number of current line
set colorcolumn=80                      " character guide bar
set tabstop=4 shiftwidth=4 expandtab    " tab width to 4; change to spaces
set linespace=3
set linebreak
set tw=80

" Cursor
set mouse=a
set scrolloff=3
set virtualedit=onemore

" shorter time for error messages, git gutter, etc
set updatetime=200

" Maintain undo history between sessions
set undofile
set undodir=~/.config/nvim/undodir

" switch buffers with ctrl b
" noremap <C-b> :bn<CR>

" copy to clipboard shortcut
vnoremap <C-c> "+y

" exit insert mode and save
inoremap jj <esc>:w<cr>

" tagbar shortcut
nmap <C-\> :TagbarToggle<CR>

" ---------------------- commentary -------------------------------------------

" comment remap (diff comments for normal and visual)
nmap c<space> gcc
vmap c<space> gc

" ---------------------- netrw stuff ------------------------------------------
" let g:netrw_banner = 0
" let g:netrw_liststyle = 3
" let g:netrw_browse_split = 0
" let g:netrw_altv = 1
" let g:netrw_winsize = 25

" ---------------------- coc-nvim stuff ---------------------------------------

" ctrl-space to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" Remap keys for goto definition
nmap <silent> gd :call CocAction('jumpDefinition', 'tab drop')<CR>

" show docs for the current word
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" variable refactoring
nmap <Leader>R <Plug>(coc-rename)

" file explorer
nmap <C-n> :CocCommand explorer<CR>

" ---------------------- fzf stuff --------------------------------------------

" look for files
noremap <C-f> :Files<CR>

" look for lines in current file
noremap <C-l> :Lines<CR> 

" navigate through buffers
noremap <C-b> :Buffers<CR>

" look for lines in all files ever wow
noremap <C-p> :Ag<CR>

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', 'cat {}']}, <bang>0)

" ---------------------- vimtex stuff -----------------------------------------
let g:tex_flavor='latex'
let g:vimtex_view_method = 'skim'
let g:vimtex_quickfix_autoclose_after_keystrokes = 5
let g:vimtex_compiler_progname='nvr'

" to avoid the weird quotes shit
let g:vimtex_imaps_leader = ';'

