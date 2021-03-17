althar_cattle1 = {
	click = async(function(player,npc)
		local f=0
		local g=0
		local t={graphic=convertGraphic(8,"monster"),color=0}
	        local opts = { }

                              player.npcGraphic=t.graphic
			      player.npcColor=t.color
			      	if((player.registry["carnagehost"]==1 and player.armorColor==15) or player.registry["carnagehost"]>1) then
                              		table.insert(opts,"Carnage nuisance")
					table.insert(opts,"Sort participants")
					table.insert(opts,"Move participant")
					table.insert(opts,"Carnage hall warp")
					table.insert(opts,"Check Participants status")
					table.insert(opts,"Clear barricades")
					if(player.state==1) then
						table.insert(opts,"Ressucitate")
					end
			      	end
				if(#opts==0) then

					player:dialogSeq({t,"Do you want to return to the Carnage hall ? This could handicap your team.\n\nClick Next if you are sure."},1)
					
					player:addHealth(player.maxHealth)
					player:addMana(player.maxMagic)
					--player:flushDuration()
						for x=1,600 do
							if(player:hasDuration(x)) then
								player:setDuration(x,0)
							end
						end
					player.state=0
					player:updateState()
					player:warp(2100,24,24)
					return
				else

                              

                                  local menuOption=player:menuString("Hello, Carnage Host.\n\nHow can I help you?",opts)


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
										Player(nameofPlayer):warp(2005,19,16)
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
										for x=1,600 do
											if(player:hasDuration(x)) then
												player:setDuration(x,0)
											end
										end
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
				
                                elseif(menuOption=="Check Participants status") then
				    if(player.registry["checkaliveparticipants"]+5<=os.time()) then
					player.registry["checkaliveparticipants"]=os.time()
					local black=0
					local white=0
					local red=0
					local blue=0
					local nuisance = { }
					for x=0,100 do
						for y=0,100 do
							nuisance=player:getObjectsInCell(player.m,x,y,BL_PC)
							if(#nuisance>0) then
								for z=1,#nuisance do
								 	if(nuisance[z].armorColor==60 and nuisance[z].state~=1) then	
										black=black+1
									elseif(nuisance[z].armorColor==61 and nuisance[z].state~=1) then
										white=white+1
									elseif(nuisance[z].armorColor==63 and nuisance[z].state~=1) then
										red=red+1
									elseif(nuisance[z].armorColor==65 and nuisance[z].state~=1) then
										blue=blue+1
									end
								end
							end		
						end
					end
					player:dialogSeq({t,"The following number of players are alive:\n\nBlack: "..black.."\nWhite: "..white.."\nRed  : "..red.."\nBlue : "..blue.."\n"})
				   else
					player:dialogSeq({t,"You can only check participants every 5 seconds."})
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
			end
        end)
}












althar_cattle2 = {
	click = async(function(player,npc)
		local f=0
		local g=0
		local t={graphic=convertGraphic(8,"monster"),color=0}
	        local opts = { }

                              player.npcGraphic=t.graphic
			      player.npcColor=t.color
			      	if((player.registry["carnagehost"]==1 and player.armorColor==15) or player.registry["carnagehost"]>1) then
                              		table.insert(opts,"Carnage nuisance")
					table.insert(opts,"Sort participants")
					table.insert(opts,"Move participant")
					table.insert(opts,"Carnage hall warp")
					table.insert(opts,"Check Participants status")
					table.insert(opts,"Clear barricades")
					if(player.state==1) then
						table.insert(opts,"Ressucitate")
					end
			      	end
				if(#opts==0) then

					player:dialogSeq({t,"Do you want to return to the Carnage hall ? This could handicap your team.\n\nClick Next if you are sure."},1)
					
					player:addHealth(player.maxHealth)
					player:addMana(player.maxMagic)
					--player:flushDuration()
					for x=1,600 do
						if(player:hasDuration(x)) then
							player:setDuration(x,0)
						end
					end
					player.state=0
					player:updateState()
					player:warp(2100,24,24)
					return
				else

                              

                                  local menuOption=player:menuString("Hello, Carnage Host.\n\nHow can I help you?",opts)


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
										Player(nameofPlayer):warp(2005,19,16)
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
										for x=1,600 do
											if(player:hasDuration(x)) then
												player:setDuration(x,0)
											end
										end
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
				
                                elseif(menuOption=="Check Participants status") then
				    if(player.registry["checkaliveparticipants"]+5<=os.time()) then
					player.registry["checkaliveparticipants"]=os.time()
					local black=0
					local white=0
					local red=0
					local blue=0
					local nuisance = { }
					for x=0,100 do
						for y=0,100 do
							nuisance=player:getObjectsInCell(player.m,x,y,BL_PC)
							if(#nuisance>0) then
								for z=1,#nuisance do
								 	if(nuisance[z].armorColor==60 and nuisance[z].state~=1) then	
										black=black+1
									elseif(nuisance[z].armorColor==61 and nuisance[z].state~=1) then
										white=white+1
									elseif(nuisance[z].armorColor==63 and nuisance[z].state~=1) then
										red=red+1
									elseif(nuisance[z].armorColor==65 and nuisance[z].state~=1) then
										blue=blue+1
									end
								end
							end		
						end
					end
					player:dialogSeq({t,"The following number of players are alive:\n\nBlack: "..black.."\nWhite: "..white.."\nRed  : "..red.."\nBlue : "..blue.."\n"})
				   else
					player:dialogSeq({t,"You can only check participants every 5 seconds."})
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
			end
        end)
}













althar_cattle3 = {
	click = async(function(player,npc)
		local f=0
		local g=0
		local t={graphic=convertGraphic(8,"monster"),color=0}
	        local opts = { }

                              player.npcGraphic=t.graphic
			      player.npcColor=t.color
			      	if((player.registry["carnagehost"]==1 and player.armorColor==15) or player.registry["carnagehost"]>1) then
                              		table.insert(opts,"Carnage nuisance")
					table.insert(opts,"Sort participants")
					table.insert(opts,"Move participant")
					table.insert(opts,"Carnage hall warp")
					table.insert(opts,"Check Participants status")
					table.insert(opts,"Clear barricades")
					if(player.state==1) then
						table.insert(opts,"Ressucitate")
					end
			      	end
				if(#opts==0) then

					player:dialogSeq({t,"Do you want to return to the Carnage hall ? This could handicap your team.\n\nClick Next if you are sure."},1)
					
					player:addHealth(player.maxHealth)
					player:addMana(player.maxMagic)
					--player:flushDuration()
					for x=1,600 do
						if(player:hasDuration(x)) then
							player:setDuration(x,0)
						end
					end
					player.state=0
					player:updateState()
					player:warp(2100,24,24)
					return
				else

                              

                                  local menuOption=player:menuString("Hello, Carnage Host.\n\nHow can I help you?",opts)


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
										Player(nameofPlayer):warp(2005,19,16)
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
										for x=1,600 do
											if(player:hasDuration(x)) then
												player:setDuration(x,0)
											end
										end
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
				
                                elseif(menuOption=="Check Participants status") then
				    if(player.registry["checkaliveparticipants"]+5<=os.time()) then
					player.registry["checkaliveparticipants"]=os.time()
					local black=0
					local white=0
					local red=0
					local blue=0
					local nuisance = { }
					for x=0,100 do
						for y=0,100 do
							nuisance=player:getObjectsInCell(player.m,x,y,BL_PC)
							if(#nuisance>0) then
								for z=1,#nuisance do
								 	if(nuisance[z].armorColor==60 and nuisance[z].state~=1) then	
										black=black+1
									elseif(nuisance[z].armorColor==61 and nuisance[z].state~=1) then
										white=white+1
									elseif(nuisance[z].armorColor==63 and nuisance[z].state~=1) then
										red=red+1
									elseif(nuisance[z].armorColor==65 and nuisance[z].state~=1) then
										blue=blue+1
									end
								end
							end		
						end
					end
					player:dialogSeq({t,"The following number of players are alive:\n\nBlack: "..black.."\nWhite: "..white.."\nRed  : "..red.."\nBlue : "..blue.."\n"})
				   else
					player:dialogSeq({t,"You can only check participants every 5 seconds."})
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
			end
        end)
}








althar_cattle4 = {
	click = async(function(player,npc)
		local f=0
		local g=0
		local t={graphic=convertGraphic(8,"monster"),color=0}
	        local opts = { }

                              player.npcGraphic=t.graphic
			      player.npcColor=t.color
			      	if((player.registry["carnagehost"]==1 and player.armorColor==15) or player.registry["carnagehost"]>1) then
                              		table.insert(opts,"Carnage nuisance")
					table.insert(opts,"Sort participants")
					table.insert(opts,"Move participant")
					table.insert(opts,"Carnage hall warp")
					table.insert(opts,"Check Participants status")
					table.insert(opts,"Clear barricades")
					if(player.state==1) then
						table.insert(opts,"Ressucitate")
					end
			      	end
				if(#opts==0) then

					player:dialogSeq({t,"Do you want to return to the Carnage hall ? This could handicap your team.\n\nClick Next if you are sure."},1)
					
					player:addHealth(player.maxHealth)
					player:addMana(player.maxMagic)
					--player:flushDuration()
					for x=1,600 do
						if(player:hasDuration(x)) then
							player:setDuration(x,0)
						end
					end
					player.state=0
					player:updateState()
					player:warp(2100,24,24)
					return
				else

                              

                                  local menuOption=player:menuString("Hello, Carnage Host.\n\nHow can I help you?",opts)


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
										Player(nameofPlayer):warp(2005,19,16)
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
										for x=1,600 do
											if(player:hasDuration(x)) then
												player:setDuration(x,0)
											end
										end
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
				
                                elseif(menuOption=="Check Participants status") then
				    if(player.registry["checkaliveparticipants"]+5<=os.time()) then
					player.registry["checkaliveparticipants"]=os.time()
					local black=0
					local white=0
					local red=0
					local blue=0
					local nuisance = { }
					for x=0,100 do
						for y=0,100 do
							nuisance=player:getObjectsInCell(player.m,x,y,BL_PC)
							if(#nuisance>0) then
								for z=1,#nuisance do
								 	if(nuisance[z].armorColor==60 and nuisance[z].state~=1) then	
										black=black+1
									elseif(nuisance[z].armorColor==61 and nuisance[z].state~=1) then
										white=white+1
									elseif(nuisance[z].armorColor==63 and nuisance[z].state~=1) then
										red=red+1
									elseif(nuisance[z].armorColor==65 and nuisance[z].state~=1) then
										blue=blue+1
									end
								end
							end		
						end
					end
					player:dialogSeq({t,"The following number of players are alive:\n\nBlack: "..black.."\nWhite: "..white.."\nRed  : "..red.."\nBlue : "..blue.."\n"})
				   else
					player:dialogSeq({t,"You can only check participants every 5 seconds."})
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
			end
        end)
}









althar_cattle5 = {
	click = async(function(player,npc)
		local f=0
		local g=0
		local t={graphic=convertGraphic(8,"monster"),color=0}
	        local opts = { }

                              player.npcGraphic=t.graphic
			      player.npcColor=t.color
			      	if((player.registry["carnagehost"]==1 and player.armorColor==15) or player.registry["carnagehost"]>1) then
                              		table.insert(opts,"Carnage nuisance")
					table.insert(opts,"Sort participants")
					table.insert(opts,"Move participant")
					table.insert(opts,"Carnage hall warp")
					table.insert(opts,"Check Participants status")
					table.insert(opts,"Clear barricades")
					if(player.state==1) then
						table.insert(opts,"Ressucitate")
					end
			      	end
				if(#opts==0) then

					player:dialogSeq({t,"Do you want to return to the Carnage hall ? This could handicap your team.\n\nClick Next if you are sure."},1)
					
					player:addHealth(player.maxHealth)
					player:addMana(player.maxMagic)
					--player:flushDuration()
					for x=1,600 do
						if(player:hasDuration(x)) then
							player:setDuration(x,0)
						end
					end
					player.state=0
					player:updateState()
					player:warp(2100,24,24)
					return
				else

                              

                                  local menuOption=player:menuString("Hello, Carnage Host.\n\nHow can I help you?",opts)


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
										Player(nameofPlayer):warp(2005,19,16)
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
										for x=1,600 do
											if(player:hasDuration(x)) then
												player:setDuration(x,0)
											end
										end
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
				
                                elseif(menuOption=="Check Participants status") then
				    if(player.registry["checkaliveparticipants"]+5<=os.time()) then
					player.registry["checkaliveparticipants"]=os.time()
					local black=0
					local white=0
					local red=0
					local blue=0
					local nuisance = { }
					for x=0,100 do
						for y=0,100 do
							nuisance=player:getObjectsInCell(player.m,x,y,BL_PC)
							if(#nuisance>0) then
								for z=1,#nuisance do
								 	if(nuisance[z].armorColor==60 and nuisance[z].state~=1) then	
										black=black+1
									elseif(nuisance[z].armorColor==61 and nuisance[z].state~=1) then
										white=white+1
									elseif(nuisance[z].armorColor==63 and nuisance[z].state~=1) then
										red=red+1
									elseif(nuisance[z].armorColor==65 and nuisance[z].state~=1) then
										blue=blue+1
									end
								end
							end		
						end
					end
					player:dialogSeq({t,"The following number of players are alive:\n\nBlack: "..black.."\nWhite: "..white.."\nRed  : "..red.."\nBlue : "..blue.."\n"})
				   else
					player:dialogSeq({t,"You can only check participants every 5 seconds."})
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
			end
        end)
}