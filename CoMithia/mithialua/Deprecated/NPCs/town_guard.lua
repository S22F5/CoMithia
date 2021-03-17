Town_guard = {
	click=async(function(player,npc)
		local t={graphic=convertGraphic(491,"monster"),color=4}
		player.npcGraphic=t.graphic
		player.npcColor=t.color
		local choice=player:menuString("What do you wish to do?",{"Buy horse saddle","Join Ealadh-testers","Leave Ealadh-testers","Read community board"})
		-- Purchases saddles
		if(choice=="Buy horse saddle") then		
			local opts = {}
			table.insert(opts,"White")
			table.insert(opts,"Black")
			table.insert(opts,"Burnt")
			table.insert(opts,"I do not wish to purchase Saddles")
			player:dialogSeq({"If you intend to travel for some time, you might use the help of a mount. I can sell you a few Saddles that will let you ride a horse. But remember, these aren't trained horses, so they will vanish if you let them go!",t,"Each saddle will cost you 50 coins."},1)
			local choice2=player:menuString2("What kind of Saddle do you wish to buy?",opts)
			if(choice2=="Burnt") then
				local amount=math.abs(tonumber(math.ceil(player:input("How many Saddles do you wish to purchase?"))))
				if(amount~=0) then
					if(amount*50<=player.money) then
						player.money=player.money-(amount*50)
						player:addItem("burnt_horse_saddle",amount)
						player:sendStatus()
					else
						player:dialogSeq({"You do not have enough money."})
					end
				end	
				elseif(choice2=="Black") then
					local amount=math.abs(tonumber(math.ceil(player:input("How many Saddles do you wish to purchase?"))))
					if(amount~=0) then
						if(amount*50<=player.money) then
							player.money=player.money-(amount*50)
							player:addItem("black_horse_saddle",amount)
							player:sendStatus()
						else
						player:dialogSeq({"You do not have enough money."})
					end
				end
				elseif(choice2=="White") then
					local amount=math.abs(tonumber(math.ceil(player:input("How many Saddles do you wish to purchase?"))))
					if(amount~=0) then
						if(amount*50<=player.money) then
						player.money=player.money-(amount*50)
						player:addItem("white_horse_saddle",amount)
						player:sendStatus()
					else
						player:dialogSeq({"You do not have enough money."})
					end
				end
			end
		end
		-- Join alpha tester if you are not in a clan
		if(choice=="Join Ealadh-testers") then
			if(player.clan ~= 0) then
				player:sendMinitext("You are already in a clan.")
			end
			if(player.clan==0) then
				player.clan=1
				player:sendStatus()
				player:sendMinitext("You are now part of the Ealadh testers clan. Whispers to '!' to use clan chat.")
			end
		end
		-- Player must be in Alpha-tester to leave
		-- TODO: Message if you are in a clan
		if(choice=="Leave Ealadh-testers") then
			if(player.clan==1) then
				player.clan=0
				player:sendStatus()
				player:sendMinitext("You left the Ealadh testers clan.")
			end
		end
		if(choice=="Read community board") then
			player:showBoard(4)
		end
	end)
}