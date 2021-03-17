sek_rya = {
on_healed = function(mob, healer)
	mob_ai_basic.on_healed(mob, healer)
end,

on_attacked = function(mob, attacker)
	sek_rya.regen(mob)
	sek_rya.throw(mob, attacker)
	mob_ai_basic.on_attacked(mob, attacker)
end,

move = function(mob, target)
	sek_rya.regen(mob)

	if (mob.paralyzed or mob.sleep ~= 1) then
		mob.paralyzed = false
		mob.sleep = 1
	end

	sek_rya.throw(mob, target)
	
	mob_ai_basic.move(mob, target)
end,

attack = function(mob, target)
	sek_rya.regen(mob)

	if (mob.paralyzed or mob.sleep ~= 1) then
		mob.paralyzed = false
		mob.sleep = 1
	end

	mob_ai_basic.attack(mob, target)
end,

after_death = function(mob, attacker)
	if (attacker == nil) then
		return
	end
	if (attacker.blType ~= BL_PC) then
		return
	end
	
	if (mob.gameRegistry["chilled_excitement"] > 0) then
		
		if (math.random(100000) < 100) then--0.1% Chilled excitement
			mob:dropItem(100000002, 1)
			mob.gameRegistry["chilled_excitement"] = mob.gameRegistry["chilled_excitement"] - 1
			attacker:gmMsg(""..attacker.name.." has killed Sek-Rya and obtained a Chilled Excitement.")
			addChatLog(attacker, ""..attacker.name.." has killed Sek-Rya and obtained a Chilled Excitement.")
			if (#attacker.group > 1) then--Has group
				--VERY PRIMITIVE PARSING FOR GROUP MEMBER NAMES.
				local group = #attacker.group
				local str = ""
				repeat
					if (str == "") then
						str = str..""..Player(group).name..", "
					else
						if (group == 1) then
							str = str.." and "..Player(group).name.." "
						else
							str = str.." "..Player(group).name..", "
						end
					end
					group = group - 1
				until group == 0
				local len = string.len(str)
				local strings = {}
				if (len > 88) then
					local loops = math.floor(len / 88)
					for i = 1, loops do
						len = string.len(len)
						if (len > 88) then
							table.insert(strings, string.sub(str, 1, 88))
							str = string.sub(str, 89)
						end
					end
					table.insert(strings, str)
				end
				for i = 1, #strings do
					attacker:gmMsg("Unique Drop: "..strings[i].." were grouped with "..attacker.name)
					addChatLog(attacker, "Unique Drop: "..strings[i].." were grouped with "..attacker.name)
				end
			end
		end

	end
end,

regen = function(mob)
	if (mob.paralyzed or mob.sleep ~= 1 or mob.registry["regen"] > os.time()) then
		return
	end
	
	local amt = 18 + math.random(3)

	if (mob.health < mob.maxHealth) then
		if (mob.health + amt >= mob.maxHealth) then
			mob.health = mob.maxHealth
		else
			mob.health = mob.health + amt
		end
	end
	mob.registry["regen"] = os.time() + 1
end,

throw = function(mob, target)
	if (mob.registry["throw"] > os.time() or math.random(100) < 5) then
		return
	end
	if (target == nil) then
		local pcBlocks = mob:getObjectsInArea(BL_PC)
		if (#pcBlocks > 0) then
			target = pcBlocks[math.random(#pcBlocks)]
		end
	end
	
	local damage = 50 + math.random(-7, 13)
	mob:throw(target.x, target.y, 2596, 0, 1)
	target.attacker = mob.ID
	target:removeHealthExtend(damage, 1, 1, 1, 1, 0)
	mob.registry["throw"] = os.time() + 8
end
}