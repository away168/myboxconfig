-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()
local act = wezterm.action

-- This is where you actually apply your config choices
config.leader = { key = "t", mods = "CTRL", timeout_milliseconds = 1000 }

config.keys = {
	-- splitting
	{
		mods = "LEADER",
		key = "-",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "|",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "m",
		action = wezterm.action.TogglePaneZoomState,
	},
	{
		mods = "LEADER",
		key = "j",
		action = act.RotatePanes("CounterClockwise"),
	},
	{
		mods = "LEADER",
		key = "k",
		action = act.RotatePanes("Clockwise"),
	},
	{
		key = "h",
		mods = "CTRL",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "l",
		mods = "CTRL",
		action = act.ActivatePaneDirection("Right"),
	},
	{
		key = "k",
		mods = "CTRL",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		key = "j",
		mods = "CTRL",
		action = act.ActivatePaneDirection("Down"),
	},
	{
		key = "H",
		mods = "CTRL",
		action = act.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "J",
		mods = "CTRL",
		action = act.AdjustPaneSize({ "Down", 5 }),
	},
	{
		key = "K",
		mods = "CTRL",
		action = act.AdjustPaneSize({ "Up", 5 }),
	},
	{
		key = "L",
		mods = "CTRL",
		action = act.AdjustPaneSize({ "Right", 5 }),
	},
}
-- my coolnight colorscheme
config.colors = {
	foreground = "#CBE0F0",
	background = "#011423",
	cursor_bg = "#47FF9C",
	cursor_border = "#47FF9C",
	cursor_fg = "#011423",
	selection_bg = "#033259",
	selection_fg = "#CBE0F0",
	ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
	brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
	tab_bar = {
		-- The color of the strip that goes along the top of the window
		-- (does not apply when fancy tab bar is in use)
		background = "#011423",

		active_tab = {
			bg_color = "#0b3052",
			fg_color = "#c0c0c0",
		},
		inactive_tab = {
			bg_color = "#011423",
			fg_color = "#808080",
		},
		inactive_tab_hover = {
			bg_color = "#011423",
			fg_color = "#909090",
		},
		new_tab = {
			bg_color = "#011423",
			fg_color = "#808080",
		},
		new_tab_hover = {
			bg_color = "#3b3052",
			fg_color = "#909090",
		},
	},
}

-- config.keys = {
-- 	-- Turn off the default CMD-m Hide action, allowing CMD-m to
-- 	-- be potentially recognized and handled by the tab
-- 	{
-- 		key = "t",
-- 		mods = "CMD",
-- 		action = wezterm.action.DisableDefaultAssignment,
-- 	},
--}

config.font = wezterm.font("FiraCode Nerd Font Mono")
config.font_size = 16

--config.enable_tab_bar = false
config.use_fancy_tab_bar = false

config.window_decorations = "RESIZE"
config.window_background_opacity = 0.85
config.macos_window_background_blur = 10

-- and finally, return the configuration to wezterm
return config
