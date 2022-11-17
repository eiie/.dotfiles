iabbrev {{ "{{  }}"<esc>F{li

setlocal expandtab
setlocal foldmethod=expr

" fold on paragraph
setlocal foldexpr=getline(v:lnum)=~'^\\s*$'&&getline(v:lnum+1)=~'\\S'?'<1':1
