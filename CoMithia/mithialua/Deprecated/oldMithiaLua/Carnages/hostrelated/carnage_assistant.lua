carnage_assistant = {
	click = async(function(player,npc)
		local t={graphic=convertGraphic(79,"monster"),color=13}
	        local opts = { }

                              player.npcGraphic=t.graphic
			      player.npcColor=t.color
                              table.insert(opts,"Buy")
                              table.insert(opts,"Sell")
			      	if((player.registry["carnagehost"]==1 and player.armorColor==15) or player.registry["carnagehost"]>1) then
                              		table.insert(opts,"Carnage nuisance")
					table.insert(opts,"Assign teams")
					table.insert(opts,"Sort participants")
					table.insert(opts,"Move participant")
					table.insert(opts,"Warps")
					table.insert(opts,"Check Participants status")
					table.insert(opts,"Set Arena doors")
					table.insert(opts,"Set Exit doors")
					table.insert(opts,"Mass Bleach")
			      	end
			      table.insert(opts,"Leave Carnage")
                              table.insert(opts,"Read Carnage board")     
                              

                                  local menuOption=player:menuString("Hello, How can I help you today?",opts)

                                  if(menuOption=="Buy") then
                                     player:buyExtend("What do you wish to buy?",{16,24,25})

                                  elseif(menuOption=="Sell") then
                                     player:sellExtend("What do you wish to sell?",{16,24,25})

                                  elseif(menuOption=="Read Carnage board") then
						player:showBoard(262)

                                  elseif(menuOption=="Leave Carnage") then
						player:dialogSeq({t,"Are you sure you want to leave the Carnage? This could handicap your team.",t,"Once you have left, you will not be able to come back or claim your win. Click Next only if you are sure you want to leave."},1)
				      		local q=math.random(1,4)
          				   	if(x==1) then
               						player:warp(18,2,4)
            					elseif(x==2) then
               						player:warp(18,27,4)
            					elseif(x==3) then
               						player:warp(9,3,6)
                                        	else
							player:warp(9,7,6)
                                        	end

                                  elseif(menuOption=="Carnage nuisance") then
					local nameofPlayer
					local w=0
					local nuisance = { }
					nameofPlayer=player:input("Who do you need to remove from the Carnage Hall?")
					for x=0,50 do
						for y=0,35 do
							nuisance=player:getObjectsInCell(player.m,x,y,BL_PC)
							if(#nuisance>0) then
								for z=1,#nuisance do
								 	if(string.lower(nuisance[z].name)==string.lower(nameofPlayer)) then
										Player(nameofPlayer):warp(2001,12,7)
										Player(nameofPlayer):sendMinitext("You have been removed by "..player.name)
										player:sendMinitext(""..nameofPlayer.." has been removed")
										w=1
										break
									end
								end
							end		
						end
					end
					if(w==0) then
						player:dialogSeq({t,""..nameofPlayer.." isn't around!"})
					end

                                  elseif(menuOption=="Assign teams") then
                                     player:dialogSeq({t,"Remember being a Carnage host is a priviledge. Player's privacy is a important and it is therefore unethical to discuss their stats with other players"},1)
				     player:powerBoard()

                                  elseif(menuOption=="Mass Bleach") then
                                     	player:dialogSeq({t,"Hello, this tool will allow you to bleach everyone in the room instantly. Proceed with caution"},1)
				  	for x=0,50 do
						for y=0,34 do
							local bleach={}

							bleach=player:getObjectsInCell(player.m,x,y,BL_PC)
							if(#bleach>0) then
								for z=1,#bleach do
									if(bleach[z].armorColor~=15) then
										bleach[z].armorColor=0
										bleach[z]:updateState()
										bleach[z]:sendAnimation(13)
										bleach[z]:sendMinitext("Host "..player.name.." has bleached everyone.")
									end
								end
							end
						end
					end					
                                  elseif(menuOption=="Move participant") then
					local nameofPlayer
					local w=0
					local nuisance = { }
					nameofPlayer=player:input("Who do you need to move within the Carnage Hall?")
					for x=0,50 do
						for y=0,35 do
							nuisance=player:getObjectsInCell(player.m,x,y,BL_PC)
							if(#nuisance>0) then
								for z=1,#nuisance do
								 	if(string.lower(nuisance[z].name)==string.lower(nameofPlayer)) then
										Player(nameofPlayer):warp(2100,24,22)
										player:sendMinitext(""..nameofPlayer.." has been moved.")
										w=1
										break
									end
								end
							end		
						end
					end
					if(w==0) then
						player:dialogSeq({t,""..nameofPlayer.." isn't around!"})
					end
				elseif(menuOption=="Sort participants") then
					local w=0
					local nuisance = { }
					local f=0
					local g=0
					player:dialogSeq({t,"You will sort all participants to their respective rows, click Next to proceed."},1)

					for x=0,50 do
						for y=0,35 do
							nuisance=player:getObjectsInCell(player.m,x,y,BL_PC)
							if(#nuisance>0) then
								for z=1,#nuisance do
								 	if(nuisance[z].armorColor==61)then
										f=math.random(37,42)
										g=math.random(9,29)
										nuisance[z]:warp(2100,f,g)
									elseif(nuisance[z].armorColor==63) then
										f=math.random(27,32)
										g=math.random(9,29)
										nuisance[z]:warp(2100,f,g)
									elseif(nuisance[z].armorColor==65) then
										f=math.random(17,22)
										g=math.random(9,29)
										nuisance[z]:warp(2100,f,g)
									elseif(nuisance[z].armorColor==60) then
										f=math.random(7,12)
										g=math.random(9,29)
										nuisance[z]:warp(2100,f,g)
									end
								end
									 
                                                         end
						end
					end
                                elseif(menuOption=="Check Participants status") then
				    if(player.registry["checkaliveparticipants"]+5<=os.time()) then
					player.registry["checkaliveparticipants"]=os.time()
					local black=0
					local white=0
					local red=0
					local blue=0
					local bleached=0
					local nuisance = { }
					for x=0,50 do
						for y=0,35 do
							nuisance=player:getObjectsInCell(player.m,x,y,BL_PC)
							if(#nuisance>0) then
								for z=1,#nuisance do
								 	if(nuisance[z].armorColor==60) then	
										black=black+1
									elseif(nuisance[z].armorColor==61) then
										white=white+1
									elseif(nuisance[z].armorColor==63) then
										red=red+1
									elseif(nuisance[z].armorColor==65) then
										blue=blue+1
									elseif(nuisance[z].armorColor==0) then
										bleached=bleached+1
									end
								end
							end		
						end
					end
					player:dialogSeq({t,"The following number of players are present:\n\nBlack: "..black.."\nWhite: "..white.."\nRed  : "..red.."\nBlue : "..blue.."\nBleached : "..bleached.."\n"})
				   else
					player:dialogSeq({t,"You can only check participants every 5 seconds."})
				   end
				elseif(menuOption=="Warps") then
						local warps= {}
						local halldoors = {}
						local halldoorsexit = {}
						local halldoorsgames = {}
						local arenas = {}
						local arenascarnage = {}
						local arenasassault = {}
						local arenasdomination = {}
						local arenaselixirwar = {}

						table.insert(warps,"Arenas")
						table.insert(warps,"Hall doors")
						table.insert(warps,"Hosts den")					

						table.insert(halldoors,"Exit doors")
						table.insert(halldoors,"Game doors")

						table.insert(halldoorsexit,"Black")
						table.insert(halldoorsexit,"Blue")
						table.insert(halldoorsexit,"Red")
						table.insert(halldoorsexit,"White")

						table.insert(halldoorsgames,"Carnage")
						table.insert(halldoorsgames,"Assault")
						table.insert(halldoorsgames,"Domination")
						table.insert(halldoorsgames,"Elixir war")

						table.insert(arenas,"Carnage")
						table.insert(arenas,"Assault")
						table.insert(arenas,"Domination")
						table.insert(arenas,"Elixir war")

						table.insert(arenascarnage,"Cattle fields")
						table.insert(arenascarnage,"The Garden")

						table.insert(arenasassault,"Castle Assault")

						table.insert(arenasdomination,"Pinwheel")

						table.insert(arenaselixirwar,"Dirt field")



						local warpchoice=player:menuString2("Where do you want to be warped to?",warps)
							if(warpchoice=="Arenas") then
								local arenachoice=player:menuString2("Which type of Game?",arenas)
									if(arenachoice=="Carnage") then
										local carnagechoice=player:menuString2("Which arena?",arenascarnage)
											if(carnagechoice=="Cattle fields") then
												player:warp(2005,17,16)
											elseif(carnagechoice=="The Garden") then
												player:warp(2021,22,22)
											end
									elseif(arenachoice=="Assault") then
										local assaultchoice=player:menuString2("Which arena?",arenasassault)
											if(assaultchoice=="Castle Assault") then
												player:warp(2041,30,2)
											end
									elseif(arenachoice=="Domination") then
										local dominationchoice=player:menuString2("Which arena?",arenasdomination)
											if(dominationchoice=="Pinwheel") then
												player:warp(2061,22,26)
											end
									elseif(arenachoice=="Elixir war") then
										local elixirwarchoice=player:menuString2("Which arena?",arenaselixirwar)
											if(elixirwarchoice=="Dirt field") then
												player.registry["elixircolor"]=0
												player:warp(2081,20,27)
											end
									end
							elseif(warpchoice=="Hall doors") then
								local doorchoice=player:menuString2("Which doors?",halldoors)
									if(doorchoice=="Exit doors") then
										local exitchoice=player:menuString2("Which Color?",halldoorsexit)
											if(exitchoice=="Black") then
												player:warp(2100,9,33)
											elseif(exitchoice=="Blue") then
												player:warp(2100,19,33)
											elseif(exitchoice=="Red") then
												player:warp(2100,29,33)
											elseif(exitchoice=="White") then
												player:warp(2100,39,33)
											end
									elseif(doorchoice=="Game doors") then
										local gamechoice=player:menuString2("Which game?",halldoorsgames)
											if(gamechoice=="Carnage") then
												player:warp(2100,9,5)
											elseif(gamechoice=="Assault") then
												player:warp(2100,19,5)
											elseif(gamechoice=="Domination") then
												player:warp(2100,29,5)
											elseif(gamechoice=="Elixir war") then
												player:warp(2100,39,5)
											end
									end
							elseif(warpchoice=="Hosts den") then
								player:warp(2003,9,9)
							end
				elseif(menuOption=="Set Exit doors") then
						local exit={}
						table.insert(exit,"Carnage")
						table.insert(exit,"Assault")
						table.insert(exit,"Domination")
						table.insert(exit,"Elixir war")
						player:dialogSeq({t,"Carnage Host, this tool allows you to set the Exit doors to direct to the correct prize room of the game you are hosting."},1)
						local exitdoors=player:menuString2("Please select the appropriate Carnage game.",exit)
							if(exitdoors=="Carnage") then
								player.mapRegistry["hallexitdoors"]=1
							elseif(exitdoors=="Assault") then
								player.mapRegistry["hallexitdoors"]=2
							elseif(exitdoors=="Domination") then
								player.mapRegistry["hallexitdoors"]=3
							elseif(exitdoors=="Elixir war") then
								player.mapRegistry["hallexitdoors"]=4
							else
								player.mapRegistry["hallexitdoors"]=0
							end
						player:sendMinitext("The Exit doors have been set for "..exitdoors..".")
						player:dialogSeq({t,"It is done."})	
				elseif(menuOption=="Set Arena doors") then
						local arenas={}
						table.insert(arenas,"Carnage")
						table.insert(arenas,"Assault")
						table.insert(arenas,"Domination")
						table.insert(arenas,"Elixir war")

						local carnagearenas = {}
						table.insert(carnagearenas,"Cattle fields")
						table.insert(carnagearenas,"The Garden")

						local assaultarenas = {}
						table.insert(assaultarenas,"Castle Assault")

						local dominationarenas = {}
						table.insert(dominationarenas,"Pinwheel")

						local elixirwararenas = {}
						table.insert(elixirwararenas,"Dirt field")
						


						local arenadoors="null"
						local arenachoice="null"
						player:dialogSeq({t,"Carnage Host, this tool allows you to set the Game doors to direct to the correct arena."},1)
						arenadoors=player:menuString2("Please select the appropriate Carnage game.",arenas)
							if(arenadoors=="Carnage") then
								arenachoice=player:menuString2("Which Carnage Arena shall you direct them to?",carnagearenas)
								if(arenachoice=="Cattle fields") then
									player.mapRegistry["carnagearena"]=1
								elseif(arenachoice=="The Garden") then
									player.mapRegistry["carnagearena"]=2
								end
								player.mapRegistry["assaultarena"]=0
								player.mapRegistry["dominationarena"]=0
								player.mapRegistry["elixirwararena"]=0

							elseif(arenadoors=="Assault") then
								arenachoice=player:menuString2("Which Assault arena shall you direct them to?",assaultarenas)
								if(arenachoice=="Castle Assault") then
									player.mapRegistry["assaultarena"]=1
								end
								player.mapRegistry["carnagearena"]=0
								player.mapRegistry["dominationarena"]=0
								player.mapRegistry["elixirwararena"]=0
							elseif(arenadoors=="Domination") then
								arenachoice=player:menuString2("Which Domination arena shall you direct them to?",dominationarenas)
								if(arenachoice=="Pinwheel") then
									player.mapRegistry["dominationarena"]=1
								end
								player.mapRegistry["assaultarena"]=0
								player.mapRegistry["carnagearena"]=0
								player.mapRegistry["elixirwararena"]=0
							elseif(arenadoors=="Elixir war") then
								arenachoice=player:menuString2("Which Elixir war arena shall you direct them to?",elixirwararenas)
								if(arenachoice=="Dirt field") then
									player.mapRegistry["elixirwararena"]=1
								end
								player.mapRegistry["assaultarena"]=0
								player.mapRegistry["carnagearena"]=0
								player.mapRegistry["domination"]=0
							end
						player:sendMinitext("The Game doors have been set for "..arenadoors.." : "..arenachoice..".")
						player.mapRegistry["hallexitdoors"]=0
						player:sendMinitext("The Exit doors have been reset.")
						player:dialogSeq({t,"It is done."})			
				end
        end)
}