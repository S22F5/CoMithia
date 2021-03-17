r2_c_thief = {
click = async(function(player, npc)
	local npcG = {graphic = 0, color = 0}
	local options = {}
	local menu
	
	player.npcGraphic = npcG.graphic
	player.npcColor = npcG.color
	player.dialogType = 1
	
	if (player.quest["masterOfDeception"] == 4) then
		if (player:hasDuration("copycat") == true) then
			--[[options = {"I heard you didn't get what we wanted."}
			menu = player:menu("What do you want?", options)
			if (menu == 1) then
				options = {"Then why isn't it in the safe?"}
				menu = player:menu("What do you mean? I got it!", options)
				if (menu == 1) then
					options = {"The sewers?"}
					menu = player:menu("The safe? It is right where you asked it to be by the sewers.", options)
					if (menu == 1) then
						options = {"Huh. Well you had better hope so buddy."}
						player:dialogSeq({npcG, "Yeah! That damned house by the sewers with your buddy standing next to it with that ridiculous password.",
						"Who makes an entry word the name of the chapel owner?\n\nMust be some sort of crush. Heh."}, 1)
						menu = player:menu("But anyway I swear it's there!", options)
						if (menu == 1) then]]--
							player.quest["masterOfDeception"] = 5
						--[[end
					end
				end
			end]]--
		end
	end
end)
}