book_of_death_tome_5 = { 
equip = function(player)
	--player:sendMinitext("You get a strange feeling from the tome.")
end,

unequip = function(player)
end,

on_break = function(player)
	if (player.state ~= 1) then
		local damage = player.baseHealth * 0.5
		damage = damage + player.health * 0.015
		player.attacker = player.ID
		player:removeHealthExtend(damage, 1, 1, 1, 1, 1)
	end
	player:playSound(13)
	player:sendAnimation(84)
end,

on_hit = function(player, target)
	local class = player.baseClass
	local chance = math.random(100000)--100k
	local weap = player:getEquippedItem(EQ_WEAP)
	local hit_check = false
	
	if (class == 1) then--Warrior
		if (chance > 15000) then--15% chance
			return
		end	
		tome5_drain.cast(player)
	elseif (class == 2) then--Rogue
		if (chance > 18000) then--18% chance
			return
		end	
		tome5_curse.cast(player, target)
	elseif (class == 3) then--Mage
		if (chance > 20000) then--20% chance
			return
		end
		tome5_necrosis.cast(player, target)
	elseif (class == 4) then--Poet
	
		if (chance > 35000) then--35% chance
			return
		end
		
		local missingHealth = player.maxHealth - player.health
		missingHealth = 1 + (missingHealth / player.maxHealth)
		
		local damage = math.floor(missingHealth * (3750 + (((player.magic * 0.015) + (player.baseMagic * 0.005)) / 2.25)))
		local magicCost = math.ceil(((player.baseMagic * 0.005) + (player.magic * 0.015)) * missingHealth) + 300
		if (target:hasDuration("turtle_shell") == true) then
			damage = damage / 4
		end
		
		if (player.magic < magicCost) then
			player:sendMinitext("Not enough mana.")
			return
		end
		
		if (target.blType == BL_PC and player:canPK(target)) then
			if (target.state ~= 1) then
				target.attacker = player.ID
				target:removeHealthExtend(damage, 1, 0, 1, 1, 0)
				player.magic = player.magic - magicCost
				player:sendStatus()		
				player:sendMinitext("You hit your foe with corrosion.")
				target:sendMinitext(""..player.name.." has hit you with corrosion.")
				hit_check = true
			end
		elseif (target.blType == BL_MOB) then
			target.attacker = player.ID
			target:removeHealthExtend(damage, 1, 1, 1, 1, 0)
			player.magic = player.magic - magicCost
			player:sendStatus()
			hit_check = true
		end
		
		target:playSound(13)
		target:sendAnimation(84)
	end
	if (hit_check == true) then
		local rand = math.random(100)
		if (player.pvp == 1) then
			if (rand <= 65) then
				weap.dura = weap.dura - math.random(1, 2)
			end
		end
		chance = -1
		if (weap.dura <= 3) then
			chance = 30
		elseif (weap.dura <= 5) then
			chance = 25
		elseif (weap.dura <= 7) then
			chance = 15
		elseif (weap.dura <= 10) then
			chance = 10
		end
		if (rand <= chance) then
			weap.dura = weap.dura + 1
			player:sendMinitext("Your tome regenerates a page.")
		end
	end
end
}

tome5_necrosis = {
cast = function(player, target)
	local magicCost = 200 + (player.magic * 0.015) + (player.baseHealth * 0.01)
	if (player.magic < magicCost) then
		player:sendMinitext("Not enough mana.")
		return
	end
	if (target:hasDuration("tome5_necrosis") == true) then
		return
	end
	
	if (target.blType == BL_PC and player:canPK(target) and target.state ~= 1) then
		target:setDuration("tome5_necrosis", 8000, player.ID)
		player.magic = player.magic - magicCost
		player:sendStatus()
		target:sendMinitext(""..player.name.." has cursed you with necrosis.")
		player:sendMinitext("You cast necrosis.")
	elseif (target.blType == BL_MOB) then
		target:setDuration("tome5_necrosis", 12000, player.ID)
		player.magic = player.magic - magicCost
		player:sendStatus()		
	end	
end,

while_cast = function(block, caster)
	if (caster == nil) then
		return
	end
	
	local damage = math.random(1875, 2375)
	if (block.blType == BL_PC) then
		damage = damage + ((caster.magic * 0.015) + (caster.baseHealth * 0.01) / 1.15)
		if (block:hasDuration("turtle_shell") == true) then
			damage = (block:removeHealthExtend(damage, 2, 0, 1, 1, 2) / (math.random(15, 25) / 10))
		end
		
		block.attacker = caster.ID
		block:removeHealthExtend(damage, 0, 0, 0, 0, 0)

	elseif (block.blType == BL_MOB) then
		damage = damage * (math.random(10, 35) / 10)

		block.attacker = caster.ID
		block:removeHealthExtend(damage, 1, 1, 1, 1, 0)
	end
	block:sendAnimation(14)
end
}

tome5_drain = {
cast = function(player)
	if (player.state == 1) then
		return
	end
	
	local magicCost = 200 + (player.magic * 0.015) + (player.baseHealth * 0.05)
	if (player.magic < magicCost) then
		player:sendMinitext("Not enough mana.")
		return
	end

	if (player:hasDuration("tome5_drain") == true) then
		return
	end
	
	player:setDuration("tome5_drain", 16000)
	player.magic = player.magic - magicCost
	player:sendMinitext("You start draining damage dealt.")
	player:sendStatus()
	player:sendAnimation(149)
end,

on_hit_while_cast = function(player, target)
	local maxHealth = player.maxHealth
	local damage = player.damage
	
	if (damage < 2) then
		damage = 2
	end
	damage = damage * 0.15
	
	if (damage > maxHealth * 0.015) then
		damage = math.floor(maxHealth * 0.015)
	end
	player:addHealth(damage)
	--player.attacker = player.ID
	--player:addHealthExtend(damage, 0, 0, 0, 0, 0)
end
}

tome5_curse = {
cast = function(player, target)
	if (target == nil) then
		return
	end
	
	local magicCost = 200 + (player.magic * 0.05) + (player.baseHealth * 0.008)
	if (player.magic < magicCost) then
		player:sendMinitext("Not enough mana.")
		return
	end
	if (target:hasDuration("tome5_curse") == true) then
		return
	end
	
	if (target.blType == BL_PC and player:canPK(target) and target.state ~= 1) then
		target:setDuration("tome5_curse", 3000, player.ID)
		player.magic = player.magic - magicCost
		player:sendStatus()
		target:sendMinitext(""..player.name.." uses curses you.")
		player:sendMinitext("You use Tome 5's curse.")
	elseif (target.blType == BL_MOB) then
		target:setDuration("tome5_curse", 6000, player.ID)
		player.magic = player.magic - magicCost
		player:sendStatus()		
	end	
	target:calcStat()
	target:sendAnimation(101)
end,

while_cast = function(block)
	block:sendAnimation(34)
end,

recast = function(block)
	block.armor = block.armor * 0.85
end,

uncast = function(block)
	block:calcStat()
end
}