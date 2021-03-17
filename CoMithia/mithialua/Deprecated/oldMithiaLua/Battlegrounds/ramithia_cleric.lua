mithia_cleric = {
	click = function(player,npc)
		local t={graphic=convertGraphic(87,"monster"),color=1}

                player.npcGraphic=t.graphic
		player.npcColor=t.color
		
		if(player.state==1) then
			player.state=0
			player:addHealth(player.maxHealth)
			player:updateState()
			player.registry["lastrez"]=os.time()
		else
			player:dialogSeq({t,"You're alive and doing perfectly well."})
		end
	end
}
			