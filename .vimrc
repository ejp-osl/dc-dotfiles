filetype on
filetype plugin on
filetype indent on
syntax on

set nocompatible
set number
set relativenumber
set cursorline
set clipboard=unnamed,unnamedplus

set shiftwidth=2
set tabstop=4
set nowrap
set ignorecase
set history=1000
if !has('nvim')
  set ttymouse=sgr
endif
set mouse=a
set wrap
set linebreak

set termguicolors
if !has('nvim')
  colorscheme catppuccin_mocha
endif

noremap J <Cmd>norm! 10j<CR>
noremap K <Cmd>norm! 10k<CR>
vnoremap J 10j
vnoremap K 10k
inoremap jh <Esc>
inoremap jk <Esc>
" let g:tmux_navigator_no_mappings = 1

" nnoremap <silent> <M-Left> :<C-U>TmuxNavigateLeft<cr>
" nnoremap <silent> <M-Right> :<C-U>TmuxNavigateRight<cr>
" nnoremap <silent> <M-Up> :<C-U>TmuxNavigateUp<cr>
" nnoremap <silent> <M-Down> :<C-U>TmuxNavigateDown<cr>

" nnoremap <silent> <M-h> :<C-U>TmuxNavigateLeft<cr>
" nnoremap <silent> <M-l> :<C-U>TmuxNavigateRight<cr>
" nnoremap <silent> <M-k> :<C-U>TmuxNavigateUp<cr>
" nnoremap <silent> <M-j> :<C-U>TmuxNavigateDown<cr>

" let g:kitty_navigator_no_mappings = 1

" nnoremap <silent> <M-h> :KittyNavigateLeft<cr>
" nnoremap <silent> <M-l> :KittyNavigateDown<cr>
" nnoremap <silent> <M-k> :KittyNavigateUp<cr>
" nnoremap <silent> <M-j> :KittyNavigateRight<cr>

nnoremap <C-z> u

:map <Up> <Nop>
:map <Left> <Nop>
:map <Right> <Nop>
:map <Down> <Nop>

"use line cursor in insert mode and block everywhere else
augroup CursorSettings
	autocmd!
	
	" Alternative Codes:
	" 1 -> blinking block
	" 2 -> solid block
	" 3 -> blinking underscore
	" 4 -> solid underscore
	" 5 -> blinking vertical bar
	" 6 -> solid vertical bar
	
	autocmd VimEnter * let &t_SI.="\e[5 q" "SI = INSERT mode
	autocmd VimEnter * let &t_SR.="\e[4 q" "SI = REPLACE mode
	autocmd VimEnter * let &t_EI.="\e[2 q" "SI = NORMAL mode (ELSE)

	autocmd VimLeave * let &t_EI.="\e[6 q" | normal i

augroup END


