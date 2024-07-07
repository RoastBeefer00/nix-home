-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action

wezterm.on("update-right-status", function(window, pane)
	window:set_right_status(window:active_workspace())
end)

local hacky_user_commands = {

	["open-tab"] = function(window, pane, cmd_context)
		window:perform_action(act.SwitchToWorkspace({ name = cmd_context.title }), pane)
		wezterm.mux.rename_workspace(wezterm.mux.get_active_workspace(), cmd_context.title)
	end,
}

wezterm.on("user-var-changed", function(window, pane, name, value)
	if name == "hacky-user-command" then
		local cmd_context = wezterm.json_parse(value)
		hacky_user_commands[cmd_context.cmd](window, pane, cmd_context)
		return
	end
end)

local function is_vim(pane)
	-- this is set by the plugin, and unset on ExitPre in Neovim
	return pane:get_user_vars().IS_NVIM == "true"
end

local direction_keys = {
	Left = "h",
	Down = "j",
	Up = "k",
	Right = "l",
	-- reverse lookup
	h = "Left",
	j = "Down",
	k = "Up",
	l = "Right",
}

local function split_nav(resize_or_move, key)
	return {
		key = key,
		mods = resize_or_move == "resize" and "META" or "CTRL",
		action = wezterm.action_callback(function(win, pane)
			if is_vim(pane) then
				-- pass the keys through to vim/nvim
				win:perform_action({
					SendKey = { key = key, mods = resize_or_move == "resize" and "META" or "CTRL" },
				}, pane)
			else
				if resize_or_move == "resize" then
					win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
				else
					win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
				end
			end
		end),
	}
end

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "tokyonight_night"
config.enable_wayland = false

config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.tab_max_width = 50

-- Leader is the same as my old tmux prefix
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	-- splitting
	{
		mods = "LEADER",
		key = "-",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "l",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "m",
		action = wezterm.action.TogglePaneZoomState,
	},
	-- show the pane selection mode, but have it swap the active and selected panes
	{
		mods = "LEADER",
		key = "0",
		action = wezterm.action.PaneSelect({
			mode = "SwapWithActive",
		}),
	},
	{
		mods = "LEADER",
		key = "x",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	{
		mods = "LEADER",
		key = "s",
		action = wezterm.action.ShowLauncherArgs({
			flags = "WORKSPACES",
		}),
	},
	{
		key = "p",
		mods = "LEADER",
		action = act.ActivateTabRelative(-1),
	},
	{
		key = "n",
		mods = "LEADER",
		action = act.ActivateTabRelative(1),
	},
	{
		key = "c",
		mods = "LEADER",
		action = act.SpawnTab("CurrentPaneDomain"),
	},
	-- move between split panes
	split_nav("move", "h"),
	split_nav("move", "j"),
	split_nav("move", "k"),
	split_nav("move", "l"),
	-- resize panes
	split_nav("resize", "h"),
	split_nav("resize", "j"),
	split_nav("resize", "k"),
	split_nav("resize", "l"),
}

-- and finally, return the configuration to wezterm
return config
