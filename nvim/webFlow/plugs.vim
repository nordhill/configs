" Plugins to consider
"
"
" Plug 'ruanyl/vim-fixmyjs'
" using fixmyjs by default might conflict with import so you end up, by default, sorting your imports for example while just trying to import a module. Hence you might want to rebind Leader i by eg.  <Leader>i <Nop>
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
" Plug 'kristijanhusak/vim-js-file-import', {'do': 'npm install'}
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
" Various git commands and a diff tool
Plug 'tpope/vim-fugitive'
call plug#end()

