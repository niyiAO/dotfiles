local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.default_prog = { '/opt/homebrew/bin/tmux', 'new-session', "-A" }
config.window_close_confirmation = 'NeverPrompt'

config.color_scheme = 'Chalk (base16)'

config.font = wezterm.font("JetBrains Mono")
config.font_size = 16
config.line_height = 1.1

config.enable_tab_bar = false
config.window_decorations = "INTEGRATED_BUTTONS"
config.window_padding = {
  left = 16,
  right = 16,
  top = 54,
  bottom = 16,
}


config.keys = {
  {
    mods = "CMD", key = "s",
    action = wezterm.action.SendKey { key = "s", mods = "ALT" }
  },
}

config.hyperlink_rules = wezterm.default_hyperlink_rules()

-- config.mouse_bindings = {
-- 	{
-- 		event = { Up = { streak = 1, button = "Left"} },
-- 		mods = "NONE",
-- 		action = wezterm.action.CompleteSelection 'ClipboardAndPrimarySelection'
-- 	},
-- 	{
-- 		event = { Up = { streak = 1, button = "Left" } },
-- 		mods = "CTRL",
-- 		action = wezterm.action.OpenLinkAtMouseCursor,
-- 	},
-- 	{
-- 		event = { Down = { streak = 1, button = "Left" } },
-- 		mods = "CTRL",
-- 		action = wezterm.action.Nop,
-- 	}
-- }

return config
