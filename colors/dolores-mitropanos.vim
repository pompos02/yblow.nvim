lua << EOF
require("dolores").colorscheme("dolores-mitropanos")
EOF

augroup dolores_mitropanos_background
  autocmd!
  autocmd OptionSet background call <SID>dolores_mitropanos_refresh()
augroup END

function! s:dolores_mitropanos_refresh() abort
  if g:colors_name ==# 'dolores-mitropanos'
    lua require("dolores").colorscheme("dolores-mitropanos")
  endif
endfunction
