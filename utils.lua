-- ver. 1.1.0   utilities functions

local Ti200 = {}

function Ti200.arrayInsert(arr, rec)
	bakArray = TweakDB:GetFlat(arr)
	table.insert(bakArray, rec)
	TweakDB:SetFlat(arr, bakArray)
end

function Ti200.cloneConstantStat(statRecord, record, value)
    if TweakDB:GetRecord(statRecord) == nil then
        TweakDB:CloneRecord(statRecord, record)
        TweakDB:SetFlat(statRecord..".value", value)
    end
end

function Ti200.createConstantStat(statRecord, modifierType, statType, value)
    if TweakDB:GetRecord(statRecord) == nil then
        TweakDB:CreateRecord(statRecord, "gamedataConstantStatModifier_Record")
        TweakDB:SetFlat(statRecord..".modifierType", modifierType)
        TweakDB:SetFlat(statRecord..".statType", statType)
        TweakDB:SetFlat(statRecord..".value", value)
    end
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

-- functions done by me to automatize the process of creating new blueprints and slots
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

return Ti200