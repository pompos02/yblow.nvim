lua << EOF
require("dolores").colorscheme("dolores-thes")
EOF

augroup dolores_thes_background
  autocmd!
  autocmd OptionSet background call <SID>dolores_thes_refresh()
augroup END

function! s:dolores_thes_refresh() abort
  if g:colors_name ==# 'dolores-thes'
    lua require("dolores").colorscheme("dolores-thes")
  endif
endfunction
