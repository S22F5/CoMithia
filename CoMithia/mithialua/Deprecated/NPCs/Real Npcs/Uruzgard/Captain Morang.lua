captain_morang = {
	click = async(function(player,npc)
		local t={graphic=convertGraphic(146,"monster"),color=2}
	        local opts = { }
		table.insert(opts,"Yes I do, I'm not afraid!")
		table.insert(opts,"Why? What's in there?")
		table.insert(opts,"No.")

        player.npcGraphic=t.graphic
		player.npcColor=t.color


			if(player.level<70) then
				player:dialogSeq({t,"Please do not walk any further sir, it wouldn't be wise from someone lacking battle experience."})
			elseif(player.level>=70 and player.registry["icelabyrinthquest"]<=1) then
				player:dialogSeq({t,"Hello there traveller. You don't actually plan on going in there without a map do you?"},1)
					local menuOption=player:menuString2("Do you plan to go in?",opts)
						if(menuOption=="No.") then
							player:dialogSeq({t,"Very well. Be safe."})
						elseif(menuOption=="Yes I do, I'm not afraid!") then
							player:dialogSeq({t,"I hope you enjoy your eternal new home then. Say hello to the Wilderbeast for me will you?"})
						elseif(menuOption=="Why? What's in there?") then
							player.registry["icelabyrinthquest"]=1
							player:dialogSeq({t,"Oh dear.. you have not heard of the Labyrinth of the Wilderbeast? This, my young friend, is the lair of the Wilderbeast.",t,"Beyond this door lies a Labyrinth of Ice that you will surely be lost in, without the directions of a map.",t,"It just so happens that my Brother and I have been working with the villagers of these parts in the Frozen North since the Bandits came upon the lands, stealing from the farmers and townsfolk.",t,"In our efforts to assist the villages, we stumbled across this Labyrinth.",t,"I have lost many men who have ventured into these caves due to the confusion caused by the icy surroundings. The place is a large maze.",t,"There is an old legend of a map that once existed long ago. However I have not laid eyes on this map, I believe the legend to be true.",t,"According to the locals, their ancestors found that the Labyrinth was too dangerous for any to enter and so broke the map into 3 pieces, spreading them across all of Mithia.",t,"I have spent many years looking for clues as to where I might find the pieces, however I cannot afford to leave my post, as I have promised my men that I will remain here in case the others manage to find their way out here to safety.",t,"I am not sure how reliable this is, however I believe the shepherd in the old Hinterlands knows a thing or two about a map piece. You might want to start by asking him.",t,"If you can locate all of the pieces I am certain that I could piece them together and provide you with a map to the Wilderbeast's Den."})
						
						end
			elseif(player.registry["icelabyrinthquest"]==2 or player.registry["icelabyrinthquest"]==3 or player.registry["icelabyrinthquest"]==4) then
				player:dialogSeq({t,"Have you found the map pieces yet?"})
			elseif(player.registry["icelabyrinthquest"]==5 and player:hasItem("first_map_piece",1) == true and player:hasItem("second_map_piece",1) == true and player:hasItem("third_map_piece",1) == true) then
				player:dialogSeq({t,"You found the map pieces! Here let me have a look at them..."},1)
					player.registry["icelabyrinthquest"]=6
					player:removeItem("first_map_piece",1)
					player:removeItem("second_map_piece",1)
					player:removeItem("third_map_piece",1)
					player:addItem("labyrinth_map",1)
					player:dialogSeq({t,"Well here you go! almost as good as new.",t,"You know, you'd be doing a big favor to the locals and even to Mithia should you manage to slay the Wilderbeast",t,"Let me know if you ever come back from in there alive... and Good luck!"})
			elseif(player.registry["icelabyrinthquest"]==6 and player:killCount(77)==0) then
					player:dialogSeq({t,"Be careful in there, my friend. Let me know if you ever overcome the Wilderbeast."})
			elseif(player.registry["icelabyrinthquest"]==6 and player:killCount(77)>=1) then
					player:dialogSeq({t,"The Wilderbeast, dead, you say ? That's incredible!",t,"You truly are a savior. Just speak to my men in Mithia if you ever wish to be transported back here."},1)
					player.registry["icelabyrinthquest"]=7
					player:addLegend("Slew the Ice Labyrinth Guardian (Year " .. player:curYear() .. ", " .. player:getCurSeason() .. ")","icelabyrinth",11,128)
			elseif(player.registry["icelabyrinthquest"]>=7) then
 					player:dialogSeq({t,"Be safe in there, "..player.name.."."})
			end
        end)

}