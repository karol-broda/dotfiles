local wezterm = require("wezterm")
local utils = require("config.utils")

local function apply(config)
	if utils.is_darwin() then
		config.window_decorations = "RESIZE|INTEGRATED_BUTTONS"
		config.window_padding = { left = 0, right = 0, top = 50, bottom = 0 }
	elseif utils.is_linux() then
		config.window_decorations = "NONE"
		config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
	end

	wezterm.on("window-config-reloaded", function(window, _)
		local screen_info = wezterm.gui.screens().active
		local overrides = window:get_config_overrides() or {}

		if screen_info then
			local is_small_screen = screen_info.dpi >= 184
			if is_small_screen then
				overrides.window_padding = { left = 0, right = 0, top = 25, bottom = 0 }
			else
				overrides.window_padding = { left = 0, right = 0, top = 50, bottom = 0 }
			end
		end

		window:set_config_overrides(overrides)
	end)
end

return {
	apply = apply,
}
