local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Mocha"

local is_darwin = function()
	return wezterm.target_triple:find("darwin") ~= nil
end

-- Font
config.font = wezterm.font("AtkynsonMono Nerd Font Mono")
config.font_size = 12.0
if is_darwin() then
	config.font_size = 14.0
end

config.use_fancy_tab_bar = false

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.tab_max_width = 50

config.show_new_tab_button_in_tab_bar = false

config.colors = {
	tab_bar = {
		background = "#1e1e2e",
	},
}

local get_formatted_process_name = function(tab)
	return string.gsub(tab.active_pane.foreground_process_name, "(.*[/\\])(.*)", "%2")
end

local get_formatted_working_dir = function(pane)
	local current_dir = pane.current_working_dir.path
	local HOME_DIR = os.getenv("HOME")

	if current_dir == HOME_DIR then
		return "~"
	end

	return string.gsub(current_dir, "(.*[/\\])(.*)", "%2")
end

local tab_title = function(tab)
	local title = tab.tab_title
	if title and #title > 0 then
		return title
	end
	return get_formatted_working_dir(tab.active_pane)
end

wezterm.on("format-tab-title", function(tab, _, _, _, _, _)
	local title = tab_title(tab)
	local background = { Background = { Color = "#1e1e2e" } }
	local foreground = { Foreground = { Color = "#bac2de" } }
	if tab.is_active then
		foreground = { Foreground = { Color = "#cba6f7" } }
	end
	local index = tab.tab_index + 1
	return {
		background,
		foreground,
		{ Text = " " .. index .. " | " .. title .. " " },
	}
end)

config.window_close_confirmation = "NeverPrompt"

return config