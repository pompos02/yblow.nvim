lua << EOF
require("yblow").colorscheme("yblow-gruvbox")
EOF

augroup yblow_gruvbox_background
  autocmd!
  autocmd OptionSet background call <SID>yblow_gruvbox_refresh()
augroup END

function! s:yblow_gruvbox_refresh() abort
  if g:colors_name ==# 'yblow-gruvbox'
    lua require("yblow").colorscheme("yblow-gruvbox")
  endif
endfunction
