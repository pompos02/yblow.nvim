lua << EOF
require("yblow").colorscheme("yblow")
EOF

augroup yblow_background
  autocmd!
  autocmd OptionSet background call <SID>yblow_refresh()
augroup END

function! s:yblow_refresh() abort
  if g:colors_name ==# 'yblow'
    lua require("yblow").colorscheme("yblow")
  endif
endfunction
