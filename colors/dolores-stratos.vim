lua << EOF
require("dolores").colorscheme("dolores-stratos")
EOF

augroup dolores_stratos_background
  autocmd!
  autocmd OptionSet background call <SID>dolores_stratos_refresh()
augroup END

function! s:dolores_stratos_refresh() abort
  if g:colors_name ==# 'dolores-stratos'
    lua require("dolores").colorscheme("dolores-stratos")
  endif
endfunction
