ketill = {
	click = async(function(player,npc)
		local t={graphic=convertGraphic(251,"monster"),color=15}
	        local opts = { }

                              player.npcGraphic=t.graphic
			      player.npcColor=t.color
                              table.insert(opts,"Yes")
                              table.insert(opts,"I do not wish to involve myself in a war") 
   			
			if(player.registry["alliancedowhar"]==1) then
				player:dialogSeq({t,"We know you, you've been helping the Dowhar! Leave this place, you are not welcomed here!"})
				return
			end

			if(player.registry["bjornprogress"]==1) then
				if(player:killCount("dowhar_fighter")>=10 and player:killCount("dowhar_tribesman")>=10 and player:killCount("dowhar_leader")>=1) then
					player.registry["alliancebjorn"]=1
					player.registry["bjornprogress"]=0
					player.registry["dowharprogress"]=0
					player.registry["bjornpointscurrent"]=25
					player.registry["bjornpointstotal"]=25
					player:addLegend("Allied with the Bjorn tribe (Year " .. player:curYear() .. ", " .. player:curSeason() .. ")","alliedbjorn",95,128)
					player:addLegend("Friend amongst the Bjorn tribe","bjornlevel",2,128)
					player:flushKills()
					player:dialogSeq({t,"Fantastic, you made it! Consider yourself a friend amongst the Bjorn tribe now. You should talk to our Elder to be recognized at your true value."})
				else
				player:dialogSeq({t,"I will be waiting for you to return from the Dowhar vein. Remember, 10 fighters, 10 tribesmen and their leader."})
				return
				end
			end

			if(player.registry["alliancedowhar"]==0 and player.registry["alliancebjorn"]==0 and player.registry["bjornprogress"]==0) then
				player:dialogSeq({t,"Hello, welcome in our humble village, "..player.name..". You are here where the last of the Bjorn tribe reside.",t,"The Bjorn and the Dowhar tribes have been at war for longer than any man can remember, for the control of the mining veins in the Volcano.",t,"Lately, a lot of our men have perished and it is with great relief that we would accept some help from someone like you. Do you wish to make yourself a friend of the Bjorn and help us get rid of the Dowhar?"},1)
				local choice=player:menuString2("Do you wish to help the Bjorn?",opts)
					if(choice=="I do not wish to involve myself in a war") then
						player:dialogSeq({t,"We understand. It is a difficult choice to make. Come back if you change your mind."})
					else
						player:flushKills()
						player.registry["bjornprogress"]=1
						player:dialogSeq({t,"Glad to hear that! As a token of your loyalty, we ask that you make your way into the Dowhar vein and slay 10 of their fighters, 10 of their tribesmen as well as their leader. Please return once it is done."}) 
					end
			end
			
			if(player.registry["alliancebjorn"]==1) then
				player:dialogSeq({t,"Welcome here, friend."})
				return
			end
			
        end)

}