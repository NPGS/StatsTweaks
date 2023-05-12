-- ver. 3.1.0	- LUA MODULES LOADER

Ti200 = require("./utils.lua")	-- import functions

registerForEvent("onInit", function()
	require("modules/fixes.lua")
	require("modules/blueprints.lua")
	require("modules/berserk.lua")
	require("modules/circulatory_system.lua")
	require("modules/frontal_cortex.lua")
	require("modules/hands.lua")
	require("modules/immune_system.lua")
	require("modules/integumentary_system.lua")
	require("modules/nervous_system.lua")
	require("modules/sandevistan.lua")
	require("modules/skeleton.lua")
end)
