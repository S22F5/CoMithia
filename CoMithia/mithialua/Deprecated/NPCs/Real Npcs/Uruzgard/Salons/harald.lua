harald = {
	click = async(function(player,npc)
		local t={graphic=convertGraphic(983,"monster"),color=24}
		local opts = { }
		local faces = { }
		local hairstyle = {}
		local armordyes = {}
		local hairdyes = {}
		local fashion = {}
		local mounts = {}

                player.npcGraphic=t.graphic
		player.npcColor=t.color
		table.insert(opts,"Faces")
		table.insert(opts,"Hair styles")
		table.insert(opts,"Armor dyes")
		table.insert(opts,"Hair dye")
		table.insert(opts,"Fashion")
		table.insert(opts,"Mounts")
		table.insert(opts,"Equipment")

		table.insert(faces,"Scar face - 5 Gems")
		table.insert(faces,"Nerd face - 5 Gems")
		table.insert(faces,"Indian face - 5 Gems")
		table.insert(faces,"Chubby face - 5 Gems")
		table.insert(faces,"Eye-Patch face - 5 Gems")

		table.insert(hairstyle,"Hairstyle: The Palm tree - 5 Gems")
		table.insert(hairstyle,"Hairstyle: Sophisticated - 5 Gems")
		table.insert(hairstyle,"Hairstyle: The Summer breeze - 5 Gems")
		table.insert(hairstyle,"Hairstyle: The Raiden - 5 Gems")
		table.insert(hairstyle,"Hairstyle: The Concubine - 5 Gems")

		table.insert(mounts,"Collar : Purple Doe - 25 Gems")
		table.insert(mounts,"Collar : Blue Panther - 25 Gems")

		
		local choice=player:menuString("You can trade your Shining Experience Gems here. How can I help you?",opts)
			if(choice=="Faces") then
				local faceschoice=player:menuString2("Which face do you want?",faces)
				if(faceschoice=="Scar face - 5 Gems") then
					player:dialogSeq({t,"This tool will change your face to -Scar face- in exchange for 5 Shining exeperience gems. Press next to proceed."},1)
					if(player:hasItem("shining_experience_gem",5) ~= true) then
						player:dialogSeq({t,"You do not have enough experience gems."})
						return
					end
					player:removeItem("shining_experience_gem",5)
					player.faceColor=0
					player.face=230
					player:sendAnimation(6)
					player:sendStatus()
					player:updateState()
					player:sendMinitext("You trade 5 Shining Experience Gems for Scar face.")
				elseif(faceschoice=="Nerd face - 5 Gems") then
					player:dialogSeq({t,"This tool will change your face to -Nerd face- in exchange for 5 Shining exeperience gems. Press next to proceed."},1)
					if(player:hasItem("shining_experience_gem",5) ~= true) then
						player:dialogSeq({t,"You do not have enough experience gems."})
						return
					end
					player:removeItem("shining_experience_gem",5)
					player.faceColor=0
					player.face=237
					player:sendAnimation(6)
					player:sendStatus()
					player:updateState()
					player:sendMinitext("You trade 5 Shining Experience Gems for Nerd face.")
				elseif(faceschoice=="Indian face - 5 Gems") then
					player:dialogSeq({t,"This tool will change your face to -Indian face- in exchange for 5 Shining exeperience gems. Press next to proceed."},1)
					if(player:hasItem("shining_experience_gem",5) ~= true) then
						player:dialogSeq({t,"You do not have enough experience gems."})
						return
					end
					player:removeItem("shining_experience_gem",5)
					player.faceColor=0
					player.face=232
					player:sendAnimation(6)
					player:sendStatus()
					player:updateState()
					player:sendMinitext("You trade 5 Shining Experience Gems for Indian face.")
				elseif(faceschoice=="Chubby face - 5 Gems") then
					player:dialogSeq({t,"This tool will change your face to -Chubby face- in exchange for 5 Shining exeperience gems. Press next to proceed."},1)
					if(player:hasItem("shining_experience_gem",5) ~= true) then
						player:dialogSeq({t,"You do not have enough experience gems."})
						return
					end
					player:removeItem("shining_experience_gem",5)
					player.faceColor=0
					player.face=227
					player:sendAnimation(6)
					player:sendStatus()
					player:updateState()
					player:sendMinitext("You trade 5 Shining Experience Gems for Chubby face.")
				elseif(faceschoice=="Eye-Patch face - 5 Gems") then
					player:dialogSeq({t,"This tool will change your face to -Eye-Patch face- in exchange for 5 Shining exeperience gems. Press next to proceed."},1)
					if(player:hasItem("shining_experience_gem",5) ~= true) then
						player:dialogSeq({t,"You do not have enough experience gems."})
						return
					end
					player:removeItem("shining_experience_gem",5)
					player.faceColor=0
					player.face=231
					player:sendAnimation(6)
					player:sendStatus()
					player:updateState()
					player:sendMinitext("You trade 5 Shining Experience Gems for Eye-Patch face.")


				end



			elseif(choice=="Hair styles") then
				local hairstylechoice=player:menuString2("Which hair do you want?",hairstyle)
				if(hairstylechoice=="Hairstyle: The Palm tree - 5 Gems") then
					player:dialogSeq({t,"This tool will change your hairstyle to \"The Palm tree\" in exchange for 5 Shining exeperience gems. Press next to proceed."},1)
					if(player:hasItem("shining_experience_gem",5) ~= true) then
						player:dialogSeq({t,"You do not have enough experience gems."})
						return
					end
					player:removeItem("shining_experience_gem",5)
					player.hairColor=0
					player.hair=101
					player:sendAnimation(9)
					player:sendStatus()
					player:updateState()
					player:sendMinitext("You trade 5 Shining Experience Gems for The Palm tree.")
				elseif(hairstylechoice=="Hairstyle: Sophisticated - 5 Gems") then
					player:dialogSeq({t,"This tool will change your hairstyle to \"The Sophisticated\" in exchange for 5 Shining exeperience gems. Press next to proceed."},1)
					if(player:hasItem("shining_experience_gem",5) ~= true) then
						player:dialogSeq({t,"You do not have enough experience gems."})
						return
					end
					player:removeItem("shining_experience_gem",5)
					player.hairColor=0
					player.hair=117
					player:sendAnimation(9)
					player:sendStatus()
					player:updateState()
					player:sendMinitext("You trade 5 Shining Experience Gems for The Summer breeze.")
				elseif(hairstylechoice=="Hairstyle: The Summer breeze - 5 Gems") then
					player:dialogSeq({t,"This tool will change your hairstyle to \"The Summer breeze\" in exchange for 5 Shining exeperience gems. Press next to proceed."},1)
					if(player:hasItem("shining_experience_gem",5) ~= true) then
						player:dialogSeq({t,"You do not have enough experience gems."})
						return
					end
					player:removeItem("shining_experience_gem",5)
					player.hairColor=0
					player.hair=118
					player:sendAnimation(9)
					player:sendStatus()
					player:updateState()
					player:sendMinitext("You trade 5 Shining Experience Gems for The Summer breeze.")
				elseif(hairstylechoice=="Hairstyle: The Raiden - 5 Gems") then
					player:dialogSeq({t,"This tool will change your hairstyle to \"The Raiden\" in exchange for 5 Shining exeperience gems. Press next to proceed."},1)
					if(player:hasItem("shining_experience_gem",5) ~= true) then
						player:dialogSeq({t,"You do not have enough experience gems."})
						return
					end
					player:removeItem("shining_experience_gem",5)
					player.hairColor=0
					player.hair=109
					player:sendAnimation(9)
					player:sendStatus()
					player:updateState()
					player:sendMinitext("You trade 5 Shining Experience Gems for The Raiden.")
				elseif(hairstylechoice=="Hairstyle: The Concubine - 5 Gems") then
					player:dialogSeq({t,"This tool will change your hairstyle to \"The Concubine\" in exchange for 5 Shining exeperience gems. Press next to proceed."},1)
					if(player:hasItem("shining_experience_gem",5) ~= true) then
						player:dialogSeq({t,"You do not have enough experience gems."})
						return
					end
					player:removeItem("shining_experience_gem",5)
					player.hairColor=0
					player.hair=103
					player:sendAnimation(9)
					player:sendStatus()
					player:updateState()
					player:sendMinitext("You trade 5 Shining Experience Gems for The Concubine.")
				end
			elseif(choice=="Mounts") then
				local mountchoice=player:menuString2("Which mount do you want?",mounts)
				if(mountchoice=="Collar : Purple Doe - 25 Gems") then
					player:dialogSeq({t,"This tool will allow you to purchase Collar : Purple Doe in exchange for 25 Shining exeperience gems. Press next to proceed."},1)
					local invcheck=0
					for x=0,25 do
						if(player:getInventoryItem(x)==nil) then
							invcheck=invcheck+1
						end
					end
					if(invcheck==0) then
						player:dialogSeq({t,"Your inventory is full."})
						return
					end						
					if(player:hasItem("shining_experience_gem",25) ~= true) then
						player:dialogSeq({t,"You do not have enough experience gems."})
						return
					end
					player:removeItem("shining_experience_gem",25)
					player:addItem("collar_purple_doe",1)
					player:sendMinitext("You trade 25 Shining Experience Gems for Collar : Purple Doe.")
				elseif(mountchoice=="Collar : Blue Panther - 25 Gems") then
					player:dialogSeq({t,"This tool will allow you to purchase Collar : Blue Panther in exchange for 25 Shining exeperience gems. Press next to proceed."},1)
					local invcheck=0
					for x=0,25 do
						if(player:getInventoryItem(x)==nil) then
							invcheck=invcheck+1
						end
					end
					if(invcheck==0) then
						player:dialogSeq({t,"Your inventory is full."})
						return
					end	
					if(player:hasItem("shining_experience_gem",25) ~= true) then
						player:dialogSeq({t,"You do not have enough experience gems."})
						return
					end
					player:removeItem("shining_experience_gem",25)
					player:addItem("collar_blue_panther",1)
					player:sendMinitext("You trade 25 Shining Experience Gems for Collar : Blue Panther.")

				end
			end

	end)

}