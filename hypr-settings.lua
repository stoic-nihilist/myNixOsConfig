-- Custom display/input settings, required from hyprland.lua via: require("hypr-settings")
-- Managed by Home Manager - do not edit directly, changes will be overwritten
-- on the next `home-manager switch`.

hl.config({
	input = {
		touchpad = {
			natural_scroll = true,
		},
	},
})

hl.monitor({
	output   = "",
	mode     = "preferred",
	position = "auto",
	scale    = 1.25,
})
