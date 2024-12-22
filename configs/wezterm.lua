local wezterm = require 'wezterm'

return {
  front_end = "WebGpu",
  font = wezterm.font_with_fallback({
    "JetBrains Mono",
    "Symbols Nerd Font Mono",
    "Noto Color Emoji",
  }),
  font_size = 14.0,
  line_height = 1.1,
  color_scheme = "Tokyo Night Storm",
  window_padding = {
    left = 10,
    right = 10,
    top = 5,
    bottom = 5,
  },

  enable_tab_bar = true,
  hide_tab_bar_if_only_one_tab = false,
  tab_bar_at_bottom = false,
  use_fancy_tab_bar = true,
  colors = {
    tab_bar = {
      background = "#1a1b26",
      active_tab = {
        bg_color = "#7aa2f7",
        fg_color = "#1a1b26",
      },
      inactive_tab = {
        bg_color = "#3b4261",
        fg_color = "#a9b1d6",
      },
      inactive_tab_hover = {
        bg_color = "#545c7e",
        fg_color = "#ffffff",
      },
      new_tab = {
        bg_color = "#1a1b26",
        fg_color = "#7aa2f7",
      },
      new_tab_hover = {
        bg_color = "#7aa2f7",
        fg_color = "#1a1b26",
      },
    },
  },

  keys = {
    {key="c", mods="CTRL|SHIFT", action=wezterm.action.CopyTo 'Clipboard'},
    {key="v", mods="CTRL|SHIFT", action=wezterm.action.PasteFrom 'Clipboard'},
    {key="t", mods="CTRL|SHIFT", action=wezterm.action.SpawnTab 'DefaultDomain'},
    {key="w", mods="CTRL|SHIFT", action=wezterm.action.CloseCurrentTab {confirm=true}},
    {key="LeftArrow", mods="CTRL|SHIFT", action=wezterm.action.ActivateTabRelative(-1)},
    {key="RightArrow", mods="CTRL|SHIFT", action=wezterm.action.ActivateTabRelative(1)},
  },
}

