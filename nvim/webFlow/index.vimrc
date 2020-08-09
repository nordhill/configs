" Things I'd like to improve:
"
" - make it easy to jump between recent files
" - eslint and flow  errors should be found  in the same place!
" - yank a row without moving to cursor


" Plugins to consider
"
"
" Plug 'ruanyl/vim-fixmyjs'
" using fixmyjs by default might conflict with import so you end up, by default, sorting your imports for example while just trying to import a module. Hence you might want to rebind Leader i by eg.  <Leader>i <Nop>
" 
" Plug 'tpop/vim-fugitive'
"
" Plug 'christoomey/vim-tmux-navigator'
"
" Plug 'brooth/far.vim'



call plug#begin('~/.config/nvim/plugged')
" Color theme, check the corresponding theme for terminal with nerdfonts.
Plug 'sainnhe/gruvbox-material'
" Automatically completes closing bracets etc when typing them - can be annoying at times.
Plug 'jiangmiao/auto-pairs'
" Completes the parameter list as you write a function that has parameters defined and you can jump directly to next one to assign it properly to a variable.
Plug 'tenfyzhong/CompleteParameter.vim'
" Automatically imports js modules from being on top of a unimported function/module. Gives you also options if moduule has more than one same named exports. 
Plug 'Galooshi/vim-import-js'
" Makes your movement w, b, e etc.. respect camel cased text.
Plug 'bkad/CamelCaseMotion'
" Allows you to e.g highlight text content and choose what characters to surround it. Allows removing surrounding characters too.
Plug 'tpope/vim-surround'
" Intellisense
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" The cool bar showing related info e.g what mode you are on, what file you are in etc.
Plug 'vim-airline/vim-airline'
" Tag manager that generates ctags so you can jump to definition etc. This might require you having the ctags whatyoumacallit installed before you can use this.
Plug 'ludovicchabant/vim-gutentags'
" Themes for airline plugin - might be useless.
Plug 'vim-airline/vim-airline-themes'
" Amazing finder plugin for searching files in your project various ways.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Async lint engine to show lint errors and going to references.
Plug 'dense-analysis/ale'
" Syntax higlighting for js and Flow.
Plug 'yuezk/vim-js'
" React highlighting
Plug 'maxmellon/vim-jsx-pretty'
" Shows a gutter in the left side of the file where you have done git changes.
" and removals
Plug 'airblade/vim-gitgutter'
" Better default search for vim that highlightS all pattern matches.
Plug 'haya14busa/incsearch.vim'
" A collection of language packs that have more then just syntax highlighting.
Plug 'sheerun/vim-polyglot'
" Language Server Protocol support.
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ },
call plug#end()

" ALE configs.
let g:ale_linters = {
\   'javascript': ['flow-language-server'],
\   'javascriptreact': ['flow-language-server'],
\   'javascript.jsx': ['flow-language-server'],
\}
" Set languae client bindings to show definitions and going to definition.
nmap <silent><C-K> <Plug>(lcn-hover)
nmap <silent><C-k> <Plug>(lcn-definition)

let g:LanguageClient_rootMarkers = {
\   'javascript': ['.flowconfig', 'package.json']
\ }

let g:LanguageClient_serverCommands={
\   'javascript': ['flow', 'lsp'],
\   'javascriptreact': ['flow', 'lsp'], 
\}

" Copy active file name to clipboard.
noremap <silent> <F4> :let @+=expand("%:p")<CR>

" Update files
noremap <silent> <F5> :let checktime<CR>

" Map Leader key
nnoremap <SPACE> <Nop>
let mapleader=" "

" Open GFiles with CTRL + P.
map <Leader>p :GFiles<CR>
map <Leader>o :History<CR>
map <Leader>s :%s//
map <Leader>vs :s/

map <Leader>r :Rg<CR> 
map <Leader>f <Plug>(incsearch-forward)

map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

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

"not really working noremap <Leader><Leader>f :Fixmyjs<CR>

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'javascriptreact': ['eslint'],
\}
let g:ale_fixers = {
      \ 'javascript': ['eslint'],
      \ 'javascriptreact': ['eslint'],
\}
let g:ale_fix_on_save = 1


map <F8> :ALENext<CR>
map <F9> :ALEPrevious<CR>

map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge


set backspace=indent,eol,start
let g:javascript_plugin_flow = 1
nmap <expr> <silent> <C-d> <SID>select_current_word()
function! s:select_current_word()
  if !get(g:, 'coc_cursors_activated', 0)
    return "\<Plug>(coc-cursors-word)"
  endif
  return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
endfunc


" Coc settings.
set updatetime=300
set shortmess+=c

" Use leader T to show documentation in preview window.
nnoremap <leader>t :call <SID>show_documentation()<CR>


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('&lt;cword&gt;')
  else
    call CocAction('doHover')
  endif
endfunction

" Instead of having ~/.vim/coc-settings.json.
let s:LSP_CONFIG = {
\  'flow': {
\    'command': exepath('flow'),
\    'args': ['lsp'],
\    'filetypes': ['javascript', 'javascriptreact'],
\    'initializationOptions': {},
\    'requireRootPattern': 1,
\    'settings': {},
\    'rootPatterns': ['.flowconfig']
\  }
\}

let s:languageservers = {}
for [lsp, config] in items(s:LSP_CONFIG)
  let s:not_empty_cmd = !empty(get(config, 'command'))
  if s:not_empty_cmd | let s:languageservers[lsp] = config | endif
endfor

if !empty(s:languageservers)
  call coc#config('languageserver', s:languageservers)
  endif


let g:js_file_import_sort_after_insert = 0
let g:js_file_import_strip_file_extension = 1
let g:js_file_import_use_fzf = 1
let g:js_file_import_omit_semicolon = 1

source $HOME/git/configs/nvim/general.vimrc
