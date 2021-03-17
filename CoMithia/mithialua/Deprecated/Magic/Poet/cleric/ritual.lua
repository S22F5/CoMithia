ritual = {
	cast=function(player,target)
		
                if(player.state==1) then
                    player:sendMinitext("Spirits can't do that.")
                    return
                end
                
                if(player.magic<player.maxMagic/5) then
                    player:sendMinitext("You do not have enough mana.")
                    return
                end
		


		if(player.state==3) then
			player:sendMinitext("You can not cast this spell on a mount.")
			return
		end

		if(player.registry["currentspecialization"]~=1) then
			player:sendMinitext("Only Clerics may use this ability.")
			return
		end

		local targetcheck = player:getObjectsInArea(BL_MOB)

		if(#targetcheck>0) then

			for x=1,#targetcheck do
				if(targetcheck[x]:hasDuration("hex")==false and targetcheck[x]:hasDuration("curse")==false and targetcheck[x]:hasDuration("feebleness")==false and targetcheck[x]:hasDuration("decrepitude")==false) then
					targetcheck[x].ac=targetcheck[x].ac+30
					targetcheck[x]:setDuration("hex",425000)
					targetcheck[x]:sendAnimation(262)
					targetcheck[x]:repeatAnimation("hex",34)
				end
			end
		end


		local aether = 300000
		local willcheck = player.will

		if willcheck>=170 then
			willcheck=170
		end

		if(willcheck>100) then
			aether = aether - ((willcheck-100)*aether/100)
		end

		player:addMana(-player.maxMagic/5)
		player:setAether("ritual",aether)
		player:sendMinitext("You cast Ritual.")
		player:sendAction(6,35)

                          
	end,
	uncast=function(player)
		player.ac=player.ac-30
		player:sendStatus()
	end,

        recast = function(player)
                player.ac=player.ac+30
		player:sendStatus()
        end,

	fix = function(player)
                player.ac=player.ac+30
		player:sendStatus()
        end,



	requirements=function(player)
		local l=99
		local i={0,"ancient_texts"}
		local ia={15000,1}
		local d={"Ritual\n\nCleric Spell\n\nA ritual to hex a high number of foes","You shall have to sacrifice (1) Ancient texts and 15000 coins to learn this ability"}
		return l,i,ia,d
	end       
}