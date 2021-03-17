healing_aura = {
cast = function(player)

end,

while_passive = function(player)
	local health = player.health
	local mHealth = player.maxHealth
	local magic = player.magic
	local mMagic = player.maxMagic
	local protect = player.protection
	local amt, hamt, mamt
	hamt = (health/mHealth)*0.015*health--max 1.5%
	if (mMagic > 0) then
		mamt = (magic/mMagic)*(0.02+((protect/20)/100))*magic--Every 20 protect adds 1%
	else
		mamt = 0
	end
	amt = hamt + mamt
	
	local pc = {}
	local mob = {}
	pc = player:getObjectsInArea(BL_PC)
	mob = player:getObjectsInArea(BL_MOB)

	local aether = math.floor(player:getAether("healing_aura")/1000)
	local dist = 2 + math.floor(player.will/40)
	if (dist - aether <= 0) then
		repeat
			aether = aether - 1
		until (dist - aether > 0)
	end
	dist = dist - aether
	
	for i = 1,#pc do
		pc2 = Player(pc[i].ID)
		if (pc2.group ~= nil) then
			if (distance(player,pc2) <= dist) then
				if (player.group[1] == pc2.group[1]) then--same group
					--pc2:sendAnimation(90)
					--player:talk(2,"hamt: "..hamt.." mamt: "..mamt.." amt: "..amt)
					if (pc2.state ~= 1) then
						pc2:addHealth2(amt)
					end
				else
					--player:talk(2,"Bad group formation")
					--break
				end
			else
			--
				--player:talk(2,"After")
			end
		end
	end
	if (#mob > 0) then
		for i = 1,#mob do
			mob[i] = Mob(mob[i].ID)
			if (distance(player,mob[i]) <= dist) then
				if ((mob[i].owner > 0) and (checkOnline(mob[i].owner) > 0)) then
					if (player.group[1] == Player(mob[i].owner).group[1]) then
					--check for owner and if owner is in group
						--mob[i]:sendAnimation(90)
					end
				end
			end
		end
	end

	--[[test area]]--
	--[[
	for i = 1,25 do
		for j = 1,25 do
			if (distanceXY(player, player.x-13+i, player.y-13+j) <= dist) then
				player:sendAnimationXY(90,player.x-13+i,player.y-13+j,1)
			end
		end
	end
	]]--
end,

while_cast = function(player)
end,

recast = function(player)
end,

uncast = function(player)
end
}