let g:markdown_folding=1

" convert current md file to pdf with pandoc
setlocal makeprg=pandoc\ %\ -o\ %:r.pdf

setlocal colorcolumn=80

" vim: foldmethod=marker:foldmarker={{{,}}}
