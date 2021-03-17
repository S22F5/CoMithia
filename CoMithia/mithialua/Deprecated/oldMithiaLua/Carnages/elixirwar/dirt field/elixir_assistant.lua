elixir_assistant_dirtfield1 = {
	click = async(function(player,npc)
		local f=0
		local g=0
		local t={graphic=convertGraphic(6,"monster"),color=15}
	        local opts = { }

                              player.npcGraphic=t.graphic
			      player.npcColor=t.color
			      	if((player.registry["carnagehost"]==1 and player.armorColor==15) or player.registry["carnagehost"]>1) then
                              		table.insert(opts,"Carnage nuisance")
					table.insert(opts,"Sort participants")
					table.insert(opts,"Move participant")
					table.insert(opts,"Carnage hall warp")
					table.insert(opts,"Move to sidelines")
					table.insert(opts,"Check Participants status")
					table.insert(opts,"Set Bow Success rate")
					table.insert(opts,"Set Bow Range")
					table.insert(opts,"===================")
					table.insert(opts,"Clear field barricades")
					table.insert(opts,"Set Side barricades")
					table.insert(opts,"Clear Side barricades")
					table.insert(opts,"===================")
					
			      	end
				table.insert(opts,"Acquire Elixir Bow")
				table.insert(opts,"Return to hall")

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
										Player(nameofPlayer).armorColor=player.registry["elixircolor"]
										Player(nameofPlayer).registry["elixircolor"]=0
										Player(nameofPlayer).registry["elixirarrowsleft"]=0
										Player(nameofPlayer):removeItem("elixir_trophy",1)
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
					
					player.armorColor=player.registry["elixircolor"]
					player:addHealth(player.maxHealth)
					player:addMana(player.maxMagic)
					--player:flushDuration()
					player.state=0
					player:updateState()
					player:removeItem("elixir_trophy",1)
					player:warp(2100,24,24)
					return
				elseif(menuOption=="Set Bow Success rate") then
					player:dialogSeq({t,"Carnage Host, this tool allows you to set the Success rate of the Elixir bows. Values can be used from 50% to 100%. Press next to proceed."},1)
					local per=player:input("What shall the success rate be? (50-100)")
					per=math.floor(math.abs(tonumber(per)))
					if(per<=50) then
						per=50
					end
					if(per>=100) then
						per=100
					end
					player.mapRegistry["bowrate"]=per
					player:broadcast(player.m,"-Host "..player.name.." has set the Elixir Bow Success rate to "..per.."%.")
				elseif(menuOption=="Set Bow Range") then
					player:dialogSeq({t,"Carnage Host, this tool allows you to set the range of the Elixir arrows. Values in tiles can be chosen from 3 to 50. Press next to proceed."},1)
					local per=player:input("What shall the arrow range be? (3-50)")
					per=math.floor(math.abs(tonumber(per)))
					if(per<=3) then
						per=3
					end
					if(per>=50) then
						per=50
					end
					player.mapRegistry["bowrange"]=per
					player:broadcast(player.m,"-Host "..player.name.." has set the Elixir Arrows Range rate to "..per.." tiles.")
                                elseif(menuOption=="Check Participants status") then
				    if(player.registry["checkaliveparticipants"]+5<=os.time()) then
					player.registry["checkaliveparticipants"]=os.time()
					local red=0
					local blue=0
					local nuisance = { }
					for x=2,36 do
						for y=10,44 do
							nuisance=player:getObjectsInCell(player.m,x,y,BL_PC)
							if(#nuisance>0) then
								for z=1,#nuisance do
									if(nuisance[z].armorColor==63 and nuisance[z].state~=1) then
										red=red+1
									elseif(nuisance[z].armorColor==65 and nuisance[z].state~=1) then
										blue=blue+1
									end
								end
							end		
						end
					end
					player:dialogSeq({t,"The following number of players are still present on the Gaming field:\n\nRed  : "..red.."\nBlue : "..blue.."\n"})
				   else
					player:dialogSeq({t,"You can only check participants every 5 seconds."})
				   end
				elseif(menuOption=="Move to sidelines") then
					player:dialogSeq({t,"Carnage Host, This tool allows you to send EVERYONE to the sidelines. Proceed with great caution."},1)
					local pla={}
					for x=0,100 do
						for y=0,100 do
							pla=player:getObjectsInCell(player.m,x,y,BL_PC)
							if(#pla>0) then
								for z=1,#pla do
									if(pla[z].armorColor~=15) then
										if(pla[z].registry["elixircolor"]==65) then
											pla[z]:warp(player.m,math.random(3,35),math.random(49,52))
											pla[z].armorColor=pla[z].registry["elixircolor"]
											pla[z]:updateState()
										elseif(pla[z].registry["elixircolor"]==63) then
											pla[z]:warp(player.m,math.random(3,35),math.random(2,5))
											pla[z].armorColor=pla[z].registry["elixircolor"]
											pla[z]:updateState()
										end
										pla[z]:removeItem("elixir_trophy",1)
									end
								end
							end
						end
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
										if(nuisance[z].registry["elixircolor"]==63) then
											Player(nameofPlayer).armorColor=player.registry["elixircolor"]	
											Player(nameofPlayer):warp(2081,15,4)
											player:sendMinitext(""..nameofPlayer.." has been moved.")
											w=1
											break
										elseif(nuisance[z].registry["elixircolor"]==65) then
											Player(nameofPlayer):warp(2081,20,51)
											player:sendMinitext(""..nameofPlayer.." has been moved.")
											w=1
											break
										end
									end
								end
							end		
						end
					end
					if(w==0) then
						player:dialogSeq({t,""..nameofPlayer.." isn't around or isn't a player!"})
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
										Player(nameofPlayer).armorColor=player.registry["elixircolor"]
										Player(nameofPlayer):updateState()
										Player(nameofPlayer):addHealth(nuisance[z].maxHealth)
										Player(nameofPlayer):removeItem("elixir_trophy",1)
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
								if(string.lower(nuisance[z].name)~=string.lower(player.name) and nuisance[z].armorColor~=15) then
									if(nuisance[z].state==1) then											 						nuisance[z]:addHealth(1000000000)
										nuisance[z].state=0
										
									end
										nuisance[z].armorColor=nuisance[z].registry["elixircolor"]
										nuisance[z]:updateState()
										nuisance[z]:addHealth(nuisance[z].maxHealth)
										nuisance[z]:addMana(nuisance[z].maxMagic)
										nuisance[z]:removeItem("elixir_trophy",1)
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
					end
				elseif(menuOption=="Carnage hall warp") then
						player:warp(2100,24,4)

                                elseif(menuOption=="Clear field barricades") then
					local barcheck = {}
					player:dialogSeq({t,"This tool allows you to remove every barricade on the gaming field instantly. Side barricades will not be affected. Press next to proceed."},1)
						for x=2,36 do
							for y=10,44 do
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
                                elseif(menuOption=="Clear Side barricades") then
					local barcheck = {}
					player:dialogSeq({t,"This tool allows you to remove every barricade on the sidelines instantly. Field barricades will not be affected. Press next to proceed."},1)
						for x=0,38 do
							for y=0,7 do
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
						for x=0,38 do
							for y=47,54 do
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
				elseif(menuOption=="Set Side barricades") then
					player:dialogSeq({t,"Carnage Host, This tool allows you to set Sideline barricades. Press next to proceed"},1)
					local barcheck = {}
					for y=2,5 do	
						barcheck=player:getObjectsInCell(player.m,2,y,BL_MOB)
						if(#barcheck==0) then
							player:spawn(76,2,y,1)
						end
					end
					for y=49,52 do	
						barcheck=player:getObjectsInCell(player.m,2,y,BL_MOB)
						if(#barcheck==0) then
							player:spawn(76,2,y,1)
						end
					end
					for y=2,5 do	
						barcheck=player:getObjectsInCell(player.m,36,y,BL_MOB)
						if(#barcheck==0) then
							player:spawn(76,36,y,1)
						end
					end
					for y=49,52 do	
						barcheck=player:getObjectsInCell(player.m,36,y,BL_MOB)
						if(#barcheck==0) then
							player:spawn(76,36,y,1)
						end
					end
				elseif(menuOption=="Acquire Elixir Bow") then
					player:dialogSeq({t,"This tool will provide you with an Elixir bow. Press next to proceed"},1)
					if(player:hasSpace("elixir_bow",1) and player:hasItem("elixir_bow",1)~=true) then
						player:addItem("elixir_bow",1)
					end
					
				end
        end)
}






















elixir_assistant_dirtfield2 = {
	click = async(function(player,npc)
		local f=0
		local g=0
		local t={graphic=convertGraphic(6,"monster"),color=15}
	        local opts = { }

                              player.npcGraphic=t.graphic
			      player.npcColor=t.color
			      	if((player.registry["carnagehost"]==1 and player.armorColor==15) or player.registry["carnagehost"]>1) then
                              		table.insert(opts,"Carnage nuisance")
					table.insert(opts,"Sort participants")
					table.insert(opts,"Move participant")
					table.insert(opts,"Carnage hall warp")
					table.insert(opts,"Move to sidelines")
					table.insert(opts,"Check Participants status")
					table.insert(opts,"Set Bow Success rate")
					table.insert(opts,"Set Bow Range")
					table.insert(opts,"===================")
					table.insert(opts,"Clear field barricades")
					table.insert(opts,"Set Side barricades")
					table.insert(opts,"Clear Side barricades")
					table.insert(opts,"===================")
					
			      	end
				table.insert(opts,"Acquire Elixir Bow")
				table.insert(opts,"Return to hall")

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
										Player(nameofPlayer).armorColor=player.registry["elixircolor"]
										Player(nameofPlayer).registry["elixircolor"]=0
										Player(nameofPlayer).registry["elixirarrowsleft"]=0
										Player(nameofPlayer):removeItem("elixir_trophy",1)
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
					
					player.armorColor=player.registry["elixircolor"]
					player:addHealth(player.maxHealth)
					player:addMana(player.maxMagic)
					--player:flushDuration()
					player.state=0
					player:updateState()
					player:removeItem("elixir_trophy",1)
					player:warp(2100,24,24)
					return
				elseif(menuOption=="Set Bow Success rate") then
					player:dialogSeq({t,"Carnage Host, this tool allows you to set the Success rate of the Elixir bows. Values can be used from 50% to 100%. Press next to proceed."},1)
					local per=player:input("What shall the success rate be? (50-100)")
					per=math.floor(math.abs(tonumber(per)))
					if(per<=50) then
						per=50
					end
					if(per>=100) then
						per=100
					end
					player.mapRegistry["bowrate"]=per
					player:broadcast(player.m,"-Host "..player.name.." has set the Elixir Bow Success rate to "..per.."%.")
				elseif(menuOption=="Set Bow Range") then
					player:dialogSeq({t,"Carnage Host, this tool allows you to set the range of the Elixir arrows. Values in tiles can be chosen from 3 to 50. Press next to proceed."},1)
					local per=player:input("What shall the arrow range be? (3-50)")
					per=math.floor(math.abs(tonumber(per)))
					if(per<=3) then
						per=3
					end
					if(per>=50) then
						per=50
					end
					player.mapRegistry["bowrange"]=per
					player:broadcast(player.m,"-Host "..player.name.." has set the Elixir Arrows Range rate to "..per.." tiles.")
                                elseif(menuOption=="Check Participants status") then
				    if(player.registry["checkaliveparticipants"]+5<=os.time()) then
					player.registry["checkaliveparticipants"]=os.time()
					local red=0
					local blue=0
					local nuisance = { }
					for x=2,36 do
						for y=10,44 do
							nuisance=player:getObjectsInCell(player.m,x,y,BL_PC)
							if(#nuisance>0) then
								for z=1,#nuisance do
									if(nuisance[z].armorColor==63 and nuisance[z].state~=1) then
										red=red+1
									elseif(nuisance[z].armorColor==65 and nuisance[z].state~=1) then
										blue=blue+1
									end
								end
							end		
						end
					end
					player:dialogSeq({t,"The following number of players are still present on the Gaming field:\n\nRed  : "..red.."\nBlue : "..blue.."\n"})
				   else
					player:dialogSeq({t,"You can only check participants every 5 seconds."})
				   end
				elseif(menuOption=="Move to sidelines") then
					player:dialogSeq({t,"Carnage Host, This tool allows you to send EVERYONE to the sidelines. Proceed with great caution."},1)
					local pla={}
					for x=0,100 do
						for y=0,100 do
							pla=player:getObjectsInCell(player.m,x,y,BL_PC)
							if(#pla>0) then
								for z=1,#pla do
									if(pla[z].armorColor~=15) then
										if(pla[z].registry["elixircolor"]==65) then
											pla[z]:warp(player.m,math.random(3,35),math.random(49,52))
											pla[z].armorColor=pla[z].registry["elixircolor"]
											pla[z]:updateState()
										elseif(pla[z].registry["elixircolor"]==63) then
											pla[z]:warp(player.m,math.random(3,35),math.random(2,5))
											pla[z].armorColor=pla[z].registry["elixircolor"]
											pla[z]:updateState()
										end
										pla[z]:removeItem("elixir_trophy",1)
									end
								end
							end
						end
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
										if(nuisance[z].registry["elixircolor"]==63) then
											Player(nameofPlayer).armorColor=player.registry["elixircolor"]	
											Player(nameofPlayer):warp(2081,15,4)
											player:sendMinitext(""..nameofPlayer.." has been moved.")
											w=1
											break
										elseif(nuisance[z].registry["elixircolor"]==65) then
											Player(nameofPlayer):warp(2081,20,51)
											player:sendMinitext(""..nameofPlayer.." has been moved.")
											w=1
											break
										end
									end
								end
							end		
						end
					end
					if(w==0) then
						player:dialogSeq({t,""..nameofPlayer.." isn't around or isn't a player!"})
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
										Player(nameofPlayer).armorColor=player.registry["elixircolor"]
										Player(nameofPlayer):updateState()
										Player(nameofPlayer):addHealth(nuisance[z].maxHealth)
										Player(nameofPlayer):removeItem("elixir_trophy",1)
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
								if(string.lower(nuisance[z].name)~=string.lower(player.name) and nuisance[z].armorColor~=15) then
									if(nuisance[z].state==1) then											 						nuisance[z]:addHealth(1000000000)
										nuisance[z].state=0
										
									end
										nuisance[z].armorColor=nuisance[z].registry["elixircolor"]
										nuisance[z]:updateState()
										nuisance[z]:addHealth(nuisance[z].maxHealth)
										nuisance[z]:addMana(nuisance[z].maxMagic)
										nuisance[z]:removeItem("elixir_trophy",1)
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
					end
				elseif(menuOption=="Carnage hall warp") then
						player:warp(2100,24,4)

                                elseif(menuOption=="Clear field barricades") then
					local barcheck = {}
					player:dialogSeq({t,"This tool allows you to remove every barricade on the gaming field instantly. Side barricades will not be affected. Press next to proceed."},1)
						for x=2,36 do
							for y=10,44 do
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
                                elseif(menuOption=="Clear Side barricades") then
					local barcheck = {}
					player:dialogSeq({t,"This tool allows you to remove every barricade on the sidelines instantly. Field barricades will not be affected. Press next to proceed."},1)
						for x=0,38 do
							for y=0,7 do
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
						for x=0,38 do
							for y=47,54 do
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
				elseif(menuOption=="Set Side barricades") then
					player:dialogSeq({t,"Carnage Host, This tool allows you to set Sideline barricades. Press next to proceed"},1)
					local barcheck = {}
					for y=2,5 do	
						barcheck=player:getObjectsInCell(player.m,2,y,BL_MOB)
						if(#barcheck==0) then
							player:spawn(76,2,y,1)
						end
					end
					for y=49,52 do	
						barcheck=player:getObjectsInCell(player.m,2,y,BL_MOB)
						if(#barcheck==0) then
							player:spawn(76,2,y,1)
						end
					end
					for y=2,5 do	
						barcheck=player:getObjectsInCell(player.m,36,y,BL_MOB)
						if(#barcheck==0) then
							player:spawn(76,36,y,1)
						end
					end
					for y=49,52 do	
						barcheck=player:getObjectsInCell(player.m,36,y,BL_MOB)
						if(#barcheck==0) then
							player:spawn(76,36,y,1)
						end
					end
				elseif(menuOption=="Acquire Elixir Bow") then
					player:dialogSeq({t,"This tool will provide you with an Elixir bow. Press next to proceed"},1)
					if(player:hasSpace("elixir_bow",1) and player:hasItem("elixir_bow",1)~=true) then
						player:addItem("elixir_bow",1)
					end
					
				end
        end)
}
