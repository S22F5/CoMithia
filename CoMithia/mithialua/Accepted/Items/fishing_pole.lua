fishing_pole = {

	on_swing = function(player)
		local bobberX = player.registry["bobberX"]
		local bobberY = player.registry["bobberY"]
		local fishies = { }
		local myFishie
		local itemReturns = {}
		local fishSize
		local fishRecord
		--Bobber colors:   1-red  2-yellow 3-green 4-white 
		if(player.registry["bobberTime"] ~= 0) then
			local bobber = player:getObjectsInCell(player.m, bobberX, bobberY, BL_ITEM)
			
			if (#bobber > 0) then
				for i = 1, #bobber do
					if (bobber[i].id == 1000000501 or bobber[i].id == 1000000502 or bobber[i].id == 1000000503 or bobber[i].id == 1000000504) then
						bobber[i]:delete()
					end
				end
			end
			--[[itemReturns = cfloor(player.m, bobberX, bobberY, player)
			
			if (#itemReturns > 1) then
				for i = 1, #itemReturns do
					if (itemReturns[i] ~= 1000000501 and itemReturns[i] ~= 1000000502 and itemReturns[i] ~= 1000000503 and itemReturns[i] ~= 1000000504
					and player:hasSpace(itemReturns[i], 1)) then
						player:addItem(itemReturns[i], 1)
					end
				end
			end]]-- THIS GRABS THE ITEMS FROM THE FLOOR
			
			player.registry["bobberTime"] = 0
			fishies = player:getObjectsInCell(player.m,bobberX,bobberY,BL_MOB)
			if (#fishies > 0) then
				for i = 1, #fishies do
					if (fishies[i].yname == "lake_carp") then
						myFishie = fishies[i] 
					end
				end
				fishSize = myFishie.registry["size"]/10
				myFishie:removeHealth(myFishie.health)
				player:sendAnimationXY(169,bobberX,bobberY,1)
				if (player.quest["r2_c_beggar"] == 5) then
					player:addItem("lake_carp_item", 1, 0, player.ID, "Special fish")
				else
					player:addItem(""..myFishie.yname.."_item", 1)
				end
				player:removeLegendbyName("fisher")
				if(player:hasLegend("fisher")) then
					--Needed to convert this to a number and add a check for decimal point. All working well now.
					fishRecord = tonumber(string.match(player:getLegend("fisher"), "(%d+%p?%d*)"))
					
					if (fishSize > fishRecord) then
						player:sendMinitext("You caught a "..fishSize.."cm "..myFishie.name.."!")
						player:sendMinitext("This is a new personal best!")
						player:removeLegendbyName("fisher")
						--player:addLegend("Caught a "..fishSize.."cm "..string.lower(myFishie.name), "fisher", 19, 128)
					else
						player:sendMinitext("You caught a "..fishSize.."cm "..myFishie.name.."!")
					end
				else
					player:sendMinitext("You caught a "..fishSize.."cm "..myFishie.name.."!")
					player:sendMinitext("This is a new personal best!")
					--player:addLegend("Caught a "..fishSize.."cm "..string.lower(myFishie.name), "fisher", 19, 128)
				end
			end
		elseif(player.side == 0 and player.registry["bobberTime"] == 0) then
			bobberX = player.x + math.random(-2,2)
			bobberY = player.y - math.random(3,5)
			player.registry["bobberX"] = bobberX
			player.registry["bobberY"] = bobberY  
			fishing_pole.castBobber(player)
		elseif(player.side == 1 and player.registry["bobberTime"] == 0) then
			bobberX = player.x + math.random(3,5)
			bobberY = player.y + math.random(-2,2)
			player.registry["bobberX"] = bobberX
			player.registry["bobberY"] = bobberY
			fishing_pole.castBobber(player)
		elseif(player.side == 2 and player.registry["bobberTime"] == 0) then
			bobberX = player.x + math.random(-2,2)
			bobberY = player.y + math.random(3,5)
			player.registry["bobberX"] = bobberX
			player.registry["bobberY"] = bobberY
			fishing_pole.castBobber(player)
			player.registry["bobberTime"] = os.time()
		elseif(player.side == 3 and player.registry["bobberTime"] == 0) then
			bobberX = player.x - math.random(3,5)
			bobberY = player.y + math.random(-2,2)
			player.registry["bobberX"] = bobberX
			player.registry["bobberY"] = bobberY
			fishing_pole.castBobber(player)
		else
			player:sendMinitext("You can't cast a bobber right now")
		end
		
		
	end,
	
	
	castBobber = function(player)
		local bobberColor = player.registry["bobberColor"]
		local bobberX = player.registry["bobberX"]
		local bobberY = player.registry["bobberY"]
		
		if (bobberColor == 0) then
			player:throw(bobberX, bobberY, 3253, 31, 1)
			player:dropItemXY(1000000501, 1, player.m, bobberX, bobberY, 46)
		elseif (bobberColor == 1) then
			player:throw(bobberX, bobberY, 3253, 14, 1)
			player:dropItemXY(1000000502, 1, player.m, bobberX, bobberY, 46)
		elseif (bobberColor == 2) then
			player:throw(bobberX, bobberY, 3253, 18, 1)
			player:dropItemXY(1000000503, 1, player.m, bobberX, bobberY, 46)	
		elseif (bobberColor == 3) then
			player:throw(bobberX, bobberY, 3253, 11, 1)
			player:dropItemXY(1000000504, 1, player.m, bobberX, bobberY, 46)	
		end
		
		player.registry["bobberTime"] = os.time()
	end
}