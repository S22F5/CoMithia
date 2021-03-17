arena_greeter = {
	click = async(function(player,npc)
		local t={graphic=convertGraphic(44,"monster"),color=5}
	        local opts = { }
		local dyes = { }

                              player.npcGraphic=t.graphic
			      player.npcColor=t.color

			      	if(player.registry["carnagehost"]<=2 and player.registry["carnagehost"]>0) then
					table.insert(opts,"Yowls")
					table.insert(opts,"Warps")

			      	end
			      	if(player.registry["carnagehost"]==3) then
					table.insert(opts,"Yowls")
					table.insert(opts,"Warps")
					table.insert(opts,"Hire Carnage host")
					table.insert(opts,"Highlight Carnages board post")
					table.insert(opts,"Read Carnages board yowl")
			      	end
				table.insert(opts,"Regular dyes")
			      	table.insert(opts,"Bleach my clothes")
				table.insert(dyes,"Blue")
				table.insert(dyes,"White")
				table.insert(dyes,"Black")
				table.insert(dyes,"Red")
			      	
				local menuOption=player:menuString("How may I help you?",opts)
					
					if(menuOption=="Hire Carnage host" and player.registry["carnagehost"]==3)	then
						local nuisance = { }
						local w=0
						local nameofPlayer=player:input("Hello, Headmaster.\n\nWho do you wish to Hire?")
						for x=-5,5 do
						for y=-5,5 do
							nuisance=player:getObjectsInCell(player.m,npc.x+x,npc.y+y,BL_PC)
							if(#nuisance>0) then
								for z=1,#nuisance do
								 	if(string.lower(nuisance[z].name)==string.lower(nameofPlayer))then
										if(Player(nameofPlayer).registry["carnagehost"]>0) then
											player:dialogSeq({t,""..nameofPlayer.." is already a Carnage host!"})
										else
										Player(nameofPlayer):sendMinitext("You are now a Carnage host!")
										player:sendMinitext(""..nameofPlayer.." has been hired.")
										Player(nameofPlayer).registry["carnagehost"]=1
										Player(nameofPlayer).registry["board261write"]=1
										Player(nameofPlayer):addLegend("Carnage host (Year " .. player:curYear() .. ", " .. player:curSeason() .. ")","carnagehost",87,128)
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

					elseif(menuOption=="Bleach my clothes") then
							player:dialogSeq({t,"I can bleach your clothes for 10 coins.\n\nDo you want to pay?"},1)
							if(player.money>=10) then
								player.money=player.money-10
								player.armorColor=0
								player:sendStatus()
								player:updateState()																player:dialogSeq({t,"It is done."})
							else
							player:dialogSeq({t,"You do not have enough money."})
							end
					elseif(menuOption=="Warps" and player.registry["carnagehost"]>0) then
							local warps = {}
					
							table.insert(warps,"Hosts den")
							table.insert(warps,"Carnage")
							table.insert(warps,"Assault")
							table.insert(warps,"Domination")
							table.insert(warps,"Elixir war")

							local choice=player:menuString2("Where do you wish to be warped?",warps)
								if(choice=="Hosts den") then
									player:warp(2003,9,9)
								elseif(choice=="Carnage") then
									player:warp(2001,3,4)
								elseif(choice=="Assault") then
									player:warp(2001,6,4)
								elseif(choice=="Domination") then
									player:warp(2001,9,4)
								elseif(choice=="Elixir war") then
									player:warp(2001,12,4)
								end
					elseif(menuOption=="Regular dyes") then
							player:dialogSeq({t,"Hello there, I can dye your clothes with regular dyes, Blue, White, Black and Red.","It will cost you 50 coins."},1)
							local choice=player:menuString2("Which dye would you like applied to your clothes?",dyes)
							if(player.money>=50) then
								if(choice=="White") then
									player.money=player.money-50
									player.armorColor=11
									player:sendStatus()
									player:updateState()
									player:dialogSeq({t,"It is done."})
								elseif(choice=="Red") then
									player.money=player.money-50
									player.armorColor=31
									player:sendStatus()
									player:updateState()
									player:dialogSeq({t,"It is done."})
								elseif(choice=="Black") then
									player.money=player.money-50
									player.armorColor=10
									player:sendStatus()
									player:updateState()
									player:dialogSeq({t,"It is done."})
								elseif(choice=="Blue") then
									player.money=player.money-50
									player.armorColor=17
									player:sendStatus()
									player:updateState()
									player:dialogSeq({t,"It is done."})
								end
							else
							player:dialogSeq({t,"You do not have enough money."})
							end
					elseif(menuOption=="Yowls" and player.registry["carnagehost"]>0) then
							local yowlstyle = {}
							local yowlchoice = {}

							table.insert(yowlstyle,"Carnage")
							table.insert(yowlstyle,"Assault")
							table.insert(yowlstyle,"Domination")
							table.insert(yowlstyle,"Elixir war")
							table.insert(yowlstyle,"Community Events")
							table.insert(yowlstyle,"Disregard Carnage yowls")

							table.insert(yowlchoice,"Doors are opening")
							table.insert(yowlchoice,"Doors close in 5 minutes")
							table.insert(yowlchoice,"Doors are closed")

							local choice=player:menuString2("Hello Carnage Host, Which applies?",yowlstyle)

								if(choice=="Community Events") then
									player:dialogSeq({t,"Carnage Host, you are about to broadcast for the entire server an invitation to read the Community Events board. Press next to Proceed."},1)
									player:broadcast(-1,"Host "..player.name.." invites you to read the Community Events board.")
									return
								elseif(choice=="Disregard Carnage yowls") then
									player:dialogSeq({t,"Carnage Host, you are about to broadcast for the entire server to disregard the latest yowls. Press next to Proceed."},1)
									player:broadcast(-1,"Host "..player.name.." asks you to disregard the latest yowls.")
									return
								elseif(choice=="Carnage") then
									local spec=player:menuString2("Which applies?",yowlchoice)
										if(spec=="Doors are opening") then
											player:broadcast(-1,"Carnage doors opening in Mithia's Arena ((63,100 Mithia))")
											player:broadcast(-1,"-- Host "..player.name)
										elseif(spec=="Doors close in 5 minutes") then
											player:broadcast(-1,"Carnage doors will be closing in 5 minutes. ((63,100 Mithia))")
											player:broadcast(-1,"-- Host "..player.name)
										elseif(spec=="Doors are closed") then
											player:broadcast(-1,"Carnage doors are now closed.")
											player:broadcast(-1,"-- Host "..player.name)
										end
								elseif(choice=="Assault") then
									local spec=player:menuString2("Which applies?",yowlchoice)
										if(spec=="Doors are opening") then
											player:broadcast(-1,"Assault doors opening in Mithia's Arena ((63,100 Mithia))")
											player:broadcast(-1,"-- Host "..player.name)
										elseif(spec=="Doors close in 5 minutes") then
											player:broadcast(-1,"Assault doors will be closing in 5 minutes. ((63,100 Mithia))")
											player:broadcast(-1,"-- Host "..player.name)
										elseif(spec=="Doors are closed") then
											player:broadcast(-1,"Assault doors are now closed.")
											player:broadcast(-1,"-- Host "..player.name)
										end
								elseif(choice=="Domination") then
									local spec=player:menuString2("Which applies?",yowlchoice)
										if(spec=="Doors are opening") then
											player:broadcast(-1,"Domination doors opening in Mithia's Arena ((63,100 Mithia))")
											player:broadcast(-1,"-- Host "..player.name)
										elseif(spec=="Doors close in 5 minutes") then
											player:broadcast(-1,"Domination doors will be closing in 5 minutes. ((63,100 Mithia))")
											player:broadcast(-1,"-- Host "..player.name)
										elseif(spec=="Doors are closed") then
											player:broadcast(-1,"Domination doors are now closed.")
											player:broadcast(-1,"-- Host "..player.name)
										end
								elseif(choice=="Elixir war") then
									local spec=player:menuString2("Which applies?",yowlchoice)
										if(spec=="Doors are opening") then
											player:broadcast(-1,"Elixir war doors opening in Mithia's Arena ((63,100 Mithia))")
											player:broadcast(-1,"-- Host "..player.name)
										elseif(spec=="Doors close in 5 minutes") then
											player:broadcast(-1,"Elixir war doors will be closing in 5 minutes. ((63,100 Mithia))")
											player:broadcast(-1,"-- Host "..player.name)
										elseif(spec=="Doors are closed") then
											player:broadcast(-1,"Elixir war doors are now closed.")
											player:broadcast(-1,"-- Host "..player.name)
										end
								end

					elseif(menuOption=="Highlight Carnages board post" and player.registry["carnagehost"]==3) then
							player:dialogSeq({t,"Good day Headmaster.\n\nThis tool will let you highlight a post from the Carnages board."},1)
							local postNumber=player:input("Which post do you want to work on? ((Enter post number))")
							local choice=player:menu2("Headmaster, Which applies?",{"Normal Status","Highlighted Status"})
							if(choice==1) then
								setPostColor(262,postNumber,0)	
								player:dialogSeq({t,"It is done"})
							elseif(choice==2) then
								setPostColor(262,postNumber,1)
								player:dialogSeq({t,"It is done"})
							end
					elseif(menuOption=="Read Carnages board yowl" and player.registry["carnagehost"]==3) then
							player:dialogSeq({t,"Headmaster, this tool allows you to broadcast a message inviting the community to read the Carnages board, proceed?"},1)
							player:broadcast(-1,"Carnage Headmaster "..player.name.." invites you to read the Carnages Board for details.")
					end  
        end)
}