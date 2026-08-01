-- Custom keybinds, required from hyprland.lua via: require("hypr-binds")
-- Managed by Home Manager - do not edit directly, changes will be overwritten
-- on the next `home-manager switch`.
--
-- Placed AFTER the default binds in hyprland.lua, so these override the
-- stock SUPER+E (default: dolphin), SUPER+S (default: scratchpad toggle),
-- and SUPER+Q (default: exec terminal) binds. SUPER+C is left untouched,
-- so it keeps its stock close-window behavior.

local mainMod = "SUPER"

-- Apps
hl.bind(mainMod .. " + H", hl.dsp.exec_cmd("helium"))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("spotify"))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("codium"))
-- hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("nautilus"))

-- Caelestia launcher ("Search"/"Center")
-- hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("caelestia shell drawers toggle launcher"))

-- Workspaces (SUPER + 1-9, 0)
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
end
