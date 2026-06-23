-- ============================================================
-- Hyprland 0.55 Lua Config — cristopher@cachyos-pc
-- Converted from hyprland.conf + improvements
-- ============================================================

-- ==================
-- VARIABLES
-- ==================

-- Add these at the top of your hyprland.lua file
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
-- Force proper pointer constraints and environment mapping for XWayland apps
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("SDL_VIDEODRIVER", "wayland,x11")

local mainMod = "SUPER"
local secondMod = "SHIFT + SUPER"
local thirdMod = "ALT + SUPER"
local fourthMod = "CTRL + SUPER"
local fifthMod = "SHIFT + CTRL"
local terminal = "kitty"
local menu = "wofi --show drun"

-- ==================
-- MONITORS
-- ==================

-- LG TV SSCR2 — 72" 4K @ 119.88Hz HDR (principal)

hl.monitor({
	output = "HDMI-A-1",
	mode = "3840x2160@119.88",
	position = "0x0",
	scale = 1,
	sdrbrightness = 1,
	vrr = 1,
	sdrsaturation = 1.0,
})

-- Samsung QCQ90S (DP-1)
hl.monitor({
	output = "DP-1",
	mode = "3840x2160@143.86",
	position = "3840x0",
	scale = 1.5,
	bitdepth = 10,
	cm = "hdr",
	sdrbrightness = 1.2,
	sdrsaturation = 1.0,
})

-- ==================
-- AUTOSTART
-- ==================

hl.on("hyprland.start", function()
	hl.exec_cmd("hyprctl setcursor catppuccin-mocha-dark-cursors 28")
	local apps = {
		"waybar",
		"swaync",
		"hyprpaper",
		"hypridle",
		"hyprpolkitagent",
		"env LD_PRELOAD=/usr/lib32/libextest.so steam",
	}
	for _, app in ipairs(apps) do
		hl.exec_cmd(app)
	end
end)

-- ==================
-- XWAYLAND
-- ==================

hl.config({
	xwayland = {
		force_zero_scaling = true,
	},
})

-- ==================
-- INPUT
-- ==================

hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "alt-intl",
		kb_model = "",
		kb_options = "ctrl:nocaps",
		kb_rules = "",

		follow_mouse = 1,
		sensitivity = -0.5,
		accel_profile = "flat",
		force_no_accel = true,

		touchpad = {
			natural_scroll = true,
		},
	},
})

hl.device({
	name = "epic-mouse-v1",
	sensitivity = -0.5,
})

-- ==================
-- LOOK AND FEEL
-- ==================

-- Load Catppuccin Mocha colors
-- (mocha.conf equivalente — define as variáveis de cor)

local mocha = {
	rosewater = 0xf5e0dcff,
	flamingo = 0xf2cdcdff,
	pink = 0xf5c2e7ff,
	mauve = 0xcba6f7ff,
	red = 0xf38ba8ff,
	maroon = 0xeba0acff,
	peach = 0xfab387ff,
	yellow = 0xf9e2afff,
	green = 0xa6e3a1ff,
	teal = 0x94e2d5ff,
	sky = 0x89dcebff,
	sapphire = 0x74c7ecff,
	blue = 0x89b4faff,
	lavender = 0xb4befeff,
	text = 0xcdd6f4ff,
	subtext1 = 0xbac2deff,
	subtext0 = 0xa6adc8ff,
	overlay2 = 0x9399b2ff,
	overlay1 = 0x7f849cff,
	overlay0 = 0x6c7086ff,
	surface2 = 0x585b70ff,
	surface1 = 0x45475aff,
	surface0 = 0x313244ff,
	base = 0x1e1e2eff,
	mantle = 0x181825ff,
	crust = 0x11111bff,
}

hl.config({
	general = {
		border_size = 3,
		resize_on_border = true,
		gaps_in = 4,
		gaps_out = 8,
		layout = "dwindle",
		allow_tearing = false,

		col = {
			active_border = { colors = { mocha.mauve, mocha.flamingo }, angle = 90 },
			inactive_border = mocha.subtext0,
		},
	},

	decoration = {
		rounding = 4,
		shadow = {
			enabled = true,
			range = 5,
			render_power = 3,
			color = "rgba(5e5c64ff)",
		},

		blur = {
			enabled = true,
			size = 8,
			passes = 2,
			vibrancy = 0.9,
		},
	},

	group = {
		col = {
			border_active = { colors = { mocha.mauve, mocha.flamingo }, angle = 90 },
			border_inactive = mocha.subtext0,
			border_locked_active = { colors = { mocha.red, mocha.maroon }, angle = 90 },
		},

		groupbar = {
			font_family = "JetBrainsMono Nerd Font",
			font_size = 14,
			gradients = true,
			col = {
				active = mocha.mauve,
				inactive = mocha.surface1,
			},
		},
	},

	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = true,
	},

	dwindle = {
		preserve_split = true,
	},
})

-- ==================
-- ANIMATIONS
-- ==================

hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })
hl.curve("fluent", { type = "bezier", points = { { 0.1, 1.0 }, { 0.0, 1.0 } } })
hl.curve("linear", { type = "bezier", points = { { 0.0, 0.0 }, { 1.0, 1.0 } } })

hl.animation({ leaf = "windows", enabled = true, speed = 6, bezier = "myBezier", style = "slide" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 6, bezier = "myBezier", style = "popin 80%" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 5, bezier = "myBezier" })
hl.animation({ leaf = "fade", enabled = true, speed = 7, bezier = "default" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 5, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 5, bezier = "fluent", style = "slide" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 30, bezier = "linear", style = "loop" })

-- ==================
-- KEYBINDINGS
-- ==================

-- Apps
hl.bind(mainMod .. " + return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + space", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd("~/.config/bin/audio-input.sh"))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + E", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd("wlogout -b 2 -L 900 -R 900"))
hl.bind(mainMod .. " + M", hl.dsp.exit())

-- Session
hl.bind(secondMod .. "  + l", hl.dsp.exec_cmd("hyprlock"))
hl.bind(secondMod .. "  + R", hl.dsp.exec_cmd("hyprctl reload"))

-- Screenshots
hl.bind("SUPER + CTRL + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind("CTRL + SHIFT + S", hl.dsp.exec_cmd('grim -g "$(slurp -d)" - | swappy -f -'))

-- Audio (pactl)
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +10%"), { locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -10%"), { locked = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"), { locked = true })

-- Focus
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Move windows
hl.bind(secondMod .. " + left", hl.dsp.window.move({ direction = "left" }))
hl.bind(secondMod .. " + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(secondMod .. " + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(secondMod .. " + down", hl.dsp.window.move({ direction = "down" }))

-- Move workspace
hl.bind(thirdMod .. " + left", hl.dsp.focus({ workspace = "-1" }))
hl.bind(thirdMod .. " + right", hl.dsp.focus({ workspace = "+1" }))

--- Move windows workspace
hl.bind(fourthMod .. " + left", hl.dsp.window.move({ workspace = "-1" }))
hl.bind(fourthMod .. " + right", hl.dsp.window.move({ workspace = "+1" }))

-- Move monitor
hl.bind(fifthMod .. " + left", hl.dsp.focus({ monitor = "HDMI-A-1" }))
hl.bind(fifthMod .. " + right", hl.dsp.focus({ monitor = "DP-1" }))

-- Resize submap
-- Switch to a submap called `resize`.
hl.bind(mainMod .. "+ r ", hl.dsp.submap("resize"))

-- Start a submap called "resize".
hl.define_submap("resize", function()
	-- Set repeating binds for resizing the active window.
	hl.bind("right", hl.dsp.window.resize({ x = 20, y = 0, relative = true }), { repeating = true })
	hl.bind("left", hl.dsp.window.resize({ x = -20, y = 0, relative = true }), { repeating = true })
	hl.bind("up", hl.dsp.window.resize({ x = 0, y = 20, relative = true }), { repeating = true })
	hl.bind("down", hl.dsp.window.resize({ x = 0, y = -20, relative = true }), { repeating = true })

	-- Use `reset` to go back to the global submap
	hl.bind("escape", hl.dsp.submap("reset"))
end)

-- Workspaces 1-9 (LG)
for i = 1, 9 do
	local key = tostring(i)
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(secondMod .. "  + " .. key, hl.dsp.window.move({ workspace = i }))
end
-- Workspace 0 → workspace 1
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = 1 }))
hl.bind(secondMod .. "  + 0", hl.dsp.window.move({ workspace = 10 }))

-- Workspaces Samsung (F1-F3)
hl.bind(mainMod .. " + F1", hl.dsp.focus({ workspace = 10 }))
hl.bind(mainMod .. " + F2", hl.dsp.focus({ workspace = 11 }))
hl.bind(mainMod .. " + F3", hl.dsp.focus({ workspace = 12 }))
hl.bind(secondMod .. " + F1", hl.dsp.window.move({ workspace = 10 }))
hl.bind(secondMod .. " + F2", hl.dsp.window.move({ workspace = 11 }))
hl.bind(secondMod .. " + F3", hl.dsp.window.move({ workspace = 12 }))

--- workspaces next ;;

-- ==================
-- WORKSPACES
-- ==================

-- LG (principal) — workspaces 1-9
for i = 1, 9 do
	hl.workspace_rule({
		workspace = tostring(i),
		monitor = "HDMI-A-1",
		default = (i == 1),
	})
end

-- Samsung (couch) — workspaces 10-12
for i = 10, 12 do
	hl.workspace_rule({
		workspace = tostring(i),
		monitor = "DP-1",
	})
end

-- Scroll workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Mouse move/resize
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(secondMod .. "  + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- ==================
-- GROUPS
-- ==================

-- Toggle current window in/out of a group
hl.bind(mainMod .. " + G", hl.dsp.group.toggle())

-- Cycle through group tabs (Forward / Backward)
hl.bind(mainMod .. " + tab", hl.dsp.group.next())
hl.bind(mainMod .. " + tab", hl.dsp.group.prev())

-- Lock a group to prevent other windows from accidentally merging into it
hl.bind(mainMod .. " + L", hl.dsp.group.lock_active({ action = "toggle" }))

-- Move a window INTO a group in a specific direction, OR merge two groups
hl.bind(mainMod .. " + CTRL + left", hl.dsp.window.move({ into_group = "l" }))
hl.bind(mainMod .. " + CTRL + right", hl.dsp.window.move({ into_group = "r" }))
hl.bind(mainMod .. " + CTRL + up", hl.dsp.window.move({ into_group = "u" }))
hl.bind(mainMod .. " + CTRL + down", hl.dsp.window.move({ into_group = "d" }))

-- Move an active tab OUT of the group into a specific tiled direction
hl.bind(secondMod .. " + CTRL + left", hl.dsp.window.move({ out_of_group = "l" }))
hl.bind(secondMod .. " + CTRL + right", hl.dsp.window.move({ out_of_group = "r" }))
hl.bind(secondMod .. " + CTRL + up", hl.dsp.window.move({ out_of_group = "u" }))
hl.bind(secondMod .. " + CTRL + down", hl.dsp.window.move({ out_of_group = "d" }))

-- ==================
-- WINDOW RULES
-- ==================

hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

-- Layer rules also return a handle.
local overlayLayerRule = hl.layer_rule({
	name = "no-anim-overlay",
	match = { namespace = "^my-overlay$" },
	no_anim = true,
})
overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },
	move = "20 monitor_h-120",
	float = true,
})

hl.window_rule({
	name = "inhibit-idle-fullscreen",
	match = { fullscreen = true },
	idle_inhibit = "fullscreen",
})

-- Kitty: delegate opacity to Hyprland so compositor blur applies
hl.window_rule({
	name = "kitty-opacity",
	match = { class = "kitty" },
	opacity = "0.80 override 0.80 override",
})
