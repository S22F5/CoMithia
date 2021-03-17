throwing_star = {
	cast=function(player,target)
	local dam=player.health*0.25*player.grace/130
	if(player.magic<player.maxMagic*0.05) then
		player:sendMinitext("You do not have enough mana.")
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
	
	local aethercalc=0

	if(player.registry["currentspecialization"]==2) then
		aethercalc=10000
	else
		aethercalc=3000
	end

	local x=math.abs(player.x-target.x)
	local y=math.abs(player.y-target.y)
	local dist=x+y
	if(dist<=1) then
		player:sendMinitext("You are too close to your target.")
		return
	end
	if(target.blType~=BL_MOB) then
		player:sendMinitext("Something went wrong.")
		return
	end
	if(dist>5) then
		local calc=dist-5
		calc=20*calc
		if calc>95 then calc=95 end
		local rng=math.random(1,100)
		if(calc>rng) then
			player:sendMinitext("You missed your target!")
			player:setAether("throwing_star",aethercalc)
			return
		end
	end
	player:sendMinitext("You Throw a Shuriken at your target.")
	player:sendAction(1,25)
	player:talk(2,"~Shuriken~")
	player:playSound(35)
	target.attacker=player.ID
	target:sendAnimation(122)
	target:removeHealthExtend(dam, 1, 1, 1, 1, 0)
	player:addMana(-player.maxMagic*0.05)
	player:addHealth(-player.maxHealth*0.1)
	player:setAether("throwing_star",aethercalc)



	end
}
