-- ver. 1.7

-- HEAD

	-- PREDATOR Legendary (increased damage to all threat enemies by +25%)
	if TweakDB:GetRecord("Items.PowerfulFabricEnhancer07_elite0") == nil then
		TweakDB:CreateRecord("Items.PowerfulFabricEnhancer07_elite0", "gamedataConstantStatModifier_Record")
		TweakDB:SetFlat("Items.PowerfulFabricEnhancer07_elite0.modifierType", "Additive")
		TweakDB:SetFlat("Items.PowerfulFabricEnhancer07_elite0.statType", "BaseStats.BonusDamageAgainstElites")
	end
	if TweakDB:GetRecord("Items.PowerfulFabricEnhancer07_standard0") == nil then
		TweakDB:CreateRecord("Items.PowerfulFabricEnhancer07_standard0", "gamedataConstantStatModifier_Record")
		TweakDB:SetFlat("Items.PowerfulFabricEnhancer07_standard0.modifierType", "Additive")
		TweakDB:SetFlat("Items.PowerfulFabricEnhancer07_standard0.statType", "BaseStats.BonusDamageAgainstRares")
	end
	if TweakDB:GetRecord("Items.PowerfulFabricEnhancer07_newStats0") == nil then
		TweakDB:CreateRecord("Items.PowerfulFabricEnhancer07_newStats0", "gamedataGameplayLogicPackage_Record")
		TweakDB:SetFlat("Items.PowerfulFabricEnhancer07_newStats0.UIData", "Items.PowerfulFabricEnhancer07_newStats1")
	end
	if TweakDB:GetRecord("Items.PowerfulFabricEnhancer07_newStats1") == nil then
		TweakDB:CreateRecord("Items.PowerfulFabricEnhancer07_newStats1", "gamedataGameplayLogicPackageUIData_Record")
		TweakDB:SetFlat("Items.PowerfulFabricEnhancer07_newStats1.localizedDescription", "LocKey#45288")
		TweakDB:SetFlat("Items.PowerfulFabricEnhancer07_newStats1.stats", {"BaseStats.BonusDamageAgainstElites", "BaseStats.BonusDamageAgainstRares"})
	end
	TweakDB:SetFlat("Items.PowerfulFabricEnhancer07_inline2.value", 25)
	TweakDB:SetFlat("Items.PowerfulFabricEnhancer07_elite0.value", 25)
	TweakDB:SetFlat("Items.PowerfulFabricEnhancer07_standard0.value", 25)
	addToList("Items.PowerfulFabricEnhancer07.statModifiers", "Items.PowerfulFabricEnhancer07_elite0")
	addToList("Items.PowerfulFabricEnhancer07.statModifiers", "Items.PowerfulFabricEnhancer07_standard0")
	addToList("Items.PowerfulFabricEnhancer07.OnAttach", "Items.PowerfulFabricEnhancer07_newStats0")
