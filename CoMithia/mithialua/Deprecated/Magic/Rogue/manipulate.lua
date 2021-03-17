manipulate = {
	cast=function(player,target)
	if(player.magic<450) then
		player:sendMinitext("You do not have enough mana.")
		return
	end
	if(target:hasDuration("manipulate")) then
		player:sendMinitext("Manipulate is already in effect.")
		return
	end
	if(target.state==1) then
		player:sendMinitext("Your target is dead!")
		return
	end
	if(target.blType==BL_MOB or target.blType==BL_NPC) then
		player:sendMinitext("Something went wrong.")
		return
	end
	if(player.state==3) then
		player:sendMinitext("You can not cast this spell on a mount.")
		return
	end
	if(player.state==1) then
		player:sendMinitext("Spirits can't do that.")
		return
	end

	if(target.class==4) then
		target:sendMinitext(""..player.name.." Manipulates your mind and wipes your Heaven's Kiss aether.")
		target:setAether("heavens_kiss",0)

	else
		player:sendMinitext("You cast Manipulate.")
		target:sendMinitext(""..player.name.." Manipulates your mind.")
		target:setDuration("manipulate",900000)
	end

	player:sendMinitext("You cast Manipulate.")
	player:sendAction(6,35)
	target:sendAnimation(249)
	player:playSound(30)
	player:addMana(-450)
	player:setAether("manipulate",1800000)
	player:sendStatus()

	end,
	requirements=function(player)
		local l=99
		local i={0,"experience_gem","abyss_shard"}
		local ia={5000,5,1}
		local d={"Manipulate\n\nA powerful tool to Manipulate the mind of your target and help them perform better.","You shall have to sacrifice (5) Experience gem, (1) Abyss shard and 5000 coins to learn this ability."}
		return l,i,ia,d
		
	end
}