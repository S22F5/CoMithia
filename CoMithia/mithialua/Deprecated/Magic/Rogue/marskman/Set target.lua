set_target = {
	cast=function(player,target)

		if(player.state==1) then
			player:sendMinitext("Spirits can't do that.")
			return
		end
		if(player.state==3) then
			player:sendMinitext("You can not cast this spell on a mount.")
			return
		end
		if(target.state==1) then
			player:sendMinitext("Your target is already dead.")
			return
		end
		if(target.blType==BL_NPC) then
			player:sendMinitext("Something went wrong.")
			return
		end
		if(player.registry["currentspecialization"]~=2) then
			player:sendMinitext("Only Marksmen may use this ability")
			return
		end

		target:sendAnimation(367)
		player.rangeTarget = target.ID
		player:sendAnimation(12)
		player:sendAction(6,50)
		player:sendMinitext("You cast Set target")
		player:sendMinitext("You focus your aim on "..target.name..".")
		player:playSound(35)


	end,

	requirements=function(player)
		local l=25
		local i={0,"archer_bow"}
		local ia={1000,1}
		local d={"Set target\n\nAllows you to set your ranged archery target","You shall sacrifice (1) Archer bow and 1000 coins to learn this ability."}
		return l,i,ia,d
	end
}
