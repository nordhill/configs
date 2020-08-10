" Things I'd like to improve:
"
" - eslint and flow  errors should be found  in the same place!
" - yank a row without moving to cursor

source $HOME/git/configs/nvim/webFlow/plugs.vim
source $HOME/git/configs/nvim/general.vim
for f in split(glob('$HOME/git/configs/nvim/webFlow/plug_settings/*.vim'), '\n')
    exe 'source' f
endfor

