searing_edge = {
	cast=function(player,target)
	if(player.magic<player.maxMagic/3) then
		player:sendMinitext("Your will is too weak.")
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

	if(player.extendHit==0 and player.enchant>1) then
		player:sendMinitext("Searing Edge is already in effect")
		return
	end


		player:sendAction(6,35)
		player:addMana(-player.maxMagic/3)
		player:playSound(25)
		player:sendAnimation(50)

		local calcinvis
		if(player.level < 99) then
			calcinvis=6+(player.level/7)
		elseif(player.level == 99) then
			-- player.invis=7*(3+(player.maxMagic/4250)+(player.maxHealth/8500))
			-- player.invis=4*(10+(player.maxMagic/5000)+(player.maxHealth/10000))
			calcinvis=40+(player.maxMagic/2500)+(player.maxHealth/2500)
		end
		calcinvis = calcinvis * 1.2
		player.enchant = calcinvis
		player.backstab=1
		player.flank=1
		player.extendHit=0
		player:sendMinitext("You focus the power of your blade, swinging around you.")

	end,

	requirements=function(player)
		local l=8
		local i={0,"peas","chestnut","squirrel_fur"}
		local ia={250,10,10,1}
		local d={"Searing Edge\n\nInfuse greater magic into your weapon to make it more performant.","You shall sacrifice (10) Peas, (10) Chestnut, (1) Squirrel fur and 250 coins to learn this ability."}
		return l,i,ia,d
	end
}
