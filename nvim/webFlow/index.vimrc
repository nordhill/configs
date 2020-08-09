" Things I'd like to improve:
"
" - make it easy to jump between recent files
" - eslint and flow  errors should be found  in the same place!
" - yank a row without moving to cursor

source $HOME/git/configs/nvim/webFlow/plugs.vim
source $HOME/git/configs/nvim/webFlow/plug_settings/*.vim
source $HOME/git/configs/nvim/general.vimrc

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

