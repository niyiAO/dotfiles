vim.opt.laststatus = 2

vim.opt.statusline = 
  " %f" ..
  " %#WildMenu#%( %M%r %)" ..
  "%#Ignore#%=%#StatusLine#" ..
  " %l/%L %y "

vim.opt.list = true
vim.opt.listchars = {
  tab = "┆ ",
}

vim.cmd([[
highlight Normal guibg=none ctermbg=none
highlight EndOfBuffer cterm=none ctermfg=0
highlight StatusLine cterm=bold,reverse ctermfg=9 ctermbg=0 
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1
]])


