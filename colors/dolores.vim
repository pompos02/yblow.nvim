lua << EOF
require("dolores").colorscheme("dolores")
EOF

augroup dolores_background
  autocmd!
  autocmd OptionSet background call <SID>dolores_refresh()
augroup END

function! s:dolores_refresh() abort
  if g:colors_name ==# 'dolores'
    lua require("dolores").colorscheme("dolores")
  endif
endfunction
