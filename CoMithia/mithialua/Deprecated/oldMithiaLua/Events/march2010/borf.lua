-- Text used for event
borf_event = {
	click = async(function(player,npc)
		local t={graphic=convertGraphic(202,"monster"),color=8}
                local opts = { }

                
		if(player.level<10) then
			player:dialogSeq({t,"Hello, I could use anyone's help, but I'm afraid you're still too young for this task."})
		end
		if(player.registry["harmsorgi2010"]>0) then
			player:dialogSeq({t,"Thanks to you, Mithia is safe once again."})
		end

			

			player.npcGraphic=t.graphic
			player.npcColor=t.color
			local menuOption=player:dialogSeq({t,"Strange noises are coming from the old Mine Shaft, so we had to open it's doors once again. I need champions to go in there and exterminate any potential threat."},1)
			if(player:killCount(167)>=1) then
				player:removeLegendbyName("harmsorgi2010")
				player.registry["harmsorgi2010"]=1
				player:addLegend("Defended Mithia against Harmsorgi (Year " .. player:curYear() .. ", " .. player:curSeason() .. ")","harmsorgi2010",1,128)
				player:dialogSeq({t,"So the rumors were indeed true...\nThank you for dealing with Harmsorgi, champion, your deeds will not be forgotten by the Brotherhood."})
			end
				
		
	end)
}
-- Current text
borf = {
	click = async(function(player,npc)
		local t={graphic=convertGraphic(202,"monster"),color=8}
		player.npcGraphic=t.graphic
		player.npcColor=t.color
				
		player:dialogSeq({t,"Harmsorgi was finally defeated, Mithia is now safe, and we closed up the cave.\n\nThank you brave soul."})
	end)
}