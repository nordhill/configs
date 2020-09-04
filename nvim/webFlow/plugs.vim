" Plugins to consider
" Plug 'christoomey/vim-tmux-navigator'
"
call plug#begin('~/.config/nvim/plugged')
" Color theme, check the corresponding theme for terminal with nerdfonts.
Plug 'sainnhe/gruvbox-material'
" Automatically completes closing bracets etc when typing them - can be annoying at times.
Plug 'jiangmiao/auto-pairs'
" Completes the parameter list as you write a function that has parameters defined and you can jump directly to next one to assign it properly to a variable.
Plug 'tenfyzhong/CompleteParameter.vim'
" Makes your movement w, b, e etc.. respect camel cased text.
Plug 'bkad/CamelCaseMotion'
" Allows you to e.g highlight text content and choose what characters to surround it. Allows removing surrounding characters too.
Plug 'tpope/vim-surround'
" Intellisense
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" The cool bar showing related info e.g what mode you are on, what file you are in etc.
Plug 'vim-airline/vim-airline'
" Themes for airline plugin - might be useless.
Plug 'vim-airline/vim-airline-themes'
" Amazing finder plugin for searching files in your project various ways.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Async lint engine to show lint errors and going to references.
"Plug 'dense-analysis/ale'
" Syntax higlighting for js and Flow.
Plug 'pangloss/vim-javascript'
" React highlighting
Plug 'maxmellon/vim-jsx-pretty'
" Shows status  in the left side of the file where you have done git changes.
" and removals
Plug 'mhinz/vim-signify'
" Better default search for vim that highlightS all pattern matches.
Plug 'haya14busa/incsearch.vim'
" A collection of language packs that have more then just syntax highlighting.
Plug 'sheerun/vim-polyglot'
" Language Server Protocol support.
"Plug 'autozimu/LanguageClient-neovim', {
"    \ 'branch': 'next',
"    \ 'do': 'bash install.sh',
"    \ },
" Various git commands and a diff tool
Plug 'tpope/vim-fugitive'
" Highlight color number with the status of the mode from airline
Plug 'ntpeters/vim-airline-colornum'
Plug 'dracula/vim', { 'as': 'dracula' }
" Comment and un comment lines fast
Plug 'preservim/nerdcommenter'
" Ctags manager
"Plug 'ludovicchabant/vim-gutentags'
" Javascript importing
"Plug 'kristijanhusak/vim-js-file-import', {'do': 'npm install'}
" Fast horizontal navigation
Plug 'unblevable/quick-scope' 
Plug 'mg979/vim-visual-multi' 
call plug#end()

