lua << EOF
require("dolores").colorscheme("dolores-asotos")
EOF

augroup dolores_asotos_background
  autocmd!
  autocmd OptionSet background call <SID>dolores_asotos_refresh()
augroup END

function! s:dolores_asotos_refresh() abort
  if g:colors_name ==# 'dolores-asotos'
    lua require("dolores").colorscheme("dolores-asotos")
  endif
endfunction
