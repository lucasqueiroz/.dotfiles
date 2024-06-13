local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Frappe"

config.font = wezterm.font("FiraMono Nerd Font Mono")
config.font_size = 12.0
config.window_decorations = "NONE"

config.use_fancy_tab_bar = false

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.show_new_tab_button_in_tab_bar = false

config.colors = {
	tab_bar = {
		background = "#303446",
	},
}

config.tab_max_width = 50

function get_formatted_process_name(tab)
	return string.gsub(tab.active_pane.foreground_process_name, "(.*[/\\])(.*)", "%2")
end

function get_formatted_working_dir(pane)
	local current_dir = pane:get_current_working_dir().path
	local HOME_DIR = string.format("file://%s", os.getenv("HOME"))

	return current_dir == HOME_DIR and "." or string.gsub(current_dir, "(.*[/\\])(.*)", "%2")
end

function tab_title(tab)
	local title = tab.tab_title
	if title and #title > 0 then
		return title
	end
	return get_formatted_process_name(tab)
end

wezterm.on("format-tab-title", function(tab, _, _, _, _, _)
	local title = tab_title(tab)
	local background = { Background = { Color = "#303446" } }
	local foreground = { Foreground = { Color = "#A5ADCE" } }
	if tab.is_active then
		foreground = { Foreground = { Color = "#8CAAEE" } }
	end
	local index = tab.tab_index + 1
	return {
		background,
		foreground,
		{ Text = " " .. index .. " | " .. title .. " " },
	}
end)

wezterm.on("update-status", function(window, pane)
	local working_dir = get_formatted_working_dir(pane)
	local right_status = {
		{ Foreground = { Color = "#8CAAEE" } },
		{ Text = " " .. working_dir .. " " },
	}
	window:set_right_status(wezterm.format(right_status))
end)

config.window_close_confirmation = "NeverPrompt"

return config
