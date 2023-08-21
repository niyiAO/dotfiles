vim.opt.omnifunc = 'syntaxcomplete#Complete'
vim.opt.expandtab = false

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.number = true
vim.opt.backup = false
vim.opt.writebackup = false

vim.opt.undofile = true

local undodir = '/tmp/.vim-undo-dir'
vim.opt.undodir = undodir
os.execute('mkdir -p ' .. undodir)
