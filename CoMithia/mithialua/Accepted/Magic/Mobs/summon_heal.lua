summon_heal = {
cast = function(mob,target)
	--ADD A VIP Option for Tavern VIP's.
	if (mob:hasDuration("summon_heal")) then
		return
	end
	if (target.state == 1) then
		return
	end	
	if (target.ID == mob.ID) then
		return
	end
	local owner = Player(mob.owner)
	if (owner.m ~= mob.m) or (target.m ~= mob.m) then
		return
	end
	if (distance(mob,target) > 8) then
		return
	end
	if (target.health > target.maxHealth * 0.8) then
		return
	end
	
	local basem = owner.maxMagic * 0.03
	local basev = owner.maxHealth * 0.015
	local l = owner.level
	local base = (0.3 * (l^2)) - (0.3 * l)
	
	local hamt = basem + basev + base
	--0.3l^2-0.3l
	local camt = basem + basev + (base/2) + 10
	if (owner.magic < camt) then
		return
	end
	owner:talk(2,""..camt)
	mob:talk(2,""..hamt)
	mob:setDuration("summon_heal",1000)
	mob:sendAction(6,40)
	owner:removeMagic(camt)
	target:addHealth(hamt)
	target:sendAnimation(66)
end
}