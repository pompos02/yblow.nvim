lua << EOF
require("dolores").colorscheme("dolores-sotiria-bellou")
EOF

augroup dolores_gruvbox_background
  autocmd!
  autocmd OptionSet background call <SID>dolores_gruvbox_refresh()
augroup END

function! s:dolores_gruvbox_refresh() abort
  if g:colors_name ==# 'dolores-sotiria-bellou'
    lua require("dolores").colorscheme("dolores-sotiria-bellou")
  endif
endfunction
