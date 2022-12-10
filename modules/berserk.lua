-- ver. 3.0.4

-- BERSERK

	-- Berserk price
	if TweakDB:GetRecord("Price.Berserk_Iconic") == nil then
		TweakDB:CloneRecord("Price.Berserk_Iconic", "Price.Berserk")
	end
	TweakDB:SetFlat("Price.Berserk_Iconic.value", 10)
	TweakDB:SetFlat("Price.Berserk.value", 6)

	-- Moore Berserk Mk.1
	TweakDB:SetFlat("Items.BerserkC1MK1_inline3.value", 10)	-- armor / resistances
	TweakDB:SetFlat("Items.BerserkC1MK1_inline5.value", 10)	-- cooldown

	-- Moore Berserk Mk.2
	TweakDB:SetFlat("Items.BerserkC1MK2_inline4.value", 10)	-- armor / resistances
	TweakDB:SetFlat("Items.BerserkC1MK2_inline6.value", 15)	-- cooldown
	TweakDB:SetFlat("Items.BerserkC1MK2_inline11.modifierType", "Multiplier")	-- multiplier
	TweakDB:SetFlat("Items.BerserkC1MK2_inline11.value", 1.1)	-- health

	-- Moore Berserk Mk.3
	TweakDB:SetFlat("Items.BerserkC1MK3_inline4.value", 20)	-- armor / resistances
	TweakDB:SetFlat("Items.BerserkC1MK3_inline5.value", 20)	-- duration
	TweakDB:SetFlat("Items.BerserkC1MK3_inline6.value", 20)	-- cooldown
	TweakDB:SetFlat("Items.BerserkC1MK3_inline17.modifierType", "Multiplier")	-- multiplier
	TweakDB:SetFlat("Items.BerserkC1MK3_inline17.value", 1.2)	-- health

	-- BioDyne Tech Berserk Mk.1
	TweakDB:SetFlat("Items.BerserkC2MK1_inline3.value", 10)	-- armor / resistances
	TweakDB:SetFlat("Items.BerserkC2MK1_inline5.value", 10)	-- cooldown

	-- BioDyne Tech Berserk Mk.2
	TweakDB:SetFlat("Items.BerserkC2MK2_inline4.value", 10)	-- armor / resistances
	TweakDB:SetFlat("Items.BerserkC2MK2_inline6.value", 15)	-- cooldown

	-- BioDyne Tech Berserk Mk.3
	TweakDB:SetFlat("Items.BerserkC2MK3_inline4.value", 20)	-- armor / resistances
	TweakDB:SetFlat("Items.BerserkC2MK3_inline5.value", 20)	-- duration
	TweakDB:SetFlat("Items.BerserkC2MK3_inline6.value", 20)	-- cooldown

	-- BioDyne Tech Berserk Mk.4
	TweakDB:SetFlat("Items.BerserkC2MK4_inline4.value", 30)	-- armor / resistances
	TweakDB:SetFlat("Items.BerserkC2MK4_inline6.value", 30)	-- cooldown

	-- Zetatech Berserk Mk.4
	TweakDB:SetFlat("Items.BerserkC3MK4_inline1.value", 20)	-- recoil
	TweakDB:SetFlat("Items.BerserkC3MK4_inline2.value", 20)	-- sway
	TweakDB:SetFlat("Items.BerserkC3MK4_inline3.value", 20)	-- melee dmg
	TweakDB:SetFlat("Items.BerserkC3MK4_inline4.value", 30)	-- armor / resistances
	TweakDB:SetFlat("Items.BerserkC3MK4_inline5.value", 30)	-- duration
	TweakDB:SetFlat("Items.BerserkC3MK4_inline6.value", 30)	-- cooldown

	-- Zetatech Berserk Mk.5
	TweakDB:SetFlat("Items.BerserkC3MK5_inline1.value", 30)	-- recoil
	TweakDB:SetFlat("Items.BerserkC3MK5_inline2.value", 30)	-- sway
	TweakDB:SetFlat("Items.BerserkC3MK5_inline3.value", 30)	-- melee dmg
	TweakDB:SetFlat("Items.BerserkC3MK5_inline4.value", 40)	-- armor / resistances
	TweakDB:SetFlat("Items.BerserkC3MK5.buyPrice", {"Price.BasePrice","Price.BuyMultiplier","Price.Cyberware","Price.CyberwareQualityMultiplier","Price.IconicMultiplier","Price.Berserk_Iconic"})
	TweakDB:SetFlat("Items.BerserkC3MK5.sellPrice", {"Price.BasePrice","Price.CyberwareSellMultiplier","Price.Cyberware","Price.CyberwareQualityMultiplier","Price.CraftingTraitMultiplier","Price.IconicMultiplier","Price.Berserk_Iconic"})

	-- Militech Berserk Mk.5
	TweakDB:SetFlat("Items.BerserkC4MK5_inline1.value", 20)	-- recoil
	TweakDB:SetFlat("Items.BerserkC4MK5_inline2.value", 20)	-- sway
	TweakDB:SetFlat("Items.BerserkC4MK5_inline3.value", 20)	-- melee dmg
	TweakDB:SetFlat("Items.BerserkC4MK5_inline4.value", 40)	-- armor / resistances
	TweakDB:SetFlat("Items.BerserkC4MK5_inline5.value", 30)	-- duration
	TweakDB:SetFlat("Items.BerserkC4MK5_inline6.value", 30)	-- cooldown
	TweakDB:SetFlat("Items.BerserkC4MK5_inline18.modifierType", "Multiplier")
	TweakDB:SetFlat("Items.BerserkC4MK5_inline18.value", 1.4)	-- health
	TweakDB:SetFlat("Items.BerserkC4MK5.buyPrice", {"Price.BasePrice","Price.BuyMultiplier","Price.Cyberware","Price.CyberwareQualityMultiplier","Price.IconicMultiplier","Price.Berserk_Iconic"})
	TweakDB:SetFlat("Items.BerserkC4MK5.sellPrice", {"Price.BasePrice","Price.CyberwareSellMultiplier","Price.Cyberware","Price.CyberwareQualityMultiplier","Price.CraftingTraitMultiplier","Price.IconicMultiplier","Price.Berserk_Iconic"})
