set laststatus=2
set statusline=
set statusline+=\ %f\ 
set statusline+=%#WildMenu#%(\ %M%r\ %)
set statusline+=%#Ignore#%=%#StatusLine#
	set statusline+=\ %l/%L\ %y\ 

set list lcs=tab:\·\·
hi EndOfBuffer cterm=none ctermfg=0
hi StatusLine cterm=bold,reverse ctermfg=9 ctermbg=0 

