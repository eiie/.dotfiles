autocmd WinEnter,BufWinEnter,FocusGained iabbrev {{ "{{  }}"<esc>F{li

setlocal expandtab
setlocal keywordprg=ansible-doc

" fold on paragraph
setlocal foldmethod=expr
setlocal foldexpr=getline(v:lnum)=~'^\\s*$'&&getline(v:lnum+1)=~'\\S'?'<1':1
