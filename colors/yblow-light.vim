lua << EOF
require("yblow").colorscheme("yblow-light")
EOF

augroup yblow_light_background
  autocmd!
  autocmd OptionSet background call <SID>yblow_light_refresh()
augroup END

function! s:yblow_light_refresh() abort
  if g:colors_name ==# 'yblow-light'
    lua require("yblow").colorscheme("yblow-light")
  endif
endfunction
