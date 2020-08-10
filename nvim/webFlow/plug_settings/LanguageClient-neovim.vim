let g:LanguageClient_rootMarkers = {
\   'javascript': ['.flowconfig', 'package.json']
\ }

let g:LanguageClient_serverCommands={
\   'javascript': ['flow', 'lsp'],
\   'javascriptreact': ['flow', 'lsp'], 
\}

" Set languae client bindings to go  to definition.
nmap <silent><Leader>k <Plug>(lcn-definition)
