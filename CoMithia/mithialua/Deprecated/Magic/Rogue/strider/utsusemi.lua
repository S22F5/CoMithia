utsusemi = {
	cast=function(player,target)

	local dur=(10+(player.grace/10))*1000
	local aet=(120-(player.grace/3))*1000

	if(player.magic<60) then
		player:sendMinitext("You do not have enough Mana.")
		return
	end
	if(player.registry["currentspecialization"]~=1) then
		player:sendMinitext("Only Striders may use this ability")
		return
	end
	if(player:hasDuration("utsusemi")) then
		player:sendMinitext("Utsusemi is already in effect.")
		return
	end
	if(player.state==1) then
		player:sendMinitext("Spirits can't do that.")
		return
	end
	if(player.state==3) then
		player:sendMinitext("You can not cast this spell on a mount.")
		return
	end
	if(player.rage>1) then
		player:sendMinitext("A rage spell is already active.")
		return
	end

		player:sendMinitext("You cast Utsusemi.")
		player:sendAction(6,35)
		player:sendAnimation(33)
		player:addMana(-60)
		player:playSound(34)
		player.rage=2
		player:setDuration("utsusemi",dur)
		player:setAether("utsusemi",aet)
		player:sendStatus()
	end,
	recast=function(player)
		player.rage=2
	end,
	fix=function(player)
		player.rage=2
	end,
	uncast=function(player)
		player.rage=1
	end,
	requirements=function(player)
		local l=28
		local i={0,5,6,194}
		local ia={1000,100,1,1}
		local d={"Utsusemi\n\nStrider Spell\n\nIncrease your damage for a short period of time. Aether and duration depends on your grace","You shall sacrifice (100) Chestnut, (1) Squirrel fur, (1) Bastard sword and 1000 coins to learn this ability."}
		return l,i,ia,d
	end
}