-- ver. 2.5.2	- LUA MODULES LOADER

registerForEvent("onInit", function()

	-- List all modules to load

		-- CLOTHES MODS
		require("modules/cloth_mods/all_cloth.lua")
		require("modules/cloth_mods/eyes.lua")
		require("modules/cloth_mods/head.lua")
		require("modules/cloth_mods/outer_chest.lua")

		-- CYBERWARE
		require("modules/cyberware/berserk_fixes.lua")
		require("modules/cyberware/berserk.lua")
		require("modules/cyberware/circulatory_system.lua")
		require("modules/cyberware/frontal_cortex.lua")
		require("modules/cyberware/hands.lua")
		require("modules/cyberware/immune_system.lua")
		require("modules/cyberware/integumentary_system.lua")
		require("modules/cyberware/nervous_system.lua")
		require("modules/cyberware/netrunner_fixes.lua")
		require("modules/cyberware/sandevistan.lua")
		require("modules/cyberware/skeleton.lua")

		-- CYBERWARE MODS
		require("modules/cw_mods/kiroshi.lua")
		require("modules/cw_mods/sandevistan.lua")

end)

function arrayInsert(arr, rec)
	bakArray = TweakDB:GetFlat(arr)
	table.insert(bakArray, TweakDBID.new(rec))
	TweakDB:SetFlat(arr, bakArray)
end
