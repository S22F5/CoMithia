farraltool = {
	click = async(function(player,npc)
		local t={graphic=convertGraphic(752,"monster"),color=0}

		if(player.registry["thewell"]==4) then
			player.npcGraphic=t.graphic
			player.npcColor=t.color
			player:addItem(166,1)
			player.registry["thewell"]=5
			player:dialogSeq({t,"You discovered Farral's ax at last!"})
	        end
        end)
}