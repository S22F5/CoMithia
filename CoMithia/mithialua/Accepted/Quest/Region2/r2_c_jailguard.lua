r2_c_jailguard = {
click = async(function(player, npc)
	local npcG = {graphic = 0, color = 0}
	local options = {}
	local menu
	
	player.npcGraphic = npcG.graphic
	player.npcColor = npcG.color
	player.dialogType = 1
	
	if (player.quest["masterOfDeception"] == 2) then
		if (player:hasDuration("copycat") == true) then
			--[[options = {"Well, how's the job?", "Could be better."}
			menu = player:menu("Hello, How's it going?", options)
			if (menu == 1) then
				options = {"Ah yes my mistake, thanks.", "Actually I have news."}
				menu = player:menu("Not too bad, shouldn't you be at your post though?", options)
				if (menu == 2) then
					options = {"You know about what! Cough it up!", "We couldn't get what we wanted."}
					menu = player:menu("News? About what?", options)
					if (menu == 2) then
						options = {"The golden wares.", "The bracelets"}
						menu = player:menu("...Huh? What we wanted? What did we want?", options)
						if (menu == 1) then
							player:dialogSeq({npcG, "What?! Drat! Go talk with the hands and ask why, go!"}, 1)]]--
							player.quest["masterOfDeception"] = 3
						--[[elseif (menu == 2) then
							--close
						end
					elseif (menu == 1) then
						--close
					end
				elseif (menu == 1) then
					--close
				end
			elseif (menu == 2) then
				--close
			end]]--
		end
	end
end)
}