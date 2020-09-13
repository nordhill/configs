" Map Leader key
nnoremap <SPACE> <Nop>
let mapleader=" "

" Set relativenumber
set relativenumber

" On pressing tab, insert 2 spaces
set expandtab

" Show existing tab with 2 spaces width
set tabstop=2

"
set softtabstop=2

"
set shiftwidth=2

" Allow mouse interaction with vim
set mouse=a

" Open and close quickfix 
nmap <Leader>ö :copen<CR>
nmap <Leader>öö :cclose<CR>

" Set color theme
syntax on
set termguicolors
"colorscheme gruvbox-material
colorscheme palenight
"set background=dark

" Auto indentation when pasting
" This breaks auto pairs plugin
" set paste

" Use clipboard for yanking, copy and pasting
"set clipboard=unnamedplus
"set clipboard^=unnamed
" Using system clipboard with ldr c and v
noremap <Leader>c "*y
noremap <Leader>v "*p
" using, I guess, a named registery so that we can do visual selecting and
" pasting without losing the yanked content
" using system clip board for all things
noremap y "+y
noremap Y "+Y
noremap x "+x
noremap p "+p
noremap P "+P
" Allow recursive search from where neovim was opened from
set path=.,/usr/include,,**

" Don't wrap round to the first solution found when searching and navigating the results
set nowrapscan

" Move to first search result when typing
set incsearch

" Reload opened files if external commands cause changes
set autoread

" Use spaces instead of actual tabs when pressing tab
set expandtab

" Vertically center scroll offset
set so=10

set guicursor=

set regexpengine=1

" Faster file content navigating with these keys because of their easier
" access
map <silent> <S-l> $
map <silent> <S-h> _
map <silent> <S-k> {
map <silent> <S-j> }

" Improve scrolling performance when navigating through large results
set lazyredraw 

" Highlight cursorline 
set cursorline

"
syntax on

"
set wildignore+=**/node_modules/**   

"
set incsearch

" Ignore case only when the pattern contains no capital letters
set ignorecase smartcase 

"
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete

" Cancel higlighting with C-c C-c
nnoremap <C-c><C-c> :noh<return> 
nnoremap <Leader>c :noh<return> 
nnoremap <CR> :noh<CR><CR>k

" Refresh files
noremap <silent> <F5> :checktime<CR>

" Create new horizontal tmux pane
noremap <silent> <Leader>m :exe "!tmux split-window -h"<CR><CR>

command! -nargs=1 SS let @/ = '\V'.escape(<q-args>, '\')|set hlsearch

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>

" Replace current selection from the whole file with another string
" map <Leader>s :%s//
nmap <leader>s :%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>

" Replace something within visual selection
map <Leader>vs :s/

" Copy active file name to clipboard.
noremap <silent> <F4> :let @+=expand("%:p")<CR>

" Show various whitespace characters
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·
set list

" Navigate splits via ctrl+hjkl
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Refresh syntax highlighting - useful for large files that might break the highlighting
nmap <F6> :filetype detect<CR>

" Paste current timestamp with some whitespace and asterix
nnoremap <Leader>nt O<C-c>"=strftime("%c")<CR>Po* <C-c>o<C-c>kA

" Open notes file in vim
nnoremap <Leader>no1 :e ~/Notes/notes<CR>
nnoremap <Leader>no2 :e ~/Notes/notes2<CR>

"Open file explorer 
nnoremap <Leader>e :Ex<CR>


nmap <silent><Leader>k gd<CR>

let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

highlight QuickScopePrimary guifg='#00C7DF' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#afff5f' gui=underline ctermfg=81 cterm=underline

let g:qs_max_chars=150

