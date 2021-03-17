r2_m_miner = {
click = async(function(player, npc)
	local npcG = {graphic = convertGraphic(npc.look, "monster"), color = npc.lookColor}
	player.npcGraphic = npcG.graphic
	player.npcColor = npcG.color
		
end),

say = function(player, npc)
end,

action = function(npc, player)
	if (math.random(0,3) == 0) then
		if(math.random(0,1) == 0) then
			if(npc.side == 0) then
				npc.side = 3
			else
				npc.side = npc.side - 1
			end
		else
			if(npc.side == 3) then
				npc.side = 0
			else
				npc.side = npc.side + 1
			end
		end
	end
	npc:sendSide()
	if (math.random(0,4) == 0) then
		npc:move()
	end
end
}