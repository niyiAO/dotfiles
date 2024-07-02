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
set notermguicolors
highlight EndOfBuffer cterm=none ctermfg=0
highlight StatusLine cterm=bold,reverse ctermfg=9 ctermbg=0
highlight LineNr ctermbg=none
]])


