call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'zcodes/vim-colors-basic'
"Автозакрывающие скобки"
Plug 'jiangmiao/auto-pairs'
"Поиск по файлам"
Plug 'kien/ctrlp.vim'
"Поиск строки во всех файлах проекта
Plug 'mileszs/ack.vim'
Plug 'damage220/solas.vim'

"Терминал"
Plug 'mklabs/split-term.vim'
call plug#end()

let g:molokai_original = 1
colo molokai

set number
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set ignorecase

set scrolloff=10

set cursorline

set backspace=indent,eol,start

set t_Co=256
set syntax=on

set hlsearch
set incsearch

set wrap
set linebreak

"Табуляция"
set autoindent
set autoread
set noswapfile
set nocompatible

map <C-n> :NERDTreeToggle<CR>

function! WrapForTmux(s)
  if !exists('$TMUX')
          return a:s
            endif

              let tmux_start = "\<Esc>Ptmux;"
              let tmux_end = "\<Esc>\\"

                return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
            endfunction

            let &t_SI .= WrapForTmux("\<Esc>[?2004h")
            let &t_EI .= WrapForTmux("\<Esc>[?2004l")
           
            function! XTermPasteBegin()
                  set pastetoggle=<Esc>[201~
                    set paste
                      return ""
                  endfunction
                  
                  inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()]]"]")"]")
if !exists("vimrc_autocommands_cursor_loaded")
  let vimrc_autocommands_cursor_loaded = 1
  if has("autocmd")
    if executable("gconftool-2")
      au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
      au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
      au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
    endif
  endif
endif

" Konsole
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

function! s:disableCursorShape()
let &t_SI = ""
let &t_EI = ""
endfunction

nnoremap <leader><F12> :call <SID>disableCursorShape()<CR>         



nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
