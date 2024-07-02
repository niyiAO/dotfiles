bootstrap_lazyvim()
require('lazy').setup({
	"mhinz/vim-startify",
	"ervandew/supertab",
	"tpope/vim-repeat",
	"tpope/vim-surround",
	"tpope/vim-commentary",
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function () 
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				ensure_installed = "all",
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },  
			})
		end
	},
	{
		"echasnovski/mini.base16",
		opts = {
			palette = {
				base00 = "#000000",
				base01 = "#000000",
				base02 = "#000000",
				base03 = "#000000",
				base04 = "#000000",
				base05 = "#000000",
				base06 = "#000000",
				base07 = "#000000",
				base08 = "#000000",
				base09 = "#000000",
				base0A = "#000000",
				base0B = "#000000",
				base0C = "#000000",
				base0D = "#000000",
				base0E = "#000000",
				base0F = "#000000",
			},
			use_cterm = {
				base00 = 0,
				base01 = 8,
				base02 = 1,
				base03 = 8,
				base04 = 2,
				base05 = 1,
				base06 = 3,
				base07 = 11,
				base08 = 4,
				base09 = 12,
				base0A = 5,
				base0B = 13,
				base0C = 6,
				base0D = 14,
				base0E = 10,
				base0F = 15,
			}
		}
	},
	{
		'stevearc/oil.nvim',
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = true
	},
	require("plugins/emmet"),
})
