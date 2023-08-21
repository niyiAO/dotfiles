bootstrap_lazyvim()
require('lazy').setup({
	"mhinz/vim-startify",
	"ervandew/supertab",
	"tpope/vim-repeat",
	"tpope/vim-surround",
	"tpope/vim-commentary",
	{
		'stevearc/oil.nvim',
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = true
	},
	require("plugins/emmet"),
})
