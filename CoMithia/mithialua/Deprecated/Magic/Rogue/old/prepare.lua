prepare = {
cast = function(player,target)
	if(player.state==1) then
		player:sendMinitext("Spirits can't do that.")
		return
	end
	
	if(player.state==3) then
		player:sendMinitext("You cannot cast this spell on a mount.")
		return
	end
	
	if (player:hasAether("prepare")) or (player:hasDuration("toxins")) then
		player:sendMinitext("Can not prepare poison yet.")
		return
	end
	
	if (player:hasDuration("prepare")) then
		player:setAether("toxins", 5000)--THIS LINE IS NOT WORKING Can't set aether to a spell you don't own?
		player:flushDuration(205)
		return
	end
	
	local magic = player.magic
	local mana_cost = 80 + (magic * 0.025)
	if (magic < mana_cost) then
		local amt = mana_cost - magic
		player:sendMinitext("Not enough mana. ("..amt..")")
		return
	end
	mana_cost = -1 * mana_cost
	player:addMana(mana_cost)
	
	
	player:setAether("prepare", 3000)
	--check items
	if (player:removeItem(2,1) == false) then
		player:sendMinitext("You must have a water vial.")
		return
	end
	if (player:removeItem(21,1) == false) then
		player:sendMinitext("You must have toxins.")
		return
	end
	
	player:setDuration("prepare",10000)
	player:sendMinitext("You start to carefully prepare the poison.")
	player:calcStat()
	player:sendAnimation(34)
end,

recast = function(player)
	player.snare = 1
end,

while_cast = function(player)
	if (math.floor(player:getDuration("prepare")/1000)%2 == 0) then
		player:sendAnimation(34)
	end
end,

uncast = function(player)
	player:calcStat()
	local aether = 0
	if (player:hasAether("prepare")) then
		aether = player:getAether("prepare")
		player:flushAether(205)
	end
	player:setAether("prepare", 20000 + aether)
	if (player:hasAether("toxins")) then
		return
	end
	--item stuff
	player:addItem(1,1)
	player:sendMinitext("You have finished preparing the poison.")
	toxins.cast(player)
end
}