
" insert mode mappings ---- {{{
inoremap jk <esc>
inoremap kj <esc>
" }}}

" Operator mappings {{{
onoremap p i(
" }}}

let mapleader = ','
let maplocalleader = ','

" To edit vimrc on the fly
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" My custom cmd commands
" Edit cmd environment macros
nnoremap <leader>env :tabe C:\Users\sp011482\env.cmd<cr>

" Quoting
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel

" Selecting all
nnoremap <leader>sel ggvG
nnoremap <F7> :tabp<cr>
nnoremap <F8> :tabn<cr>

" File format
set ff=dos

" Encoding
set encoding=utf-8
set fileencoding=latin1

" Syntax
syntax on

set backspace=indent,eol,start

" Setting the font
set gfn=Consolas:h8

" Plugins ------ {{{
source C:/Users/sp011482/apps/gvim/plugin/getscriptPlugin.vim
source C:/Users/sp011482/apps/gvim/plugin/gzip.vim
source C:/Users/sp011482/apps/gvim/plugin/logiPat.vim
source C:/Users/sp011482/apps/gvim/plugin/matchparen.vim
source C:/Users/sp011482/apps/gvim/plugin/netrwPlugin.vim
source C:/Users/sp011482/apps/gvim/plugin/rrhelper.vim
source C:/Users/sp011482/apps/gvim/plugin/spellfile.vim
source C:/Users/sp011482/apps/gvim/plugin/tarPlugin.vim
source C:/Users/sp011482/apps/gvim/plugin/tohtml.vim
source C:/Users/sp011482/apps/gvim/plugin/vimballPlugin.vim
source C:/Users/sp011482/apps/gvim/plugin/zipPlugin.vim 
" }}}

call plug#begin('C:/Users/sp011482/apps/gvim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'jalvesaq/Nvim-R'
Plug 'Valloric/YouCompleteMe'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
call plug#end()

" Basic settings --- {{{
set nu
set clipboard=unnamed
set hlsearch incsearch

if !has("gui_running")
    set term=xterm
    set t_Co=256
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
    colorscheme gruvbox
endif
" }}}

" R Configs ---------- {{{
" Sample settings for vim-r-plugin and screen.vim
" Installation 
"       - Place plugin file under ~/.vim/
"       - To activate help, type in vim :helptags ~/.vim/doc
"       - Place the following vim conf lines in .vimrc
" Usage
"       - Read intro/help in vim with :h vim-r-plugin or :h screen.txt
"       - To initialize vim/R session, start screen/tmux, open some *.R file in vim and then hit F2 key
"       - Object/omni completion command CTRL-X CTRL-O
"       - To update object list for omni completion, run :RUpdateObjList
" My favorite Vim/R window arrangement 
"	tmux attach
"	Open *.R file in Vim and hit F2 to open R
"	Go to R pane and create another pane with C-a %
"	Open second R session in new pane
"	Go to vim pane and open a new viewport with :split *.R
" Useful tmux commands
"       tmux new -s <myname>       start new session with a specific name
"	tmux ls (C-a-s)            list tmux session
"       tmux attach -t <id>        attach to specific session  
"       tmux kill-session -t <id>  kill specific session
" 	C-a-: kill-session         kill a session
" 	C-a %                      split pane vertically
"       C-a "                      split pane horizontally
" 	C-a-o                      jump cursor to next pane
"	C-a C-o                    swap panes
" 	C-a-: resize-pane -L 10    resizes pane by 10 to left (L R U D)
" Corresponding Vim commands
" 	:split or :vsplit      split viewport
" 	C-w-w                  jump cursor to next pane-
" 	C-w-r                  swap viewports
" 	C-w C-++               resize viewports to equal split
" 	C-w 10+                increase size of current pane by value

" To open R in terminal rather than RGui (only necessary on OS X)
" let vimrplugin_applescript = 0
" let vimrplugin_screenplugin = 0
" For tmux support
let g:ScreenImpl = 'Tmux'
let vimrplugin_screenvsplit = 1 " For vertical tmux split
let g:ScreenShellInitialFocus = 'shell' 
" instruct to use your own .screenrc file
let g:vimrplugin_noscreenrc = 1
" For integration of r-plugin with screen.vim
let g:vimrplugin_screenplugin = 1
" Don't use conque shell if installed
let vimrplugin_conqueplugin = 0
" map the letter 'r' to send visually selected lines to R 
let g:vimrplugin_map_r = 1
" see R documentation in a Vim buffer
let vimrplugin_vimpager = "no"
"set expandtab
set shiftwidth=4
set tabstop=8
" start R with F2 key
noremap <F2> <Plug>RStart 
inoremap <F2> <Plug>RStart
vnoremap <F2> <Plug>RStart
" send selection to R with space bar
vnoremap <Space> <Plug>RDSendSelection 
" send line to R with space bar
nnoremap <Space> <Plug>RDSendLine
" }}}

" Home ---- {{{
cd C:/Users/sp011482/
" }}}

let g:Rtools_path="C:\\Users\\sp011482\\AppData\\Local\\Rtools\\mingw_64\\bin\\"
let Rtools_path="C:\\Users\\sp011482\\AppData\\Local\\Rtools\\mingw_64\\bin\\"
let g:R_app="C:\\Users\\sp011482\\AppData\\Local\\R-3.5.0\\bin\\R.exe"
let R_app="C:\\Users\\sp011482\\AppData\\Local\\R-3.5.0\\bin\\R.exe"

" My autocmd commands per filetype ----------- {{{
augroup ft_html
    autocmd!
    autocmd BufNewFile,BufRead *.html setlocal nowrap
augroup END

augroup ft_javascript
    	autocmd!
	autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
	autocmd FileType javascript iabbrev <buffer> iff if ()<left>
augroup END

augroup ft_python
    	autocmd!
	autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
	autocmd FileType python iabbrev <buffer> iff if:<left>
augroup END

augroup ft_R
	autocmd!
	autocmd FileType rnoweb nnoremap <buffer> <localleader>c I#<esc>
	autocmd FileType rmd nnoremap <buffer> <localleader>c I#<esc>
	autocmd BufNewFile,BufRead *.r,*.R nnoremap <buffer> <localleader>c I#<esc>
	autocmd BufNewFile,BufRead *.r,*.R nnoremap <buffer> <localleader>st I#### <esc>A####
	" autocmd BufNewFile,BufRead *.r,*.R inoremap <buffer> <c-s-m> <esc>i %>% <esc>a 
	autocmd BufNewFile,BufRead *.r,*.R inoremap ( ()<esc>i
	autocmd BufNewFile,BufRead *.r,*.R inoremap " ""<esc>i
	autocmd BufNewFile,BufRead *.r,*.R inoremap ' ''<esc>i
	autocmd BufNewFile,BufRead *.r,*.R inoremap { {}<esc>i
	autocmd BufNewFile,BufRead *.r,*.R inoremap [ []<esc>i
augroup END

augroup ft_c
	autocmd!
	autocmd FileType cpp nnoremap <buffer> <localleader>c I#<esc>
	autocmd FileType cpp inoremap ( ()<esc>i
	autocmd FileType cpp inoremap " ""<esc>i
	autocmd FileType cpp inoremap ' ''<esc>i
	autocmd FileType cpp inoremap { {}<esc>i
	autocmd FileType cpp inoremap [ []<esc>i
augroup END
" }}}

" Snippets --------- {{{
augroup snippets
    autocmd!
    autocmd BufNewFile,BufRead *.r,*.R iabbrev <buffer> iff if ()<left>
    autocmd BufNewFile,BufRead *.r,*.R iabbrev <buffer> foor for ()<left>
augroup END
" }}}

" Vimscript file settings ---- {{{
augroup filetype_vim
    autocmd!
    autocmd Filetype vim setlocal foldmethod=marker
augroup END
" }}}

" Status Line ---- {{{
setlocal statusline=%.20F\ -\ Filetype:\ %y%=Line:\ %l/%L
" }}}

