-- ver. 3.0.6

-- BERSERK FIXES

	-- ADD RESISTANCES

		-- FIX BERSERKPLAYERBUFF
		TweakDB:SetFlat("BaseStatusEffect.BerserkPlayerBuff_inline21.modifierType", "AdditiveMultiplier")
		TweakDB:SetFlat("BaseStatusEffect.BerserkPlayerBuff_inline21.refObject", "Player")
		TweakDB:SetFlat("BaseStatusEffect.BerserkPlayerBuff_inline21.value", 0.01)
		TweakDB:SetFlat("BaseStatusEffect.BerserkPlayerBuff_inline22.refObject", "Player")
		TweakDB:SetFlat("BaseStatusEffect.BerserkPlayerBuff_inline23.refObject", "Player")
		TweakDB:SetFlat("BaseStatusEffect.BerserkPlayerBuff_inline24.refObject", "Player")
		TweakDB:SetFlat("BaseStatusEffect.BerserkPlayerBuff_inline25.refObject", "Player")
		TweakDB:SetFlat("BaseStatusEffect.BerserkPlayerBuff_inline26.refObject", "Player")

		-- STAT MODIFIERS ARRAY
		berserks12 = {
			"Items.BerserkC1MK1.statModifiers",
			"Items.BerserkC1MK2.statModifiers",
			"Items.BerserkC2MK1.statModifiers",
			"Items.BerserkC2MK2.statModifiers",
		}

		berserks3 = {
			"Items.BerserkC1MK3.statModifiers",
			"Items.BerserkC2MK3.statModifiers",
		}

		berserks4 = {
			"Items.BerserkC2MK4.statModifiers",
			"Items.BerserkC3MK4.statModifiers",
		}

		berserks5 = {
			"Items.BerserkC3MK5.statModifiers",
			"Items.BerserkC4MK5.statModifiers",
		}

		-- RESISTANCES VARIABLES NAMES
		berserkResistances01 = "Items.BerserkResistances01"
		berserkResistances02 = "Items.BerserkResistances02"
		berserkResistances03 = "Items.BerserkResistances03"
		berserkResistances04 = "Items.BerserkResistances04"

		-- CREATE AND ADD RESISTANCES FROM BERSERKS Mk.1 TO Mk.5
		Ti200.createAndAssociateStatToArray(berserkResistances01, "Additive", "BaseStats.BerserkResistancesBonus", 10, berserks12)
		Ti200.createAndAssociateStatToArray(berserkResistances02, "Additive", "BaseStats.BerserkResistancesBonus", 20, berserks3)
		Ti200.createAndAssociateStatToArray(berserkResistances03, "Additive", "BaseStats.BerserkResistancesBonus", 30, berserks4)
		Ti200.createAndAssociateStatToArray(berserkResistances04, "Additive", "BaseStats.BerserkResistancesBonus", 40, berserks5)


	-- MELEE DAMAGE DMG ADD
	berserkMeleeBuff = "BaseStatusEffect.BerserkPlayerBuff_melee_dmg"
	if TweakDB:GetRecord(berserkMeleeBuff) == nil then
		Ti200.createCombinedStat(berserkMeleeBuff, "AdditiveMultiplier", "*", "Player", "BaseStats.BerserkMeleeDamageBonus", "BaseStats.EffectiveDPS", 0.01)
		Ti200.arrayInsert("BaseStatusEffect.BerserkPlayerBuff_inline19.statModifiers", berserkMeleeBuff)
	end


	-- SUPERHERO FALL POV ROTATION
	TweakDB:SetFlat("PlayerLocomotion.player_locomotion_data_SuperheroFall_inline10.value", 1)


	-- UIDATA COOLDOWN FIX (for when 'Chained Berserk' mod is equipped)
	cooldownFix = "Items.BerserkBase_cooldown_fix"
	if TweakDB:GetRecord(cooldownFix) == nil then
		Ti200.createCombinedStat(cooldownFix, "Additive", "*", "Self", "BaseStats.BerserkCooldownReduction", "BaseStats.BerserkCooldownBase", 1)
		TweakDB:SetFlat("Items.BerserkBase.statModifiers", {"Items.BerserkBase_inline3", cooldownFix})
		TweakDB:SetFlat("BaseStatusEffect.BerserkCooldown_inline0.statModifiers", {"BaseStatusEffect.CyberwareCooldownDuration_inline0","BaseStatusEffect.BerserkCooldown_inline1","BaseStatusEffect.BerserkCooldown_inline2"})
		Ti200.associateRecordToArray(berserks12, cooldownFix)
		Ti200.associateRecordToArray(berserks3, cooldownFix)
		Ti200.associateRecordToArray(berserks4, cooldownFix)
		Ti200.associateRecordToArray(berserks5, cooldownFix)
	end


-- BERSERK MK.1 / MK.5 ADDITIONAL TWEAKS

	-- CARRY CAPACITY

		-- MINIMUM CAPACITY Mk.1 / Mk.2
		if TweakDB:GetRecord("Items.BerserkCarryCapacity01") == nil then
			TweakDB:CreateRecord("Items.BerserkCarryCapacity01", "gamedataGameplayLogicPackage_Record")	-- LOGIC PACKAGE
				TweakDB:CloneRecord("Items.BerserkCarryCapacity01_inline0", "Items.BerserkC4MK5_inline15")	-- STAT GROUP EFFECTOR
					TweakDB:CloneRecord("Items.BerserkCarryCapacity01_inline1", "Items.BerserkC4MK5_inline17")	-- STAT MODIFIER GROUP
						TweakDB:CloneRecord("Items.BerserkCarryCapacity01_inline2", "Items.TitaniumInfusedBonesCommon_inline1")	-- CONSTANT STAT MODIFIER
				TweakDB:CloneRecord("Items.BerserkCarryCapacity01_inline3", "Items.TitaniumInfusedBonesCommon_inline2")	-- UIDATA
			TweakDB:SetFlat("Items.BerserkCarryCapacity01.effectors", {"Items.BerserkCarryCapacity01_inline0"})
				TweakDB:SetFlat("Items.BerserkCarryCapacity01_inline0.statGroup", "Items.BerserkCarryCapacity01_inline1")
					TweakDB:SetFlat("Items.BerserkCarryCapacity01_inline1.statModifiers", {"Items.BerserkCarryCapacity01_inline2"})
						TweakDB:SetFlat("Items.BerserkCarryCapacity01_inline2.value", 0.1)
			TweakDB:SetFlat("Items.BerserkCarryCapacity01.UIData", "Items.BerserkCarryCapacity01_inline3")
				TweakDB:SetFlat("Items.BerserkCarryCapacity01_inline3.intValues", {10})
			Ti200.arrayInsert("Items.BerserkC1MK1.OnEquip", "Items.BerserkCarryCapacity01")
			Ti200.arrayInsert("Items.BerserkC1MK2.OnEquip", "Items.BerserkCarryCapacity01")
			Ti200.arrayInsert("Items.BerserkC2MK1.OnEquip", "Items.BerserkCarryCapacity01")
			Ti200.arrayInsert("Items.BerserkC2MK2.OnEquip", "Items.BerserkCarryCapacity01")
		end

		-- LOW CAPACITY Mk.3
		if TweakDB:GetRecord("Items.BerserkCarryCapacity02") == nil then
			TweakDB:CreateRecord("Items.BerserkCarryCapacity02", "gamedataGameplayLogicPackage_Record")	-- LOGIC PACKAGE
				TweakDB:CloneRecord("Items.BerserkCarryCapacity02_inline0", "Items.BerserkC4MK5_inline15")	-- STAT GROUP EFFECTOR
					TweakDB:CloneRecord("Items.BerserkCarryCapacity02_inline1", "Items.BerserkC4MK5_inline17")	-- STAT MODIFIER GROUP
						TweakDB:CloneRecord("Items.BerserkCarryCapacity02_inline2", "Items.TitaniumInfusedBonesCommon_inline1")	-- CONSTANT STAT MODIFIER
				TweakDB:CloneRecord("Items.BerserkCarryCapacity02_inline3", "Items.TitaniumInfusedBonesCommon_inline2")	-- UIDATA
			TweakDB:SetFlat("Items.BerserkCarryCapacity02.effectors", {"Items.BerserkCarryCapacity02_inline0"})
				TweakDB:SetFlat("Items.BerserkCarryCapacity02_inline0.statGroup", "Items.BerserkCarryCapacity02_inline1")
					TweakDB:SetFlat("Items.BerserkCarryCapacity02_inline1.statModifiers", {"Items.BerserkCarryCapacity02_inline2"})
						TweakDB:SetFlat("Items.BerserkCarryCapacity02_inline2.value", 0.2)
			TweakDB:SetFlat("Items.BerserkCarryCapacity02.UIData", "Items.BerserkCarryCapacity02_inline3")
				TweakDB:SetFlat("Items.BerserkCarryCapacity02_inline3.intValues", {20})
			Ti200.arrayInsert("Items.BerserkC1MK3.OnEquip", "Items.BerserkCarryCapacity02")
			Ti200.arrayInsert("Items.BerserkC2MK3.OnEquip", "Items.BerserkCarryCapacity02")
		end

		-- MEDIUM CAPACITY Mk.4
		if TweakDB:GetRecord("Items.BerserkCarryCapacity03") == nil then
			TweakDB:CreateRecord("Items.BerserkCarryCapacity03", "gamedataGameplayLogicPackage_Record")	-- LOGIC PACKAGE
				TweakDB:CloneRecord("Items.BerserkCarryCapacity03_inline0", "Items.BerserkC4MK5_inline15")	-- STAT GROUP EFFECTOR
					TweakDB:CloneRecord("Items.BerserkCarryCapacity03_inline1", "Items.BerserkC4MK5_inline17")	-- STAT MODIFIER GROUP
						TweakDB:CloneRecord("Items.BerserkCarryCapacity03_inline2", "Items.TitaniumInfusedBonesCommon_inline1")	-- CONSTANT STAT MODIFIER
				TweakDB:CloneRecord("Items.BerserkCarryCapacity03_inline3", "Items.TitaniumInfusedBonesCommon_inline2")	-- UIDATA
			TweakDB:SetFlat("Items.BerserkCarryCapacity03.effectors", {"Items.BerserkCarryCapacity03_inline0"})
				TweakDB:SetFlat("Items.BerserkCarryCapacity03_inline0.statGroup", "Items.BerserkCarryCapacity03_inline1")
					TweakDB:SetFlat("Items.BerserkCarryCapacity03_inline1.statModifiers", {"Items.BerserkCarryCapacity03_inline2"})
						TweakDB:SetFlat("Items.BerserkCarryCapacity03_inline2.value", 0.3)
			TweakDB:SetFlat("Items.BerserkCarryCapacity03.UIData", "Items.BerserkCarryCapacity03_inline3")
				TweakDB:SetFlat("Items.BerserkCarryCapacity03_inline3.intValues", {30})
			Ti200.arrayInsert("Items.BerserkC2MK4.OnEquip", "Items.BerserkCarryCapacity03")
			Ti200.arrayInsert("Items.BerserkC3MK4.OnEquip", "Items.BerserkCarryCapacity03")
		end

		-- HIGH CAPACITY Mk.5
		if TweakDB:GetRecord("Items.BerserkCarryCapacity04") == nil then
			TweakDB:CreateRecord("Items.BerserkCarryCapacity04", "gamedataGameplayLogicPackage_Record")	-- LOGIC PACKAGE
				TweakDB:CloneRecord("Items.BerserkCarryCapacity04_inline0", "Items.BerserkC4MK5_inline15")	-- STAT GROUP EFFECTOR
					TweakDB:CloneRecord("Items.BerserkCarryCapacity04_inline1", "Items.BerserkC4MK5_inline17")	-- STAT MODIFIER GROUP
						TweakDB:CloneRecord("Items.BerserkCarryCapacity04_inline2", "Items.TitaniumInfusedBonesCommon_inline1")	-- CONSTANT STAT MODIFIER
				TweakDB:CloneRecord("Items.BerserkCarryCapacity04_inline3", "Items.TitaniumInfusedBonesCommon_inline2")	-- UIDATA
			TweakDB:SetFlat("Items.BerserkCarryCapacity04.effectors", {"Items.BerserkCarryCapacity04_inline0"})
				TweakDB:SetFlat("Items.BerserkCarryCapacity04_inline0.statGroup", "Items.BerserkCarryCapacity04_inline1")
					TweakDB:SetFlat("Items.BerserkCarryCapacity04_inline1.statModifiers", {"Items.BerserkCarryCapacity04_inline2"})
						TweakDB:SetFlat("Items.BerserkCarryCapacity04_inline2.value", 0.4)
			TweakDB:SetFlat("Items.BerserkCarryCapacity04.UIData", "Items.BerserkCarryCapacity04_inline3")
				TweakDB:SetFlat("Items.BerserkCarryCapacity04_inline3.intValues", {40})
			Ti200.arrayInsert("Items.BerserkC3MK5.OnEquip", "Items.BerserkCarryCapacity04")
			Ti200.arrayInsert("Items.BerserkC4MK5.OnEquip", "Items.BerserkCarryCapacity04")
		end


	-- DAMAGE REDUCTION

		-- MINIMUM REDUCTION Mk.1 / Mk.2
		if TweakDB:GetRecord("Items.BerserkDmgReduction01") == nil then
			TweakDB:CreateRecord("Items.BerserkDmgReduction01", "gamedataGameplayLogicPackage_Record")	-- LOGIC PACKAGE
				TweakDB:CloneRecord("Items.BerserkDmgReduction01_inline0", "Items.BerserkC4MK5_inline9")	-- EFFECTOR EFFECTOR
					TweakDB:CloneRecord("Items.BerserkDmgReduction01_inline1", "Items.PainReductor_inline2")	-- EFFECTOR
				TweakDB:CloneRecord("Items.BerserkDmgReduction01_inline2", "Items.PainReductor_inline3")	-- UIDATA
			TweakDB:SetFlat("Items.BerserkDmgReduction01.effectors", {"Items.BerserkDmgReduction01_inline0"})
				TweakDB:SetFlat("Items.BerserkDmgReduction01_inline0.effectorToApply", "Items.BerserkDmgReduction01_inline1")
					TweakDB:SetFlat("Items.BerserkDmgReduction01_inline1.operationType", 'Multiply')
					TweakDB:SetFlat("Items.BerserkDmgReduction01_inline1.value", 0.9, 'Float')
			TweakDB:SetFlat("Items.BerserkDmgReduction01.UIData", "Items.BerserkDmgReduction01_inline2")
				TweakDB:SetFlat("Items.BerserkDmgReduction01_inline2.intValues", {10})	-- UIDATA
			Ti200.arrayInsert("Items.BerserkC1MK1.OnEquip", "Items.BerserkDmgReduction01")
			Ti200.arrayInsert("Items.BerserkC1MK2.OnEquip", "Items.BerserkDmgReduction01")
			Ti200.arrayInsert("Items.BerserkC2MK1.OnEquip", "Items.BerserkDmgReduction01")
			Ti200.arrayInsert("Items.BerserkC2MK2.OnEquip", "Items.BerserkDmgReduction01")
		end

		-- LOW REDUCTION Mk.3
		if TweakDB:GetRecord("Items.BerserkDmgReduction02") == nil then
			TweakDB:CreateRecord("Items.BerserkDmgReduction02", "gamedataGameplayLogicPackage_Record")	-- LOGIC PACKAGE
				TweakDB:CloneRecord("Items.BerserkDmgReduction02_inline0", "Items.BerserkC4MK5_inline9")	-- EFFECTOR EFFECTOR
					TweakDB:CloneRecord("Items.BerserkDmgReduction02_inline1", "Items.PainReductor_inline2")	-- EFFECTOR
				TweakDB:CloneRecord("Items.BerserkDmgReduction02_inline2", "Items.PainReductor_inline3")	-- UIDATA
			TweakDB:SetFlat("Items.BerserkDmgReduction02.effectors", {"Items.BerserkDmgReduction02_inline0"})
				TweakDB:SetFlat("Items.BerserkDmgReduction02_inline0.effectorToApply", "Items.BerserkDmgReduction02_inline1")
					TweakDB:SetFlat("Items.BerserkDmgReduction02_inline1.operationType", 'Multiply')
					TweakDB:SetFlat("Items.BerserkDmgReduction02_inline1.value", 0.8, 'Float')
			TweakDB:SetFlat("Items.BerserkDmgReduction02.UIData", "Items.BerserkDmgReduction02_inline2")
				TweakDB:SetFlat("Items.BerserkDmgReduction02_inline2.intValues", {20})	-- UIDATA
			Ti200.arrayInsert("Items.BerserkC1MK3.OnEquip", "Items.BerserkDmgReduction02")
			Ti200.arrayInsert("Items.BerserkC2MK3.OnEquip", "Items.BerserkDmgReduction02")
		end

		-- MEDIUM REDUCTION Mk.4
		if TweakDB:GetRecord("Items.BerserkDmgReduction03") == nil then
			TweakDB:CreateRecord("Items.BerserkDmgReduction03", "gamedataGameplayLogicPackage_Record")	-- LOGIC PACKAGE
				TweakDB:CloneRecord("Items.BerserkDmgReduction03_inline0", "Items.BerserkC4MK5_inline9")	-- EFFECTOR EFFECTOR
					TweakDB:CloneRecord("Items.BerserkDmgReduction03_inline1", "Items.PainReductor_inline2")	-- EFFECTOR
				TweakDB:CloneRecord("Items.BerserkDmgReduction03_inline2", "Items.PainReductor_inline3")	-- UIDATA
			TweakDB:SetFlat("Items.BerserkDmgReduction03.effectors", {"Items.BerserkDmgReduction03_inline0"})
				TweakDB:SetFlat("Items.BerserkDmgReduction03_inline0.effectorToApply", "Items.BerserkDmgReduction03_inline1")
					TweakDB:SetFlat("Items.BerserkDmgReduction03_inline1.operationType", 'Multiply')
					TweakDB:SetFlat("Items.BerserkDmgReduction03_inline1.value", 0.7, 'Float')
			TweakDB:SetFlat("Items.BerserkDmgReduction03.UIData", "Items.BerserkDmgReduction03_inline2")
				TweakDB:SetFlat("Items.BerserkDmgReduction03_inline2.intValues", {30})	-- UIDATA
			Ti200.arrayInsert("Items.BerserkC2MK4.OnEquip", "Items.BerserkDmgReduction03")
			Ti200.arrayInsert("Items.BerserkC3MK4.OnEquip", "Items.BerserkDmgReduction03")
		end

		-- HIGH REDUCTION Mk.5
		if TweakDB:GetRecord("Items.BerserkDmgReduction04") == nil then
			TweakDB:CreateRecord("Items.BerserkDmgReduction04", "gamedataGameplayLogicPackage_Record")	-- LOGIC PACKAGE
				TweakDB:CloneRecord("Items.BerserkDmgReduction04_inline0", "Items.BerserkC4MK5_inline9")	-- EFFECTOR EFFECTOR
					TweakDB:CloneRecord("Items.BerserkDmgReduction04_inline1", "Items.PainReductor_inline2")	-- EFFECTOR
				TweakDB:CloneRecord("Items.BerserkDmgReduction04_inline2", "Items.PainReductor_inline3")	-- UIDATA
			TweakDB:SetFlat("Items.BerserkDmgReduction04.effectors", {"Items.BerserkDmgReduction04_inline0"})
				TweakDB:SetFlat("Items.BerserkDmgReduction04_inline0.effectorToApply", "Items.BerserkDmgReduction04_inline1")
					TweakDB:SetFlat("Items.BerserkDmgReduction04_inline1.operationType", 'Multiply')
					TweakDB:SetFlat("Items.BerserkDmgReduction04_inline1.value", 0.6, 'Float')
			TweakDB:SetFlat("Items.BerserkDmgReduction04.UIData", "Items.BerserkDmgReduction04_inline2")
				TweakDB:SetFlat("Items.BerserkDmgReduction04_inline2.intValues", {40})	-- UIDATA
			Ti200.arrayInsert("Items.BerserkC3MK5.OnEquip", "Items.BerserkDmgReduction04")
			Ti200.arrayInsert("Items.BerserkC4MK5.OnEquip", "Items.BerserkDmgReduction04")
		end


-- NETRUNNER FIXES

	-- COMBAT QUICKHACKS SPREAD ADJUSTMENT
	TweakDB:SetFlat("Items.DamageHacksSpreadInitEffector.spreadCount", 3)
	TweakDB:SetFlat("QuickHack.BaseOverheatHack_inline3.spreadCount", 3)
	TweakDB:SetFlat("QuickHack.BrainMeltBaseHack_inline3.spreadCount", 3)
	TweakDB:SetFlat("QuickHack.OverloadBaseHack_inline6.spreadCount", 3)

	-- NETWATCH NETDRIVER MK5 TWEAK
	if TweakDB:GetRecord("Price.Cyberdeck_NetdriverMK5") == nil then
		TweakDB:CloneRecord("Price.Cyberdeck_NetdriverMK5", "Price.Cyberdeck")
		TweakDB:SetFlat("Price.Cyberdeck_NetdriverMK5.value", 10)
		TweakDB:SetFlat("Items.NetwatchNetdriverLegendaryMKV_inline2.value", 12)	-- RAM
		TweakDB:SetFlat("Items.NetwatchNetdriverLegendaryMKV_inline3.value", 10)	-- BUFFER
		TweakDB:SetFlat("Items.NetwatchNetdriverLegendaryMKV.blueprint", "Items.CyberdeckBlueprint7Slots")
		TweakDB:SetFlat("Items.NetwatchNetdriverLegendaryMKV.buyPrice", {"Price.BasePrice","Price.BuyMultiplier","Price.Cyberware","Price.CyberwareQualityMultiplier","Price.IconicMultiplier","Price.Cyberdeck_NetdriverMK5"})
		TweakDB:SetFlat("Items.NetwatchNetdriverLegendaryMKV.OnEquip", {"Items.BaseDeck_inline0","Items.BaseDeck_inline3","Items.NetwatchNetdriverLegendaryMKV_inline1","Items.DamageHacksAreaAbility","Items.QuickHackDamageAbility03","Items.MemoryRegenAbility03","Items.SpreadingRangeAbility03","Items.NPCUploadTimeAbility02"})
		TweakDB:SetFlat("Items.NetwatchNetdriverLegendaryMKV.sellPrice", {"Price.BasePrice","Price.CyberwareSellMultiplier","Price.Cyberware","Price.CyberwareQualityMultiplier","Price.CraftingTraitMultiplier","Price.IconicMultiplier","Price.Cyberdeck_NetdriverMK5"})
	end
