let g:ale_fixers = {
      \ 'javascript': ['eslint'],
      \ 'javascriptreact': ['eslint'],
\}

let g:ale_fix_on_save = 1

let g:ale_linters = {
\   'javascript': ['flow-language-server', 'eslint'],
\   'javascriptreact': ['flow-language-server', 'eslint'],
\   'javascript.jsx': ['flow-language-server', 'eslint'],
\}

nnoremap <leader>T :call LanguageClient_textDocument_hover()<CR>
