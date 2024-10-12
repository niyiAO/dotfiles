local has_words_before = function()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

return {
	{
		"hrsh7th/nvim-cmp",
		event = { "InsertEnter", "CmdlineEnter" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"onsails/lspkind-nvim",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			if not vim.fn.exists("g:loaded_cmp") then
				return
			end

			vim.o.completeopt = "menuone,noinsert,noselect"

			local cmp = require("cmp")
			local lspkind = require("lspkind")
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				completion = { autocomplete = false },
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.close(),
					["<CR>"] = cmp.mapping({
						i = function(fallback)
							if cmp.visible() and cmp.get_active_entry() then
								cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
							else
								fallback()
							end
						end,
						s = cmp.mapping.confirm({ select = true }),
						c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
					}),
					['<Tab>'] = function(fallback)
						if not cmp.select_next_item() then
							if vim.bo.buftype ~= 'prompt' and has_words_before() then
								cmp.complete()
							else
								fallback()
							end
						end
					end,
					['<S-Tab>'] = function(fallback)
						if not cmp.select_prev_item() then
							if vim.bo.buftype ~= 'prompt' and has_words_before() then
								cmp.complete()
							else
								fallback()
							end
						end
					end,
				}),
				sources = cmp.config.sources({
					{ name = "path" },
					{ name = "nvim_lsp",               keyword_length = 3 },
					{ name = "nvim_lsp_signature_help" },
					-- { name = "buffer",                 keyword_length = 3 },
					{ name = "calc" },
					{ name = "luasnip" },
				}),
				formatting = {
					format = lspkind.cmp_format({ with_text = false, maxwidth = 50 }),
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
			})

			vim.cmd([[highlight! default link CmpItemKind CmpItemMenuDefault]])
		end,
	},
	{
		"hrsh7th/cmp-nvim-lsp",
		dependencies = { "hrsh7th/nvim-cmp" },
		config = true
	},
}
