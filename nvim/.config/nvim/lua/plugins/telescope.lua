return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-ui-select.nvim" },
	config = function()
		require("telescope").setup({
			pickers = {
				find_files = {
					hidden = true,
					theme = "ivy",
				},
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({}),
				},
			},
		})
		local builtin = require("telescope.builtin")
    nmap("<C-p>", builtin.find_files)
    nmap("<leader>fg", builtin.live_grep)

		require("telescope").load_extension("ui-select")
	end,
}
