thorne = {

click = async(function(player, npc)
	local npcG = {graphic = convertGraphic(3153, "item"), color = 0}
	local opts = {"Facial hair"}
	local menuOption
	local offers = {"Gentleman's accessories", "Facial hair"}
	local facialHair = {"Full beard", "Long beard", "Mustache", "Handlebar"}
	local fullBeards = {600000006,600000007,600000008,600000009,600000010,600000011,600000012,600000013,600000014,600000015,600000016,600000017,600000018,600000019,600000020,
						600000021,600000022,600000023,600000024,600000025,600000026,600000027,600000028,600000029,600000030,600000031,600000032,600000033,600000034,600000035,
						600000036,600000037}
	
	player.npcGraphic = npcG.graphic
	player.npcColor = npcG.color
	player.dialogType = 1
	player.lastClick = npc.ID
	
	menuOption = player:menuString("Hmm yes..?", offers)
	
	if (menuOption == "Facial hair") then
		local menu2 = player:menuString("Well lets see...", facialHair)
		
		if(menu2 == "Full beard") then
			player:buyExtend("These are your options..", fullBeards)
		elseif(menu2 == "Long beard") then
			player:dialog("Mpfh. Only those experienced in battle are worth of such a glorious display of manliness", npcG) 
		else
			player:dialog("Check back soon", npcG)
		end
	end
end)
}