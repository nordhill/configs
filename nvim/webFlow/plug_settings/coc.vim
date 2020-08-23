" https://flow.org/en/docs/editors/vim/
" Coc settings.
set updatetime=299
set shortmess+=c

" Instead of having ~/.vim/coc-settings.json.
"let s:LSP_CONFIG = {
"\  'flow': {
"\    'command': exepath('flow'),
"\    'args': ['lsp'],
"\    'filetypes': ['javascript', 'javascriptreact'],
"\    'initializationOptions': {},
"\    'requireRootPattern': 0,
"\    'settings': {},
"\    'rootPatterns': ['.flowconfig']
"\  }
"\}
"
"let s:languageservers = {}
"for [lsp, config] in items(s:LSP_CONFIG)
"  let s:not_empty_cmd = !empty(get(config, 'command'))
"  if s:not_empty_cmd | let s:languageservers[lsp] = config | endif
"endfor
"
"if !empty(s:languageservers)
"  call coc#config('languageserver', s:languageservers)
"  endif
"
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('&lt;cword&gt;')
  else
    call CocAction('doHover')
  endif
endfunction

" Use leader T to show documentation in preview window.
nnoremap <leader>t :call <SID>show_documentation()<CR>

nmap <silent> <F9> <Plug>(coc-diagnostic-prev)
nmap <silent> <F8> <Plug>(coc-diagnostic-next)
"map <silent> <Leader>k <Plug>(coc-definition)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

