-- ver. 3.0	- LUA MODULES LOADER

registerForEvent("onInit", function()
	require("modules/fixes.lua")
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

function arrayInsert(arr, rec)
	bakArray = TweakDB:GetFlat(arr)
	table.insert(bakArray, TweakDBID.new(rec))
	TweakDB:SetFlat(arr, bakArray)
end
