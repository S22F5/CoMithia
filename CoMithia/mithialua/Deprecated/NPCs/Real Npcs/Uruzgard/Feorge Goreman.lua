feorge_goreman = {
	click = function(player,npc)
		local t={graphic=convertGraphic(6,"monster"),color=12}
	        local opts = { }

                              player.npcGraphic=t.graphic
			      player.npcColor=t.color

		if(os.time()>=player.mapRegistry["feorgegoremanspeech"]) then
			player.mapRegistry["feorgegoremanspeech"]=os.time()+20
			npc:talk(0,"Feorge Goreman: I'm a lean, mean, grillin' machine")
		end
        end

}