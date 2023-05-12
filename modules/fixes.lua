-- ver. 3.1.0

-- BERSERK FIXES

	-- ADD RESISTANCES

		-- FIX BERSERK PLAYER BUFF
		TweakDB:SetFlat("BaseStatusEffect.BerserkPlayerBuff_inline21.modifierType", "AdditiveMultiplier")
		TweakDB:SetFlat("BaseStatusEffect.BerserkPlayerBuff_inline21.refObject", "Player")
		TweakDB:SetFlat("BaseStatusEffect.BerserkPlayerBuff_inline21.value", 0.01)
		TweakDB:SetFlat("BaseStatusEffect.BerserkPlayerBuff_inline22.refObject", "Player")
		TweakDB:SetFlat("BaseStatusEffect.BerserkPlayerBuff_inline23.refObject", "Player")
		TweakDB:SetFlat("BaseStatusEffect.BerserkPlayerBuff_inline24.refObject", "Player")
		TweakDB:SetFlat("BaseStatusEffect.BerserkPlayerBuff_inline25.refObject", "Player")
		TweakDB:SetFlat("BaseStatusEffect.BerserkPlayerBuff_inline26.refObject", "Player")

		-- STAT MODIFIERS TABLES
		local berserks12 = {
			"Items.BerserkC1MK1.statModifiers",
			"Items.BerserkC1MK2.statModifiers",
			"Items.BerserkC2MK1.statModifiers",
			"Items.BerserkC2MK2.statModifiers",
		}

		local berserks3 = {
			"Items.BerserkC1MK3.statModifiers",
			"Items.BerserkC2MK3.statModifiers",
		}

		local berserks4 = {
			"Items.BerserkC2MK4.statModifiers",
			"Items.BerserkC3MK4.statModifiers",
		}

		local berserks5 = {
			"Items.BerserkC3MK5.statModifiers",
			"Items.BerserkC4MK5.statModifiers",
		}

		-- RESISTANCES VARIABLES NAMES
		local berserkResistances01 = "Items.BerserkResistances01"
		local berserkResistances02 = "Items.BerserkResistances02"
		local berserkResistances03 = "Items.BerserkResistances03"
		local berserkResistances04 = "Items.BerserkResistances04"

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

	-- EQUIP TABLES
	local berserkEquip12 = {
		"Items.BerserkC1MK1.OnEquip",
		"Items.BerserkC1MK2.OnEquip",
		"Items.BerserkC2MK1.OnEquip",
		"Items.BerserkC2MK2.OnEquip",
	}

	local berserkEquip3 = {
		"Items.BerserkC1MK3.OnEquip",
		"Items.BerserkC2MK3.OnEquip",
	}

	local berserkEquip4 = {
		"Items.BerserkC2MK4.OnEquip",
		"Items.BerserkC3MK4.OnEquip",
	}

	local berserkEquip5 = {
		"Items.BerserkC3MK5.OnEquip",
		"Items.BerserkC4MK5.OnEquip",
	}


	-- CARRY CAPACITY

		-- GLOBAL PREREQ
		local berserkEffectPrereq = Ti200.createStatusEffectPrereq("berserkGlobalPrereq", "", false, "StatusEffectPrereq", "BaseStatusEffect.BerserkPlayerBuff", "None")

		-- MINIMUM CAPACITY Mk.1 / Mk.2
		local berserkCarrySkill01 = "Items.BerserkCarryCapacity01"
		if TweakDB:GetRecord(berserkCarrySkill01) == nil then
			local zerkCarry01 = { Ti200.createConstantStat(berserkCarrySkill01.."_stat0", "AdditiveMultiplier", "BaseStats.CarryCapacity", 0.1) }
			local zerkCarry01UiData = Ti200.createUiData(berserkCarrySkill01, {}, "ability_silenced", {10}, "LocKey#40830", "", {}, {})
			Ti200.makeStatGroupPackage(berserkCarrySkill01, "ApplyStatGroupEffector", berserkEffectPrereq, zerkCarry01, zerkCarry01UiData)
			Ti200.associateRecordToArray(berserkEquip12, berserkCarrySkill01)
		end

		-- LOW CAPACITY Mk.3
		local berserkCarrySkill02 = "Items.BerserkCarryCapacity02"
		if TweakDB:GetRecord(berserkCarrySkill02) == nil then
			local zerkCarry02 = { Ti200.createConstantStat(berserkCarrySkill02.."_stat0", "AdditiveMultiplier", "BaseStats.CarryCapacity", 0.2) }
			local zerkCarry02UiData = Ti200.createUiData(berserkCarrySkill02, {}, "ability_silenced", {20}, "LocKey#40830", "", {}, {})
			Ti200.makeStatGroupPackage(berserkCarrySkill02, "ApplyStatGroupEffector", berserkEffectPrereq, zerkCarry02, zerkCarry02UiData)
			Ti200.associateRecordToArray(berserkEquip3, berserkCarrySkill02)
		end

		-- MEDIUM CAPACITY Mk.4
		local berserkCarrySkill03 = "Items.BerserkCarryCapacity03"
		if TweakDB:GetRecord(berserkCarrySkill03) == nil then
			local zerkCarry03 = { Ti200.createConstantStat(berserkCarrySkill03.."_stat0", "AdditiveMultiplier", "BaseStats.CarryCapacity", 0.3) }
			local zerkCarry03UiData = Ti200.createUiData(berserkCarrySkill03, {}, "ability_silenced", {30}, "LocKey#40830", "", {}, {})
			Ti200.makeStatGroupPackage(berserkCarrySkill03, "ApplyStatGroupEffector", berserkEffectPrereq, zerkCarry03, zerkCarry03UiData)
			Ti200.associateRecordToArray(berserkEquip4, berserkCarrySkill03)
		end

		-- HIGH CAPACITY Mk.5
		local berserkCarrySkill04 = "Items.BerserkCarryCapacity04"
		if TweakDB:GetRecord(berserkCarrySkill04) == nil then
			local zerkCarry04 = { Ti200.createConstantStat(berserkCarrySkill04.."_stat0", "AdditiveMultiplier", "BaseStats.CarryCapacity", 0.4) }
			local zerkCarry04UiData = Ti200.createUiData(berserkCarrySkill04, {}, "ability_silenced", {40}, "LocKey#40830", "", {}, {})
			Ti200.makeStatGroupPackage(berserkCarrySkill04, "ApplyStatGroupEffector", berserkEffectPrereq, zerkCarry04, zerkCarry04UiData)
			Ti200.associateRecordToArray(berserkEquip5, berserkCarrySkill04)
		end


	-- DAMAGE REDUCTION

		-- MINIMUM REDUCTION Mk.1 / Mk.2
		local berserkLowerDmg01 = "Items.BerserkDmgReduction01"
		if TweakDB:GetRecord(berserkLowerDmg01) == nil then
			local berserkLowerDmg01UiData = Ti200.createUiData(berserkLowerDmg01, {}, "ability_silenced", {10}, "LocKey#40805", "", {}, {})
			Ti200.makeEffectorGroupPackage(berserkLowerDmg01, "ApplyEffectorEffector", "ModifyDamageEffector", berserkEffectPrereq, "Prereqs.ProcessHitReceived", "Multiply", 0.9, "Float", berserkLowerDmg01UiData)
			Ti200.associateRecordToArray(berserkEquip12, berserkLowerDmg01)
		end

		-- LOW REDUCTION Mk.3
		local berserkLowerDmg02 = "Items.BerserkDmgReduction02"
		if TweakDB:GetRecord(berserkLowerDmg02) == nil then
			local berserkLowerDmg02UiData = Ti200.createUiData(berserkLowerDmg02, {}, "ability_silenced", {20}, "LocKey#40805", "", {}, {})
			Ti200.makeEffectorGroupPackage(berserkLowerDmg02, "ApplyEffectorEffector", "ModifyDamageEffector", berserkEffectPrereq, "Prereqs.ProcessHitReceived", "Multiply", 0.8, "Float", berserkLowerDmg02UiData)
			Ti200.associateRecordToArray(berserkEquip3, berserkLowerDmg02)
		end

		-- MEDIUM REDUCTION Mk.4
		local berserkLowerDmg03 = "Items.BerserkDmgReduction03"
		if TweakDB:GetRecord(berserkLowerDmg03) == nil then
			local berserkLowerDmg03UiData = Ti200.createUiData(berserkLowerDmg03, {}, "ability_silenced", {30}, "LocKey#40805", "", {}, {})
			Ti200.makeEffectorGroupPackage(berserkLowerDmg03, "ApplyEffectorEffector", "ModifyDamageEffector", berserkEffectPrereq, "Prereqs.ProcessHitReceived", "Multiply", 0.7, "Float", berserkLowerDmg03UiData)
			Ti200.associateRecordToArray(berserkEquip4, berserkLowerDmg03)
		end

		-- HIGH REDUCTION Mk.5
		local berserkLowerDmg04 = "Items.BerserkDmgReduction04"
		if TweakDB:GetRecord(berserkLowerDmg04) == nil then
			local berserkLowerDmg04UiData = Ti200.createUiData(berserkLowerDmg04, {}, "ability_silenced", {40}, "LocKey#40805", "", {}, {})
			Ti200.makeEffectorGroupPackage(berserkLowerDmg04, "ApplyEffectorEffector", "ModifyDamageEffector", berserkEffectPrereq, "Prereqs.ProcessHitReceived", "Multiply", 0.6, "Float", berserkLowerDmg04UiData)
			Ti200.associateRecordToArray(berserkEquip5, berserkLowerDmg04)
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
