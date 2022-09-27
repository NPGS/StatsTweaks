-- ver. 2.5

-- Kiroshi Optics

    -- Quality changes and unlocking rules
    TweakDB:SetFlat("Items.KiroshiOptics.quality", "Quality.Rare") -- Common to Rare
    TweakDB:SetFlat("Items.KiroshiOpticsRare.quality", "Quality.Epic") -- Rare to Epic
    TweakDB:SetFlat("Items.KiroshiOpticsEpic.quality", "Quality.Legendary") -- Epic to Legendary
    TweakDB:SetFlat("AttachmentSlots.KiroshiOpticsSlot2.unlockedBy", 'Epic')
    TweakDB:SetFlat("AttachmentSlots.KiroshiOpticsSlot3.unlockedBy", 'Legendary')
