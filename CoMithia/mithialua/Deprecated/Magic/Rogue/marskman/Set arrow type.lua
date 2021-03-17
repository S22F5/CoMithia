set_arrow_type = {
	cast= async(function(player,target)



		if(player.state==1) then
			player:sendMinitext("Spirits can't do that.")
			return
		end
		if(player.state==3) then
			player:sendMinitext("You can not cast this spell on a mount.")
			return
		end

		if(player.magic<(player.maxMagic/20)) then
			player:sendMinitext("You do not have enough mana")
			return
		end

		if(player.registry["currentspecialization"]~=2) then
			player:sendMinitext("Only Marksmen may use that ability")
			return
		end

		
		local arrowopts = {}

		table.insert(arrowopts,"Regular arrows")
		table.insert(arrowopts,"Piercing arrows")

		if(player.level>=50) then
			table.insert(arrowopts,"Poison arrows")
		end
	
		if(player.level>=75) then
			table.insert(arrowopts,"Fragmentation arrows")
		end

		if(player.level>=99) then
			table.insert(arrowopts,"Crippling arrows")
		end

		player:sendMinitext("You cast Set Arrow Type.")

		local arrowchoice = player:menuString2("Which type of arrows do you wish to use?",arrowopts)

		if(arrowchoice=="Regular arrows") then
			player.registry["marksmanammo"]=0
			player:sendMinitext("You will now use Regular arrows.")
		end
		if(arrowchoice=="Piercing arrows") then
			player.registry["marksmanammo"]=1
			player:sendMinitext("You will now use Piercing arrows.")
		end
		if(arrowchoice=="Poison arrows") then
			player.registry["marksmanammo"]=2
			player:sendMinitext("You will now use Poison arrows.")
		end
		if(arrowchoice=="Fragmentation arrows") then
			player.registry["marksmanammo"]=3
			player:sendMinitext("You will now use Fragmentation arrows.")
		end
		if(arrowchoice=="Crippling arrows") then
			player.registry["marksmanammo"]=4
			player:sendMinitext("You will now use Crippling arrows.")
		end

		player:addMana(-player.maxMagic/20)
		player:sendAnimation(358)
		player:sendAction(6,50)
		player:playSound(35)


	end),

	requirements=function(player)
		local l=25
		local i={0,"fox_fur","chestnut"}
		local ia={750,1,50}
		local d={"Set Arrow Type\n\nAllows you to set the type of arrows you wish to use","You shall sacrifice (1) Fox fur, (50) Chestnut and 750 coins to learn this ability."}
		return l,i,ia,d
	end
}
