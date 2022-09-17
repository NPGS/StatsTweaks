-- ver. 2.3

-- HEAD

	-- PREDATOR Legendary (increased damage to all threat enemies by +25%)
	if TweakDB:GetRecord("Items.PowerfulFabricEnhancer07_elite0") == nil then
		-- STAT ELITE0
		TweakDB:CreateRecord("Items.PowerfulFabricEnhancer07_elite0", "gamedataConstantStatModifier_Record")
		TweakDB:SetFlat("Items.PowerfulFabricEnhancer07_elite0.modifierType", "Additive")
		TweakDB:SetFlat("Items.PowerfulFabricEnhancer07_elite0.statType", "BaseStats.BonusDamageAgainstElites")
		TweakDB:SetFlat("Items.PowerfulFabricEnhancer07_elite0.value", 25)
		-- STAT STANDARD0
		TweakDB:CreateRecord("Items.PowerfulFabricEnhancer07_standard0", "gamedataConstantStatModifier_Record")
		TweakDB:SetFlat("Items.PowerfulFabricEnhancer07_standard0.modifierType", "Additive")
		TweakDB:SetFlat("Items.PowerfulFabricEnhancer07_standard0.statType", "BaseStats.BonusDamageAgainstRares")
		TweakDB:SetFlat("Items.PowerfulFabricEnhancer07_standard0.value", 25)
		-- NEWSTATS0
		TweakDB:CreateRecord("Items.PowerfulFabricEnhancer07_newStats0", "gamedataGameplayLogicPackage_Record")
		TweakDB:SetFlat("Items.PowerfulFabricEnhancer07_newStats0.UIData", "Items.PowerfulFabricEnhancer07_newStats1")
		TweakDB:SetFlat("Items.PowerfulFabricEnhancer07_inline2.value", 25)
		-- NEWSTATS1
		TweakDB:CreateRecord("Items.PowerfulFabricEnhancer07_newStats1", "gamedataGameplayLogicPackageUIData_Record")
		TweakDB:SetFlat("Items.PowerfulFabricEnhancer07_newStats1.localizedDescription", "LocKey#45288")
		TweakDB:SetFlat("Items.PowerfulFabricEnhancer07_newStats1.stats", {"BaseStats.BonusDamageAgainstElites", "BaseStats.BonusDamageAgainstRares"})
		-- INSERT
		arrayInsert("Items.PowerfulFabricEnhancer07.statModifiers", "Items.PowerfulFabricEnhancer07_elite0")
		arrayInsert("Items.PowerfulFabricEnhancer07.statModifiers", "Items.PowerfulFabricEnhancer07_standard0")
		arrayInsert("Items.PowerfulFabricEnhancer07.OnAttach", "Items.PowerfulFabricEnhancer07_newStats0")
	end
