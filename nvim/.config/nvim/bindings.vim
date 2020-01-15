let mapleader = " "
map <Space> <Leader> 

nnoremap + ddp
nnoremap - :.move-2<CR>
nnoremap <C-n> :set relativenumber!<CR>
nnoremap ; :
nnoremap <Leader>- :split<CR>
nnoremap <Leader>\ :vsplit<CR>
nnoremap <Leader>q :close<CR>
nnoremap <Leader><Leader>w :x<CR>
nnoremap <Leader><Leader>q :q!<CR>
nnoremap <Leader>w :w<CR>
nnoremap <C-\> <Esc>:NERDTreeToggle<CR>
nnoremap <C-l> :noh<CR>

nnoremap <Leader>y "+y
nnoremap <Leader>p "+p
nnoremap <Leader><Leader>p "*p
nnoremap <Leader><Leader><Leader> <nop>
nnoremap <Leader><Tab> :e #<CR>

vnoremap * y/<C-r>"<CR>

"autoclose and position cursor to write text inside
inoremap ' ''<left>
inoremap ` ``<left>
inoremap " ""<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>

"autoclose and ignore
inoremap '' ''
inoremap `` ``
inoremap "" ""
inoremap () ()
inoremap [] []
inoremap {} {}

"autoclose 2 lines below and position cursor in the middle 
inoremap '<CR> '<CR>'<ESC>O
inoremap `<CR> `<CR>`<ESC>O
inoremap "<CR> "<CR>"<ESC>O
inoremap (<CR> (<CR>)<ESC>O
inoremap [<CR> [<CR>]<ESC>O
inoremap {<CR> {<CR>}<ESC>O

let g:user_emmet_leader_key=','

