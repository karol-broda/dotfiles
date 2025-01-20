local wezterm = require("wezterm")

return {
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
	{
		key = "g",
		mods = "CTRL|SHIFT",
		action = wezterm.action_callback(function(window, pane)
			local last_command = pane:get_foreground_process_info().command_line
			if last_command then
				window:perform_action(
					wezterm.action.SendString(table.concat(last_command, " ") ..
						" | bat --paging=always\n"),
					pane
				)
			else
				window:toast_notification("Error", "No command found", nil, 4000)
			end
		end),
	},
	{
		key = 'm',
		mods = 'CMD',
		action = wezterm.action.DisableDefaultAssignment,
	},
}
