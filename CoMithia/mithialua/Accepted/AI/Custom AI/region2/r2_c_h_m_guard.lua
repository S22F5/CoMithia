r2_c_h_m_guard = {
on_spawn = function(npc)
	--mob.side = 1
	--mob:sendSide()
end,

click = async(function(player, npc)
	local options = {"Yes", "No"}
	local choice = ""
	
end),

move = function(npc)
	local pcBlocks = npc:getObjectsInCell(npc.m, npc.startX, npc.startY, BL_PC)
	if (npc.startX ~= npc.x or npc.startY ~= npc.y) then
		npc:warp(npc.m, npc.startX, npc.startY)
	end
	if (npc.side ~= 0) then
		npc.side = 0
		npc:sendSide()
	end
	
	if (#pcBlocks > 0) then
		for i = 1, #pcBlocks do
			pcBlocks[i]:warp(npc.m, npc.startX, npc.startY - 2)
			pcBlocks[i]:sendMinitext("Access here is forbidden.")
		end
	end
end
}