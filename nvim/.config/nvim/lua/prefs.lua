vim.opt.omnifunc = 'syntaxcomplete#Complete'
vim.opt.expandtab = false

vim.opt.clipboard = 'unnamedplus'
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.number = true
vim.opt.backup = false
vim.opt.writebackup = false

vim.opt.undofile = true

local undodir = '/tmp/.vim-undo-dir'
vim.opt.undodir = undodir
os.execute('mkdir -p ' .. undodir)

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
