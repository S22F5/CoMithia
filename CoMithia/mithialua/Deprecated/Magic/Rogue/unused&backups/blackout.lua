blackout = {
	cast=function(player,target)
	local r
	if(player.magic<80) then
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
		player:sendAction(6,35)
		target:sendAnimation(39)
		player:playSound(92)
		player:addMana(-80)
		r=math.random(1,150)
		if(player.grace>r) then
			target.confused=TRUE
			target.confuseTarget=player.ID
			player:sendMinitext("You cast Blackout.")
		end
		player:setAether("blackout",2000)
	end,
	requirements=function(player)
		local l=38
		local i={0,5,15,244}
		local ia={1700,150,10,1}
		local d={"Blackout\n\nTry to make your target forget about you.","You shall sacrifice (150) Chestnut, (10) Control rune, (1) Vial of blood and 1700 coins to learn this ability."}
		return l,i,ia,d
	end
}