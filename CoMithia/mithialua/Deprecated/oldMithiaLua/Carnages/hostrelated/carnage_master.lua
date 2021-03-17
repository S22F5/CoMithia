carnage_master = {
	click = async(function(player,npc)
		local t={graphic=convertGraphic(146,"monster"),color=15}
	        local opts = { }

                              player.npcGraphic=t.graphic
			      player.npcColor=t.color

			      	if(player.registry["carnagehost"]==1) then
					if(player.armorColor==15) then
                              		table.insert(opts,"Obtain Carnages key")
					table.insert(opts,"Destroy Carnages key")
					end
					table.insert(opts,"Host dye")
			      	end

			      	if(player.registry["carnagehost"]==3) then
					if(player.armorColor==15) then
                              		table.insert(opts,"Obtain Carnages key")
					table.insert(opts,"Destroy Carnages key")
					end
					table.insert(opts,"Fire host")
					table.insert(opts,"Step down")
					table.insert(opts,"Host dye")
			      	end
				if(player.registry["carnagehost"]>=1) then
					table.insert(opts,"Carnage Sage")
					table.insert(opts,"Host Steed")
					table.insert(opts,"Hosts barricade")
					table.insert(opts,"Elixir barricades")
					table.insert(opts,"Carnages warp")
			      		table.insert(opts,"Main hall warp")
				end

			      local menuOption=player:menuString("Hello, Carnage Host, how may I help you?",opts)
					
					if(menuOption=="Obtain Carnages key") then
						if(player:hasItem("carnages_key") ~= true) then															
							player:sendMinitext("You receive a Carnages key.")
							player:addItem(188,1)
							
						else
							player:dialogSeq({t,"You already have a Carnages key"})
						end
					elseif(menuOption=="Destroy Carnages key") then
								player:removeItem(188,1)
					elseif(menuOption=="Elixir barricades") then
						if(player:hasItem("elixir_barricades",1)==true) then
							player:removeItem("elixir_barricades",1)
						else
							if(player:hasSpace("elixir_barricades",1)) then
								player:addItem("elixir_barricades",1)
							else
								player:sendMinitext("Your inventory is full.")
							end
						end
					elseif(menuOption=="Host Steed") then
						if(player:hasItem("collar_host_steed",1)==true) then
							player:removeItem("collar_host_steed",1)
						end
						if(not player:hasSpell("host_steed_magic")) then
							player:addSpell("host_steed_magic")
						end	
					elseif(menuOption=="Main hall warp") then
						player:warp(2001,4,9)
					elseif(menuOption=="Carnages warp") then
						local choices = {}
						table.insert(choices,"Carnages")
						table.insert(choices,"Dominations")
						table.insert(choices,"Assaults")
						table.insert(choices,"Elixir wars")
						local choice=player:menuString2("Where to?",choices)
						if(choice=="Carnages") then
							player:warp(2007,9,8)
						elseif(choice=="Assaults") then
							player:warp(2008,9,8)
						elseif(choice=="Dominations") then
							player:warp(2009,9,8)
						elseif(choice=="Elixir wars") then
							player:warp(2010,9,8)
						end
					elseif(menuOption=="Fire host") then
						player:dialogSeq({t,"Hello Headmaster. This will allow you to remove a Carnage host from duty. Only proceed if you are certain of your decision."},1)
						local nameofPlayer=player:input("Which Carnage host needs his power removed?")
							if(Player(nameofPlayer).name~=player.name) then
									if(Player(nameofPlayer).registry["carnagehost"]>0) then
										Player(nameofPlayer).registry["carnagehost"]=0
										Player(nameofPlayer):sendMinitext("You are no longer a Carnage host.")
										player:sendMinitext(""..nameofPlayer.." has been fired.")
									end
									Player(nameofPlayer).registry["board261write"]=0
									Player(nameofPlayer):removeItem(188,1)
									Player(nameofPlayer):removeItem("elixir_barricades",1)
									Player(nameofPlayer):removeLegendbyName("carnagehost")
									Player(nameofPlayer):removeSpell("sage_carnages")
									Player(nameofPlayer):removeSpell("hosts_barricade")
									if(Player(nameofPlayer).armorColor==15) then
										Player(nameofPlayer).armorColor=0
										Player(nameofPlayer):sendStatus()
										Player(nameofPlayer):updateState()
									end
							else
								player:dialogSeq({t,"You can not fire yourself!"})
							end
					elseif(menuOption=="Step down") then
						local nuisance= { }
						local w=0
						player:dialogSeq({t,"Hello Headmaster. This will allow you to step down of your position and promote a new Carnage Headmaster. Only proceed if you are -ABSOLUTELY- certain of your decision."},1)

						local nameofPlayer=player:input("Which Carnage host shall become the new Headmaster?")
						if(nameofPlayer~=player.name) then
						for x=0,15 do
						for y=0,15 do
							nuisance=player:getObjectsInCell(player.m,x,y,BL_PC)
							if(#nuisance>0) then
								for z=1,#nuisance do
								 	if(nuisance[z].name==nameofPlayer) then
										Player(nameofPlayer):sendMinitext(""..player.name.." has made you the new Carnages Headmaster. Congratulations.")
										player:sendMinitext(""..nameofPlayer.." is now the new Carnages Headmaster")
										Player(nameofPlayer):removeLegendbyName("carnagehost")
										Player(nameofPlayer):addLegend("Carnage Headmaster (Year " .. player:curYear() .. ", " .. player:curSeason() .. ")","carnagehost",87,128)
										Player(nameofPlayer).registry["carnagehost"]=3
										player:removeLegendbyName("carnagehost")
										player:addLegend("Carnage host (Year " .. player:curYear() .. ", " .. player:curSeason() .. ")","carnagehost",87,128)
										player.registry["carnagehost"]=1
										Player(nameofPlayer).registry["board262write"]=1
										Player(nameofPlayer).registry["board263del"]=1
										player.registry["board262write"]=0
										player.registry["board261del"]=0	
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
							player:dialogSeq({t,""..nameofPlayer.." isn't around!"})
						end								
     					elseif(menuOption=="Host dye" and player.registry["dyesaved"]==0) then
						player.registry["dyesaved"]=1
						player.registry["savedye"]=player.armorColor
						player.armorColor=15
						player:updateState()
						player:dialogSeq({t,"Your dye has been saved."})

					elseif(menuOption=="Host dye" and player.registry["dyesaved"]==1) then
						player.registry["dyesaved"]=0
						player.armorColor=player.registry["savedye"]
						player:updateState()
						player:dialogSeq({t,"Your dye has been restored."})

					elseif(menuOption=="Carnage Sage") then
						player:dialogSeq({t,"In case you have lost your Carnage Sage spell, this tool allows you to relearn it, press Next to proceed."},1)
						player:addSpell("sage_carnages")
					elseif(menuOption=="Hosts barricade") then
						player:dialogSeq({t,"In case you have lost your Hosts barricade spell, this tool allows you to relearn it, press Next to proceed."},1)
						player:addSpell("hosts_barricade")

					end
						
                              

                              
        end)
}