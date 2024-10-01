vim.opt.laststatus = 2

vim.opt.statusline =
  " %f" ..
  " %#WildMenu#%( %M%r %)" ..
  "%#Ignore#%=%#StatusLine#" ..
  " %l/%L %y "

vim.opt.list = true
vim.opt.listchars = {
  tab = "┆ ", -- good options ┊ ┆ │
}

vim.cmd([[
set notermguicolors
colorscheme noctu
]])

vim.opt.signcolumn = "yes:1"
