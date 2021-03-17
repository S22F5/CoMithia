objectListHelper = {0,42,55,6133}

objectHelper={
	canPass=function(objectNum)
		for x=1,#objectListHelper do
			if(objectNum==objectListHelper[x]) then return true end
		end
		return false
	end
}