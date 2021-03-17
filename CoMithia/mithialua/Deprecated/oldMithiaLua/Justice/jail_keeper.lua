jail_keeper = {
	click = async(function(player,npc)
		local t={graphic=convertGraphic(147,"monster"),color=9}
	        local opts = { }

                              player.npcGraphic=t.graphic
			      player.npcColor=t.color
			      	if(player.registry["constable"]>0) then
					table.insert(opts,"Assess prisonner sentence")
					table.insert(opts,"Transfer prisonner to Court hall")
				end
  
		if(#opts>0 and player.registry["jailtime"]==0) then
                                  local menuOption=player:menuString("Hello Constable, How can I help you today?",opts)

                                  if(menuOption=="Assess prisonner sentence") then
					local nameofPlayer
					local w=0
					local nuisance = { }
					nameofPlayer=player:input("Whom sentence do you wish to assess?")
					for x=5,14 do
						for y=5,8 do
							nuisance=player:getObjectsInCell(player.m,x,y,BL_PC)
							if(#nuisance>0) then
								for z=1,#nuisance do
								 	if(nuisance[z].name==nameofPlayer) then
										if(Player(nameofPlayer).registry["jailtime"]>1) then
										player:dialogSeq({t,""..nameofPlayer.." still has "..Player(nameofPlayer).registry["jailtime"]-os.time().." seconds to spend here to finish his sentence."})
										elseif(Player(nameofPlayer).registry["jailtime"]==1) then
										player:dialogSeq({t,""..nameofPlayer.." is jailed forever."})
										else
										player:dialogSeq({t,""..nameofPlayer.." has finished his sentence."})
										end
										w=1
										break
									end
								end
							end		
						end
					end
					if(w==0) then
						player:dialogSeq({t,""..nameofPlayer.." isn't imprisonned here!"})
					end

                                  elseif(menuOption=="Transfer prisonner to Court hall") then
					local nameofPlayer
					local w=0
					local nuisance = { }
					nameofPlayer=player:input("Who do you wish to transfer to the Court hall for Trial?")
					for x=5,14 do
						for y=5,8 do
							nuisance=player:getObjectsInCell(player.m,x,y,BL_PC)
							if(#nuisance>0) then
								for z=1,#nuisance do
								 	if(nuisance[z].name==nameofPlayer) then
										local z=math.random(1,4)
										if(z==1) then
											Player(nameofPlayer):warp(3003,4,11)
										elseif(z==2) then
											Player(nameofPlayer):warp(3003,5,11)
										elseif(z==3) then
											Player(nameofPlayer):warp(3003,12,11)
										elseif(z==4) then
											Player(nameofPlayer):warp(3003,13,11)
										end
										w=1
										Player(nameofPlayer):sendMinitext("Constable "..player.name.." has transfered you to the Court hall.")
										player:dialogSeq({t,"The prisonner "..nameofPlayer.." has been transfered to the Court hall."})
										break
									end
								end
							end		
						end
					end
					if(w==0) then
						player:dialogSeq({t,""..nameofPlayer.." isn't imprisonned here!"})
					end
                                  end
		else
			if(player.y<=8) then
				if(player.registry["jailtime"]<=os.time() and player.registry["jailtime"]~=1) then
					player:dialogSeq({t,"You are free to go now, try not to break the law again!"},1)
					player:warp(3004,8,11)
					player:sendMinitext("The Jail keeper liberates you from Jail.")
				elseif(player.registry["jailtime"]==1) then
					player:dialogSeq({t,"You were jailed forever, miscreant. You and I are gonna learn to know each other quite well."})
				else
					local count=player.registry["jailtime"]-os.time()
					player:dialogSeq({t,"You will remain a prisonner for "..count.." more seconds."})
				end
			else
				player:dialogSeq({t,"Visiting our comfortable little prison, are Ye?"})
			end

		end
        end)
}