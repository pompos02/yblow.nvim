lua << EOF
require("dolores").colorscheme("dolores-glykeria")
EOF

augroup dolores_glykeria_background
  autocmd!
  autocmd OptionSet background call <SID>dolores_glykeria_refresh()
augroup END

function! s:dolores_glykeria_refresh() abort
  if g:colors_name ==# 'dolores-glykeria'
    lua require("dolores").colorscheme("dolores-glykeria")
  endif
endfunction
