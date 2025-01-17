---@type wezterm
local wezterm = require("wezterm")
local M = {}

---merge two tables, t2 overwriting if nessesary t1
---@param t1 table
---@param t2 table
---@return table
M.tableMerge = function(t1, t2)
  for k, v in pairs(t2) do
    if type(v) == "table" then
      if type(t1[k] or false) == "table" then
        M.tableMerge(t1[k] or {}, t2[k] or {})
      else
        t1[k] = v
      end
    else
      t1[k] = v
    end
  end
  return t1
end

---check if a table contains a value
---@param t table
---@param val any
---@return boolean
M.tableContains = function(t, val)
  for _, v in ipairs(t) do
    if v == val then
      return true
    end
  end
  return false
end

---check if running on Linux
---@return boolean
M.is_linux = function()
  return wezterm.target_triple:find("linux") ~= nil
end

---check if running on macOS
---@return boolean
M.is_darwin = function()
  return wezterm.target_triple:find("darwin") ~= nil
end


--- Represents information about a tab
---@class TabInfo
---@field tab_title string The title explicitly set for the tab
---@field active_pane PaneInfo Information about the active pane

--- Represents information about a pane
---@class PaneInfo
---@field title string The title of the pane

--- Get the tab title
---@param tab_info TabInfo Information about the tab
---@return string The computed tab title
M.tab_title = function(tab_info)
	local title = tab_info.tab_title
	if title and #title > 0 then
		return title
	end
	return tab_info.active_pane.title
end

return M
