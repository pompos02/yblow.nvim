lua << EOF
require("dolores").colorscheme("dolores-thalasses")
EOF

augroup dolores_onedark_background
  autocmd!
  autocmd OptionSet background call <SID>dolores_onedark_refresh()
augroup END

function! s:dolores_onedark_refresh() abort
  if g:colors_name ==# 'dolores-thalasses'
    lua require("dolores").colorscheme("dolores-thalasses")
  endif
endfunction
