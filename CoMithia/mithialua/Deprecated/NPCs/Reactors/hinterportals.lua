hid459750 = {
	click = async(function(player,npc)
		local t={graphic=convertGraphic(543,"monster"),color=21}

		if(player.registry["hinterlandsportal"]>0 and player.registry["unlockhintereast"]==0) then
			player.npcGraphic=t.graphic
			player.npcColor=t.color
			player.registry["unlockhintereast"]=1
			player.registry["hinterlandsportal"]=player.registry["hinterlandsportal"]+1
			player:dialogSeq({t,"This spot would make a good place for a portal around East of Hinterlands"})
	        end
        end)
}

hid452597 = {
	click = async(function(player,npc)
		local t={graphic=convertGraphic(543,"monster"),color=21}

		if(player.registry["hinterlandsportal"]>0 and player.registry["unlockhintersouth"]==0) then
			player.npcGraphic=t.graphic
			player.npcColor=t.color
			player.registry["unlockhintersouth"]=1
			player.registry["hinterlandsportal"]=player.registry["hinterlandsportal"]+1
			player:dialogSeq({t,"This spot would make a good place for a portal around South of Hinterlands"})
	        end
        end)
}

hid450250 = {
	click = async(function(player,npc)
		local t={graphic=convertGraphic(543,"monster"),color=21}

		if(player.registry["hinterlandsportal"]>0 and player.registry["unlockhinterwest"]==0) then
			player.npcGraphic=t.graphic
			player.npcColor=t.color
			player.registry["unlockhinterwest"]=1
			player.registry["hinterlandsportal"]=player.registry["hinterlandsportal"]+1
			player:dialogSeq({t,"This spot would make a good place for a portal around West of Hinterlands"})
	        end
        end)
}

hid451404 = {
	click = async(function(player,npc)
		local t={graphic=convertGraphic(543,"monster"),color=21}

		if(player.registry["hinterlandsportal"]>0 and player.registry["unlockhinternorth"]==0) then
			player.npcGraphic=t.graphic
			player.npcColor=t.color
			player.registry["unlockhinternorth"]=1
			player.registry["hinterlandsportal"]=player.registry["hinterlandsportal"]+1
			player:dialogSeq({t,"This spot would make a good place for a portal around North of Hinterlands"})
	        end
        end)
}