r2_c_warper = {
click = async(function(player, npc)
	local g = {graphic = convertGraphic(2, "monster"), color = 6}
	
	player.npcGraphic = g.graphic
	player.npcColor = g.color
	player.dialogType = 0
	
	local justice = {math.random(111, 113), math.random(53, 54)}
	local market = {math.random(134, 140), math.random(69, 70)}
	local guild = {math.random(130, 133), math.random(28, 30)}
	local noble = {math.random(42, 48), math.random(53, 54)}
	local arena = {math.random(50, 54), math.random(81, 83)}
	local wtavern = {math.random(12, 17), math.random(52, 54)}
	local chapel = {math.random(24, 26), math.random(20, 22)}
	
	local opts = {"Justice", "Market", "Guild", "Noble", "Arena", "West Tavern", "Chapel"}
	
	if(#opts~=0) then
		local menuOption=player:menuString("Where would you like to go?",opts)

		if (menuOption == "Justice") then
			player:warp(npc.m, justice[1], justice[2])
		elseif (menuOption == "Market") then
			player:warp(npc.m, market[1], market[2])
		elseif (menuOption == "Guild") then
			player:warp(npc.m, guild[1], guild[2])
		elseif (menuOption == "Noble") then
			player:warp(npc.m, noble[1], noble[2])
		elseif (menuOption == "Arena") then
			player:warp(npc.m, arena[1], arena[2])
		elseif (menuOption == "West Tavern") then
			player:warp(npc.m, wtavern[1], wtavern[2])
		elseif (menuOption == "Chapel") then
			player:warp(npc.m, chapel[1], chapel[2])
		end
	end
end)
}