return {
	"mattn/emmet-vim",
	ft = {"html", "css", "vue", "html.handlebars", "javascriptreact", "typescriptreact"},
  init = function ()
    vim.g.user_emmet_install_global = 0
    vim.g.user_emmet_leader_key = ','
  end,
	config = function()
    vim.cmd("EmmetInstall")
  end
}
