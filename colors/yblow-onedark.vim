lua << EOF
require("yblow").colorscheme("yblow-onedark")
EOF

augroup yblow_onedark_background
  autocmd!
  autocmd OptionSet background call <SID>yblow_onedark_refresh()
augroup END

function! s:yblow_onedark_refresh() abort
  if g:colors_name ==# 'yblow-onedark'
    lua require("yblow").colorscheme("yblow-onedark")
  endif
endfunction
