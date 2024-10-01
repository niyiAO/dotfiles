return {
	"mhinz/vim-startify",
	"ervandew/supertab",
	"tpope/vim-repeat",
	"tpope/vim-surround",
	"tpope/vim-commentary",
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{
		"windwp/nvim-ts-autotag",
		ft = {"html", "typescriptreact", "javascriptreact"},
		config = true,
	},
}
