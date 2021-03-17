sleipnir = {
--[[
	click =async(function(player,npc)
		local t={graphic=convertGraphic(330,"monster"),color=0}
       		player.npcGraphic=t.graphic
		player.npcColor=t.color
		local promotionopts={}
		local clanfeatures = {}
		local opts = {}
		local clannumber=6
		table.insert(promotionopts,"Level 1 - No Special Priviledges")
		table.insert(promotionopts,"Level 2 - Add kindred, Grant Clan Title")
		table.insert(promotionopts,"Level 3 - Item banking")
		table.insert(promotionopts,"Level 4 - Money banking")
		table.insert(promotionopts,"Level 5 - Terminate Kindred")

		if(player.registry["clan"..clannumber.."kindredlevel"]>=0) then
				table.insert(opts,"Clan History")
		end
		if(player.registry["clan"..clannumber.."kindredlevel"]>=1) then
				table.insert(opts,"Leave this clan")
				table.insert(opts,"View clan bank")
				table.insert(opts,"Add item to clan bank")
				table.insert(opts,"Add money to clan bank")
		end
		if(player.registry["clan"..clannumber.."kindredlevel"]>=2) then
				table.insert(opts,"Add Kindred")
				table.insert(opts,"Grant Clan Title")
		end
		if(player.registry["clan"..clannumber.."kindredlevel"]>=3) then
				table.insert(opts,"Withdraw item from clan bank")
		end
		if(player.registry["clan"..clannumber.."kindredlevel"]>=4) then
				table.insert(opts,"Withdraw money from clan bank")
		end
		if(player.registry["clan"..clannumber.."kindredlevel"]>=5) then
				table.insert(opts,"Terminate kindred")
		end
		if(player.registry["clan"..clannumber.."kindredlevel"]>=6) then
				table.insert(opts,"Primogen Sage")
				table.insert(opts,"Clan features")
				table.insert(opts,"Set Kindred Level")
				table.insert(opts,"Step down")
		end

		table.insert(clanfeatures,"Clan bank slots")
		table.insert(clanfeatures,"More coming later...")


		local menuOption=player:menuString("How may I help you?",opts)

			if(menuOption=="Clan History") then
				player:dialogSeq({t,"Avalanche.\n\nHistory of the clan, submitted by the Primogen"})
			elseif(menuOption=="Leave this clan" and player.registry["clan"..clannumber.."kindredlevel"]>=1) then
					if(player.registry["clan"..clannumber.."kindredlevel"]>=6) then
						player:dialogSeq({t,"As Primogen, you may not leave your own clan."})
						return
					end
					if(player.clan==clannumber) then
						player:dialogSeq({t,"This tool allows you to leave this clan. Only proceed if you are certain of your decision."},1)
						local choice=player:menuString2("Are you certain you wish to terminate your kindredship ?",{"Yes","No"})
						if(choice=="Yes") then
							player.clan=0
							player.registry["clan"..clannumber.."kindredlevel"]=0
							player.clanTitle=""
							player:warp(9,3,6)
							player:sendMinitext("Farewell, then.")
						else
							player:dialogSeq({"Very well."})
						end
					else
						player:dialogSeq({t,"You are not part of this clan."})
					end
			elseif(menuOption=="View clan bank" and player.registry["clan"..clannumber.."kindredlevel"]>=1) then
					player:clanViewBank("List of items :")
			elseif(menuOption=="Add item to clan bank" and player.registry["clan"..clannumber.."kindredlevel"]>=1) then
					player:clanShowBankAdd("What do you wish to deposit to your clan bank?")
			elseif(menuOption=="Add money to clan bank" and player.registry["clan"..clannumber.."kindredlevel"]>=1) then
					player:clanBankAddMoney()
			elseif(menuOption=="Add Kindred" and player.registry["clan"..clannumber.."kindredlevel"]>=2) then
					player:dialogSeq({t,"This tool allows you to add a Kindred to your clan. The selected player must not be currently part of any clan."},1)
					name=player:input("Who do you wish to add as a Kindred?")
					if(string.lower(name)~=string.lower(player.name)) then
							if(Player(name).clan==0) then
								Player(name).registry["kindredinviter"]=player.ID
								Player(name).registry["claninvitenumber"]=clannumber
								sleipnir.addKindred(Player(name),npc)
							elseif(Player(name).clan==clannumber) then
								player:dialogSeq({t,""..name.." is already part of your clan!"})
							else
								player:dialogSeq({t,""..name.." is already part of another clan!"})
							end
					else
						player:dialogSeq({"You can not invite yourself!"})
					end
			elseif(menuOption=="Grant Clan Title" and player.registry["clan"..clannumber.."kindredlevel"]>=2) then
					player:dialogSeq({t,"This tool allows you to Grant a Clan Title to one of your Kindreds. The maximal length allowed is 18 characters. Click next to proceed."},1) 
					local name=player:input("Who shall you grant a title to?")
					if(Player(name).registry["clan"..clannumber.."kindredlevel"]==0) then
						player:dialogSeq({t,""..name.." is not part of your clan!"})
						return
					end
					local title=player:input("What shall be the new title?")
					if(string.len(title)>18) then
							player:dialogSeq({t,"This title is too long."})
							return
					end
					--if(string.find(string.lower(title),"'")) then
					--		player:dialogSeq({t,"You may not use ' in your titles."})
					--		return
					--end
					Player(name).clanTitle=title
					Player(name):sendMinitext("You have been granted a new clan title by "..player.name..".")
					player:sendMinitext("If "..name.." is online, then it is done.")
			elseif(menuOption=="Withdraw item from clan bank" and player.registry["clan"..clannumber.."kindredlevel"]>=3) then
					player:clanShowBank("List of items: ")
			elseif(menuOption=="Withdraw money from clan bank" and player.registry["clan"..clannumber.."kindredlevel"]>=4) then
					player:clanBankWithdrawMoney()
			elseif(menuOption=="Terminate kindred" and player.registry["clan"..clannumber.."kindredlevel"]>=5) then
					player:dialogSeq({t,"This tool allows you to terminate a Kindred. Only proceed if you are certain of your decision."},1)
					local name=player:input("Who shall be expelled from the Clan?")
					if(Player(name).clan~=clannumber) then
							player:dialogSeq({t,""..name.." isn't part of your clan!"})
					end
					if(Player(name).registry["clan"..clannumber.."kindredlevel"]>=player.registry["clan"..clannumber.."kindredlevel"]) then
							player:dialogSeq({t,"You may not terminate an equal or higher ranking officer."})
							return
					end
					Player(name).registry["clan"..clannumber.."kindredlevel"]=0
					Player(name).clanTitle=""
					Player(name).clan=0
					Player(name):sendMinitext(""..player.name.." expells you from the clan.")
					player:sendMinitext("If online, "..name.." has been terminated.")
			elseif(menuOption=="Primogen Sage" and player.registry["clan"..clannumber.."kindredlevel"]>=6) then
					player:dialogSeq({t,"Primogen, this tool allows you to learn your Primogen Sage. Remember that it is strictly forbidden to use it for personnal purposes."},1)
					player:addSpell("primogen_sage")
					player:sendMinitext("Your mind expands as you learn Primogen Sage")
			elseif(menuOption=="Clan features" and player.registry["clan"..clannumber.."kindredlevel"]>=6) then
					player:dialogSeq({t,"Primogen, this tool allows you to buy and rent features for your clan. Click next to proceed."},1)
					local choice=player:menuString2("Which feature are you interested in?",clanfeatures)
						if(choice=="Clan bank slots") then
							if(player.mapRegistry["clanbankmaxslots"]>=500) then
								player:dialogSeq({t,"Your clan is currently equipped with 500 slots. You may not purchase any more."})
								return
							end
							player:dialogSeq({t,"Your clan is currently equipped with "..player.mapRegistry["clanbankmaxslots"].." bank slots. Each additional slot costs 50.000 coins and you can buy up to 500 slots."},1)
							local clanbankslots=player:menuString2("Do you wish to purchase one clan bank slot for 50.000 coins?",{"Yes","No"})
								if(clanbankslots=="Yes") then
									if(player.money>=50000) then
										player.mapRegistry["clanbankmaxslots"]=player.mapRegistry["clanbankmaxslots"]+1
										saveMapRegistry(player.m)
										player.money=player.money-50000
										player:sendStatus()
										player:dialogSeq({t,"Your clan is now equipped with a total of "..player.mapRegistry["clanbankmaxslots"].." bank slots."})
									else
										player:dialogSeq({t,"You do not have enough money."})
									end
								end
						else

						
						More coming later

					
						


						end

			elseif(menuOption=="Set Kindred Level" and player.registry["clan"..clannumber.."kindredlevel"]>=6) then
					player:dialogSeq({t,"Primogen, this tool allows you to set the level of a Kindred within your clan. Proceed with caution."},1)
					local name=player:input("Which Kindred needs his level adjusted?")
					if(name==player.name) then
						player:dialogSeq({t,"As Primogen, you may not adjust your own Kindred level."})
						return
					end
					local choice=player:menuString2("Which level shall "..name.." be? ((All levels inherits the previous level powers. Only the new powers are indicated))",promotionopts)
					if(Player(name).clan~=clannumber) then
							player:dialogSeq({t,""..name.." is not a part of your clan."})
							return
					end
					if(choice=="Level 1 - No Special Priviledges") then
							Player(name).registry["clan"..clannumber.."kindredlevel"]=1
							Player(name):sendMinitext("You are now a level 1 Kindred")
							player:sendMinitext("If online, "..name.." is now a level 1 Kindred.")
					elseif(choice=="Level 2 - Add kindred, Grant Clan Title") then
							Player(name).registry["clan"..clannumber.."kindredlevel"]=2
							Player(name):sendMinitext("You are now a level 2 Kindred")
							player:sendMinitext("If online, "..name.." is now a level 2 Kindred.")
					elseif(choice=="Level 3 - Item banking") then
							Player(name).registry["clan"..clannumber.."kindredlevel"]=3
							Player(name):sendMinitext("You are now a level 3 Kindred")
							player:sendMinitext("If online, "..name.." is now a level 3 Kindred.")
					elseif(choice=="Level 4 - Money banking") then
							Player(name).registry["clan"..clannumber.."kindredlevel"]=4
							Player(name):sendMinitext("You are now a level 4 Kindred")
							player:sendMinitext("If online, "..name.." is now a level 4 Kindred.")
					elseif(choice=="Level 5 - Terminate Kindred") then
							Player(name).registry["clan"..clannumber.."kindredlevel"]=5
							Player(name):sendMinitext("You are now a level 5 Kindred")
							player:sendMinitext("If online, "..name.." is now a level 5 Kindred.")
					end
			elseif(menuOption=="Step down" and player.registry["clan"..clannumber.."kindredlevel"]>=6) then
					player:dialogSeq({t,"Primogen, this tool allows you to step down from your position. Only proceed if you are -ABSOLUTELY- certain of your decision."},1)
						local nuisance= { }
						local w=0
						local nameofPlayer=player:input("Who shall become the new Primogen?")
						if(nameofPlayer~=player.name) then
							for x=-20,20 do
								for y=-20,20 do
									nuisance=player:getObjectsInCell(player.m,player.x+x,player.y+y,BL_PC)
									if(#nuisance>0) then
										for z=1,#nuisance do
								 			if(nuisance[z].name==nameofPlayer and nuisance[z].clan==clannumber) then
												Player(nameofPlayer):sendMinitext(""..player.name.." has made you the new Primogen. Congratulations.")
												player:sendMinitext(""..nameofPlayer.." is now the new Primogen")
												Player(nameofPlayer):addLegend("Primogen of Avalanche since Year " .. player:curYear() .. ", " .. player:curSeason() .. "","primogen",7,128)
												Player(nameofPlayer).registry["clan"..clannumber.."kindredlevel"]=6
												player:removeLegendbyName("primogen")
												player:removeSpell("primogen_sage")
												player.registry["clan"..clannumber.."kindredlevel"]=1
												w=1
											end
										end
									end		
								end
							end
						else
							player:dialogSeq({t,"You can not do that."})
						end
						if(w==0) then
							player:dialogSeq({t,""..nameofPlayer.." isn't around or isn't a part of your clan!"})
						end
			end
					
			
		
		
		



	end),

	addKindred=async(function(player,npc)

			local t={graphic=convertGraphic(0,"monster"),color=0}
			local opts = {}
			local check = {}
			table.insert(opts,"Yes")
			table.insert(opts,"No")
                        player.npcGraphic=t.graphic
			player.npcColor=t.color

			local choice=player:menuString2(""..Player(player.registry["kindredinviter"]).name.." Wishes to make you a kindred of Avalanche, do you accept?",opts)
				if(choice=="No") then
					Player(player.registry["kindredinviter"]):dialogSeq({""..player.name" has refused your offer."})
				elseif(choice=="Yes") then
						player.clan=player.registry["claninvitenumber"]
						player.registry["clan"..player.clan.."kindredlevel"]=1
						player:sendStatus()
						Player(player.registry["kindredinviter"]):sendMinitext(""..player.name.." has accepted your offer and is now a kindred of this clan.")
						player:sendMinitext("You are now a Kindred of Avalanche.")
				end




	end)
]]--
}