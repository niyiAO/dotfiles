let mapleader = " "
map <Space> <Leader> 

nnoremap + ddp
nnoremap - ddkP
nnoremap <C-n> :set relativenumber!<CR>
nnoremap ; :
nnoremap <Leader>- :split<CR>
nnoremap <Leader>\ :vsplit<CR>
nnoremap <Leader>q :close<CR>
nnoremap <Leader><Leader>w :x<CR>
nnoremap <Leader><Leader>q :q!<CR>
nnoremap <Leader>w :w<CR>
nnoremap <C-\> <Esc>:Vex<CR>
nnoremap <Leader>l :noh<CR>

nnoremap <silent> <C-[> :bprev<CR>
nnoremap <silent> <C-]> :bnext<CR>

nnoremap <Leader><Right> <C-w><Right><CR>
nnoremap <Leader><Left> <C-w><Left><CR>
nnoremap <Leader><Up> <C-w><Up><CR>
nnoremap <Leader><Down> <C-w><Down><CR>
nnoremap <C-h> b
nnoremap <C-l> w
nnoremap <C-k> {
nnoremap <C-j> }

nnoremap <Leader>y "+y
nnoremap <Leader>p "+p
nnoremap <Leader><Leader>p "*p
nnoremap <Leader><Leader><Leader> <nop>
nnoremap <Leader><Tab> <C-^>
nnoremap <C-p> :Files<CR>

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

