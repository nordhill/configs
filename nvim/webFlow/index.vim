" Things I'd like to improve:
"
" - eslint and flow  errors should be found  in the same place!
" - yank a row without moving to cursor
" - use searching + cgn, vgn, gn combos
" - replace character easily with line breaks and indent the selection.
"   current solution to use visual selection + ldr-vs and /,/\,r/g

source $HOME/git-public/configs/nvim/webFlow/plugs.vim
source $HOME/git-public/configs/nvim/general.vim
for f in split(glob('$HOME/git-public/configs/nvim/webFlow/plug_settings/*.vim'), '\n')
    exe 'source' f
endfor

