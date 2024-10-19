return {
	{
		"williamboman/mason.nvim",
		config = true
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			automatic_installation = true,
		},
		dependencies = { "williamboman/mason.nvim" }
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = { "hrsh7th/cmp-nvim-lsp", "williamboman/mason-lspconfig.nvim" },
		config = function()
			local capabilities = require('cmp_nvim_lsp').default_capabilities()

			local border = "rounded"

			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
				vim.lsp.handlers.hover, {
					border = border
				}
			)

			vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
				vim.lsp.handlers.signature_help, {
					border = border
				}
			)

			local lsps = {
				tailwindcss = { capabilities = capabilities },
				ts_ls = { capabilities = capabilities },
				jsonls = { capabilities = capabilities },
				bashls = { capabilities = capabilities },
				yamlls = { capabilities = capabilities },
				html = { capabilities = capabilities },
				gopls = { capabilities = capabilities },
				lua_ls = {
					capabilities = capabilities,
					on_init = function(client)
						if client.workspace_folders then
							local path = client.workspace_folders[1].name
							if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
								return
							end
						end

						client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
							runtime = {
								version = 'LuaJIT'
							},
							diagnostics = {
								disable = { "lowercase-global" }
							},
							workspace = {
								checkThirdParty = false,
								library = {
									vim.env.VIMRUNTIME
								}
							}
						})
					end,
					settings = {
						Lua = {}
					}
				}
			}

			local lspconfig = require("lspconfig")

			for lsp, config in pairs(lsps) do
				lspconfig[lsp].setup(config)
			end

			nmap("K", vim.lsp.buf.hover)
			nmap("<leader>gd", vim.lsp.buf.definition)
			nmap("<leader>gr", vim.lsp.buf.references)
			nmap("<leader>ca", vim.lsp.buf.code_action)
			nmap("<space>rn", vim.lsp.buf.rename)
		end
	},
	{
		"nvimtools/none-ls.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.prettier,
				},
			})

			nmap("<leader>gf", vim.lsp.buf.format)
		end,
	}
}
