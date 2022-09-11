-- ver. 2.2

-- BIONIC JOINTS

	-- Rare
	TweakDB:SetFlat("Items.JointLockRare_inline3.value", -0.15)
	TweakDB:SetFlat("Items.JointLockRare_inline4.value", -0.15)
	TweakDB:SetFlat("Items.JointLockRare_inline5.intValues", {15})

	-- Epic
	TweakDB:SetFlat("Items.JointLockEpic_inline4.value", -0.3)
	TweakDB:SetFlat("Items.JointLockEpic_inline5.value", -0.3)
	TweakDB:SetFlat("Items.JointLockEpic_inline6.intValues", {30})
	TweakDB:CloneRecord("Vendors.cct_dtn_ripdoc_01_joint_lock_epic", "Vendors.cct_dtn_ripdoc_01_inline7")
    TweakDB:SetFlat("Vendors.cct_dtn_ripdoc_01_joint_lock_epic.item", "Items.JointLockEpic")
    addToList("Vendors.cct_dtn_ripdoc_01.itemStock", "Vendors.cct_dtn_ripdoc_01_joint_lock_epic")


-- MICROROTORS

	-- Common
	TweakDB:SetFlat("Items.CyberRotorsCommon_inline3.value", 0.06)
	TweakDB:SetFlat("Items.CyberRotorsCommon_inline4.intValues", {6})

	-- Uncommon
	TweakDB:SetFlat("Items.CyberRotorsUncommon_inline4.value", 0.12)
	TweakDB:SetFlat("Items.CyberRotorsUncommon_inline5.intValues", {12})

	-- Rare
	TweakDB:SetFlat("Items.CyberRotorsRare_inline4.value", 0.18)
	TweakDB:SetFlat("Items.CyberRotorsRare_inline5.intValues", {18})

	-- Epic
	TweakDB:SetFlat("Items.CyberRotorsEpic_inline4.value", 0.25)
	TweakDB:SetFlat("Items.CyberRotorsEpic_inline5.intValues", {25})

	-- Legendary
	TweakDB:SetFlat("Items.CyberRotorsLegendary_inline4.value", 0.35)
	TweakDB:SetFlat("Items.CyberRotorsLegendary_inline5.intValues", {35})
