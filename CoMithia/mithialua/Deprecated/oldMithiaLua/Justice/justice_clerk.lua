justice_clerk = {
	click = async(function(player,npc)
		local t={graphic=convertGraphic(41,"monster"),color=30}
	        local opts = { }
		local optstime = {}

                              player.npcGraphic=t.graphic
			      player.npcColor=t.color

			      	if(player.registry["constable"]==1 or player.registry["constable"]==2) then
                              		table.insert(opts,"Summon defendant")
					table.insert(opts,"Jail defendant")
					table.insert(opts,"Release defendant")
			      	end
			      	if(player.registry["constable"]==3) then
                              		table.insert(opts,"Summon defendant")
					table.insert(opts,"Jail defendant")
					table.insert(opts,"Release defendant")
					table.insert(opts,"Step down")
					table.insert(opts,"Hire Constable")
					table.insert(opts,"Demote Constable")
					table.insert(opts,"Highlight Scum board post")
					table.insert(opts,"Highlight Law board post")
					table.insert(opts,"Read Law board yowl")
					table.insert(opts,"Nominate Celebrant")
					table.insert(opts,"Demote Celebrant")
			      	end
			      	if(#opts~=0) then

			      	
				local menuOption=player:menuString("Hello Constable, How may I help you?",opts)
					
					if(menuOption=="Summon defendant") then
						local w=math.random(1,4)
						local nameofPlayer=player:input("Hello, Constable.\n\nWho do you wish to Summon?")
						if(w==1) then
							Player(nameofPlayer):warp(3003,4,11)
						elseif(w==2) then
							Player(nameofPlayer):warp(3003,5,11)
						elseif(w==3) then
							Player(nameofPlayer):warp(3003,12,11)
						elseif(w==4) then
							Player(nameofPlayer):warp(3003,13,11)
						end
							Player(nameofPlayer):sendMinitext("Constable "..player.name.." has summoned you to the court room.")
					elseif(menuOption=="Jail defendant") then
						local nuisance = { }
						local w=0
						local nameofPlayer=player:input("Hello, Constable.\n\nWho do you wish to Jail?")
						if(nameofPlayer==player.name) then
							player:sendMinitext("You cannot jail yourself.")
							return
						end
						table.insert(optstime,"6 Hours")
						table.insert(optstime,"12 Hours")
						table.insert(optstime,"1 Day")
						table.insert(optstime,"3 Days")
						table.insert(optstime,"1 Week")
						table.insert(optstime,"Forever")
						table.insert(optstime,"Do not change current sentence")
						local choice=player:menuString2("How long do you wish to jail the defendant?",optstime)
						for x=0,14 do
						for y=0,14 do
							nuisance=player:getObjectsInCell(player.m,x,y,BL_PC)
							if(#nuisance>0) then
								for z=1,#nuisance do
								 	if(string.lower(nuisance[z].name)==string.lower(nameofPlayer)) then
										if(choice=="6 Hours") then
											Player(nameofPlayer):sendMinitext("Constable "..player.name.." has thrown You in jail for 6 hours!")
											Player(nameofPlayer):warp(3004,8,8)
											Player(nameofPlayer).registry["jailtime"]=os.time()+21600
											player:sendMinitext("The defendant, "..nameofPlayer..", has been jailed for 6 hours.")
											w=1
										elseif(choice=="12 Hours") then
											Player(nameofPlayer):sendMinitext("Constable "..player.name.." has thrown You in jail for 12 hours!")
											Player(nameofPlayer):warp(3004,8,8)
											Player(nameofPlayer).registry["jailtime"]=os.time()+43200
											player:sendMinitext("The defendant, "..nameofPlayer..", has been jailed for 12 hours.")
											w=1
										elseif(choice=="1 Day") then
											Player(nameofPlayer):sendMinitext("Constable "..player.name.." has thrown You in jail for 1 Day!")
											Player(nameofPlayer):warp(3004,8,8)
											Player(nameofPlayer).registry["jailtime"]=os.time()+86400
											player:sendMinitext("The defendant, "..nameofPlayer..", has been jailed for 1 Day.")
											w=1
										elseif(choice=="3 Days") then
											Player(nameofPlayer):sendMinitext("Constable "..player.name.." has thrown You in jail for 3 Days!")
											Player(nameofPlayer):warp(3004,8,8)
											Player(nameofPlayer).registry["jailtime"]=os.time()+259200
											player:sendMinitext("The defendant, "..nameofPlayer..", has been jailed for 3 Days.")
											w=1
										elseif(choice=="1 Week") then
											Player(nameofPlayer):sendMinitext("Constable "..player.name.." has thrown You in jail for 1 Week!")
											Player(nameofPlayer):warp(3004,8,8)
											Player(nameofPlayer).registry["jailtime"]=os.time()+604800
											player:sendMinitext("The defendant, "..nameofPlayer..", has been jailed for 1 Week.")
											w=1
										elseif(choice=="Forever") then
											Player(nameofPlayer):sendMinitext("Constable "..player.name.." has thrown You in jail forever!")
											Player(nameofPlayer):warp(3004,8,8)
											Player(nameofPlayer).registry["jailtime"]=1
											player:sendMinitext("The defendant, "..nameofPlayer..", has been jailed forever.")
											w=1
										elseif(choice=="Do not change current sentence") then
											Player(nameofPlayer):sendMinitext("Constable "..player.name.." has thrown You in jail!")
											Player(nameofPlayer):warp(3004,8,8)
											player:sendMinitext("The defendant, "..nameofPlayer..", has been jailed.")
											w=1
										end
									end
								end
							end		
						end
					        end
						if(w==0) then
							player:dialogSeq({t,""..nameofPlayer.." isn't around!"})
						end
					elseif(menuOption=="Release defendant") then
						local nuisance = { }
						local w=0
						local nameofPlayer=player:input("Hello, Constable.\n\nWho do you wish to Release?")
						if(nameofPlayer==player.name) then
							player:sendMinitext("You are not a defendant!")
							return
						end
						for x=0,14 do
						for y=0,14 do
							nuisance=player:getObjectsInCell(player.m,x,y,BL_PC)
							if(#nuisance>0) then
								for z=1,#nuisance do
								 	if(string.lower(nuisance[z].name)==string.lower(nameofPlayer)) then
										        local z=math.random(1,4)
            										if(x==1) then
               											Player(nameofPlayer):warp(18,2,4)
            										elseif(x==2) then
               											Player(nameofPlayer):warp(18,27,4)
            										elseif(x==3) then
               											Player(nameofPlayer):warp(9,3,6)
            										else 
												Player(nameofPlayer):warp(9,7,6)
            										end
											Player(nameofPlayer):sendMinitext("Constable "..player.name.." has Released you.")
											Player(nameofPlayer).registry["jailtime"]=0
											w=1
									end
								end
							end		
						end
					        end
						if(w==0) then
							player:dialogSeq({t,""..nameofPlayer.." isn't around!"})
						end
					elseif(menuOption=="Step down") then
						local nuisance= { }
						local w=0
						player:dialogSeq({t,"Hello Master. This will allow you to step down of your position and promote a new Head Constable. Only proceed if you are -ABSOLUTELY- certain of your decision."},1)
						local nameofPlayer=player:input("Who shall become the new Head Constable?")
						if(nameofPlayer~=player.name) then
						for x=0,14 do
						for y=0,14 do
							nuisance=player:getObjectsInCell(player.m,x,y,BL_PC)
							if(#nuisance>0) then
								for z=1,#nuisance do
								 	if(string.lower(nuisance[z].name)==string.lower(nameofPlayer)) then
										Player(nameofPlayer):sendMinitext(""..player.name.." has made you the new Head Constable. Congratulations.")
										player:sendMinitext(""..nameofPlayer.." is now the new Head Constable")
										Player(nameofPlayer):removeLegendbyName("constable")
										Player(nameofPlayer):addLegend("Head Constable (Year " .. player:curYear() .. ", " .. player:curSeason() .. ")","constable",135,128)
										Player(nameofPlayer).registry["constable"]=3
										player:removeLegendbyName("constable")
										player:addLegend("Knighted Constable (Year " .. player:curYear() .. ", " .. player:curSeason() .. ")","constable",135,128)
										player.registry["constable"]=1
										Player(nameofPlayer).registry["board1write"]=1
										Player(nameofPlayer).registry["board263del"]=1
										Player(nameofPlayer).registry["board11del"]=1	
										player.registry["board1write"]=0
										player.registry["board263del"]=0
										player.registry["board11del"]=0	
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


					elseif(menuOption=="Hire Constable")	then
						local nuisance = { }
						local w=0
						local nameofPlayer=player:input("Hello, Master.\n\nWho do you wish to Hire?")
						for x=0,14 do
						for y=0,14 do
							nuisance=player:getObjectsInCell(player.m,x,y,BL_PC)
							if(#nuisance>0) then
								for z=1,#nuisance do
								 	if(string.lower(nuisance[z].name)==string.lower(nameofPlayer))then
										if(Player(nameofPlayer).registry["constable"]>0) then
											player:dialogSeq({t,""..nameofPlayer.." is already a Constable!"})
										else
										Player(nameofPlayer):sendMinitext("You have been Knighted Constable!")
										player:sendMinitext(""..nameofPlayer.." has been Knighted.")
										Player(nameofPlayer).registry["constable"]=1
										Player(nameofPlayer):addLegend("Knighted Constable (Year " .. player:curYear() .. ", " .. player:curSeason() .. ")","constable",135,128)
										Player(nameofPlayer).registry["board11write"]=1										
										end
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
					elseif(menuOption=="Demote Constable") then
						player:dialogSeq({t,"Hello Master. This will allow you to Demote a Constable from duty. Only proceed if you are certain of your decision."},1)
						local nameofPlayer=player:input("Which Constable needs his power removed?")
							if(string.lower(nameofPlayer)~=string.lower(player.name)) then
									if(Player(nameofPlayer).registry["constable"]>0) then
										Player(nameofPlayer).registry["constable"]=0
										Player(nameofPlayer):sendMinitext("You are no longer a Constable.")
										player:sendMinitext(""..nameofPlayer.." has been Demoted.")
									end
									Player(nameofPlayer):removeLegendbyName("constable")
									Player(nameofPlayer).registry["board11write"]=0	
							else
							player:dialogSeq({t,"You can not fire yourself!"})
							end
					elseif(menuOption=="Highlight Scum board post") then
							player:dialogSeq({t,"Good day, Master.\n\nThis tool will let you highlight a post from the Scum board."},1)
							local postNumber=player:input("Which post do you want to work on? ((Enter post number))")
							local choice=player:menu2("Constable, Which applies?",{"Normal Status","Highlighted Status"})
							if(choice==1) then
								setPostColor(11,postNumber,0)	
								player:dialogSeq({t,"It is done"})
							elseif(choice==2) then
								setPostColor(11,postNumber,1)
								player:dialogSeq({t,"It is done"})
							end
					elseif(menuOption=="Highlight Law board post") then
							player:dialogSeq({t,"Good day, Master.\n\nThis tool will let you highlight a post from the Law board."},1)
							local postNumber=player:input("Which post do you want to work on? ((Enter post number))")
							local choice=player:menu2("Constable, Which applies?",{"Normal Status","Highlighted Status"})
							if(choice==1) then
								setPostColor(1,postNumber,0)	
								player:dialogSeq({t,"It is done"})
							elseif(choice==2) then
								setPostColor(1,postNumber,1)
								player:dialogSeq({t,"It is done"})
							end
					elseif(menuOption=="Read Law board yowl") then
							player:dialogSeq({t,"Head Constable, this tool allows you to broadcast a message inviting the community to read the Law board, proceed?"},1)
							player:broadcast(-1,"Head Constable "..player.name.." invites you to read the Law board for details.")
					elseif(menuOption=="Nominate Celebrant") then
							local nominceleb = { }
							local w=0
							player:dialogSeq({t,"Head Constable, this tool allows you to nominate a new Marriage Celebrant. Proceed?"},1)
							local choice=player:input("Who shall become a Marriage Celebrant?")
							
							for x=0,14 do
							for y=0,14 do
							nominceleb=player:getObjectsInCell(player.m,x,y,BL_PC)
							if(#nominceleb>0) then
								for z=1,#nominceleb do
								 	if(string.lower(nominceleb[z].name)==string.lower(choice))then
										if(Player(choice).registry["marriagecelebrant"]>0) then
											player:dialogSeq({t,""..choice.." is already a Celebrant!"})
										else
										Player(choice):sendMinitext("You have been given Celebrant powers")
										player:sendMinitext(""..choice.." has been given Celebrant powers.")
										Player(choice).registry["marriagecelebrant"]=1
										Player(choice):addLegend("Marriage Celebrant since Year " .. player:curYear() .. ", " .. player:curSeason() .. "","celebrant",6,5)										
										end
										w=1
										break
									end
								end
							end		
							end
					        	end
							if(w==0) then
								player:dialogSeq({t,"I'm sorry, but "..nominceleb.." doesn't seem to be around!"})
							end				
					elseif(menuOption=="Demote Celebrant") then
						player:dialogSeq({t,"Hello Master. This will allow you to Demote a Celebrant from duty. Only proceed if you are certain of your decision."},1)
						local nameofPlayer=player:input("Which Celebrant needs his power removed?")
							if(string.lower(nameofPlayer)~=string.lower(player.name)) then
									if(Player(nameofPlayer).registry["marriagecelebrant"]>0) then
										Player(nameofPlayer).registry["marriagecelebrant"]=0
										Player(nameofPlayer):sendMinitext("You are no longer a Celebrant.")
										player:sendMinitext(""..nameofPlayer.." has been Demoted.")
									end
									Player(nameofPlayer):removeLegendbyName("celebrant")
							else
							player:dialogSeq({t,"You can not fire yourself!"})
							end
					end
				else
					player:dialogSeq({t,"Welcome to the Court hall!"})
				end 
        end)
}