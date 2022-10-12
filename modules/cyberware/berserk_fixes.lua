-- ver. 2.5.1

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

		-- ADD RESISTANCES TO BERSERKS Mk.1 / Mk.2
		if TweakDB:GetRecord("Items.Berserk_LowResistance") == nil then
			TweakDB:CreateRecord("Items.Berserk_LowResistance", "gamedataConstantStatModifier_Record")
			TweakDB:SetFlat("Items.Berserk_LowResistance.modifierType", "Additive")
			TweakDB:SetFlat("Items.Berserk_LowResistance.statType", "BaseStats.BerserkResistancesBonus")
			arrayInsert("Items.BerserkC1MK1.statModifiers", "Items.Berserk_LowResistance")
			arrayInsert("Items.BerserkC1MK2.statModifiers", "Items.Berserk_LowResistance")
			arrayInsert("Items.BerserkC2MK1.statModifiers", "Items.Berserk_LowResistance")
			arrayInsert("Items.BerserkC2MK2.statModifiers", "Items.Berserk_LowResistance")
		end

		-- ADD RESISTANCES TO BERSERKS Mk.3 / Mk.4
		if TweakDB:GetRecord("Items.Berserk_AvgResistance") == nil then
			TweakDB:CreateRecord("Items.Berserk_AvgResistance", "gamedataConstantStatModifier_Record")
			TweakDB:SetFlat("Items.Berserk_AvgResistance.modifierType", "Additive")
			TweakDB:SetFlat("Items.Berserk_AvgResistance.statType", "BaseStats.BerserkResistancesBonus")
			arrayInsert("Items.BerserkC1MK3.statModifiers", "Items.Berserk_AvgResistance")
			arrayInsert("Items.BerserkC2MK3.statModifiers", "Items.Berserk_AvgResistance")
			arrayInsert("Items.BerserkC2MK4.statModifiers", "Items.Berserk_AvgResistance")
			arrayInsert("Items.BerserkC3MK4.statModifiers", "Items.Berserk_AvgResistance")
		end

		-- ADD RESISTANCES TO BERSERKS Mk.5
		if TweakDB:GetRecord("Items.Berserk_HighResistance") == nil then
			TweakDB:CreateRecord("Items.Berserk_HighResistance", "gamedataConstantStatModifier_Record")
			TweakDB:SetFlat("Items.Berserk_HighResistance.modifierType", "Additive")
			TweakDB:SetFlat("Items.Berserk_HighResistance.statType", "BaseStats.BerserkResistancesBonus")
			arrayInsert("Items.BerserkC3MK5.statModifiers", "Items.Berserk_HighResistance")
			arrayInsert("Items.BerserkC4MK5.statModifiers", "Items.Berserk_HighResistance")
		end
		-- SET RESISTANCES VALUE
		TweakDB:SetFlat("Items.Berserk_LowResistance.value", 10)
		TweakDB:SetFlat("Items.Berserk_AvgResistance.value", 20)
		TweakDB:SetFlat("Items.Berserk_HighResistance.value", 30)


	-- MELEE DAMAGE DMG ADD
	if TweakDB:GetRecord("BaseStatusEffect.BerserkPlayerBuff_melee_dmg") == nil then
		TweakDB:CreateRecord("BaseStatusEffect.BerserkPlayerBuff_melee_dmg", "gamedataCombinedStatModifier_Record")
		TweakDB:SetFlat("BaseStatusEffect.BerserkPlayerBuff_melee_dmg.modifierType", "AdditiveMultiplier")
		TweakDB:SetFlat("BaseStatusEffect.BerserkPlayerBuff_melee_dmg.opSymbol", "*")
		TweakDB:SetFlat("BaseStatusEffect.BerserkPlayerBuff_melee_dmg.refObject", "Player")
		TweakDB:SetFlat("BaseStatusEffect.BerserkPlayerBuff_melee_dmg.refStat", "BaseStats.BerserkMeleeDamageBonus")
		TweakDB:SetFlat("BaseStatusEffect.BerserkPlayerBuff_melee_dmg.statType", "BaseStats.EffectiveDPS")
		TweakDB:SetFlat("BaseStatusEffect.BerserkPlayerBuff_melee_dmg.value", 0.01)
		arrayInsert("BaseStatusEffect.BerserkPlayerBuff_inline19.statModifiers", "BaseStatusEffect.BerserkPlayerBuff_melee_dmg")
	end


	-- UIDATA COOLDOWN FIX (for when 'Chained Berserk' mod is equipped)
	if TweakDB:GetRecord("Items.BerserkBase_cooldown_fix") == nil then
		TweakDB:CloneRecord("Items.BerserkBase_cooldown_fix", "Items.SandevistanBase_inline1")
		TweakDB:SetFlat("Items.BerserkBase_cooldown_fix.refStat", "BaseStats.BerserkCooldownReduction")
		TweakDB:SetFlat("Items.BerserkBase_cooldown_fix.statType", "BaseStats.BerserkCooldownBase")
		TweakDB:SetFlat("Items.BerserkBase_cooldown_fix.value", 1)
		TweakDB:SetFlat("Items.BerserkBase.statModifiers", {"Items.BerserkBase_inline3","Items.BerserkBase_cooldown_fix"})
		TweakDB:SetFlat("BaseStatusEffect.BerserkCooldown_inline0.statModifiers", {"BaseStatusEffect.CyberwareCooldownDuration_inline0","BaseStatusEffect.BerserkCooldown_inline1","BaseStatusEffect.BerserkCooldown_inline2"})
		arrayInsert("Items.BerserkC1MK2.statModifiers", "Items.BerserkBase_cooldown_fix")
		arrayInsert("Items.BerserkC1MK3.statModifiers", "Items.BerserkBase_cooldown_fix")
		arrayInsert("Items.BerserkC2MK2.statModifiers", "Items.BerserkBase_cooldown_fix")
		arrayInsert("Items.BerserkC2MK3.statModifiers", "Items.BerserkBase_cooldown_fix")
		arrayInsert("Items.BerserkC2MK4.statModifiers", "Items.BerserkBase_cooldown_fix")
		arrayInsert("Items.BerserkC3MK4.statModifiers", "Items.BerserkBase_cooldown_fix")
		arrayInsert("Items.BerserkC3MK5.statModifiers", "Items.BerserkBase_cooldown_fix")
		arrayInsert("Items.BerserkC4MK5.statModifiers", "Items.BerserkBase_cooldown_fix")
	end


	-- STRENGTH INCREASES CARRY CAPACITY

		-- MEDIUM CAPACITY Mk.1 / Mk.3
		if TweakDB:GetRecord("Items.BerserkCarryCapacity_M_inline0") == nil then
			TweakDB:CreateRecord("Items.BerserkCarryCapacity_M_inline0", "gamedataGameplayLogicPackage_Record")	-- LOGIC PACKAGE
				TweakDB:CloneRecord("Items.BerserkCarryCapacity_M_inline1", "Items.BerserkC4MK5_inline15")	-- STAT GROUP EFFECTOR
					TweakDB:CloneRecord("Items.BerserkCarryCapacity_M_inline2", "Items.BerserkC4MK5_inline17")	-- STAT MODIFIER GROUP
						TweakDB:CloneRecord("Items.BerserkCarryCapacity_M_inline3", "Items.TitaniumInfusedBonesCommon_inline1")	-- CONSTANT STAT MODIFIER
				TweakDB:CloneRecord("Items.BerserkCarryCapacity_M_inline4", "Items.TitaniumInfusedBonesCommon_inline2")	-- UIDATA
			-- SET STATS
			TweakDB:SetFlat("Items.BerserkCarryCapacity_M_inline0.effectors", {"Items.BerserkCarryCapacity_M_inline1"})
				TweakDB:SetFlat("Items.BerserkCarryCapacity_M_inline1.statGroup", "Items.BerserkCarryCapacity_M_inline2")
					TweakDB:SetFlat("Items.BerserkCarryCapacity_M_inline2.statModifiers", {"Items.BerserkCarryCapacity_M_inline3"})
			TweakDB:SetFlat("Items.BerserkCarryCapacity_M_inline0.UIData", "Items.BerserkCarryCapacity_M_inline4")
			arrayInsert("Items.BerserkC1MK1.OnEquip", "Items.BerserkCarryCapacity_M_inline0")
			arrayInsert("Items.BerserkC1MK2.OnEquip", "Items.BerserkCarryCapacity_M_inline0")
			arrayInsert("Items.BerserkC1MK3.OnEquip", "Items.BerserkCarryCapacity_M_inline0")
			arrayInsert("Items.BerserkC2MK1.OnEquip", "Items.BerserkCarryCapacity_M_inline0")
			arrayInsert("Items.BerserkC2MK2.OnEquip", "Items.BerserkCarryCapacity_M_inline0")
			arrayInsert("Items.BerserkC2MK3.OnEquip", "Items.BerserkCarryCapacity_M_inline0")
		end

		-- HIGH CAPACITY Mk.4 / Mk.5
		if TweakDB:GetRecord("Items.BerserkCarryCapacity_H_inline0") == nil then
			TweakDB:CreateRecord("Items.BerserkCarryCapacity_H_inline0", "gamedataGameplayLogicPackage_Record")	-- LOGIC PACKAGE
				TweakDB:CloneRecord("Items.BerserkCarryCapacity_H_inline1", "Items.BerserkC4MK5_inline15")	-- STAT GROUP EFFECTOR
					TweakDB:CloneRecord("Items.BerserkCarryCapacity_H_inline2", "Items.BerserkC4MK5_inline17")	-- STAT MODIFIER GROUP
						TweakDB:CloneRecord("Items.BerserkCarryCapacity_H_inline3", "Items.TitaniumInfusedBonesUncommon_inline1")	-- CONSTANT STAT MODIFIER
				TweakDB:CloneRecord("Items.BerserkCarryCapacity_H_inline4", "Items.TitaniumInfusedBonesUncommon_inline2")	-- UIDATA
			-- SET STATS
			TweakDB:SetFlat("Items.BerserkCarryCapacity_H_inline0.effectors", {"Items.BerserkCarryCapacity_H_inline1"})
				TweakDB:SetFlat("Items.BerserkCarryCapacity_H_inline1.statGroup", "Items.BerserkCarryCapacity_H_inline2")
					TweakDB:SetFlat("Items.BerserkCarryCapacity_H_inline2.statModifiers", {"Items.BerserkCarryCapacity_H_inline3"})
			TweakDB:SetFlat("Items.BerserkCarryCapacity_H_inline0.UIData", "Items.BerserkCarryCapacity_H_inline4")
			arrayInsert("Items.BerserkC2MK4.OnEquip", "Items.BerserkCarryCapacity_H_inline0")
			arrayInsert("Items.BerserkC3MK4.OnEquip", "Items.BerserkCarryCapacity_H_inline0")
			arrayInsert("Items.BerserkC3MK5.OnEquip", "Items.BerserkCarryCapacity_H_inline0")
			arrayInsert("Items.BerserkC4MK5.OnEquip", "Items.BerserkCarryCapacity_H_inline0")
		end


	-- ADD DAMAGE REDUCTION

		-- LOW REDUCTION
		if TweakDB:GetRecord("Items.BerserkLowDmgReduction_inline0") == nil then
			TweakDB:CreateRecord("Items.BerserkLowDmgReduction_inline0", "gamedataGameplayLogicPackage_Record")	-- LOGIC PACKAGE
				TweakDB:CloneRecord("Items.BerserkLowDmgReduction_inline1", "Items.BerserkC4MK5_inline9")	-- EFFECTOR EFFECTOR
					TweakDB:CloneRecord("Items.BerserkLowDmgReduction_inline2", "Items.PainReductor_inline2")	-- EFFECTOR
				TweakDB:CloneRecord("Items.BerserkLowDmgReduction_inline3", "Items.PainReductor_inline3")	-- UIDATA
			-- SET STATS
			TweakDB:SetFlat("Items.BerserkLowDmgReduction_inline0.effectors", {"Items.BerserkLowDmgReduction_inline1"})
				TweakDB:SetFlat("Items.BerserkLowDmgReduction_inline1.effectorToApply", "Items.BerserkLowDmgReduction_inline2")
					TweakDB:SetFlat("Items.BerserkLowDmgReduction_inline2.operationType", 'Multiply')
					TweakDB:SetFlat("Items.BerserkLowDmgReduction_inline2.value", 0.85, 'Float')
			TweakDB:SetFlat("Items.BerserkLowDmgReduction_inline0.UIData", "Items.BerserkLowDmgReduction_inline3")
				TweakDB:SetFlat("Items.BerserkLowDmgReduction_inline3.intValues", {15})	-- UIDATA
			arrayInsert("Items.BerserkC1MK1.OnEquip", "Items.BerserkLowDmgReduction_inline0")
			arrayInsert("Items.BerserkC1MK2.OnEquip", "Items.BerserkLowDmgReduction_inline0")
			arrayInsert("Items.BerserkC2MK1.OnEquip", "Items.BerserkLowDmgReduction_inline0")
			arrayInsert("Items.BerserkC2MK2.OnEquip", "Items.BerserkLowDmgReduction_inline0")
		end

		-- MEDIUM REDUCTION
		if TweakDB:GetRecord("Items.BerserkMediumDmgReduction_inline0") == nil then
			TweakDB:CreateRecord("Items.BerserkMediumDmgReduction_inline0", "gamedataGameplayLogicPackage_Record")	-- LOGIC PACKAGE
				TweakDB:CloneRecord("Items.BerserkMediumDmgReduction_inline1", "Items.BerserkC4MK5_inline9")	-- EFFECTOR EFFECTOR
					TweakDB:CloneRecord("Items.BerserkMediumDmgReduction_inline2", "Items.PainReductor_inline2")	-- EFFECTOR
				TweakDB:CloneRecord("Items.BerserkMediumDmgReduction_inline3", "Items.PainReductor_inline3")	-- UIDATA
			-- SET STATS
			TweakDB:SetFlat("Items.BerserkMediumDmgReduction_inline0.effectors", {"Items.BerserkMediumDmgReduction_inline1"})
				TweakDB:SetFlat("Items.BerserkMediumDmgReduction_inline1.effectorToApply", "Items.BerserkMediumDmgReduction_inline2")
					TweakDB:SetFlat("Items.BerserkMediumDmgReduction_inline2.operationType", 'Multiply')
					TweakDB:SetFlat("Items.BerserkMediumDmgReduction_inline2.value", 0.7, 'Float')
			TweakDB:SetFlat("Items.BerserkMediumDmgReduction_inline0.UIData", "Items.BerserkMediumDmgReduction_inline3")
				TweakDB:SetFlat("Items.BerserkMediumDmgReduction_inline3.intValues", {30})	-- UIDATA
			arrayInsert("Items.BerserkC1MK3.OnEquip", "Items.BerserkMediumDmgReduction_inline0")
			arrayInsert("Items.BerserkC2MK3.OnEquip", "Items.BerserkMediumDmgReduction_inline0")
			arrayInsert("Items.BerserkC2MK4.OnEquip", "Items.BerserkMediumDmgReduction_inline0")
			arrayInsert("Items.BerserkC3MK4.OnEquip", "Items.BerserkMediumDmgReduction_inline0")
		end

		-- HIGH REDUCTION
		if TweakDB:GetRecord("Items.BerserkHighDmgReduction_inline0") == nil then
			TweakDB:CreateRecord("Items.BerserkHighDmgReduction_inline0", "gamedataGameplayLogicPackage_Record")	-- LOGIC PACKAGE
				TweakDB:CloneRecord("Items.BerserkHighDmgReduction_inline1", "Items.BerserkC4MK5_inline9")	-- EFFECTOR EFFECTOR
					TweakDB:CloneRecord("Items.BerserkHighDmgReduction_inline2", "Items.PainReductor_inline2")	-- EFFECTOR
				TweakDB:CloneRecord("Items.BerserkHighDmgReduction_inline3", "Items.PainReductor_inline3")	-- UIDATA
			-- SET STATS
			TweakDB:SetFlat("Items.BerserkHighDmgReduction_inline0.effectors", {"Items.BerserkHighDmgReduction_inline1"})
				TweakDB:SetFlat("Items.BerserkHighDmgReduction_inline1.effectorToApply", "Items.BerserkHighDmgReduction_inline2")
					TweakDB:SetFlat("Items.BerserkHighDmgReduction_inline2.operationType", 'Multiply')
					TweakDB:SetFlat("Items.BerserkHighDmgReduction_inline2.value", 0.55, 'Float')
			TweakDB:SetFlat("Items.BerserkHighDmgReduction_inline0.UIData", "Items.BerserkHighDmgReduction_inline3")
				TweakDB:SetFlat("Items.BerserkHighDmgReduction_inline3.intValues", {45})	-- UIDATA
			arrayInsert("Items.BerserkC3MK5.OnEquip", "Items.BerserkHighDmgReduction_inline0")
			arrayInsert("Items.BerserkC4MK5.OnEquip", "Items.BerserkHighDmgReduction_inline0")
		end
