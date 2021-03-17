colonel_thorodd = {
	click=async(function(player)
		local t={graphic=convertGraphic(672,"monster"),color=0}
                player.npcGraphic=t.graphic
		player.npcColor=t.color
		if(player.level<99) then
			player:dialogSeq({t,"Halt! This forsaken fortress serves as Gruzar's shelter. Please run away while you still can, you're in a lot of danger here."})
			return
		end
		if(player.registry["gruzaraccessquest"]==0) then
			player:dialogSeq({t,"Halt!\n\n This forsaken fortress serves as Gruzar's shelter, that is when he's not out slaughtering the people for his own enjoyment.",t,"Surely, you have heard of Gruzar and his atrocities?"},1)
				local menuChoice=player:menuString2("Have you heard of Gruzar? ((Clicking No will explain you the Lore related to this character.))",{"Yes","No"})
				if(menuChoice=="No") then
					player:dialogSeq({t,"Lore coming soon..."})
				elseif(menuChoice=="Yes") then
					player:dialogSeq({t,"So you know which kind of Monster we are facing.\n\nMy Men are dropping like flies in there, either killed or tortured in horrible ways only to be brought back as tormented spirits.",t,"We're going to need some help to stop this insanity. You seem to be handling yourself pretty well, You might be able to assist me."},1)
					local helpchoice=player:menuString2("Do you wish to help Colonel Thorodd in the defeat of Gruzar",{"Yes","No"})
					if(helpchoice=="Yes") then
						player.registry["gruzaraccessquest"]=1
						player:dialogSeq({t,"Excellent! Please check with me again in a second to receive further instructions."})
						return
					else
						player:dialogSeq({t,"-He grumbles- These know-it-all civilians...\n\nIf you change your mind, you know where I am."})
						return
					end
				end
		end
		if(player.registry["gruzaraccessquest"]==1) then
			player:dialogSeq({t,"I'm afraid we've hit a snag. Gruzar has sealed the entrance and prevents us from assaulting his fortress.",t,"All is not lost however, as our intelligence services have recently sent me important information.",t,"It seems Gruzar has broke the rune used to remove the magical seal into three pieces and distributed them amongst three of his trusted lieutenants...",t,"Gaorg holds the first piece.\n\nDaxlor holds the second piece of the rune.\n\nAbyss holds the third piece.",t,"If you manage to defeat them, you will recover their part of the rune. Bring me the three parts and I will be able to reforge the rune.\n\nBe careful however, broken runes are extremely volatile. Be sure to have enough space in your bag to receive it."},1)
			if(player:hasItem("rune_first_piece",1) == true and player:hasItem("rune_second_piece",1) == true and player:hasItem("rune_third_piece",1) == true) then
				player:removeItem("rune_first_piece",1)
				player:removeItem("rune_second_piece",1)
				player:removeItem("rune_third_piece",1)
				player.registry["gruzaraccessquest"]=2
				player:addItem("fortress_rune",1)
				player:removeLegendbyName("gruzarattune")
				player:addLegend("Displayed bravery in the assault against Gruzar's fortress (Year " .. player:curYear() .. ", " .. player:curSeason() .. ")","gruzarattune",214,9)
				player:dialogSeq({t,"Ah, you have brought them back with you. This is very good work.",t,"With this rune, you will be able to enter the fortress."},1)
			end
		end
		if(player.registry["gruzaraccessquest"]==2 or player.registry["gruzaraccessquest"]==3) then
			player:dialogSeq({t,"Now that you're able to enter the fortress, you might get a shot a Gruzar himself. You will need to destroy his avatars first however, and it will not be an easy task. If you value your life, I do not advise going in there alone.",t,"If by some miracle you manage to destroy Gruzar... Come back here and I will reward you for this heroic display of bravery."},1)			
				if(player.registry["gruzaraccessquest"]==3) then
					local item
					local invcheck=0
					for x=0,25 do
						item=player:getInventoryItem(x)
						if(item==nil) then
							invcheck=invcheck+1
						end
					end
					if(invcheck>0) then
						player:addItem("shining_experience_gem",5)
						player.registry["gruzaraccessquest"]=4
						player:removeLegendbyName("gruzarkill")
						player:addLegend("Vanquished Gruzar, Lord of Darkness (Year " .. player:curYear() .. ", " .. player:curSeason() .. ")","gruzarkill",214,9)
						player:dialogSeq({t,"Unbelievable! You returned, alive, and Gruzar is no more? This day will be celebrated by our future generations!"})
					else
						player:dialogSeq({t,"Please free up an inventory space"})
					end
				end
		end
		--if player somehow lost the fortress rune this will add another
		if(player.registry["gruzaraccessquest"]>=2) then
			local item
			local invcheck=0
			for x=0,25 do
				item=player:getInventoryItem(x)
				if(item==nil) then
					invcheck=invcheck+1
				end
			end
			if(invcheck>0) then
				if(player:hasItem("fortress_rune",1) ~= true) then
					player:addItem("fortress_rune",1)					
				end
			else
				player:dialogSeq({t,"Please free up an inventory space"})
			end				
		end
		if(player.registry["gruzaraccessquest"]==4) then
			player:dialogSeq({t,"-Thorodd salutes you and seems very glad-\n\nHello!"})
		end
	end)
}

hid32019874 = {
	click=function(player,npc)
		if(os.time()<player.registry["lastrez"]+(60*3)) then
			player:sendMinitext("You are still recovering from your wounds!")
			player:sendMinitext(""..player.registry["lastrez"]+(60*3)-os.time().." seconds remaining.")
			player:warp(3201,98,78)
			return
		end
		if(player:hasItem("fortress_rune",1) == true and player.registry["gruzaraccessquest"]>=2) then
			player:warp(20000,13,27)
			player:sendMinitext("You use the Fortress rune and enter the sinister fortress.")
		else
			player:warp(3201,98,78)
			player:sendMinitext("You are violently thrown back by the magical seal")
		end
	end
}
hid32019974 = {
	click=function(player,npc)
		if(os.time()<player.registry["lastrez"]+(60*3)) then
			player:sendMinitext("You are still recovering from your wounds!")
			player:sendMinitext(""..player.registry["lastrez"]+(60*3)-os.time().." seconds remaining.")
			player:warp(3201,99,78)
			return
		end
		if(player:hasItem("fortress_rune",1) == true and player.registry["gruzaraccessquest"]>=2) then
			player:warp(20000,14,27)
			player:sendMinitext("You use the Fortress rune and enter the sinister fortress.")
		else
			player:warp(3201,99,78)
			player:sendMinitext("You are violently thrown back by the magical seal")
		end
	end
}
hid320110074 = {
	click=function(player,npc)
		if(os.time()<player.registry["lastrez"]+(60*3)) then
			player:sendMinitext("You are still recovering from your wounds!")
			player:sendMinitext(""..player.registry["lastrez"]+(60*3)-os.time().." seconds remaining.")
			player:warp(3201,100,78)
			return
		end
		if(player:hasItem("fortress_rune",1) == true and player.registry["gruzaraccessquest"]>=2) then
			player:warp(20000,15,27)
			player:sendMinitext("You use the Fortress rune and enter the sinister fortress.")
		else
			player:warp(3201,100,78)
			player:sendMinitext("You are violently thrown back by the magical seal")
		end
	end
}

