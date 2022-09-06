-- ver. 2.1

-- SANDEVISTAN

	-- Sandevistan price
	if TweakDB:GetRecord("Price.Sandevistan_Iconic") == nil then
		TweakDB:CloneRecord("Price.Sandevistan_Iconic", "Price.Sandevistan")
	end
	TweakDB:SetFlat("Price.Sandevistan_Iconic.value", 15)
	TweakDB:SetFlat("Price.Sandevistan.value", 6.5)

	-- Sandevistan Cooldown Mk.1 / Mk.4
	TweakDB:SetFlat("Items.SandevistanC1MK1_inline3.value", 10)	-- Zetatech Mk.1
	TweakDB:SetFlat("Items.SandevistanC1MK2_inline3.value", 15)	-- Zetatech Mk.2
	TweakDB:SetFlat("Items.SandevistanC1MK3_inline3.value", 15)	-- Zetatech Mk.3
	TweakDB:SetFlat("Items.SandevistanC2MK1_inline3.value", 10)	-- Dynalar Mk.1
	TweakDB:SetFlat("Items.SandevistanC2MK2_inline3.value", 15)	-- Dynalar Mk.2
	TweakDB:SetFlat("Items.SandevistanC2MK4_inline3.value", 20)	-- Dynalar Mk.4

	-- Sandevistan "Warp Dancer" Qiant Mk.5
	TweakDB:SetFlat("Items.SandevistanC3MK5_inline0.valueToCheck", 20)	-- prerequisite
	TweakDB:SetFlat("Items.SandevistanC3MK5_inline3.value", 20)			-- cooldown
	TweakDB:SetFlat("Items.SandevistanC3MK5_inline8.value", 1.2)		-- damage
	TweakDB:SetFlat("Items.SandevistanC3MK5_inline9.intValues", {20})	-- damage UI
	TweakDB:SetFlat("Items.SandevistanC3MK5_inline14.value", 20)		-- crit chance
	TweakDB:SetFlat("Items.SandevistanC3MK5_inline15.value", 40)		-- crit damage
	TweakDB:SetFlat("Items.SandevistanC3MK5_inline16.intValues", {20, 40})	-- crit UI
	TweakDB:SetFlat("Items.SandevistanC3MK5.buyPrice", {"Price.BasePrice","Price.BuyMultiplier","Price.Cyberware","Price.CyberwareQualityMultiplier","Price.IconicMultiplier","Price.Sandevistan_Iconic"})
	TweakDB:SetFlat("Items.SandevistanC3MK5.sellPrice", {"Price.BasePrice","Price.CyberwareSellMultiplier","Price.Cyberware","Price.CyberwareQualityMultiplier","Price.CraftingTraitMultiplier","Price.IconicMultiplier","Price.Sandevistan_Iconic"})

	-- Sandevistan "Falcon" Militech Mk.5
	TweakDB:SetFlat("Items.SandevistanC4MK5_inline3.value", 20)		-- cooldown
	TweakDB:SetFlat("Items.SandevistanC4MK5_inline8.value", 1.2)	-- damage
	TweakDB:SetFlat("Items.SandevistanC4MK5_inline9.intValues", {20})	-- damage UI
	TweakDB:SetFlat("Items.SandevistanC4MK5.buyPrice", {"Price.BasePrice","Price.BuyMultiplier","Price.Cyberware","Price.CyberwareQualityMultiplier","Price.IconicMultiplier","Price.Sandevistan_Iconic"})
	TweakDB:SetFlat("Items.SandevistanC4MK5.sellPrice", {"Price.BasePrice","Price.CyberwareSellMultiplier","Price.Cyberware","Price.CyberwareQualityMultiplier","Price.CraftingTraitMultiplier","Price.IconicMultiplier","Price.Sandevistan_Iconic"})
