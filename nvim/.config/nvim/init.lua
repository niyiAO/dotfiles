require 'helpers'
require 'prefs'
require 'bindings'

bootstrap_lazyvim()

require("lazy").setup("plugins", {
  ui = {
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
  },
})
require 'rice'

