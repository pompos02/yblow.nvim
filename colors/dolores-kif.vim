lua << EOF
require("dolores").colorscheme("dolores-kif")
EOF

augroup dolores_g_background
  autocmd!
  autocmd OptionSet background call <SID>dolores_g_refresh()
augroup END

function! s:dolores_g_refresh() abort
  if g:colors_name ==# 'dolores-kif'
    lua require("dolores").colorscheme("dolores-kif")
  endif
endfunction
