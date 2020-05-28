" =============================== Plugins Start ===============================
call plug#begin('~/.vim/plugged')

" colorscheme plugin, use whatever you want
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
" ================================ Plugins End ================================

" ================================ nvim config ================================
set encoding=UTF-8

" -------------- Display stuff ----------------

" Set whatever colorscheme you want
au ColorScheme * hi Normal ctermbg=None
colorscheme tender

" show relative line nums from current line
set relativenumber

" show line number of current line
set number

" max line length of 80 chars
set colorcolumn=80

" tab width to 4, <TAB> key to indent, change tabs to spaces
set tabstop=4 shiftwidth=4 expandtab

" line height formatting
set linespace=3

" break lines with carriage return at a certain width
set linebreak

" text width of 80 chars
set tw=80

" -------------- Mouse stuff ----------------

" can use mouse (this gets rid of cmd+c)
set mouse=a

" always have 3 lines above and below the cursor
set scrolloff=3

" allows cursor to move after the last char in a line
set virtualedit=onemore

" ----------------- Misc stuff ---------------------

" shorter time for error messages
set updatetime=100

" maintain undo history between sessions
set undofile
set undodir=~/.config/nvim/undodir

" ----------------- Remaps ----------------------

" copy to clipboard shortcut
vnoremap <C-c> "+y

" exit insert mode and save
inoremap jj <esc>:w<cr>
" ================================ nvim config ================================

" ============================== Plugin remaps ================================

" ------------ tagbar -------------

" tagbar shortcut
nmap <C-\> :TagbarToggle<CR>
" ---------------------------------

" ------------ coc-nvim -------------

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
" -----------------------------------

" ------------ vim-commentary -------------

" comment remap (diff comments for normal and visual)
nmap c<space> gcc
vmap c<space> gc
" -----------------------------------------

" ------------ FZF and ripgrep  -------------

" look for files
noremap <C-f> :Files<CR>

" look for lines in current file
noremap <C-l> :Lines<CR> 

" navigate through buffers
noremap <C-b> :Buffers<CR>

" look for lines in all files ever wow
noremap <C-p> :Rg<CR>

" command! -bang -nargs=? -complete=dir Files
"     \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', 'cat {}']}, <bang>0)
" -------------------------------------------

" ------------ vimtex -------------

let g:tex_flavor='latex'
let g:vimtex_view_method = 'skim'
let g:vimtex_quickfix_autoclose_after_keystrokes = 5
let g:vimtex_compiler_progname='nvr'

" to avoid the weird quotes shit
let g:vimtex_imaps_leader = ';'
" ---------------------------------

" ------------ netrw (not in use) -------------

" let g:netrw_banner = 0
" let g:netrw_liststyle = 3
" let g:netrw_browse_split = 0
" let g:netrw_altv = 1
" let g:netrw_winsize = 25
" ---------------------------------------------
" ============================== Plugin remaps ================================
