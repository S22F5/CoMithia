sanctuary = {
cast = function(player)
	if (player.state ~= 0) then
		return
	end
	local cost = player.mRegenAmount * 2.75
	if (player.magic < cost) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	player:addMana(-cost)
	player:setAether("sanctuary", 3000)
	player:addNPC("sanctuary", player.m, player.x, player.y, 750, 12000,player.ID)
	player:sendAnimation(117)
end,


action = function(npc, player)
	local n = npc
	local m = n.m
	local x = n.x
	local y = n.y
	local h = {}
	local j
	local xcoords = {x}--/lua Player(3).registry["sanctuary"] = 
	local ycoords = {y}
	if (player.registry["sanctuary"] == 1) then
		xcoords = {x, x+1, x-1, x, x}
		ycoords = {y, y, y, y+1, y-1}
	elseif (player.registry["sanctuary"] == 2) then
		xcoords = {x, x+1, x+1, x-1, x-1}
		ycoords = {y, y+1, y-1, y+1, y-1}
	elseif (player.registry["sanctuary"] == 3) then
		xcoords = {x, x+1, x-1, x, x, x+1, x+1, x-1, x-1}
		ycoords = {y, y, y, y+1, y-1, y+1, y-1, y+1, y-1}
	elseif (player.registry["sanctuary"] == 4) then
		xcoords = {x+1, x+1, x-1, x-1, x+2, x-2, x, x}
		ycoords = {y+1, y-1, y+1, y-1, y, y, y+2, y-2}
	elseif (player.registry["sanctuary"] == 5) then
		xcoords = {x, x+1, x+1, x-1, x-1, x+2, x-2, x, x}
		ycoords = {y, y+1, y-1, y+1, y-1, y, y, y+2, y-2}
	elseif (player.registry["sanctuary"] == 6) then
		xcoords = {x, x+1, x-1, x, x, x+1, x+1, x-1, x-1, x+2, x-2, x, x}
		ycoords = {y, y, y, y+1, y-1, y+1, y-1, y+1, y-1, y, y, y+2, y-2}
	elseif (player.registry["sanctuary"] == 7) then
		xcoords = {x, x+1, x-1, x, x, x+1, x-1, x+1, x-1, x+2, x+2, x-2, x-2}
		ycoords = {y, y, y, y+1, y-1, y-2, y-2, y+2, y+2, y+1, y-1, y+1, y-1}
	end
	if (player) then
		h = npc:getObjectsInCell(m, x, y, BL_PC)
	else
	--no owner
	end
	if (#h > 0) then
		npc:sendAnimationXY(2,x,y)
		for i = 1, #xcoords do
			npc:sendAnimationXY(116,xcoords[i],ycoords[i])
			h = npc:getObjectsInCell(m, xcoords[i], ycoords[i], BL_PC)
			for j = 1, #h do
				local amt = 1 + math.floor(player.vRegenAmount/3)
				if (h[j].state ~= 1) then
					if ((h[j].health + amt) > h[j].maxHealth) then
						h[j].health = h[j].maxHealth
					else
						h[j].health = h[j].health + amt
					end
				h[j]:sendStatus()
				
				end
				--h[j]:sendHealth(-2, 0)
				--h[j]:sendHealth(-1,0)
			end
		end

	end
	--[[
	for i = 1,#h do
		npc:sendAnimationXY(2,x,y)
		npc:sendAnimationXY(116,x,y)
		npc:sendAnimationXY(116,x+1,y+1)
		npc:sendAnimationXY(116,x+1,y-1)
		npc:sendAnimationXY(116,x-1,y+1)
		npc:sendAnimationXY(116,x-1,y-1)
	end]]--
	
end,

endAction = function(npc, player)
	npc:delete()
end
}