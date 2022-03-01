" -------------------------
" Misc {{{
" -------------------------
" Enable ftplugins
filetype plugin indent on

" Compatibility
set nocompatible

" Show numbers
set number
set relativenumber

" Colors and themes
syntax on
colorscheme slate

" Indentation
set autoindent
set tabstop=8
set softtabstop=8
set shiftwidth=4

" Wildmenu
set wildmenu
"set wildmode=longest:full
"set wildmode=list,longest
set wildcharm=<C-Z>

" Buffers
set hidden " buffers can be hidden despite being modified

" Search
set hlsearch " Highlight searches
set incsearch " Start the search when typing
set smartcase " Ignore case when search is in lower-case
" Toggle hls
nmap <F8> :set hls!<CR>

"
set showmatch " Highlight matching parenthesis

" History
set history=1000
set undolevels=1000

" Supress sounds
set visualbell
set noerrorbells

" Encoding
set encoding=UTF-8

" List chararacters
" set list " End lines with "$" character
set listchars=tab:>-,eol:<,nbsp:% 
" Toggle list characters
nmap <F6> :set list! <CR>

" Mouse
"set mouse=a " Activate mouse

" Fuzzy finder
set path+=**10

" Wrap lines
set wrap
" set textwidth=78

" Spell
set spelllang=en,fr
" Toggle spellcheck
nmap <F7> :setlocal spell!<CR>

" ----------------------}}}
" Mapings {{{
" -------------------------

" Disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <right> <nop>
nnoremap <left> <nop>

vnoremap <up> <nop>
vnoremap <down> <nop>
vnoremap <right> <nop>
vnoremap <left> <nop>

inoremap <up> <nop>
inoremap <down> <nop>
inoremap <right> <nop>
inoremap <left> <nop>

" Resize window with arrows
nnoremap <Up>    :resize -2<CR>
nnoremap <Down>  :resize +2<CR>
nnoremap <Left>  :vertical resize -2<CR>
nnoremap <Right> :vertical resize +2<CR>

" j and k occur on display lines instead of real lines
" nnoremap j gj
" nnoremap k gk

" gj and gk occur on real lines instead of display lines
" nnoremap gj j
" nnoremap gk k

" Replace C-W + hjkl by C-hjkl
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

" Disable arrow keys in command line mode
cnoremap <up> <nop>
cnoremap <down> <nop>

" Make <C-p> and <C-n> filter the command history
cnoremap <C-p> <up>
cnoremap <C-n> <down>

" Keep selection in select mode after shifting
vnoremap > >gv
vnoremap < <gv

" c-s for saving, also in insert mode
nnoremap <C-S> :update<CR>
inoremap <C-S> <C-O>:update<CR>

" Very magic mode for regex (use extended regex)
nnoremap / /\v
vnoremap / /\v
cnoremap %s/ %smagic/
cnoremap \>s/ \>smagic/
nnoremap :g/ :g/\v
nnoremap :g// :g//

" Quickfix

nnoremap [c :cprevious<CR>
nnoremap ]c :cnext<CR>
nnoremap [C :cfirst<CR>
nnoremap ]C :clast<CR>
nnoremap [<c-c> :cpfile<CR>
nnoremap ]<c-q> :cnfile<CR>

" Location

nnoremap [l :lprevious<CR>
nnoremap ]l :lpnext<CR>
nnoremap [L :lfirst<CR>
nnoremap ]L :llast<CR>
nnoremap [<c-l> :lpfile<CR>
nnoremap ]<c-l> :lnfile<CR>

" Buffer

nnoremap [b :bprevious<CR>
nnoremap ]b :bnext<CR>
nnoremap [B :bfirst<CR>
nnoremap ]B :blast<CR>

" Args

nnoremap [a :previous<CR>
nnoremap ]a :next<CR>
nnoremap [A :first<CR>
nnoremap ]A :last<CR>

" Tags 
nnoremap [t :tprevious<CR>
nnoremap ]t :tnext<CR>
nnoremap [T :tfirst<CR>
nnoremap ]T :tlast<CR>

" Forget to sudo ...
cnoremap w!! w !sudo tee > /dev/null %

" ----------------------}}}
" French azerty mappings {{{
" -------------------------

" Go to mark
nmap è `
omap è `

" go to last buffer <C-->

" Swap case
vnoremap é ~
nnoremap é ~

" Easier brackets key mappings
nmap à ]
nmap ç [

" remap 'go to next mark' for brackets
nnoremap çè [`
nnoremap àè ]`

" remap bracket marks
nnoremap èç `[
nnoremap èà `]

" ----------------------}}}
" Leader key mappings {{{
" -------------------------

" Set space as leader key
nnoremap <SPACE> <Nop>
let mapleader =" "

" Edit vimrc shortcuts
nnoremap <Leader>ev :tab new $MYVIMRC<cr>
nnoremap <Leader>sv :source $MYVIMRC<cr>

" Shortcut to  set cursor line and column
hi CursorLine   cterm=underline ctermbg=NONE ctermfg=NONE
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
" set colorcolumn=80
" set cursorline
" hi CursorLine ctermbg=0
" hi CursorLineNR ctermbg=8

" Shortcut to trim blanks
nnoremap <Leader><Leader><space> :%s/\s\+$//e<cr>
nnoremap <Leader><Leader><tab> :%s/<space><tab>/<tab>/gc<cr>

" Shortcuts for the terminal
nnoremap <Leader>t :belowright terminal<cr>

" Mappings to access buffers
" \l       : list buffers
" \n \p \a : go next/previous/last-used
" \1 \2 \3 : go to buffer 1/2/3 etc
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>p :bp<CR>
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>a :e#<CR>
nnoremap <Leader>& :1b<CR>
nnoremap <Leader>é :2b<CR>
nnoremap <Leader>" :3b<CR>
nnoremap <Leader>' :4b<CR>
nnoremap <Leader>( :5b<CR>
nnoremap <Leader>- :6b<CR>
nnoremap <Leader>è :7b<CR>
nnoremap <Leader>_ :8b<CR>
nnoremap <Leader>ç :9b<CR>
nnoremap <Leader>à :10b<CR>

" Browse MRU files
nnoremap <Leader>u :browse oldfiles<CR>

" List and chosse buffer
nnoremap <leader>, :ls<CR>:b<Space>

" Switch CWD to the directory of the open buffer
nmap <leader>cd :cd %:p:h<cr>:pwd<cr>

" Buffers navigation
nmap <leader>j :bnext<cr>
nmap <leader>k :bprevious<cr>

" Managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>

" Quick yanking to the end of the line
nnoremap Y y$

" Indent all documents using g= 
nnoremap g= mmgg=G`m

" Paste from yank register 
xnoremap <leader>p "0p
nnoremap <leader>p "0p

" ----------------------}}}
" Netrw {{{
" -------------------------

let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_browse_split=4
let g:netrw_winsize = 18
let g:netrw_altv=1
let g:netrw_cursor=0 " set user's cursor line in netrw

" Open netrw at startup
" augroup netrw
"	autocmd!
"	autocmd VimEnter * :Lexplore
"	autocmd
" augroup END

" Function toggle netrw
let g:NetrwIsOpen=0
function! ToggleNetrw()
    if g:NetrwIsOpen
	let i = bufnr("$")
	while (i >= 1)
	    if (getbufvar(i, "&filetype") == "netrw")
		silent exe "bwipeout " . i
	    endif
	    let i-=1
	endwhile
	let g:NetrwIsOpen=0
    else
	let g:NetrwIsOpen=1
	silent Vexplore"! for right side
	silent :hi CursorLine term=bold cterm=bold ctermbg=8
	silent :setlocal cursorline
    endif
endfunction

" Maping toggle netrw
nnoremap <silent> ù :call ToggleNetrw()<CR>

" ----------------------}}}
" Status line {{{
" -------------------------

set showmode

set laststatus=2 " always enable status line
set ruler " position in %
set statusline=%<\%0*\ %n\ %F\ %h%m%r%=%-14.(%l/%L,%c%V%)\ %P\ %{FugitiveStatusline()} " statusline with Fugitive
" set statusline=%<\%0*\ %n\ %F\ %h%m%r%=%-14.(%l/%L,%c%V%)\ %P\ %{b:git_branch}\ " statusline with functions below

" %< - where to truncate the line if too long
" %0* - restore normal highlight
" %n - buffer number
" %F - buffer name (path to a file, or something)
" %h - help flag
" %m - modified flag
" %r - readonly flag
" %= - separater between the left (buffer name) and the right (ruler) parts
" %-14.(...%) - minimum field width == 14
" %l - line
" %L - line (total)
" %c - column
" %V - virtual column
" %P - percentage

" Git branch for statusline
function Gitbranch()
    " return trim(system("git -C " . expand("%:h") . " branch --show-current 2>NUL")) " windows way
    return trim(system("git -C " . expand("%:h") . " branch --show-current 2>/dev/null")) " linux way
endfunction
augroup Gitget
    autocmd!
    autocmd BufEnter * let b:git_branch = Gitbranch()
augroup END

" ----------------------}}}
" Tab line {{{
" -------------------------

set showtabline=1 " Only if there are at least two tab pages

" Presentation mode
nmap <F5> :set relativenumber! number! showmode! showcmd! hidden! ruler! <CR> :execute 'set showtabline=' . (&showtabline ==# 0 ? 2 : 0)<CR> :execute 'set laststatus=' . (&laststatus ==# 0 ? 2 : 0) <CR>

" --------------------}}}
" Folds and views {{{
" -------------------------

" if has('folding')
" 	set foldmethod=indent
" endif

set foldcolumn=1

" open and close folds automatically when jumping around
set foldopen=block,hor,mark,percent,quickfix,search,tag,undo
set foldclose=all

set viewdir=$HOME/.vim/view/

" Automatic mkview to remember folds
augroup vimrc
    autocmd BufWritePost *
		\   if expand('%') != '' && &buftype !~ 'nofile'
		\|      mkview
		\|  endif
    autocmd BufRead *
		\   if expand('%') != '' && &buftype !~ 'nofile'
		\|      silent loadview
		\|  endif
augroup END

set viewoptions=folds,cursor,curdir

" ----------------------}}}
" Persistence {{{
" -------------------------

" Persistent undo
set undodir=$HOME/.vim/undo/
set undofile

" .viminfo 

set viminfo='500,f1,:500,<500,/500,%,s100,h,c
" "500 : file numbers to store marks 
" f1 : save global marks
" :500 : lines in command-line history
" <500 : lines in registers
" /500 : lines in search history
" % : buffer list
" s100 : line marks limit in Kbyte
" h : disable hls when loading .viminfo
" c : encoding

" -------------------------
" Sessions
" -------------------------

set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize,terminal,slash,unix

" add shortcuts with leader key for making sessions and viminfo and restore it ?

" ----------------------}}}
" Encryption {{{
" -------------------------

set cm=blowfish2
" use gpg or pgp with autocommand instead ?


" ---------------------}}}
" Colors {{{
" -------------------------

" StatusLine
highlight StatusLine		term=bold cterm=bold ctermfg=0 ctermbg=2	"status line of current window
highlight StatusLineNC		term=bold cterm=bold ctermfg=2 ctermbg=8	"status lines of not-current windows
au InsertEnter * hi StatusLine term=bold cterm=bold ctermbg=0 ctermbg=3		"status line when entering insert mode
au InsertLeave * hi StatusLine term=bold cterm=bold ctermfg=0 ctermbg=2		"reset when leaving insert mode

" Tabline
highlight TabLine		term=bold cterm=bold ctermfg=2 ctermbg=8	"tab pages line, not active tab page label
highlight TabLineFill		term=bold cterm=bold ctermfg=8 ctermbg=8	"tab pages line, where there are no labels
highlight TabLineSel		term=bold cterm=bold ctermfg=0 ctermbg=2	"tab pages line, active tab page label

" Terminal
highlight StatusLineTerm	term=bold cterm=bold ctermfg=8 ctermbg=4	"status line of current window
highlight StatusLineTermNC	term=bold cterm=bold ctermfg=4 ctermbg=8	"status lines of not-current windows 
highlight Terminal		term=bold cterm=bold ctermfg=15 ctermbg=0	"terminal window

" Splits
highlight VertSplit		term=bold cterm=bold ctermfg=8 ctermbg=0	"vertical split

" Numbers
highlight LineNR 		term=bold cterm=bold ctermfg=8 ctermbg=0	"numbers on the ruler
highlight CursorLineNR		term=bold cterm=bold ctermfg=2 ctermbg=0	"cursor number on the ruler

" Folds
highlight Folded		term=bold cterm=bold ctermfg=2 ctermbg=0	"fold
highlight FoldColumn		term=bold cterm=bold ctermfg=0 ctermbg=0	"fold column (ruler)

" Pop-up menu
highlight Pmenu			term=bold cterm=bold ctermfg=15 ctermbg=8	"normal item
highlight PmenuSel		term=bold cterm=bold ctermfg=8 ctermbg=2	"selected item
highlight PmenuSbar		term=bold cterm=bold ctermfg=0 ctermbg=15	"scrollbar
highlight PmenuThumb		term=bold cterm=bold ctermfg=0 ctermbg=2	"thumb of scrollbar

"0 -> Black
"2 -> Green
"3 -> Yellow
"4 -> Blue
"8 -> Grey
"15 -> White

" ----------------------}}}
" Work in progress {{{
" -------------------------

" Change colorscheme for markdown file
" autocmd WinEnter,FileType markdown colorscheme default

" Faire des abbrÃ©viations pour les insertions utilisÃ©s couramment ?
" iabbrev: #ct #####################


" Always open help in an other tab
" nnoremap :help :tab help

let g:markdown_folding=1

au BufRead,BufNewFile *.md setfiletype markdown

" ----------------------}}}
" Plugins configurations and bindings {{{
" -------------------------

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=number
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    " nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    " nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" autocomplete options
set completeopt=menuone,noinsert,noselect,preview

" asyncomplete-file registration
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
    \ 'name': 'file',
    \ 'allowlist': ['*'],
    \ 'priority': 10,
    \ 'completor': function('asyncomplete#sources#file#completor')
    \ }))

" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"

" asyncomplete-Ultisnips registration
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
            \ 'name': 'ultisnips',
            \ 'whitelist': ['*'],
            \ 'completor': function('asyncomplete#sources#ultisnips#completor')
            \ }))

" tmuxcomplete registration

let g:tmuxcomplete#asyncomplete_source_options = {
            \ 'name':      'tmuxcomplete',
            \ 'whitelist': ['*'],
            \ 'config': {
            \     'splitmode':      'words',
            \     'filter_prefix':   1,
            \     'show_incomplete': 1,
            \     'sort_candidates': 0,
            \     'scrollback':      0,
            \     'truncate':        0
            \     }
            \ }

" ----------------------}}}

" vim: foldmethod=marker:foldmarker={{{,}}}
