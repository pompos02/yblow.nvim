lua << EOF
require("yblow").colorscheme("yblow-g")
EOF

augroup yblow_g_background
  autocmd!
  autocmd OptionSet background call <SID>yblow_g_refresh()
augroup END

function! s:yblow_g_refresh() abort
  if g:colors_name ==# 'yblow-g'
    lua require("yblow").colorscheme("yblow-g")
  endif
endfunction
