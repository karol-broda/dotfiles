local wezterm = require 'wezterm'
local utils = require("config.utils")
local tab_bar_style = require("config.tab_bar")
local key_bindings = require("config.keys")
local window_config = require("config.window")

local config = wezterm.config_builder()

config.front_end = "WebGpu"
config.font = wezterm.font_with_fallback({
	"JetBrains Mono",
	"Symbols Nerd Font Mono",
	"Noto Color Emoji",
})
config.font_size = 12.5
config.line_height = 1.1
config.color_scheme = "Catppuccin Macchiato"

config.colors = {
	tab_bar = tab_bar_style,
}
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false

config.keys = key_bindings

window_config.apply(config)

config.adjust_window_size_when_changing_font_size = false
config.window_background_opacity = 0.7
config.tab_max_width = 32

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local title = utils.get_active_program_name(tab)
	local num_windows = #tab.panes
	if num_windows > 1 then
		title = title .. " :" .. num_windows .. ":"
	end
	return { { Text = title } }
end)

wezterm.on("update-right-status", function(window, pane)
	window:set_right_status("")
end)

return config
