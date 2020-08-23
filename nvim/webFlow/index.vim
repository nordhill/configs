" Things I'd like to improve:
"
" - eslint and flow  errors should be found  in the same place!
" - yank a row without moving to cursor
" - use searching + cgn, vgn, gn combos
" - replace character easily with line breaks and indent the selection.
"   current solution to use visual selection + ldr-vs and /,/\,r/g


let basePath='~/git-public/configs/nvim/webFlow/'

exe 'source' basePath . 'plugs.vim'
exe 'source' basePath . '../general.vim'
for f in split(glob(basePath . 'plug_settings/*.vim'), '\n')
    exe 'source' f
endfor

let g:javascript_plugin_flow = 1
