lua << EOF
require("yblow").colorscheme("yblow-github")
EOF

augroup yblow_github_background
  autocmd!
  autocmd OptionSet background call <SID>yblow_github_refresh()
augroup END

function! s:yblow_github_refresh() abort
  if g:colors_name ==# 'yblow-github'
    lua require("yblow").colorscheme("yblow-github")
  endif
endfunction
