local wezterm = require 'wezterm'
local nerdfonts = wezterm.nerdfonts
package.path = package.path .. ';' .. wezterm.config_dir .. '/config/?.lua'

local config = wezterm.config_builder()
local utils = require("config.utils")

config.front_end = "WebGpu"

config.font = wezterm.font_with_fallback({
	"JetBrains Mono",
	"Symbols Nerd Font Mono",
	"Noto Color Emoji",
})

config.font_size = 12.5
config.line_height = 1.1
config.color_scheme = "Catppuccin Macchiato"

config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false

if utils.is_darwin() then
	config.window_decorations = "RESIZE|INTEGRATED_BUTTONS"
	config.window_padding = { left = 0, right = 0, top = 25, bottom = 0 }
else
	config.window_decorations = "NONE"
	config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
end

config.adjust_window_size_when_changing_font_size = false
config.window_background_opacity = 0.7

config.keys = {
	{ key = "c",          mods = "CTRL|SHIFT", action = wezterm.action.CopyTo 'Clipboard' },
	{ key = "v",          mods = "CTRL|SHIFT", action = wezterm.action.PasteFrom 'Clipboard' },
	{ key = "t",          mods = "CTRL|SHIFT", action = wezterm.action.SpawnTab 'DefaultDomain' },
	{ key = "w",          mods = "CTRL|SHIFT", action = wezterm.action.CloseCurrentTab { confirm = true } },
	{ key = "LeftArrow",  mods = "CTRL|SHIFT", action = wezterm.action.ActivateTabRelative(-1) },
	{ key = "RightArrow", mods = "CTRL|SHIFT", action = wezterm.action.ActivateTabRelative(1) },
	{ key = "UpArrow",    mods = "SHIFT",      action = wezterm.action.ScrollToPrompt(-1) },
	{ key = "DownArrow",  mods = "SHIFT",      action = wezterm.action.ScrollToPrompt(1) },
	{ key = "LeftArrow",  mods = "ALT",        action = wezterm.action.SendString("\x1b[1;5D") },
	{ key = "RightArrow", mods = "ALT",        action = wezterm.action.SendString("\x1b[1;5C") },
}

config.tab_max_width = 32

return config
