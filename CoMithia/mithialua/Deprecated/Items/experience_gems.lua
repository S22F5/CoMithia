experience_gem = {
	use = async(function(player)
		local t={graphic=convertGraphic(1030,"item"),color=0}
	        local opts = { }
		if(player.state==1) then
			player:sendMinitext("Spirits can't do that")
			return
		end
		if(player.level<99) then
			player:sendMinitext("You must be level 99 to use that item.")
			return
		end
		if(player.exp<1000000000) then
			player:sendMinitext("You need at least 1 Billion Experience to use that item")
			return
		end
		local check=0
		for x=0,23 do
			if(player:getInventoryItem(x)~=nil) then
				--Inv is full
			else
				check=check+1
			end
		end

		if(check==0) then
			player:sendMinitext("Your inventory is already full.")
			return
		end
		
		player:dialogSeq({t,"By clicking next, you will be storing 1,000,000,000 experience into this gem. Proceed with caution as you will only be able to restore this experience to yourself once every week."},1)
			if(player:hasItem("experience_gem",1) ~= true) then
				player:sendMinitext("You need an experience Gem.")
				return
			end
			if(player.exp<1000000000) then
				player:sendMinitext("You need 1 Billion experience.")
				return
			end
			for x=0,23 do
				if(player:getInventoryItem(x)~=nil) then
					--Inv is full
				else
					check=check+1
				end
			end
			if(check==0) then
				player:sendMinitext("Your inventory is already full.")
				return
			end

		player:removeItem("experience_gem",1)
		player.exp=player.exp-1000000000
		player:addItem("shining_experience_gem",1)
		player:sendStatus()
	
	end)
}

shining_experience_gem = {

	use = async(function(player)
		local t={graphic=convertGraphic(1090,"item"),color=0}
	        local opts = { }

		local check=player.registry["lastshiningexperienceuse"]
--		if((check+(60*60*24*7))>os.time()) then
--				player:sendMinitext("You must wait "..((check+(60*60*24*7))-os.time()).." seconds before you can be allowed to restore your experience again.")
--				return
--		end
		if(player.exp>3000000000) then
			player:sendMinitext("You may only restore experience on yourself if you are currently carrying less than 3 Billion Experience.")
			return
		end
		player:dialogSeq({t,"You may restore 1,000,000,000 Experience upon yourself should you choose to use this Gem. Click next if you wish to proceed."},1)
			if(player.exp>3000000000) then
				player:sendMinitext("You may not restore experience on yourself if you have more than 3 Billion Experience already.")
				return
			end
			if(player:hasItem("shining_experience_gem",1) ~= true) then
				player:sendMinitext("You need a Shining experience gem.")
				return
			end

		player.registry["lastshiningexperienceuse"]=os.time()
		player:removeItem("shining_experience_gem",1)
		player.exp=player.exp+1000000000
		player:sendStatus()

	end)
}