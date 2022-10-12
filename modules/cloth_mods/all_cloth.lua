-- ver. 2.5.2

-- PRICE

	TweakDB:SetFlat("Price.PowerfulFabricEnhancer.value", 25)


-- EVERY CLOTHES

	-- BULLY Legendary (balanced stat crit damage to 12%)
	local bullySlots = {'AttachmentSlots.FaceFabricEnhancer1',
						'AttachmentSlots.HeadFabricEnhancer1',
						'AttachmentSlots.FootFabricEnhancer1', 
						'AttachmentSlots.LegsFabricEnhancer1', 
						'AttachmentSlots.LegsFabricEnhancer2', 
						'AttachmentSlots.InnerChestFabricEnhancer1',
						'AttachmentSlots.InnerChestFabricEnhancer2',
						'AttachmentSlots.OuterChestFabricEnhancer1',
						'AttachmentSlots.OuterChestFabricEnhancer2'}
	TweakDB:SetFlat("Items.SimpleFabricEnhancer04_inline0.value", 12)
	TweakDB:SetFlat("Items.SimpleFabricEnhancer04_inline2.value", 12)
	TweakDB:SetFlat("Items.SimpleFabricEnhancer04.placementSlots", bullySlots)
	TweakDB:SetFlat("Items.SimpleFabricEnhancer04.itemType", "ItemType.Prt_FabricEnhancer")
