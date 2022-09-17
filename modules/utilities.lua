-- ver. 2.3

-- Utilites

	mltp = TweakDB:GetFlat("Items.SandevistanC2MK3_inline7.operationType")	-- operationType

-- arrayInsert (use this inside if condition)
	function arrayInsert(arr, rec)
		bakArray = TweakDB:GetFlat(arr)
		table.insert(bakArray, rec)
		TweakDB:SetFlat(arr, bakArray)
	end
