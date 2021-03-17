crippling_poison = {
cast = function(player,target)
	if(player.state==1) then
		player:sendMinitext("Spirits can't do that.")
		return
	end
	
	if(player.state==3) then
		player:sendMinitext("You cannot cast this spell on a mount.")
		return
	end
	
	if (player:hasAether("crippling_poison") or player:hasDuration("crippling_poison")) then
		player:sendMinitext("Can not use crippling poison yet.")
		return
	end
	
	player:setAether("crippling_poison", 2000)
	--check items
	if (player:removeItem(1,1) == false) then
		player:sendMinitext("You must have a poison vial.")
		return
	end
	player:sendAction(6,18)
	player:setDuration("crippling_poison",30000)
end,

recast = function(player,caster)
	if (player.ID ~= caster.ID) then
		local speed = player.speed
		local bSpeed = player.baseSpeed
		speed = math.abs(bSpeed - speed)
		local duration = player:getDuration("crippling_poison")
		
		speed = player.speed + 40 + (speed * 10)

		if (speed > 255) then
			player.speed = 255
		else
			player.speed = speed
		end
	end
end,

on_hit_while_cast = function(player, target)
	if (player:hasAether("crippling_poison")) then
		return
	else
		target:setDuration("crippling_poison",8000,player.ID)
		player:setAether("crippling_poison", 2000)
	end
--[[
	if (player == caster) then--CAN GET CASTER DATA?
	end
]]--
end,

while_cast = function(player, caster)

	if (player.ID ~= caster.ID) then
		player:calcStat()
	end

end,

uncast = function(player)
	player:calcStat()
end
}