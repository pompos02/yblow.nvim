lua << EOF
require("yara_blow").colorscheme()
EOF

augroup yara_blow_background
  autocmd!
  autocmd OptionSet background call <SID>yara_blow_refresh()
augroup END

function! s:yara_blow_refresh() abort
  if g:colors_name ==# 'yblow'
    lua require("yara_blow").colorscheme()
  endif
endfunction
