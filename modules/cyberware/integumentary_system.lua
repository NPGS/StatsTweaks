-- ver. 2.5

-- SUBDERMAL ARMOR

	-- Common
	TweakDB:SetFlat("Items.SubdermalArmorCommon_inline1.value", 100)
	TweakDB:SetFlat("Items.SubdermalArmorCommon_inline2.intValues", {100})

	-- Uncommon (need Street Cred 5 to equip)
	if TweakDB:GetRecord("Items.SubdermalArmorUncommon_requirement0") == nil then
		TweakDB:CreateRecord("Items.SubdermalArmorUncommon_requirement0", "gamedataStatPrereq_Record")
		TweakDB:SetFlat("Items.SubdermalArmorUncommon_requirement0.comparisonType", "GreaterOrEqual")
		TweakDB:SetFlat("Items.SubdermalArmorUncommon_requirement0.prereqClassName", "StatPrereq")
		TweakDB:SetFlat("Items.SubdermalArmorUncommon_requirement0.statType", "StreetCred")
		TweakDB:SetFlat("Items.SubdermalArmorUncommon_requirement0.valueToCheck", 5)
		TweakDB:SetFlat("Items.SubdermalArmorUncommon.equipPrereqs", {"Items.SubdermalArmorUncommon_requirement0"})
	end
	TweakDB:SetFlat("Items.SubdermalArmorUncommon_inline1.value", 250)
	TweakDB:SetFlat("Items.SubdermalArmorUncommon_inline2.intValues", {250})

	-- Rare (need Street Cred 10 to equip)
	if TweakDB:GetRecord("Items.SubdermalArmorRare_requirement0") == nil then
		TweakDB:CreateRecord("Items.SubdermalArmorRare_requirement0", "gamedataStatPrereq_Record")
		TweakDB:SetFlat("Items.SubdermalArmorRare_requirement0.comparisonType", "GreaterOrEqual")
		TweakDB:SetFlat("Items.SubdermalArmorRare_requirement0.prereqClassName", "StatPrereq")
		TweakDB:SetFlat("Items.SubdermalArmorRare_requirement0.statType", "StreetCred")
		TweakDB:SetFlat("Items.SubdermalArmorRare_requirement0.valueToCheck", 10)
		TweakDB:SetFlat("Items.SubdermalArmorRare.equipPrereqs", {"Items.SubdermalArmorRare_requirement0"})
	end
	TweakDB:SetFlat("Items.SubdermalArmorRare_inline1.value", 400)
	TweakDB:SetFlat("Items.SubdermalArmorRare_inline2.intValues", {400})

	-- Epic (need Street Cred 20 to equip)
	if TweakDB:GetRecord("Items.SubdermalArmorEpic_requirement0") == nil then
		TweakDB:CreateRecord("Items.SubdermalArmorEpic_requirement0", "gamedataStatPrereq_Record")
		TweakDB:SetFlat("Items.SubdermalArmorEpic_requirement0.comparisonType", "GreaterOrEqual")
		TweakDB:SetFlat("Items.SubdermalArmorEpic_requirement0.prereqClassName", "StatPrereq")
		TweakDB:SetFlat("Items.SubdermalArmorEpic_requirement0.statType", "StreetCred")
		TweakDB:SetFlat("Items.SubdermalArmorEpic_requirement0.valueToCheck", 20)
		TweakDB:SetFlat("Items.SubdermalArmorEpic.equipPrereqs", {"Items.SubdermalArmorEpic_requirement0"})
	end
	TweakDB:SetFlat("Items.SubdermalArmorEpic_inline1.value", 600)
	TweakDB:SetFlat("Items.SubdermalArmorEpic_inline2.intValues", {600})

	-- Legendary (need Street Cred 35 to equip)
	if TweakDB:GetRecord("Items.SubdermalArmorLegendary_requirement0") == nil then
		TweakDB:CreateRecord("Items.SubdermalArmorLegendary_requirement0", "gamedataStatPrereq_Record")
		TweakDB:SetFlat("Items.SubdermalArmorLegendary_requirement0.comparisonType", "GreaterOrEqual")
		TweakDB:SetFlat("Items.SubdermalArmorLegendary_requirement0.prereqClassName", "StatPrereq")
		TweakDB:SetFlat("Items.SubdermalArmorLegendary_requirement0.statType", "StreetCred")
		TweakDB:SetFlat("Items.SubdermalArmorLegendary_requirement0.valueToCheck", 35)
		TweakDB:SetFlat("Items.SubdermalArmorLegendary.equipPrereqs", {"Items.SubdermalArmorLegendary_requirement0"})
	end
	TweakDB:SetFlat("Items.SubdermalArmorLegendary_inline1.value", 800)
	TweakDB:SetFlat("Items.SubdermalArmorLegendary_inline2.intValues", {800})


-- OPTICAL CAMO

	-- Rare & Epic Shared Cooldown
	TweakDB:SetFlat("BaseStatusEffect.OpticalCamoCooldown_inline1.value", 45)

	-- Rare (need Street Cred 10 to equip)
	if TweakDB:GetRecord("Items.OpticalCamoRare_requirement0") == nil then
		TweakDB:CreateRecord("Items.OpticalCamoRare_requirement0", "gamedataStatPrereq_Record")
		TweakDB:SetFlat("Items.OpticalCamoRare_requirement0.comparisonType", "GreaterOrEqual")
		TweakDB:SetFlat("Items.OpticalCamoRare_requirement0.prereqClassName", "StatPrereq")
		TweakDB:SetFlat("Items.OpticalCamoRare_requirement0.statType", "StreetCred")
		TweakDB:SetFlat("Items.OpticalCamoRare_requirement0.valueToCheck", 10)
		TweakDB:SetFlat("Items.OpticalCamoRare.equipPrereqs", {"Items.OpticalCamoRare_requirement0"})
	end
	TweakDB:SetFlat("Items.OpticalCamoRare_inline2.intValues", {10, 45})

	-- Epic (need Street Cred 20 to equip)
	if TweakDB:GetRecord("Items.OpticalCamoEpic_requirement0") == nil then
		TweakDB:CreateRecord("Items.OpticalCamoEpic_requirement0", "gamedataStatPrereq_Record")
		TweakDB:SetFlat("Items.OpticalCamoEpic_requirement0.comparisonType", "GreaterOrEqual")
		TweakDB:SetFlat("Items.OpticalCamoEpic_requirement0.prereqClassName", "StatPrereq")
		TweakDB:SetFlat("Items.OpticalCamoEpic_requirement0.statType", "StreetCred")
		TweakDB:SetFlat("Items.OpticalCamoEpic_requirement0.valueToCheck", 20)
		TweakDB:SetFlat("Items.OpticalCamoEpic.equipPrereqs", {"Items.OpticalCamoEpic_requirement0"})
	end
	TweakDB:SetFlat("Items.OpticalCamoEpic_inline2.intValues", {15, 45})

	-- Legendary (need Street Cred 40 to equip)
	if TweakDB:GetRecord("Items.OpticalCamoLegendary_requirement0") == nil then
		TweakDB:CreateRecord("Items.OpticalCamoLegendary_requirement0", "gamedataStatPrereq_Record")
		TweakDB:SetFlat("Items.OpticalCamoLegendary_requirement0.comparisonType", "GreaterOrEqual")
		TweakDB:SetFlat("Items.OpticalCamoLegendary_requirement0.prereqClassName", "StatPrereq")
		TweakDB:SetFlat("Items.OpticalCamoLegendary_requirement0.statType", "StreetCred")
		TweakDB:SetFlat("Items.OpticalCamoLegendary_requirement0.valueToCheck", 40)
		TweakDB:SetFlat("Items.OpticalCamoLegendary.equipPrereqs", {"Items.OpticalCamoLegendary_requirement0"})
	end
	TweakDB:SetFlat("BaseStatusEffect.OpticalCamoPlayerBuffLegendary_inline1.value", 20)
	TweakDB:SetFlat("BaseStatusEffect.OpticalCamoLegendaryCooldown_inline1.value", 30)
	TweakDB:SetFlat("Items.OpticalCamoLegendary_inline2.intValues", {20, 30})
