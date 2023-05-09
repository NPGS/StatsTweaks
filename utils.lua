-- ver. 1.1.0   utilities functions

local Ti200 = {}

function Ti200.arrayInsert(arr, rec)
	bakArray = TweakDB:GetFlat(arr)
	table.insert(bakArray, rec)
	TweakDB:SetFlat(arr, bakArray)
end

-- i thank a collaborator of mine for allowing me to use this function
function Ti200.enableSlot(slotName)
    local recordID = TweakDB:GetRecord(slotName):GetID()
    Override('InventoryDataManagerV2', 'GetAttachmentSlotsForInventory;', function(wrappedMethod)
		slot = wrappedMethod()
		table.insert(slot, TweakDBID.new(slotName))
		return slot
	end)
    Override('UIItemsHelper', 'GetEmptySlotName;TweakDBID', function(slotID, wrappedMethod) 
        if (slotID == recordID) then
            return "UI-Labels-EmptyCyberwareModSlot"
        end
        return wrappedMethod(slotID)
    end)
    Override('UIItemsHelper', 'GetSlotShadowIcon;TweakDBIDgamedataItemTypegamedataEquipmentArea', function(slotID, itemType, equipmentArea, wrappedMethod)
        if (slotID == recordID) then
            return CName.new('UIIcon.ItemShadow_Fragment')
        end
        return wrappedMethod(slotID, itemType, equipmentArea)
    end)
    Override('UIItemsHelper', 'GetLootingtShadowIcon;TweakDBIDgamedataItemTypegamedataEquipmentArea', function(slotID, itemType, equipmentArea, wrappedMethod)
        if (slotID == recordID) then
            return CName.new('UIIcon.LootingShadow_Fragment')
        end
        return wrappedMethod(slotID, itemType, equipmentArea)
    end)
    Override('UIItemsHelper', 'GetSlotName;TweakDBIDgamedataItemTypegamedataEquipmentArea', function(slotID, itemType, equipmentArea, wrappedMethod)
        if (slotID == recordID) then
            return "Gameplay-Items-Item Type-Prt_Fragment"
        end
        return wrappedMethod(slotID, itemType, equipmentArea)
    end)
end

-- The functions below are done by me, always ask for a permission before using them for your own purpose
function Ti200.cloneConstantStat(statRecord, record, value)
    if TweakDB:GetRecord(statRecord) == nil then
        TweakDB:CloneRecord(statRecord, record)
        TweakDB:SetFlat(statRecord..".value", value)
    end
    return statRecord
end

function Ti200.createConstantStat(statRecord, modifierType, statType, value)
    if TweakDB:GetRecord(statRecord) == nil then
        TweakDB:CreateRecord(statRecord, "gamedataConstantStatModifier_Record")
        TweakDB:SetFlat(statRecord..".modifierType", modifierType)
        TweakDB:SetFlat(statRecord..".statType", statType)
        TweakDB:SetFlat(statRecord..".value", value)
    end
    return statRecord
end

function Ti200.createCombinedStat(statRecord, modifierType, opSymbol, refObject, refStat, statType, value)
    if TweakDB:GetRecord(statRecord) == nil then
        TweakDB:CreateRecord(statRecord, "gamedataCombinedStatModifier_Record")
        TweakDB:SetFlat(statRecord..".modifierType", modifierType)
        TweakDB:SetFlat(statRecord..".opSymbol", opSymbol)
        TweakDB:SetFlat(statRecord..".refObject", refObject)
        TweakDB:SetFlat(statRecord..".refStat", refStat)
        TweakDB:SetFlat(statRecord..".statType", statType)
        TweakDB:SetFlat(statRecord..".value", value)
    end
    return statRecord
end

function Ti200.createVendorItem(itemVendorRecord, streetCred, item, vendorItemList)
    if TweakDB:GetRecord(itemVendorRecord) == nil then
    	TweakDB:CloneRecord(itemVendorRecord, "Vendors.wat_lch_ripperdoc_01_inline14")
        TweakDB:SetFlat(itemVendorRecord..".availabilityPrereq", streetCred)
        TweakDB:SetFlat(itemVendorRecord..".item", item)
        Ti200.arrayInsert(vendorItemList, itemVendorRecord)
    end
end

function Ti200.createIcon(itemRecord, iconName, path)
    local iconRecord = "UIIcon."..itemRecord.."_icon"
    if TweakDB:GetRecord(iconRecord) == nil then
        TweakDB:CreateRecord(iconRecord, "gamedataUIIcon_Record")
        TweakDB:SetFlat(iconRecord..".atlasPartName", CName(iconName))
        TweakDB:SetFlat(iconRecord..".atlasResourcePath", CName(path))
        TweakDB:SetFlat(itemRecord..".icon", iconRecord)
        TweakDB:SetFlat(itemRecord..".iconPath", itemRecord.."_icon")
    end
end

function Ti200.associateRecordToArray(mainArray, record)
    for i, array in ipairs(mainArray) do
        Ti200.arrayInsert(array, record)
    end
end

function Ti200.createAndAssociateStatToArray(statRecord, modifierType, statType, value, mainArray)
    if TweakDB:GetRecord(statRecord) == nil then
        Ti200.createConstantStat(statRecord, modifierType, statType, value)
        Ti200.associateRecordToArray(mainArray, statRecord)
    end
end

function Ti200.setValueToRecordAttribute(mainArray, value)
    for i, recAtt in ipairs(mainArray) do
        TweakDB:SetFlat(recAtt, value)
    end
end

function Ti200.createUiData(record, floats, iconPath, integers, desc, locName, nameValues, stats)
    local recordName = record.."_uiData"
    if TweakDB:GetRecord(recordName) == nil then
        TweakDB:CreateRecord(recordName, "gamedataGameplayLogicPackageUIData_Record")
        TweakDB:SetFlat(recordName..".floatValues", floats)
        TweakDB:SetFlat(recordName..".iconPath", CName(iconPath))
        TweakDB:SetFlat(recordName..".intValues", integers)
        TweakDB:SetFlat(recordName..".localizedDescription", desc)
        TweakDB:SetFlat(recordName..".localizedName", locName)
        TweakDB:SetFlat(recordName..".nameValues", nameValues)
        TweakDB:SetFlat(recordName..".stats", stats)
    end
    return recordName
end

function Ti200.createStatusEffectPrereq(record, check, invert, prereq, effect, tag)
    local recordName = record.."_statusPrereq"
    if TweakDB:GetRecord(recordName) == nil then
        TweakDB:CreateRecord(recordName, "gamedataStatusEffectPrereq_Record")
        TweakDB:SetFlat(recordName..".checkType", check)
        TweakDB:SetFlat(recordName..".invert", invert)
        TweakDB:SetFlat(recordName..".prereqClassName", CName(prereq))
        TweakDB:SetFlat(recordName..".statusEffect", effect)
        TweakDB:SetFlat(recordName..".tagToCheck", CName(tag))
    end
    return recordName
end

function Ti200.makeEffectorGroupPackage(mainRecord, effectorName, effectorName2, prereq, prereq2, operation, value, type, uiData)
    if TweakDB:GetRecord(mainRecord) == nil then
        TweakDB:CreateRecord(mainRecord, "gamedataGameplayLogicPackage_Record")
            TweakDB:CreateRecord(mainRecord.."_inline0", "gamedataApplyEffectorEffector_Record")
                TweakDB:CreateRecord(mainRecord.."_inline1", "gamedataEffector_Record")
        TweakDB:SetFlat(mainRecord..".effectors", {mainRecord.."_inline0"})
            TweakDB:SetFlat(mainRecord.."_inline0.effectorClassName", CName(effectorName))
            TweakDB:SetFlat(mainRecord.."_inline0.effectorToApply", mainRecord.."_inline1")
            TweakDB:SetFlat(mainRecord.."_inline0.prereqRecord", prereq)
                TweakDB:SetFlat(mainRecord.."_inline1.effectorClassName", CName(effectorName2))
                TweakDB:SetFlat(mainRecord.."_inline1.prereqRecord", prereq2)
                TweakDB:SetFlat(mainRecord.."_inline1.operationType", operation)
                TweakDB:SetFlat(mainRecord.."_inline1.value", value, type)
        TweakDB:SetFlat(mainRecord..".UIData", uiData)
    end
end

function Ti200.makeStatGroupPackage(mainRecord, effectorName, prereq, statsArray, uiData)
    if TweakDB:GetRecord(mainRecord) == nil then
        TweakDB:CreateRecord(mainRecord, "gamedataGameplayLogicPackage_Record")
            TweakDB:CreateRecord(mainRecord.."_inline0", "gamedataApplyStatGroupEffector_Record")
                TweakDB:CreateRecord(mainRecord.."_inline1", "gamedataStatModifierGroup_Record")
        TweakDB:SetFlat(mainRecord..".effectors", {mainRecord.."_inline0"})
            TweakDB:SetFlat(mainRecord.."_inline0.effectorClassName", CName(effectorName))
            TweakDB:SetFlat(mainRecord.."_inline0.prereqRecord", prereq)
            TweakDB:SetFlat(mainRecord.."_inline0.statGroup", mainRecord.."_inline1")
                TweakDB:SetFlat(mainRecord.."_inline1.statModifiers", statsArray)
                TweakDB:SetFlat(mainRecord.."_inline1.statModsLimit", -1)
        TweakDB:SetFlat(mainRecord..".UIData", uiData)
    end
end

-- functions done by me to automatize the process of creating new blueprints and slots connected to "enableSlot()" function
function Ti200.addSlotsToMods(mods, slots)
    for i, modArr in ipairs(mods) do
        for j, slot in ipairs(slots) do
            Ti200.arrayInsert(modArr, slot)
        end
    end
end

function Ti200.createSlot(attachmentSlots)
    local newSlots = {}
    for i, slot in ipairs(attachmentSlots[0]) do
        local attachmentSlot = "AttachmentSlots."..slot[0].."_M"
        if TweakDB:GetRecord(attachmentSlot) == nil then
            TweakDB:CreateRecord(attachmentSlot, "gamedataAttachmentSlot_Record")
                TweakDB:SetFlat(attachmentSlot..".entitySlotName", slot[0])
                TweakDB:SetFlat(attachmentSlot..".localizedName", slot[1])
                TweakDB:SetFlat(attachmentSlot..".unlockedBy", slot[2])
            table.insert(newSlots, attachmentSlot)
        end
        Ti200.enableSlot(attachmentSlot)
    end
    return newSlots
end

function Ti200.createBlueprint(name, slotsArray, attachmentSlots, mods)
    local blueprintName = "Items."..name
    local rootElement = blueprintName.."_inline0"
    if attachmentSlots ~= nil then
        for i, attachmentSlot in ipairs(attachmentSlots) do
            local slotElement = blueprintName.."_inline"..i
            if TweakDB:GetRecord(slotElement) == nil then
                TweakDB:CreateRecord(slotElement, "gamedataItemBlueprintElement_Record")
                    TweakDB:SetFlat(slotElement..".slot", attachmentSlot)
                table.insert(slotsArray, slotElement)
            end
        end
        Ti200.addSlotsToMods(mods, attachmentSlots)
    end
    if TweakDB:GetRecord(blueprintName) == nil then
        TweakDB:CreateRecord(rootElement, "gamedataItemBlueprintElement_Record")
            TweakDB:SetFlat(rootElement..".childElements", slotsArray)
            TweakDB:SetFlat(rootElement..".slot", "AttachmentSlots.GenericItemRoot")
        TweakDB:CreateRecord(blueprintName, "gamedataItemBlueprint_Record")
            TweakDB:SetFlat(blueprintName..".rootElement", rootElement)
    end
    return blueprintName
end

function Ti200.makeUltraBlueprint(newSlots, blpName, origSlots, mods, condition)
    local attachmentSlots = nil
    if condition == true then
        attachmentSlots = Ti200.createSlot(newSlots)
    end
    local blueprintName = Ti200.createBlueprint(blpName, origSlots, attachmentSlots, mods)
    return blueprintName
end

return Ti200