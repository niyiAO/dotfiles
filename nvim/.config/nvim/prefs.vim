set omnifunc=syntaxcomplete#Complete
set noexpandtab
set tabstop=2
set shiftwidth=2
set number 
set nobackup
set nowritebackup

if !isdirectory("/tmp/.vim-undo-dir")
	call mkdir("/tmp/.vim-undo-dir", "", 0700)
endif

set undodir=/tmp/.vim-undo-dir
set undofile

let g:user_emmet_install_global = 0
let g:netrw_winsize = 25
let g:netrw_browse_split = 4
autocmd FileType html,css,vue,html.handlebars EmmetInstall

filetype plugin on
