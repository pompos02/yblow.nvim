lua << EOF
require("yblow").colorscheme("yblow-dark")
EOF

augroup yblow_dark_background
  autocmd!
  autocmd OptionSet background call <SID>yblow_dark_refresh()
augroup END

function! s:yblow_dark_refresh() abort
  if g:colors_name ==# 'yblow-dark'
    lua require("yblow").colorscheme("yblow-dark")
  endif
endfunction
