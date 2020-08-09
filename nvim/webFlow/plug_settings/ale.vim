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

map <F8> :ALENext<CR>
map <F9> :ALEPrevious<CR>
