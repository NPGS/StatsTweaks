-- ver. 2.5.2

-- OUTER CHEST

	-- DEAD-EYE Legendary (restored original effects, highly balanced stats (no game breaker))
	local equipSlots = {'AttachmentSlots.InnerChestFabricEnhancer1',
		'AttachmentSlots.InnerChestFabricEnhancer2',
		'AttachmentSlots.OuterChestFabricEnhancer1',
		'AttachmentSlots.OuterChestFabricEnhancer2'}
	TweakDB:SetFlat("Items.PowerfulFabricEnhancer08_inline0.statType", "BaseStats.CritChance")
	TweakDB:SetFlat("Items.PowerfulFabricEnhancer08_inline0.value", 2)
	TweakDB:SetFlat("Items.PowerfulFabricEnhancer08_inline1.value" , 6)
	TweakDB:SetFlat("Items.PowerfulFabricEnhancer08_inline3.statType", "BaseStats.CritChance")
	TweakDB:SetFlat("Items.PowerfulFabricEnhancer08_inline3.value", 2)
	TweakDB:SetFlat("Items.PowerfulFabricEnhancer08_inline4.value", 6)
	TweakDB:SetFlat("Items.PowerfulFabricEnhancer08_inline6.localizedDescription", "LocKey#45284")
	TweakDB:SetFlat("Items.PowerfulFabricEnhancer08_inline6.stats", {"BaseStats.CritChance"})
	TweakDB:SetFlat("Items.PowerfulFabricEnhancer08.placementSlots", equipSlots)
	TweakDB:SetFlat("Items.PowerfulFabricEnhancer08.itemType", "ItemType.Prt_TorsoFabricEnhancer")
