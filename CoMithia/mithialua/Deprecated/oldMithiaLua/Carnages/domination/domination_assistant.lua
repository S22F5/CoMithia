domination_assistant = {
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
					table.insert(opts,"Clear barricades")
					table.insert(opts,"Start round")
					table.insert(opts,"Force ending")
					if(player.state==1) then
						table.insert(opts,"Ressucitate")
					end
			      	end

				table.insert(opts,"Return to hall")
				if(player.state==1) then
					table.insert(opts,"Reincarnate")
				end

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
					player:flushDuration()
					player.state=0
					if(player.speed~=80) then
						player.speed=80
					end
					player:updateState()
					player:warp(2100,24,24)
					return
				elseif(menuOption=="Start round") then
					if(player.mapRegistry["dominationroundstart"]==1) then
						player:dialogSeq({t,"The round is already started."})
						return
					end
					player:dialogSeq({t,"Carnage Host, This tool allows you to start the Domination round. Proceed with caution."},1)
					player:broadcast(player.m,"-Host "..player.name..": The Domination round has started!")
					player.mapRegistry["dominationroundstart"]=1

					player.mapRegistry["shrinetopleftcapture"]=0
					player.mapRegistry["shrinetopleftcapturecolor"]=0

					player.mapRegistry["shrinetoprightcapture"]=0
					player.mapRegistry["shrinetoprightcapturecolor"]=0

					player.mapRegistry["shrinecentercapture"]=0
					player.mapRegistry["shrinecentercapturecolor"]=0

					player.mapRegistry["shrinebottomleftcapture"]=0
					player.mapRegistry["shrinebottomleftcapturecolor"]=0

					player.mapRegistry["shrinebottomrightcapture"]=0
					player.mapRegistry["shrinebottomrightcapturecolor"]=0

					player.mapRegistry["totalblack"]=0
					player.mapRegistry["totalwhite"]=0
					player.mapRegistry["totalred"]=0
					player.mapRegistry["totalblue"]=0


					return
				elseif(menuOption=="Force ending") then
					if(player.mapRegistry["dominationroundstart"]==0) then
						player:dialogSeq({t,"The round has not been started yet."})
						return
					end

					player:dialogSeq({t,"Carnage Host, this tool allows you to force the ending of a Domination round. Please proceed with Extreme Caution."},1)
					player:broadcast(player.m,"-Host "..player.name.." forces a round end!")
					player:broadcast(player.m,"-Final Score Display = Black : "..player.mapRegistry["totalblack"]..", White : "..player.mapRegistry["totalwhite"]..", Red : "..player.mapRegistry["totalred"]..", Blue: "..player.mapRegistry["totalblue"]..".")
					return
				elseif(menuOption=="Reincarnate") then
					player.paralyzed=true
					player:setDuration("domination_res",30000)
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
										if(Player(nameofPlayer).speed~=80) then
											Player(nameofPlayer).speed=80
										end
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
										nuisance[z]:flushDuration()
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