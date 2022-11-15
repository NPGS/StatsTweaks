-- ver. 3.0.3

-- SUBDERMAL ARMOR

	-- Common
	TweakDB:SetFlat("Items.SubdermalArmorCommon_inline1.value", 100)
	TweakDB:SetFlat("Items.SubdermalArmorCommon_inline2.intValues", {100})

	-- UNCOMMON
	TweakDB:SetFlat("Items.SubdermalArmorUncommon_inline1.value", 250)
	TweakDB:SetFlat("Items.SubdermalArmorUncommon_inline2.intValues", {250})

	-- RARE
	TweakDB:SetFlat("Items.SubdermalArmorRare_inline1.value", 400)
	TweakDB:SetFlat("Items.SubdermalArmorRare_inline2.intValues", {400})

	-- EPIC
	TweakDB:SetFlat("Items.SubdermalArmorEpic_inline1.value", 600)
	TweakDB:SetFlat("Items.SubdermalArmorEpic_inline2.intValues", {600})

	-- LEGENDARY
	TweakDB:SetFlat("Items.SubdermalArmorLegendary_inline1.value", 800)
	TweakDB:SetFlat("Items.SubdermalArmorLegendary_inline2.intValues", {800})


-- OPTICAL CAMO

	-- RARE & EPIC Shared Cooldown
	TweakDB:SetFlat("BaseStatusEffect.OpticalCamoCooldown_inline1.value", 45)

	-- RARE (need 12 Street Cred to buy)
	TweakDB:SetFlat("Vendors.std_rcr_ripperdoc_01_inline19.availabilityPrereq", "Vendors.EarlyEndGameCredAvailability")
	TweakDB:SetFlat("Vendors.pac_wwd_ripperdoc_01_inline11.availabilityPrereq", "Vendors.EarlyEndGameCredAvailability")
	TweakDB:SetFlat("Items.OpticalCamoRare_inline2.intValues", {10, 45})

	-- EPIC (need 25 Street Cred to buy)
	TweakDB:SetFlat("Vendors.wat_kab_ripperdoc_03_inline15.availabilityPrereq", "Vendors.LateStartGameCredAvailability")
	TweakDB:SetFlat("Items.OpticalCamoEpic_inline2.intValues", {15, 45})

	-- LEGENDARY (already has requirement of 39 Street Cred to buy)
	TweakDB:SetFlat("BaseStatusEffect.OpticalCamoPlayerBuffLegendary_inline1.value", 20)
	TweakDB:SetFlat("BaseStatusEffect.OpticalCamoLegendaryCooldown_inline1.value", 30)
	TweakDB:SetFlat("Items.OpticalCamoLegendary_inline2.intValues", {20, 30})
