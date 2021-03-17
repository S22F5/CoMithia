castle_assault_assistant1 = {
	click = async(function(player,npc)
		local f=0
		local g=0
		local t={graphic=convertGraphic(6,"monster"),color=15}
	        local opts = { }
		local m=player.m

                              player.npcGraphic=t.graphic
			      player.npcColor=t.color
			      	if((player.registry["carnagehost"]==1 and player.armorColor==15) or player.registry["carnagehost"]>1) then
                              		table.insert(opts,"Carnage nuisance")
					table.insert(opts,"Sort participants")
					table.insert(opts,"Move participant")
					table.insert(opts,"Carnage hall warp")
					table.insert(opts,"Clear barricades")
					table.insert(opts,"Start round")
					table.insert(opts,"Force ending")
					table.insert(opts,"Set Offense/Defense")
					table.insert(opts,"Send to Sidelines")
					table.insert(opts,"Assess time")
					table.insert(opts,"Warps")
					if(player.state==1) then
						table.insert(opts,"Ressucitate")
					end
			      	end

				table.insert(opts,"Return to hall")
				if(player.state==1) then
					table.insert(opts,"Reincarnate")
				end
				table.insert(opts,"Teleportation")

                                local menuOption=player:menuString("Hello.\n\nHow can I help you?",opts)


                                if(menuOption=="Carnage nuisance") then
					local nameofPlayer
					local w=0
					local nuisance = { }
					nameofPlayer=player:input("Who do you need to remove from the Arena?")
					for x=0,100 do
						for y=0,100 do
							nuisance=player:getObjectsInCell(player.m,x,y,BL_PC)
							if(#nuisance>0) then
								for z=1,#nuisance do
								 	if(string.lower(nuisance[z].name)==string.lower(nameofPlayer)) then
										Player(nameofPlayer):warp(2001,12,7)
										Player(nameofPlayer):sendMinitext("You have been nuisanced by "..player.name)
										player:sendMinitext(""..nameofPlayer.." has been nuisanced")
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
				elseif(menuOption=="Return to hall") then
					player:dialogSeq({t,"Do you want to return to the Carnage hall ? This could handicap your team.\n\nClick Next if you are sure."},1)
					
					player:addHealth(player.maxHealth)
					player:addMana(player.maxMagic)
					--player:flushDuration()
					player.state=0
					player:updateState()
					player:warp(2100,24,24)
					return
				elseif(menuOption=="Start round") then
					if(player.mapRegistry["assaultroundstart"]>0) then
						player:dialogSeq({t,"The round is already started."})
						return
					end
						player:dialogSeq({t,"Carnage Host, This tool allows you to start an Assault Round. Please make sure the Offense and Defense is set accordingly."},1)

						player.mapRegistry["assaultroundstart"]=os.time()

						player.mapRegistry["firstshrineunderattack"]=0
						player.mapRegistry["secondshrineunderattack"]=0
						player.mapRegistry["thirdshrineunderattack"]=0
						player.mapRegistry["fourthshrineunderattack"]=0

						player.mapRegistry["firstshrineattacktime"]=0
						player.mapRegistry["secondshrineattacktime"]=0
						player.mapRegistry["thirdshrineattacktime"]=0
						player.mapRegistry["fourthshrineattacktime"]=0

						player.mapRegistry["firstshrinecaptured"]=0
						player.mapRegistry["secondshrinecaptured"]=0
						player.mapRegistry["thirdshrinecaptured"]=0
						player.mapRegistry["fourthshrinecaptured"]=0

						player:broadcast(player.m,"-Host "..player.name.." starts the Assault Round!")
						
						

					return
				elseif(menuOption=="Force ending") then
					if(player.mapRegistry["assaultroundstart"]==0) then
						player:dialogSeq({t,"The round has not been started yet."})
						return
					end

					
					player:dialogSeq({t,"Carnage Host, this tool allows you to force the ending of an Assault round. Please proceed with Extreme Caution."},1)
					player:broadcast(player.m,"-Host "..player.name.." forces a round end!")
					local time=os.time()-player.mapRegistry["assaultroundstart"]
					local timemin=math.floor(time/60)
					local timesec=time-(timemin*60)
					player:broadcast(player.m,"The round ends after "..timemin.." minutes and "..timesec.." seconds.")
					player.mapRegistry["assaultroundstart"]=0
					return
				elseif(menuOption=="Set Offense/Defense") then
					if(player.mapRegistry["assaultroundstart"]>0) then
						player:dialogSeq({t,"A round has already been started. You can only Set Offense and Defense when a round has ended."})
						return
					end
					local choices={}
					table.insert(choices,"Offense: Red, Defense: Black")
					table.insert(choices,"Offense: Black, Defense: Red")

					local choice=player:menuString2("How do you wish to set the Game?",choices)
						if(choice=="Offense: Red, Defense: Black") then
							player.mapRegistry["defenseteamcolor"]=60
							player.mapRegistry["attackteamcolor"]=63
						elseif(choice=="Offense: Black, Defense: Red") then
							player.mapRegistry["defenseteamcolor"]=63
							player.mapRegistry["attackteamcolor"]=60
						end
						
						player:dialogSeq({t,"Your choice is:\n\n"..choice.."\n\nRemember to Send teams to Sidelines before starting the round."})						
						return


				elseif(menuOption=="Send to Sidelines" and player.m==m) then
					if(player.mapRegistry["assaultroundstart"]>0) then
						player:dialogSeq({t,"A round has already been started. You can only Send players to sidelines when a round has ended."})
						return
					end

					player:dialogSeq({t,"Carnage Host, This tool allows you to send players to the sidelines according to your Offense/Defense settings. Please proceed with Caution."},1)
					local players = {}
					for x=0,100 do
						for y=0,100 do
							players=player:getObjectsInCell(player.m,x,y,BL_PC)
							if(#players>0) then
								for z=1,#players do
									if(players[z].armorColor==player.mapRegistry["defenseteamcolor"]) then
										players[z]:warp(m,math.random(42,57),math.random(0,6))
									elseif(players[z].armorColor==player.mapRegistry["attackteamcolor"]) then
										players[z]:warp(m,math.random(0,30),math.random(91,99))
									end
								end
							end
						end
					end
					

				elseif(menuOption=="Assess time") then
					if(player.mapRegistry["assaultroundstart"]==0) then
						player:dialogSeq({t,"The Round has not started yet."})
						return
					end
					
					local time=os.time()-player.mapRegistry["assaultroundstart"]
					local timemin=math.floor(time/60)
					local timesec=time-(timemin*60)
					player:sendMinitext("The round has started "..timemin.." minutes and "..timesec.." seconds ago.")

				elseif(menuOption=="Reincarnate") then
					if(player.armorColor==player.mapRegistry["defenseteamcolor"]) then
						player:warp(m,math.random(42,57),math.random(0,6))
						player.paralyzed=true
						player:setDuration("domination_res",30000)
						return
					elseif(player.armorColor==player.mapRegistry["attackteamcolor"]) then
						player:warp(m,math.random(0,30),math.random(91,99))
						player.paralyzed=true
						player:setDuration("domination_res",30000)
						return
					else
						player:dialogSeq({t,"Your team is neither on Offense nor on Defense."})
						return
					end


				elseif(menuOption=="Teleportation") then
					if(player.state==1) then
						player:sendMinitext("You need to be alive to use this feature.")
						return
					end
					if(player.registry["assaultport"]>os.time()) then
						player:sendMinitext("You can only use this feature every thirty seconds.")
						return
					end
					if(player.mapRegistry["assaultroundstart"]==0) then
						player:dialogSeq({t,"The Round has not started yet."})
						return
					end

					if(player.armorColor==player.mapRegistry["defenseteamcolor"]) then
						local choices = {}

						if(player.mapRegistry["firstshrinecaptured"]==0) then
							table.insert(choices,"Second Shrine")
						end
						if(player.mapRegistry["secondshrinecaptured"]==0) then
							table.insert(choices,"Third Shrine")
						end
						table.insert(choices,"Sideline")

						local choice=player:menuString2("Where do you wish to be Teleported?",choices)
							if(choice=="Second Shrine") then
								player:warp(m,math.random(6,10),math.random(50,54))
								player:sendMinitext("You have been teleported to the Second Shrine!")
								player.registry["assaultport"]=os.time()+30
							elseif(choice=="Third Shrine") then
								player:warp(m,math.random(20,24),math.random(20,24))
								player:sendMinitext("You have been teleported to the Third Shrine!")
								player.registry["assaultport"]=os.time()+30
							elseif(choice=="Sideline") then
								player:warp(m,math.random(42,57),math.random(0,6))
								player:sendMinitext("You have been teleported to your sideline!")
								player.registry["assaultport"]=os.time()+30
							end
					elseif(player.armorColor==player.mapRegistry["attackteamcolor"]) then
						local choices = {}

						if(player.mapRegistry["thirdshrinecaptured"]==1) then
							table.insert(choices,"Third Shrine")
						end
						if(player.mapRegistry["secondshrinecaptured"]==1) then
							table.insert(choices,"Second Shrine")
						end
						if(player.mapRegistry["firstshrinecaptured"]==1) then
							table.insert(choices,"First Shrine")
						end
						table.insert(choices,"Sideline")

						local choice=player:menuString2("Where do you wish to be Teleported?",choices)
							if(choice=="First Shrine") then
								player:warp(m,math.random(46,50),math.random(64,68))
								player:sendMinitext("You have been teleported to the Second Shrine!")
								player.registry["assaultport"]=os.time()+30
							elseif(choice=="Second Shrine") then
								player:warp(m,math.random(6,10),math.random(50,54))
								player:sendMinitext("You have been teleported to the Second Shrine!")
								player.registry["assaultport"]=os.time()+30
							elseif(choice=="Third Shrine") then
								player:warp(m,math.random(20,24),math.random(20,24))
								player:sendMinitext("You have been teleported to the Third Shrine!")
								player.registry["assaultport"]=os.time()+30
							elseif(choice=="Sideline") then
								player:warp(m,math.random(0,30),math.random(91,99))
								player:sendMinitext("You have been teleported to your sideline!")
								player.registry["assaultport"]=os.time()+30
							end
					else
						player:dialogSeq({t,"Your team is neither on Offense nor on Defense."})
						return
					end

                                elseif(menuOption=="Warps") then
					local choices = {}

					table.insert(choices,"Offense Sideline")
					table.insert(choices,"Defense Sideline")
					table.insert(choices,"First Shrine")
					table.insert(choices,"Second Shrine")
					table.insert(choices,"Third Shrine")
					
					local choice=player:menuString2("Where do you wish to be warped to ?",choices)
						if(choice=="Offense Sideline") then
							player:warp(m,13,87)
						elseif(choice=="Defense Sideline") then
							player:warp(m,39,11)
						elseif(choice=="First Shrine") then
							player:warp(m,41,67)
						elseif(choice=="Second Shrine") then
							player:warp(m,2,47)
						elseif(choice=="Third Shrine") then
							player:warp(m,31,16)
						end
					return

                                elseif(menuOption=="Move participant") then
					local nameofPlayer
					local w=0
					local nuisance = { }
					nameofPlayer=player:input("Who do you need to move within the Arena?")
					for x=0,100 do
						for y=0,100 do
							nuisance=player:getObjectsInCell(player.m,x,y,BL_PC)
							if(#nuisance>0) then
								for z=1,#nuisance do
								 	if(string.lower(nuisance[z].name)==string.lower(nameofPlayer)) then	
										Player(nameofPlayer):warp(2061,20,25)
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
					local choice=player:menu2("Sort Participants :",{"Sort one participant", "Sort all participants"})
					if(choice==1) then
					nameofPlayer=player:input("Who do you wish to sort to the Carnage Hall?")
					for x=0,100 do
						for y=0,100 do
							nuisance=player:getObjectsInCell(player.m,x,y,BL_PC)
							if(#nuisance>0) then
								for z=1,#nuisance do
								 	if(string.lower(nuisance[z].name)==string.lower(nameofPlayer)) then
										Player(nameofPlayer).state=0
										Player(nameofPlayer):updateState()
										Player(nameofPlayer):addHealth(nuisance[z].maxHealth)
										Player(nameofPlayer):warp(2100,24,24)
										player:sendMinitext(""..nameofPlayer.." has been sorted to the Carnage hall.")
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
					elseif(choice==2) then

					player:dialogSeq({t,"You will sort all participants to their respective rows in the Carnage hall, click Next to proceed."},1)
					
					local f=0
					local g=0
					for x=0,100 do
						for y=0,100 do
							nuisance=player:getObjectsInCell(player.m,x,y,BL_PC)
							if(#nuisance>0) then
								for z=1,#nuisance do
									if(nuisance[z].state==1) then											 						nuisance[z]:addHealth(1000000000)
										nuisance[z].state=0
										nuisance[z]:updateState()
									end
										nuisance[z]:addHealth(nuisance[z].maxHealth)
										nuisance[z]:addMana(nuisance[z].maxMagic)
										--nuisance[z]:flushDuration()
								 	if(nuisance[z].armorColor==61) then
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
					end
				elseif(menuOption=="Carnage hall warp") then
						player:warp(2100,24,4)
				elseif(menuOption=="Ressucitate") then
						if(player.armorColor==15) then
							player:addHealth(1000000000)
							player.state=0
							player:updateState()
						else
							player:dialogSeq({t,"You can not use this ability while you play."})
						end
				
                                elseif(menuOption=="Clear barricades") then
					local barcheck = {}
					player:dialogSeq({t,"This tool allows you to remove every barricade on the map instantly. Press next to proceed."},1)
						for x=0,100 do
							for y=0,100 do
								barcheck=player:getObjectsInCell(player.m,x,y,BL_MOB)
								if(#barcheck>0) then
									for z=1,#barcheck do
										if(string.lower(barcheck[z].name)==string.lower("barricade")) then
												barcheck[z].attacker=player.ID
												barcheck[z]:removeHealth(3000000000)
										end
									end
								end
							end
						end
				end
        end)
}

castle_assault_assistant2 = {
	click = async(function(player,npc)
		local f=0
		local g=0
		local t={graphic=convertGraphic(6,"monster"),color=15}
	        local opts = { }
		local m=player.m

                              player.npcGraphic=t.graphic
			      player.npcColor=t.color
			      	if((player.registry["carnagehost"]==1 and player.armorColor==15) or player.registry["carnagehost"]>1) then
                              		table.insert(opts,"Carnage nuisance")
					table.insert(opts,"Sort participants")
					table.insert(opts,"Move participant")
					table.insert(opts,"Carnage hall warp")
					table.insert(opts,"Clear barricades")
					table.insert(opts,"Start round")
					table.insert(opts,"Force ending")
					table.insert(opts,"Set Offense/Defense")
					table.insert(opts,"Send to Sidelines")
					table.insert(opts,"Assess time")
					table.insert(opts,"Warps")
					if(player.state==1) then
						table.insert(opts,"Ressucitate")
					end
			      	end

				table.insert(opts,"Return to hall")
				if(player.state==1) then
					table.insert(opts,"Reincarnate")
				end
				table.insert(opts,"Teleportation")

                                local menuOption=player:menuString("Hello.\n\nHow can I help you?",opts)


                                if(menuOption=="Carnage nuisance") then
					local nameofPlayer
					local w=0
					local nuisance = { }
					nameofPlayer=player:input("Who do you need to remove from the Arena?")
					for x=0,100 do
						for y=0,100 do
							nuisance=player:getObjectsInCell(player.m,x,y,BL_PC)
							if(#nuisance>0) then
								for z=1,#nuisance do
								 	if(string.lower(nuisance[z].name)==string.lower(nameofPlayer)) then
										Player(nameofPlayer):warp(2001,12,7)
										Player(nameofPlayer):sendMinitext("You have been nuisanced by "..player.name)
										player:sendMinitext(""..nameofPlayer.." has been nuisanced")
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
				elseif(menuOption=="Return to hall") then
					player:dialogSeq({t,"Do you want to return to the Carnage hall ? This could handicap your team.\n\nClick Next if you are sure."},1)
					
					player:addHealth(player.maxHealth)
					player:addMana(player.maxMagic)
					--player:flushDuration()
					player.state=0
					player:updateState()
					player:warp(2100,24,24)
					return
				elseif(menuOption=="Start round") then
					if(player.mapRegistry["assaultroundstart"]>0) then
						player:dialogSeq({t,"The round is already started."})
						return
					end
						player:dialogSeq({t,"Carnage Host, This tool allows you to start an Assault Round. Please make sure the Offense and Defense is set accordingly."},1)

						player.mapRegistry["assaultroundstart"]=os.time()

						player.mapRegistry["firstshrineunderattack"]=0
						player.mapRegistry["secondshrineunderattack"]=0
						player.mapRegistry["thirdshrineunderattack"]=0
						player.mapRegistry["fourthshrineunderattack"]=0

						player.mapRegistry["firstshrineattacktime"]=0
						player.mapRegistry["secondshrineattacktime"]=0
						player.mapRegistry["thirdshrineattacktime"]=0
						player.mapRegistry["fourthshrineattacktime"]=0

						player.mapRegistry["firstshrinecaptured"]=0
						player.mapRegistry["secondshrinecaptured"]=0
						player.mapRegistry["thirdshrinecaptured"]=0
						player.mapRegistry["fourthshrinecaptured"]=0

						player:broadcast(player.m,"-Host "..player.name.." starts the Assault Round!")
						
						

					return
				elseif(menuOption=="Force ending") then
					if(player.mapRegistry["assaultroundstart"]==0) then
						player:dialogSeq({t,"The round has not been started yet."})
						return
					end

					
					player:dialogSeq({t,"Carnage Host, this tool allows you to force the ending of an Assault round. Please proceed with Extreme Caution."},1)
					player:broadcast(player.m,"-Host "..player.name.." forces a round end!")
					local time=os.time()-player.mapRegistry["assaultroundstart"]
					local timemin=math.floor(time/60)
					local timesec=time-(timemin*60)
					player:broadcast(player.m,"The round ends after "..timemin.." minutes and "..timesec.." seconds.")
					player.mapRegistry["assaultroundstart"]=0
					return
				elseif(menuOption=="Set Offense/Defense") then
					if(player.mapRegistry["assaultroundstart"]>0) then
						player:dialogSeq({t,"A round has already been started. You can only Set Offense and Defense when a round has ended."})
						return
					end
					local choices={}
					table.insert(choices,"Offense: Red, Defense: Black")
					table.insert(choices,"Offense: Black, Defense: Red")

					local choice=player:menuString2("How do you wish to set the Game?",choices)
						if(choice=="Offense: Red, Defense: Black") then
							player.mapRegistry["defenseteamcolor"]=60
							player.mapRegistry["attackteamcolor"]=63
						elseif(choice=="Offense: Black, Defense: Red") then
							player.mapRegistry["defenseteamcolor"]=63
							player.mapRegistry["attackteamcolor"]=60
						end
						
						player:dialogSeq({t,"Your choice is:\n\n"..choice.."\n\nRemember to Send teams to Sidelines before starting the round."})						
						return


				elseif(menuOption=="Send to Sidelines" and player.m==m) then
					if(player.mapRegistry["assaultroundstart"]>0) then
						player:dialogSeq({t,"A round has already been started. You can only Send players to sidelines when a round has ended."})
						return
					end

					player:dialogSeq({t,"Carnage Host, This tool allows you to send players to the sidelines according to your Offense/Defense settings. Please proceed with Caution."},1)
					local players = {}
					for x=0,100 do
						for y=0,100 do
							players=player:getObjectsInCell(m,x,y,BL_PC)
							if(#players>0) then
								for z=1,#players do
									if(players[z].armorColor==player.mapRegistry["defenseteamcolor"]) then
										players[z]:warp(m,math.random(42,57),math.random(0,6))
									elseif(players[z].armorColor==player.mapRegistry["attackteamcolor"]) then
										players[z]:warp(m,math.random(0,30),math.random(91,99))
									end
								end
							end
						end
					end
					

				elseif(menuOption=="Assess time") then
					if(player.mapRegistry["assaultroundstart"]==0) then
						player:dialogSeq({t,"The Round has not started yet."})
						return
					end
					
					local time=os.time()-player.mapRegistry["assaultroundstart"]
					local timemin=math.floor(time/60)
					local timesec=time-(timemin*60)
					player:sendMinitext("The round has started "..timemin.." minutes and "..timesec.." seconds ago.")

				elseif(menuOption=="Reincarnate") then
					if(player.armorColor==player.mapRegistry["defenseteamcolor"]) then
						player:warp(m,math.random(42,57),math.random(0,6))
						player.paralyzed=true
						player:setDuration("domination_res",30000)
						return
					elseif(player.armorColor==player.mapRegistry["attackteamcolor"]) then
						player:warp(m,math.random(0,30),math.random(91,99))
						player.paralyzed=true
						player:setDuration("domination_res",30000)
						return
					else
						player:dialogSeq({t,"Your team is neither on Offense nor on Defense."})
						return
					end


				elseif(menuOption=="Teleportation") then
					if(player.state==1) then
						player:sendMinitext("You need to be alive to use this feature.")
						return
					end
					if(player.registry["assaultport"]>os.time()) then
						player:sendMinitext("You can only use this feature every thirty seconds.")
						return
					end
					if(player.mapRegistry["assaultroundstart"]==0) then
						player:dialogSeq({t,"The Round has not started yet."})
						return
					end

					if(player.armorColor==player.mapRegistry["defenseteamcolor"]) then
						local choices = {}

						if(player.mapRegistry["firstshrinecaptured"]==0) then
							table.insert(choices,"Second Shrine")
						end
						if(player.mapRegistry["secondshrinecaptured"]==0) then
							table.insert(choices,"Third Shrine")
						end
						table.insert(choices,"Sideline")

						local choice=player:menuString2("Where do you wish to be Teleported?",choices)
							if(choice=="Second Shrine") then
								player:warp(m,math.random(6,10),math.random(50,54))
								player:sendMinitext("You have been teleported to the Second Shrine!")
								player.registry["assaultport"]=os.time()+30
							elseif(choice=="Third Shrine") then
								player:warp(m,math.random(20,24),math.random(20,24))
								player:sendMinitext("You have been teleported to the Third Shrine!")
								player.registry["assaultport"]=os.time()+30
							elseif(choice=="Sideline") then
								player:warp(m,math.random(42,57),math.random(0,6))
								player:sendMinitext("You have been teleported to your sideline!")
								player.registry["assaultport"]=os.time()+30
							end
					elseif(player.armorColor==player.mapRegistry["attackteamcolor"]) then
						local choices = {}

						if(player.mapRegistry["thirdshrinecaptured"]==1) then
							table.insert(choices,"Third Shrine")
						end
						if(player.mapRegistry["secondshrinecaptured"]==1) then
							table.insert(choices,"Second Shrine")
						end
						if(player.mapRegistry["firstshrinecaptured"]==1) then
							table.insert(choices,"First Shrine")
						end
						table.insert(choices,"Sideline")

						local choice=player:menuString2("Where do you wish to be Teleported?",choices)
							if(choice=="First Shrine") then
								player:warp(m,math.random(46,50),math.random(64,68))
								player:sendMinitext("You have been teleported to the Second Shrine!")
								player.registry["assaultport"]=os.time()+30
							elseif(choice=="Second Shrine") then
								player:warp(m,math.random(6,10),math.random(50,54))
								player:sendMinitext("You have been teleported to the Second Shrine!")
								player.registry["assaultport"]=os.time()+30
							elseif(choice=="Third Shrine") then
								player:warp(m,math.random(20,24),math.random(20,24))
								player:sendMinitext("You have been teleported to the Third Shrine!")
								player.registry["assaultport"]=os.time()+30
							elseif(choice=="Sideline") then
								player:warp(m,math.random(0,30),math.random(91,99))
								player:sendMinitext("You have been teleported to your sideline!")
								player.registry["assaultport"]=os.time()+30
							end
					else
						player:dialogSeq({t,"Your team is neither on Offense nor on Defense."})
						return
					end

                                elseif(menuOption=="Warps") then
					local choices = {}

					table.insert(choices,"Offense Sideline")
					table.insert(choices,"Defense Sideline")
					table.insert(choices,"First Shrine")
					table.insert(choices,"Second Shrine")
					table.insert(choices,"Third Shrine")
					
					local choice=player:menuString2("Where do you wish to be warped to ?",choices)
						if(choice=="Offense Sideline") then
							player:warp(m,13,87)
						elseif(choice=="Defense Sideline") then
							player:warp(m,39,11)
						elseif(choice=="First Shrine") then
							player:warp(m,41,67)
						elseif(choice=="Second Shrine") then
							player:warp(m,2,47)
						elseif(choice=="Third Shrine") then
							player:warp(m,31,16)
						end
					return

                                elseif(menuOption=="Move participant") then
					local nameofPlayer
					local w=0
					local nuisance = { }
					nameofPlayer=player:input("Who do you need to move within the Arena?")
					for x=0,100 do
						for y=0,100 do
							nuisance=player:getObjectsInCell(player.m,x,y,BL_PC)
							if(#nuisance>0) then
								for z=1,#nuisance do
								 	if(string.lower(nuisance[z].name)==string.lower(nameofPlayer)) then	
										Player(nameofPlayer):warp(2061,20,25)
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
					local choice=player:menu2("Sort Participants :",{"Sort one participant", "Sort all participants"})
					if(choice==1) then
					nameofPlayer=player:input("Who do you wish to sort to the Carnage Hall?")
					for x=0,100 do
						for y=0,100 do
							nuisance=player:getObjectsInCell(player.m,x,y,BL_PC)
							if(#nuisance>0) then
								for z=1,#nuisance do
								 	if(string.lower(nuisance[z].name)==string.lower(nameofPlayer)) then
										Player(nameofPlayer).state=0
										Player(nameofPlayer):updateState()
										Player(nameofPlayer):addHealth(nuisance[z].maxHealth)
										Player(nameofPlayer):warp(2100,24,24)
										player:sendMinitext(""..nameofPlayer.." has been sorted to the Carnage hall.")
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
					elseif(choice==2) then

					player:dialogSeq({t,"You will sort all participants to their respective rows in the Carnage hall, click Next to proceed."},1)
					
					local f=0
					local g=0
					for x=0,100 do
						for y=0,100 do
							nuisance=player:getObjectsInCell(player.m,x,y,BL_PC)
							if(#nuisance>0) then
								for z=1,#nuisance do
									if(nuisance[z].state==1) then											 						nuisance[z]:addHealth(1000000000)
										nuisance[z].state=0
										nuisance[z]:updateState()
									end
										nuisance[z]:addHealth(nuisance[z].maxHealth)
										nuisance[z]:addMana(nuisance[z].maxMagic)
										--nuisance[z]:flushDuration()
								 	if(nuisance[z].armorColor==61) then
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
					end
				elseif(menuOption=="Carnage hall warp") then
						player:warp(2100,24,4)
				elseif(menuOption=="Ressucitate") then
						if(player.armorColor==15) then
							player:addHealth(1000000000)
							player.state=0
							player:updateState()
						else
							player:dialogSeq({t,"You can not use this ability while you play."})
						end
				
                                elseif(menuOption=="Clear barricades") then
					local barcheck = {}
					player:dialogSeq({t,"This tool allows you to remove every barricade on the map instantly. Press next to proceed."},1)
						for x=0,100 do
							for y=0,100 do
								barcheck=player:getObjectsInCell(player.m,x,y,BL_MOB)
								if(#barcheck>0) then
									for z=1,#barcheck do
										if(string.lower(barcheck[z].name)==string.lower("barricade")) then
												barcheck[z].attacker=player.ID
												barcheck[z]:removeHealth(3000000000)
										end
									end
								end
							end
						end
				end
        end)
}

castle_assault_assistant3 = {
	click = async(function(player,npc)
		local f=0
		local g=0
		local t={graphic=convertGraphic(6,"monster"),color=15}
	        local opts = { }
		local m=player.m

                              player.npcGraphic=t.graphic
			      player.npcColor=t.color
			      	if((player.registry["carnagehost"]==1 and player.armorColor==15) or player.registry["carnagehost"]>1) then
                              		table.insert(opts,"Carnage nuisance")
					table.insert(opts,"Sort participants")
					table.insert(opts,"Move participant")
					table.insert(opts,"Carnage hall warp")
					table.insert(opts,"Clear barricades")
					table.insert(opts,"Start round")
					table.insert(opts,"Force ending")
					table.insert(opts,"Set Offense/Defense")
					table.insert(opts,"Send to Sidelines")
					table.insert(opts,"Assess time")
					table.insert(opts,"Warps")
					if(player.state==1) then
						table.insert(opts,"Ressucitate")
					end
			      	end

				table.insert(opts,"Return to hall")
				if(player.state==1) then
					table.insert(opts,"Reincarnate")
				end
				table.insert(opts,"Teleportation")

                                local menuOption=player:menuString("Hello.\n\nHow can I help you?",opts)


                                if(menuOption=="Carnage nuisance") then
					local nameofPlayer
					local w=0
					local nuisance = { }
					nameofPlayer=player:input("Who do you need to remove from the Arena?")
					for x=0,100 do
						for y=0,100 do
							nuisance=player:getObjectsInCell(player.m,x,y,BL_PC)
							if(#nuisance>0) then
								for z=1,#nuisance do
								 	if(string.lower(nuisance[z].name)==string.lower(nameofPlayer)) then
										Player(nameofPlayer):warp(2001,12,7)
										Player(nameofPlayer):sendMinitext("You have been nuisanced by "..player.name)
										player:sendMinitext(""..nameofPlayer.." has been nuisanced")
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
				elseif(menuOption=="Return to hall") then
					player:dialogSeq({t,"Do you want to return to the Carnage hall ? This could handicap your team.\n\nClick Next if you are sure."},1)
					
					player:addHealth(player.maxHealth)
					player:addMana(player.maxMagic)
					--player:flushDuration()
					player.state=0
					player:updateState()
					player:warp(2100,24,24)
					return
				elseif(menuOption=="Start round") then
					if(player.mapRegistry["assaultroundstart"]>0) then
						player:dialogSeq({t,"The round is already started."})
						return
					end
						player:dialogSeq({t,"Carnage Host, This tool allows you to start an Assault Round. Please make sure the Offense and Defense is set accordingly."},1)

						player.mapRegistry["assaultroundstart"]=os.time()

						player.mapRegistry["firstshrineunderattack"]=0
						player.mapRegistry["secondshrineunderattack"]=0
						player.mapRegistry["thirdshrineunderattack"]=0
						player.mapRegistry["fourthshrineunderattack"]=0

						player.mapRegistry["firstshrineattacktime"]=0
						player.mapRegistry["secondshrineattacktime"]=0
						player.mapRegistry["thirdshrineattacktime"]=0
						player.mapRegistry["fourthshrineattacktime"]=0

						player.mapRegistry["firstshrinecaptured"]=0
						player.mapRegistry["secondshrinecaptured"]=0
						player.mapRegistry["thirdshrinecaptured"]=0
						player.mapRegistry["fourthshrinecaptured"]=0

						player:broadcast(player.m,"-Host "..player.name.." starts the Assault Round!")
						
						

					return
				elseif(menuOption=="Force ending") then
					if(player.mapRegistry["assaultroundstart"]==0) then
						player:dialogSeq({t,"The round has not been started yet."})
						return
					end

					
					player:dialogSeq({t,"Carnage Host, this tool allows you to force the ending of an Assault round. Please proceed with Extreme Caution."},1)
					player:broadcast(player.m,"-Host "..player.name.." forces a round end!")
					local time=os.time()-player.mapRegistry["assaultroundstart"]
					local timemin=math.floor(time/60)
					local timesec=time-(timemin*60)
					player:broadcast(player.m,"The round ends after "..timemin.." minutes and "..timesec.." seconds.")
					player.mapRegistry["assaultroundstart"]=0
					return
				elseif(menuOption=="Set Offense/Defense") then
					if(player.mapRegistry["assaultroundstart"]>0) then
						player:dialogSeq({t,"A round has already been started. You can only Set Offense and Defense when a round has ended."})
						return
					end
					local choices={}
					table.insert(choices,"Offense: Red, Defense: Black")
					table.insert(choices,"Offense: Black, Defense: Red")

					local choice=player:menuString2("How do you wish to set the Game?",choices)
						if(choice=="Offense: Red, Defense: Black") then
							player.mapRegistry["defenseteamcolor"]=60
							player.mapRegistry["attackteamcolor"]=63
						elseif(choice=="Offense: Black, Defense: Red") then
							player.mapRegistry["defenseteamcolor"]=63
							player.mapRegistry["attackteamcolor"]=60
						end
						
						player:dialogSeq({t,"Your choice is:\n\n"..choice.."\n\nRemember to Send teams to Sidelines before starting the round."})						
						return


				elseif(menuOption=="Send to Sidelines" and player.m==m) then
					if(player.mapRegistry["assaultroundstart"]>0) then
						player:dialogSeq({t,"A round has already been started. You can only Send players to sidelines when a round has ended."})
						return
					end

					player:dialogSeq({t,"Carnage Host, This tool allows you to send players to the sidelines according to your Offense/Defense settings. Please proceed with Caution."},1)
					local players = {}
					for x=0,100 do
						for y=0,100 do
							players=player:getObjectsInCell(m,x,y,BL_PC)
							if(#players>0) then
								for z=1,#players do
									if(players[z].armorColor==player.mapRegistry["defenseteamcolor"]) then
										players[z]:warp(m,math.random(42,57),math.random(0,6))
									elseif(players[z].armorColor==player.mapRegistry["attackteamcolor"]) then
										players[z]:warp(m,math.random(0,30),math.random(91,99))
									end
								end
							end
						end
					end
					

				elseif(menuOption=="Assess time") then
					if(player.mapRegistry["assaultroundstart"]==0) then
						player:dialogSeq({t,"The Round has not started yet."})
						return
					end
					
					local time=os.time()-player.mapRegistry["assaultroundstart"]
					local timemin=math.floor(time/60)
					local timesec=time-(timemin*60)
					player:sendMinitext("The round has started "..timemin.." minutes and "..timesec.." seconds ago.")

				elseif(menuOption=="Reincarnate") then
					if(player.armorColor==player.mapRegistry["defenseteamcolor"]) then
						player:warp(m,math.random(42,57),math.random(0,6))
						player.paralyzed=true
						player:setDuration("domination_res",30000)
						return
					elseif(player.armorColor==player.mapRegistry["attackteamcolor"]) then
						player:warp(m,math.random(0,30),math.random(91,99))
						player.paralyzed=true
						player:setDuration("domination_res",30000)
						return
					else
						player:dialogSeq({t,"Your team is neither on Offense nor on Defense."})
						return
					end


				elseif(menuOption=="Teleportation") then
					if(player.state==1) then
						player:sendMinitext("You need to be alive to use this feature.")
						return
					end
					if(player.registry["assaultport"]>os.time()) then
						player:sendMinitext("You can only use this feature every thirty seconds.")
						return
					end
					if(player.mapRegistry["assaultroundstart"]==0) then
						player:dialogSeq({t,"The Round has not started yet."})
						return
					end

					if(player.armorColor==player.mapRegistry["defenseteamcolor"]) then
						local choices = {}

						if(player.mapRegistry["firstshrinecaptured"]==0) then
							table.insert(choices,"Second Shrine")
						end
						if(player.mapRegistry["secondshrinecaptured"]==0) then
							table.insert(choices,"Third Shrine")
						end
						table.insert(choices,"Sideline")

						local choice=player:menuString2("Where do you wish to be Teleported?",choices)
							if(choice=="Second Shrine") then
								player:warp(m,math.random(6,10),math.random(50,54))
								player:sendMinitext("You have been teleported to the Second Shrine!")
								player.registry["assaultport"]=os.time()+30
							elseif(choice=="Third Shrine") then
								player:warp(m,math.random(20,24),math.random(20,24))
								player:sendMinitext("You have been teleported to the Third Shrine!")
								player.registry["assaultport"]=os.time()+30
							elseif(choice=="Sideline") then
								player:warp(m,math.random(42,57),math.random(0,6))
								player:sendMinitext("You have been teleported to your sideline!")
								player.registry["assaultport"]=os.time()+30
							end
					elseif(player.armorColor==player.mapRegistry["attackteamcolor"]) then
						local choices = {}

						if(player.mapRegistry["thirdshrinecaptured"]==1) then
							table.insert(choices,"Third Shrine")
						end
						if(player.mapRegistry["secondshrinecaptured"]==1) then
							table.insert(choices,"Second Shrine")
						end
						if(player.mapRegistry["firstshrinecaptured"]==1) then
							table.insert(choices,"First Shrine")
						end
						table.insert(choices,"Sideline")

						local choice=player:menuString2("Where do you wish to be Teleported?",choices)
							if(choice=="First Shrine") then
								player:warp(m,math.random(46,50),math.random(64,68))
								player:sendMinitext("You have been teleported to the Second Shrine!")
								player.registry["assaultport"]=os.time()+30
							elseif(choice=="Second Shrine") then
								player:warp(m,math.random(6,10),math.random(50,54))
								player:sendMinitext("You have been teleported to the Second Shrine!")
								player.registry["assaultport"]=os.time()+30
							elseif(choice=="Third Shrine") then
								player:warp(m,math.random(20,24),math.random(20,24))
								player:sendMinitext("You have been teleported to the Third Shrine!")
								player.registry["assaultport"]=os.time()+30
							elseif(choice=="Sideline") then
								player:warp(m,math.random(0,30),math.random(91,99))
								player:sendMinitext("You have been teleported to your sideline!")
								player.registry["assaultport"]=os.time()+30
							end
					else
						player:dialogSeq({t,"Your team is neither on Offense nor on Defense."})
						return
					end

                                elseif(menuOption=="Warps") then
					local choices = {}

					table.insert(choices,"Offense Sideline")
					table.insert(choices,"Defense Sideline")
					table.insert(choices,"First Shrine")
					table.insert(choices,"Second Shrine")
					table.insert(choices,"Third Shrine")
					
					local choice=player:menuString2("Where do you wish to be warped to ?",choices)
						if(choice=="Offense Sideline") then
							player:warp(m,13,87)
						elseif(choice=="Defense Sideline") then
							player:warp(m,39,11)
						elseif(choice=="First Shrine") then
							player:warp(m,41,67)
						elseif(choice=="Second Shrine") then
							player:warp(m,2,47)
						elseif(choice=="Third Shrine") then
							player:warp(m,31,16)
						end
					return

                                elseif(menuOption=="Move participant") then
					local nameofPlayer
					local w=0
					local nuisance = { }
					nameofPlayer=player:input("Who do you need to move within the Arena?")
					for x=0,100 do
						for y=0,100 do
							nuisance=player:getObjectsInCell(player.m,x,y,BL_PC)
							if(#nuisance>0) then
								for z=1,#nuisance do
								 	if(string.lower(nuisance[z].name)==string.lower(nameofPlayer)) then	
										Player(nameofPlayer):warp(2061,20,25)
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
					local choice=player:menu2("Sort Participants :",{"Sort one participant", "Sort all participants"})
					if(choice==1) then
					nameofPlayer=player:input("Who do you wish to sort to the Carnage Hall?")
					for x=0,100 do
						for y=0,100 do
							nuisance=player:getObjectsInCell(player.m,x,y,BL_PC)
							if(#nuisance>0) then
								for z=1,#nuisance do
								 	if(string.lower(nuisance[z].name)==string.lower(nameofPlayer)) then
										Player(nameofPlayer).state=0
										Player(nameofPlayer):updateState()
										Player(nameofPlayer):addHealth(nuisance[z].maxHealth)
										Player(nameofPlayer):warp(2100,24,24)
										player:sendMinitext(""..nameofPlayer.." has been sorted to the Carnage hall.")
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
					elseif(choice==2) then

					player:dialogSeq({t,"You will sort all participants to their respective rows in the Carnage hall, click Next to proceed."},1)
					
					local f=0
					local g=0
					for x=0,100 do
						for y=0,100 do
							nuisance=player:getObjectsInCell(player.m,x,y,BL_PC)
							if(#nuisance>0) then
								for z=1,#nuisance do
									if(nuisance[z].state==1) then											 						nuisance[z]:addHealth(1000000000)
										nuisance[z].state=0
										nuisance[z]:updateState()
									end
										nuisance[z]:addHealth(nuisance[z].maxHealth)
										nuisance[z]:addMana(nuisance[z].maxMagic)
										--nuisance[z]:flushDuration()
								 	if(nuisance[z].armorColor==61) then
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
					end
				elseif(menuOption=="Carnage hall warp") then
						player:warp(2100,24,4)
				elseif(menuOption=="Ressucitate") then
						if(player.armorColor==15) then
							player:addHealth(1000000000)
							player.state=0
							player:updateState()
						else
							player:dialogSeq({t,"You can not use this ability while you play."})
						end
				
                                elseif(menuOption=="Clear barricades") then
					local barcheck = {}
					player:dialogSeq({t,"This tool allows you to remove every barricade on the map instantly. Press next to proceed."},1)
						for x=0,100 do
							for y=0,100 do
								barcheck=player:getObjectsInCell(player.m,x,y,BL_MOB)
								if(#barcheck>0) then
									for z=1,#barcheck do
										if(string.lower(barcheck[z].name)==string.lower("barricade")) then
												barcheck[z].attacker=player.ID
												barcheck[z]:removeHealth(3000000000)
										end
									end
								end
							end
						end
				end
        end)
}




castle_assault_assistant4 = {
	click = async(function(player,npc)
		local f=0
		local g=0
		local t={graphic=convertGraphic(6,"monster"),color=15}
	        local opts = { }
		local m=player.m

                              player.npcGraphic=t.graphic
			      player.npcColor=t.color
			      	if((player.registry["carnagehost"]==1 and player.armorColor==15) or player.registry["carnagehost"]>1) then
                              		table.insert(opts,"Carnage nuisance")
					table.insert(opts,"Sort participants")
					table.insert(opts,"Move participant")
					table.insert(opts,"Carnage hall warp")
					table.insert(opts,"Clear barricades")
					table.insert(opts,"Start round")
					table.insert(opts,"Force ending")
					table.insert(opts,"Set Offense/Defense")
					table.insert(opts,"Send to Sidelines")
					table.insert(opts,"Assess time")
					table.insert(opts,"Warps")
					if(player.state==1) then
						table.insert(opts,"Ressucitate")
					end
			      	end

				table.insert(opts,"Return to hall")
				if(player.state==1) then
					table.insert(opts,"Reincarnate")
				end
				table.insert(opts,"Teleportation")

                                local menuOption=player:menuString("Hello.\n\nHow can I help you?",opts)


                                if(menuOption=="Carnage nuisance") then
					local nameofPlayer
					local w=0
					local nuisance = { }
					nameofPlayer=player:input("Who do you need to remove from the Arena?")
					for x=0,100 do
						for y=0,100 do
							nuisance=player:getObjectsInCell(player.m,x,y,BL_PC)
							if(#nuisance>0) then
								for z=1,#nuisance do
								 	if(string.lower(nuisance[z].name)==string.lower(nameofPlayer)) then
										Player(nameofPlayer):warp(2001,12,7)
										Player(nameofPlayer):sendMinitext("You have been nuisanced by "..player.name)
										player:sendMinitext(""..nameofPlayer.." has been nuisanced")
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
				elseif(menuOption=="Return to hall") then
					player:dialogSeq({t,"Do you want to return to the Carnage hall ? This could handicap your team.\n\nClick Next if you are sure."},1)
					
					player:addHealth(player.maxHealth)
					player:addMana(player.maxMagic)
					--player:flushDuration()
					player.state=0
					player:updateState()
					player:warp(2100,24,24)
					return
				elseif(menuOption=="Start round") then
					if(player.mapRegistry["assaultroundstart"]>0) then
						player:dialogSeq({t,"The round is already started."})
						return
					end
						player:dialogSeq({t,"Carnage Host, This tool allows you to start an Assault Round. Please make sure the Offense and Defense is set accordingly."},1)

						player.mapRegistry["assaultroundstart"]=os.time()

						player.mapRegistry["firstshrineunderattack"]=0
						player.mapRegistry["secondshrineunderattack"]=0
						player.mapRegistry["thirdshrineunderattack"]=0
						player.mapRegistry["fourthshrineunderattack"]=0

						player.mapRegistry["firstshrineattacktime"]=0
						player.mapRegistry["secondshrineattacktime"]=0
						player.mapRegistry["thirdshrineattacktime"]=0
						player.mapRegistry["fourthshrineattacktime"]=0

						player.mapRegistry["firstshrinecaptured"]=0
						player.mapRegistry["secondshrinecaptured"]=0
						player.mapRegistry["thirdshrinecaptured"]=0
						player.mapRegistry["fourthshrinecaptured"]=0

						player:broadcast(player.m,"-Host "..player.name.." starts the Assault Round!")
						
						

					return
				elseif(menuOption=="Force ending") then
					if(player.mapRegistry["assaultroundstart"]==0) then
						player:dialogSeq({t,"The round has not been started yet."})
						return
					end

					
					player:dialogSeq({t,"Carnage Host, this tool allows you to force the ending of an Assault round. Please proceed with Extreme Caution."},1)
					player:broadcast(player.m,"-Host "..player.name.." forces a round end!")
					local time=os.time()-player.mapRegistry["assaultroundstart"]
					local timemin=math.floor(time/60)
					local timesec=time-(timemin*60)
					player:broadcast(player.m,"The round ends after "..timemin.." minutes and "..timesec.." seconds.")
					player.mapRegistry["assaultroundstart"]=0
					return
				elseif(menuOption=="Set Offense/Defense") then
					if(player.mapRegistry["assaultroundstart"]>0) then
						player:dialogSeq({t,"A round has already been started. You can only Set Offense and Defense when a round has ended."})
						return
					end
					local choices={}
					table.insert(choices,"Offense: Red, Defense: Black")
					table.insert(choices,"Offense: Black, Defense: Red")

					local choice=player:menuString2("How do you wish to set the Game?",choices)
						if(choice=="Offense: Red, Defense: Black") then
							player.mapRegistry["defenseteamcolor"]=60
							player.mapRegistry["attackteamcolor"]=63
						elseif(choice=="Offense: Black, Defense: Red") then
							player.mapRegistry["defenseteamcolor"]=63
							player.mapRegistry["attackteamcolor"]=60
						end
						
						player:dialogSeq({t,"Your choice is:\n\n"..choice.."\n\nRemember to Send teams to Sidelines before starting the round."})						
						return


				elseif(menuOption=="Send to Sidelines" and player.m==m) then
					if(player.mapRegistry["assaultroundstart"]>0) then
						player:dialogSeq({t,"A round has already been started. You can only Send players to sidelines when a round has ended."})
						return
					end

					player:dialogSeq({t,"Carnage Host, This tool allows you to send players to the sidelines according to your Offense/Defense settings. Please proceed with Caution."},1)
					local players = {}
					for x=0,100 do
						for y=0,100 do
							players=player:getObjectsInCell(m,x,y,BL_PC)
							if(#players>0) then
								for z=1,#players do
									if(players[z].armorColor==player.mapRegistry["defenseteamcolor"]) then
										players[z]:warp(m,math.random(42,57),math.random(0,6))
									elseif(players[z].armorColor==player.mapRegistry["attackteamcolor"]) then
										players[z]:warp(m,math.random(0,30),math.random(91,99))
									end
								end
							end
						end
					end
					

				elseif(menuOption=="Assess time") then
					if(player.mapRegistry["assaultroundstart"]==0) then
						player:dialogSeq({t,"The Round has not started yet."})
						return
					end
					
					local time=os.time()-player.mapRegistry["assaultroundstart"]
					local timemin=math.floor(time/60)
					local timesec=time-(timemin*60)
					player:sendMinitext("The round has started "..timemin.." minutes and "..timesec.." seconds ago.")

				elseif(menuOption=="Reincarnate") then
					if(player.armorColor==player.mapRegistry["defenseteamcolor"]) then
						player:warp(m,math.random(42,57),math.random(0,6))
						player.paralyzed=true
						player:setDuration("domination_res",30000)
						return
					elseif(player.armorColor==player.mapRegistry["attackteamcolor"]) then
						player:warp(m,math.random(0,30),math.random(91,99))
						player.paralyzed=true
						player:setDuration("domination_res",30000)
						return
					else
						player:dialogSeq({t,"Your team is neither on Offense nor on Defense."})
						return
					end


				elseif(menuOption=="Teleportation") then
					if(player.state==1) then
						player:sendMinitext("You need to be alive to use this feature.")
						return
					end
					if(player.registry["assaultport"]>os.time()) then
						player:sendMinitext("You can only use this feature every thirty seconds.")
						return
					end
					if(player.mapRegistry["assaultroundstart"]==0) then
						player:dialogSeq({t,"The Round has not started yet."})
						return
					end

					if(player.armorColor==player.mapRegistry["defenseteamcolor"]) then
						local choices = {}

						if(player.mapRegistry["firstshrinecaptured"]==0) then
							table.insert(choices,"Second Shrine")
						end
						if(player.mapRegistry["secondshrinecaptured"]==0) then
							table.insert(choices,"Third Shrine")
						end
						table.insert(choices,"Sideline")

						local choice=player:menuString2("Where do you wish to be Teleported?",choices)
							if(choice=="Second Shrine") then
								player:warp(m,math.random(6,10),math.random(50,54))
								player:sendMinitext("You have been teleported to the Second Shrine!")
								player.registry["assaultport"]=os.time()+30
							elseif(choice=="Third Shrine") then
								player:warp(m,math.random(20,24),math.random(20,24))
								player:sendMinitext("You have been teleported to the Third Shrine!")
								player.registry["assaultport"]=os.time()+30
							elseif(choice=="Sideline") then
								player:warp(m,math.random(42,57),math.random(0,6))
								player:sendMinitext("You have been teleported to your sideline!")
								player.registry["assaultport"]=os.time()+30
							end
					elseif(player.armorColor==player.mapRegistry["attackteamcolor"]) then
						local choices = {}

						if(player.mapRegistry["thirdshrinecaptured"]==1) then
							table.insert(choices,"Third Shrine")
						end
						if(player.mapRegistry["secondshrinecaptured"]==1) then
							table.insert(choices,"Second Shrine")
						end
						if(player.mapRegistry["firstshrinecaptured"]==1) then
							table.insert(choices,"First Shrine")
						end
						table.insert(choices,"Sideline")

						local choice=player:menuString2("Where do you wish to be Teleported?",choices)
							if(choice=="First Shrine") then
								player:warp(m,math.random(46,50),math.random(64,68))
								player:sendMinitext("You have been teleported to the Second Shrine!")
								player.registry["assaultport"]=os.time()+30
							elseif(choice=="Second Shrine") then
								player:warp(m,math.random(6,10),math.random(50,54))
								player:sendMinitext("You have been teleported to the Second Shrine!")
								player.registry["assaultport"]=os.time()+30
							elseif(choice=="Third Shrine") then
								player:warp(m,math.random(20,24),math.random(20,24))
								player:sendMinitext("You have been teleported to the Third Shrine!")
								player.registry["assaultport"]=os.time()+30
							elseif(choice=="Sideline") then
								player:warp(m,math.random(0,30),math.random(91,99))
								player:sendMinitext("You have been teleported to your sideline!")
								player.registry["assaultport"]=os.time()+30
							end
					else
						player:dialogSeq({t,"Your team is neither on Offense nor on Defense."})
						return
					end

                                elseif(menuOption=="Warps") then
					local choices = {}

					table.insert(choices,"Offense Sideline")
					table.insert(choices,"Defense Sideline")
					table.insert(choices,"First Shrine")
					table.insert(choices,"Second Shrine")
					table.insert(choices,"Third Shrine")
					
					local choice=player:menuString2("Where do you wish to be warped to ?",choices)
						if(choice=="Offense Sideline") then
							player:warp(m,13,87)
						elseif(choice=="Defense Sideline") then
							player:warp(m,39,11)
						elseif(choice=="First Shrine") then
							player:warp(m,41,67)
						elseif(choice=="Second Shrine") then
							player:warp(m,2,47)
						elseif(choice=="Third Shrine") then
							player:warp(m,31,16)
						end
					return

                                elseif(menuOption=="Move participant") then
					local nameofPlayer
					local w=0
					local nuisance = { }
					nameofPlayer=player:input("Who do you need to move within the Arena?")
					for x=0,100 do
						for y=0,100 do
							nuisance=player:getObjectsInCell(player.m,x,y,BL_PC)
							if(#nuisance>0) then
								for z=1,#nuisance do
								 	if(string.lower(nuisance[z].name)==string.lower(nameofPlayer)) then	
										Player(nameofPlayer):warp(2061,20,25)
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
					local choice=player:menu2("Sort Participants :",{"Sort one participant", "Sort all participants"})
					if(choice==1) then
					nameofPlayer=player:input("Who do you wish to sort to the Carnage Hall?")
					for x=0,100 do
						for y=0,100 do
							nuisance=player:getObjectsInCell(player.m,x,y,BL_PC)
							if(#nuisance>0) then
								for z=1,#nuisance do
								 	if(string.lower(nuisance[z].name)==string.lower(nameofPlayer)) then
										Player(nameofPlayer).state=0
										Player(nameofPlayer):updateState()
										Player(nameofPlayer):addHealth(nuisance[z].maxHealth)
										Player(nameofPlayer):warp(2100,24,24)
										player:sendMinitext(""..nameofPlayer.." has been sorted to the Carnage hall.")
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
					elseif(choice==2) then

					player:dialogSeq({t,"You will sort all participants to their respective rows in the Carnage hall, click Next to proceed."},1)
					
					local f=0
					local g=0
					for x=0,100 do
						for y=0,100 do
							nuisance=player:getObjectsInCell(player.m,x,y,BL_PC)
							if(#nuisance>0) then
								for z=1,#nuisance do
									if(nuisance[z].state==1) then											 						nuisance[z]:addHealth(1000000000)
										nuisance[z].state=0
										nuisance[z]:updateState()
									end
										nuisance[z]:addHealth(nuisance[z].maxHealth)
										nuisance[z]:addMana(nuisance[z].maxMagic)
										--nuisance[z]:flushDuration()
								 	if(nuisance[z].armorColor==61) then
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
					end
				elseif(menuOption=="Carnage hall warp") then
						player:warp(2100,24,4)
				elseif(menuOption=="Ressucitate") then
						if(player.armorColor==15) then
							player:addHealth(1000000000)
							player.state=0
							player:updateState()
						else
							player:dialogSeq({t,"You can not use this ability while you play."})
						end
				
                                elseif(menuOption=="Clear barricades") then
					local barcheck = {}
					player:dialogSeq({t,"This tool allows you to remove every barricade on the map instantly. Press next to proceed."},1)
						for x=0,100 do
							for y=0,100 do
								barcheck=player:getObjectsInCell(player.m,x,y,BL_MOB)
								if(#barcheck>0) then
									for z=1,#barcheck do
										if(string.lower(barcheck[z].name)==string.lower("barricade")) then
												barcheck[z].attacker=player.ID
												barcheck[z]:removeHealth(3000000000)
										end
									end
								end
							end
						end
				end
        end)
}



castle_assault_assistant5 = {
	click = async(function(player,npc)
		local f=0
		local g=0
		local t={graphic=convertGraphic(6,"monster"),color=15}
	        local opts = { }
		local m=player.m

                              player.npcGraphic=t.graphic
			      player.npcColor=t.color
			      	if((player.registry["carnagehost"]==1 and player.armorColor==15) or player.registry["carnagehost"]>1) then
                              		table.insert(opts,"Carnage nuisance")
					table.insert(opts,"Sort participants")
					table.insert(opts,"Move participant")
					table.insert(opts,"Carnage hall warp")
					table.insert(opts,"Clear barricades")
					table.insert(opts,"Start round")
					table.insert(opts,"Force ending")
					table.insert(opts,"Set Offense/Defense")
					table.insert(opts,"Send to Sidelines")
					table.insert(opts,"Assess time")
					table.insert(opts,"Warps")
					if(player.state==1) then
						table.insert(opts,"Ressucitate")
					end
			      	end

				table.insert(opts,"Return to hall")
				if(player.state==1) then
					table.insert(opts,"Reincarnate")
				end
				table.insert(opts,"Teleportation")

                                local menuOption=player:menuString("Hello.\n\nHow can I help you?",opts)


                                if(menuOption=="Carnage nuisance") then
					local nameofPlayer
					local w=0
					local nuisance = { }
					nameofPlayer=player:input("Who do you need to remove from the Arena?")
					for x=0,100 do
						for y=0,100 do
							nuisance=player:getObjectsInCell(player.m,x,y,BL_PC)
							if(#nuisance>0) then
								for z=1,#nuisance do
								 	if(string.lower(nuisance[z].name)==string.lower(nameofPlayer)) then
										Player(nameofPlayer):warp(2001,12,7)
										Player(nameofPlayer):sendMinitext("You have been nuisanced by "..player.name)
										player:sendMinitext(""..nameofPlayer.." has been nuisanced")
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
				elseif(menuOption=="Return to hall") then
					player:dialogSeq({t,"Do you want to return to the Carnage hall ? This could handicap your team.\n\nClick Next if you are sure."},1)
					
					player:addHealth(player.maxHealth)
					player:addMana(player.maxMagic)
					--player:flushDuration()
					player.state=0
					player:updateState()
					player:warp(2100,24,24)
					return
				elseif(menuOption=="Start round") then
					if(player.mapRegistry["assaultroundstart"]>0) then
						player:dialogSeq({t,"The round is already started."})
						return
					end
						player:dialogSeq({t,"Carnage Host, This tool allows you to start an Assault Round. Please make sure the Offense and Defense is set accordingly."},1)

						player.mapRegistry["assaultroundstart"]=os.time()

						player.mapRegistry["firstshrineunderattack"]=0
						player.mapRegistry["secondshrineunderattack"]=0
						player.mapRegistry["thirdshrineunderattack"]=0
						player.mapRegistry["fourthshrineunderattack"]=0

						player.mapRegistry["firstshrineattacktime"]=0
						player.mapRegistry["secondshrineattacktime"]=0
						player.mapRegistry["thirdshrineattacktime"]=0
						player.mapRegistry["fourthshrineattacktime"]=0

						player.mapRegistry["firstshrinecaptured"]=0
						player.mapRegistry["secondshrinecaptured"]=0
						player.mapRegistry["thirdshrinecaptured"]=0
						player.mapRegistry["fourthshrinecaptured"]=0

						player:broadcast(player.m,"-Host "..player.name.." starts the Assault Round!")
						
						

					return
				elseif(menuOption=="Force ending") then
					if(player.mapRegistry["assaultroundstart"]==0) then
						player:dialogSeq({t,"The round has not been started yet."})
						return
					end

					
					player:dialogSeq({t,"Carnage Host, this tool allows you to force the ending of an Assault round. Please proceed with Extreme Caution."},1)
					player:broadcast(player.m,"-Host "..player.name.." forces a round end!")
					local time=os.time()-player.mapRegistry["assaultroundstart"]
					local timemin=math.floor(time/60)
					local timesec=time-(timemin*60)
					player:broadcast(player.m,"The round ends after "..timemin.." minutes and "..timesec.." seconds.")
					player.mapRegistry["assaultroundstart"]=0
					return
				elseif(menuOption=="Set Offense/Defense") then
					if(player.mapRegistry["assaultroundstart"]>0) then
						player:dialogSeq({t,"A round has already been started. You can only Set Offense and Defense when a round has ended."})
						return
					end
					local choices={}
					table.insert(choices,"Offense: Red, Defense: Black")
					table.insert(choices,"Offense: Black, Defense: Red")

					local choice=player:menuString2("How do you wish to set the Game?",choices)
						if(choice=="Offense: Red, Defense: Black") then
							player.mapRegistry["defenseteamcolor"]=60
							player.mapRegistry["attackteamcolor"]=63
						elseif(choice=="Offense: Black, Defense: Red") then
							player.mapRegistry["defenseteamcolor"]=63
							player.mapRegistry["attackteamcolor"]=60
						end
						
						player:dialogSeq({t,"Your choice is:\n\n"..choice.."\n\nRemember to Send teams to Sidelines before starting the round."})						
						return


				elseif(menuOption=="Send to Sidelines" and player.m==m) then
					if(player.mapRegistry["assaultroundstart"]>0) then
						player:dialogSeq({t,"A round has already been started. You can only Send players to sidelines when a round has ended."})
						return
					end

					player:dialogSeq({t,"Carnage Host, This tool allows you to send players to the sidelines according to your Offense/Defense settings. Please proceed with Caution."},1)
					local players = {}
					for x=0,100 do
						for y=0,100 do
							players=player:getObjectsInCell(m,x,y,BL_PC)
							if(#players>0) then
								for z=1,#players do
									if(players[z].armorColor==player.mapRegistry["defenseteamcolor"]) then
										players[z]:warp(m,math.random(42,57),math.random(0,6))
									elseif(players[z].armorColor==player.mapRegistry["attackteamcolor"]) then
										players[z]:warp(m,math.random(0,30),math.random(91,99))
									end
								end
							end
						end
					end
					

				elseif(menuOption=="Assess time") then
					if(player.mapRegistry["assaultroundstart"]==0) then
						player:dialogSeq({t,"The Round has not started yet."})
						return
					end
					
					local time=os.time()-player.mapRegistry["assaultroundstart"]
					local timemin=math.floor(time/60)
					local timesec=time-(timemin*60)
					player:sendMinitext("The round has started "..timemin.." minutes and "..timesec.." seconds ago.")

				elseif(menuOption=="Reincarnate") then
					if(player.armorColor==player.mapRegistry["defenseteamcolor"]) then
						player:warp(m,math.random(42,57),math.random(0,6))
						player.paralyzed=true
						player:setDuration("domination_res",30000)
						return
					elseif(player.armorColor==player.mapRegistry["attackteamcolor"]) then
						player:warp(m,math.random(0,30),math.random(91,99))
						player.paralyzed=true
						player:setDuration("domination_res",30000)
						return
					else
						player:dialogSeq({t,"Your team is neither on Offense nor on Defense."})
						return
					end


				elseif(menuOption=="Teleportation") then
					if(player.state==1) then
						player:sendMinitext("You need to be alive to use this feature.")
						return
					end
					if(player.registry["assaultport"]>os.time()) then
						player:sendMinitext("You can only use this feature every thirty seconds.")
						return
					end
					if(player.mapRegistry["assaultroundstart"]==0) then
						player:dialogSeq({t,"The Round has not started yet."})
						return
					end

					if(player.armorColor==player.mapRegistry["defenseteamcolor"]) then
						local choices = {}

						if(player.mapRegistry["firstshrinecaptured"]==0) then
							table.insert(choices,"Second Shrine")
						end
						if(player.mapRegistry["secondshrinecaptured"]==0) then
							table.insert(choices,"Third Shrine")
						end
						table.insert(choices,"Sideline")

						local choice=player:menuString2("Where do you wish to be Teleported?",choices)
							if(choice=="Second Shrine") then
								player:warp(m,math.random(6,10),math.random(50,54))
								player:sendMinitext("You have been teleported to the Second Shrine!")
								player.registry["assaultport"]=os.time()+30
							elseif(choice=="Third Shrine") then
								player:warp(m,math.random(20,24),math.random(20,24))
								player:sendMinitext("You have been teleported to the Third Shrine!")
								player.registry["assaultport"]=os.time()+30
							elseif(choice=="Sideline") then
								player:warp(m,math.random(42,57),math.random(0,6))
								player:sendMinitext("You have been teleported to your sideline!")
								player.registry["assaultport"]=os.time()+30
							end
					elseif(player.armorColor==player.mapRegistry["attackteamcolor"]) then
						local choices = {}

						if(player.mapRegistry["thirdshrinecaptured"]==1) then
							table.insert(choices,"Third Shrine")
						end
						if(player.mapRegistry["secondshrinecaptured"]==1) then
							table.insert(choices,"Second Shrine")
						end
						if(player.mapRegistry["firstshrinecaptured"]==1) then
							table.insert(choices,"First Shrine")
						end
						table.insert(choices,"Sideline")

						local choice=player:menuString2("Where do you wish to be Teleported?",choices)
							if(choice=="First Shrine") then
								player:warp(m,math.random(46,50),math.random(64,68))
								player:sendMinitext("You have been teleported to the Second Shrine!")
								player.registry["assaultport"]=os.time()+30
							elseif(choice=="Second Shrine") then
								player:warp(m,math.random(6,10),math.random(50,54))
								player:sendMinitext("You have been teleported to the Second Shrine!")
								player.registry["assaultport"]=os.time()+30
							elseif(choice=="Third Shrine") then
								player:warp(m,math.random(20,24),math.random(20,24))
								player:sendMinitext("You have been teleported to the Third Shrine!")
								player.registry["assaultport"]=os.time()+30
							elseif(choice=="Sideline") then
								player:warp(m,math.random(0,30),math.random(91,99))
								player:sendMinitext("You have been teleported to your sideline!")
								player.registry["assaultport"]=os.time()+30
							end
					else
						player:dialogSeq({t,"Your team is neither on Offense nor on Defense."})
						return
					end

                                elseif(menuOption=="Warps") then
					local choices = {}

					table.insert(choices,"Offense Sideline")
					table.insert(choices,"Defense Sideline")
					table.insert(choices,"First Shrine")
					table.insert(choices,"Second Shrine")
					table.insert(choices,"Third Shrine")
					
					local choice=player:menuString2("Where do you wish to be warped to ?",choices)
						if(choice=="Offense Sideline") then
							player:warp(m,13,87)
						elseif(choice=="Defense Sideline") then
							player:warp(m,39,11)
						elseif(choice=="First Shrine") then
							player:warp(m,41,67)
						elseif(choice=="Second Shrine") then
							player:warp(m,2,47)
						elseif(choice=="Third Shrine") then
							player:warp(m,31,16)
						end
					return

                                elseif(menuOption=="Move participant") then
					local nameofPlayer
					local w=0
					local nuisance = { }
					nameofPlayer=player:input("Who do you need to move within the Arena?")
					for x=0,100 do
						for y=0,100 do
							nuisance=player:getObjectsInCell(player.m,x,y,BL_PC)
							if(#nuisance>0) then
								for z=1,#nuisance do
								 	if(string.lower(nuisance[z].name)==string.lower(nameofPlayer)) then	
										Player(nameofPlayer):warp(2061,20,25)
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
					local choice=player:menu2("Sort Participants :",{"Sort one participant", "Sort all participants"})
					if(choice==1) then
					nameofPlayer=player:input("Who do you wish to sort to the Carnage Hall?")
					for x=0,100 do
						for y=0,100 do
							nuisance=player:getObjectsInCell(player.m,x,y,BL_PC)
							if(#nuisance>0) then
								for z=1,#nuisance do
								 	if(string.lower(nuisance[z].name)==string.lower(nameofPlayer)) then
										Player(nameofPlayer).state=0
										Player(nameofPlayer):updateState()
										Player(nameofPlayer):addHealth(nuisance[z].maxHealth)
										Player(nameofPlayer):warp(2100,24,24)
										player:sendMinitext(""..nameofPlayer.." has been sorted to the Carnage hall.")
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
					elseif(choice==2) then

					player:dialogSeq({t,"You will sort all participants to their respective rows in the Carnage hall, click Next to proceed."},1)
					
					local f=0
					local g=0
					for x=0,100 do
						for y=0,100 do
							nuisance=player:getObjectsInCell(player.m,x,y,BL_PC)
							if(#nuisance>0) then
								for z=1,#nuisance do
									if(nuisance[z].state==1) then											 						nuisance[z]:addHealth(1000000000)
										nuisance[z].state=0
										nuisance[z]:updateState()
									end
										nuisance[z]:addHealth(nuisance[z].maxHealth)
										nuisance[z]:addMana(nuisance[z].maxMagic)
										--nuisance[z]:flushDuration()
								 	if(nuisance[z].armorColor==61) then
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
					end
				elseif(menuOption=="Carnage hall warp") then
						player:warp(2100,24,4)
				elseif(menuOption=="Ressucitate") then
						if(player.armorColor==15) then
							player:addHealth(1000000000)
							player.state=0
							player:updateState()
						else
							player:dialogSeq({t,"You can not use this ability while you play."})
						end
				
                                elseif(menuOption=="Clear barricades") then
					local barcheck = {}
					player:dialogSeq({t,"This tool allows you to remove every barricade on the map instantly. Press next to proceed."},1)
						for x=0,100 do
							for y=0,100 do
								barcheck=player:getObjectsInCell(player.m,x,y,BL_MOB)
								if(#barcheck>0) then
									for z=1,#barcheck do
										if(string.lower(barcheck[z].name)==string.lower("barricade")) then
												barcheck[z].attacker=player.ID
												barcheck[z]:removeHealth(3000000000)
										end
									end
								end
							end
						end
				end
        end)
}