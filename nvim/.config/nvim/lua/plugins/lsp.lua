return {
	{
		"williamboman/mason.nvim",
		config = true
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = { "hrsh7th/cmp-nvim-lsp", "williamboman/mason-lspconfig.nvim" },
		config = function()
			local capabilities = require('cmp_nvim_lsp').default_capabilities()

			local mason_lspconfig = require("mason-lspconfig")
			mason_lspconfig.setup({
				ensure_installed = { "tailwindcss", "ts_ls", "jsonls", "bashls", "yamlls", "html", "gopls", },
				automatic_installation = true
			})

			mason_lspconfig.setup_handlers({
				function(server_name)
					local config = {
						capabilities = capabilities,
					}

					if server_name == "lua_ls" then
						config.on_init = function(client)
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
						end
						config.settings = {
							Lua = {}
						}
					end

					require("lspconfig")[server_name].setup(config)
				end,
			})

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
