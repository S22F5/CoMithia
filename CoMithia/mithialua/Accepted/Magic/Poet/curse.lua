curse = {
on_learn = function(player)
	if (player:hasSpell("afflict")) then
		player:removeSpell("afflict")
	end
	
	player.registry["learned_afflict"] = 1
end,

cast = function(player, target)
	local duration = 60000
	local magicCost = 60
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < magicCost) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	if (target.state == 1) then
		player:sendMinitext("That is no longer useful.")
		return
	end
	
	if (target:hasDuration("plague") or target:hasDuration("destructive_tune")) then
		player:sendMinitext("A stronger version is already running.")
		return
	end
	
	if (target:hasDuration("curse")) then
		player:sendMinitext("That spell is already cast.")
		return
	end
	
	if (target.blType == BL_MOB) then
		player:sendAction(6, 20)
		player.magic = player.magic - magicCost
		player:sendStatus()
		player:playSound(24)
		player:sendMinitext("You cast Curse.")

		if (target:hasDuration("afflict")) then
			target:setDuration("afflict", 0)
		end
		
		target:setDuration("curse", duration)
		target:sendAnimation(144, 0)
	elseif (target.blType == BL_PC and player:canPK(target)) then
		player:sendAction(6, 20)
		player.magic = player.magic - magicCost
		player:sendStatus()
		player:playSound(24)
		
		if (checkProtection(player, target, 750)) then
			player:sendMinitext("Curse has been deflected.")
		else
			player:sendMinitext("You cast Curse.")
			if (target:hasDuration("afflict")) then
				target:setDuration("afflict", 0)
			end
			target:setDuration("curse", duration)
			target:sendAnimation(144, 0)
			target:sendMinitext(player.name.." curses you.")
			target:calcStat()			
		end
	end
end,

while_cast = function(block)
	if (block.blType == BL_MOB and block.charState ~= 2) then
		block:sendAnimation(34, 0)
	elseif (block.blType == BL_PC and block.state ~= 2) then
		block:sendAnimation(34, 0)
	end
end,

recast = function(block)
	block.armor = block.armor * .6
end,

uncast = function(block)
	block:calcStat()
end,

requirements = function(player)
	local level = 25
	local items = {}
	local itemAmounts = {}
	local description = {"Reduces armor by a fair amount on a target"}
	return level, items, itemAmounts, description
end
}