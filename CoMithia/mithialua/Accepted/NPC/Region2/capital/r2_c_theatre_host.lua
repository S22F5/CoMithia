r2_c_theatre_host = {
click = async(function(player, npc)
	local npcG = {graphic = 0, color = 0}
	player.npcGraphic = npcG.graphic
	player.npcColor = npcG.color
	player.dialogType = 1
	
	local options = {}
	local menu
	
	player:dialogSeq({npcG, "Hello there!"}, 1)
	if (player.armorColor ~= 0) then
		options = {"Yes.", "No."}
		menu = player:menu("Would you like me to bleach you?", options)
		if (menu == 1) then
			options = {"Bleach me.", "No thanks."}
			menu = player:menu("It will cost 500 gold.", options)
			if (menu == 1) then
				if (player:removeGold(500) == true) then
					player.armorColor = 0
					player:refresh()
				else
					player:dialogSeq({npcG, "You do not have enough gold."}, 1)
				end
			elseif (menu == 2) then
				player:dialogSeq({npcG, "Perhaps another time then."}, 1)
			end
		elseif (menu == 2) then
			player:dialogSeq({npcG, "Perhaps another time then."}, 1)
		end
	end
end)
}