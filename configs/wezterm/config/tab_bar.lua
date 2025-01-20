local colors = {
	rosewater = "#f4dbd6",
	text = "#cad3f5",
	base = "#24273a",
	crust = "#181926",
	mantle = "#1e2030",
	surface0 = "#363a4f",
	surface1 = "#494d64",
	surface2 = "#5b6078",
	accent = "#c6a0f6",
}

return {
	background = colors.crust,
	active_tab = {
		bg_color = colors.accent,
		fg_color = colors.crust,
		intensity = "Normal",
		italic = false,
		underline = "None",
		strikethrough = false,
	},
	inactive_tab = {
		bg_color = colors.mantle,
		fg_color = colors.text,
		intensity = "Normal",
		italic = false,
		underline = "None",
		strikethrough = false,
	},
	inactive_tab_hover = {
		bg_color = colors.base,
		fg_color = colors.text,
		intensity = "Normal",
		italic = false,
		underline = "None",
		strikethrough = false,
	},
	new_tab = {
		bg_color = colors.surface0,
		fg_color = colors.text,
		intensity = "Normal",
		italic = false,
		underline = "None",
		strikethrough = false,
	},
	new_tab_hover = {
		bg_color = colors.surface1,
		fg_color = colors.text,
		intensity = "Normal",
		italic = false,
		underline = "None",
		strikethrough = false,
	},
}

