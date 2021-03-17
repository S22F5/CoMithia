dalectos = {
	click = async(function(player,npc)
		local t={graphic=convertGraphic(833,"monster"),color=28}
                local opts = { }
		local checkitem = {}
		local checkplayer = {}
		local optsbooth = {}
		local count = 0
		local changecheck=0
                table.insert(opts,"Claim booth")
		table.insert(opts,"Leave booth")
		table.insert(optsbooth,"Right booth")
		table.insert(optsbooth,"Left booth")
                table.insert(opts,"Deposit Item")
                table.insert(opts,"Withdraw Item")
                table.insert(opts,"Deposit Money")
                table.insert(opts,"Withdraw Money")
				table.insert(opts,"Announce sale")
		
                
		if(player.state==1) then
			player:dialogSeq({t,"I'm sorry, but I may not deal with dead people."})
			return
		end
		if(player.level<20) then
			player:dialogSeq({t,"I'm sorry, but you need to be at least of the 20th insight."})
			return
		end


			player.npcGraphic=t.graphic
			player.npcColor=t.color
			local menuOption=player:menuString2("Welcome to the Auction house, how can I help you?",opts)
			if(menuOption=="Claim booth") then
				if(player.x<6 and player.y>19) then
					changecheck=1
				elseif(player.x>10 and player.y>19) then
					changecheck=1
				else
					changecheck=0
				end
				if(changecheck==0) then
				local choicebooth=player:menuString2("Which booth do you wish to claim?",optsbooth)
					if(choicebooth=="Right booth") then
						if(player.registry["constable"]>=1) then
							player:warp(52,12,20)
						else
							for x=11,15 do
								for y=20,26 do
									checkitem=player:getObjectsInCell(player.m,x,y,BL_ITEM)
									checkplayer=player:getObjectsInCell(player.m,x,y,BL_PC)
									if(#checkitem>0) then
										count=count+1
									end
									if(#checkplayer>0) then
										count=count+1
									end
								end
							end
							if(count==0) then
								player.mapRegistry["ownerrightbooth"]=player.ID
								player:warp(52,12,20)
							else
								player:dialogSeq({t,"I'm sorry, but there are still items being exposed on this booth. If the owner vanished, you may call a Constable to come and clear up the situation."})
							end
						end
					elseif(choicebooth=="Left booth") then
						if(player.registry["constable"]>=1) then
							player:warp(52,4,20)
						else
							for x=1,5 do
								for y=20,26 do
									checkitem=player:getObjectsInCell(player.m,x,y,BL_ITEM)
									checkplayer=player:getObjectsInCell(player.m,x,y,BL_PC)
									if(#checkitem>0) then
										count=count+1
									end
									if(#checkplayer>0) then
										count=count+1
									end
								end
							end
							if(count==0) then
								player.mapRegistry["ownerleftbooth"]=player.ID
								player:warp(52,4,20)
							else
								player:dialogSeq({t,"I'm sorry, but there are still items being exposed on this booth. If the owner vanished, you may call a Constable to come and clear up the situation."})
							end
						end
					end
				else
					player:dialogSeq({t,"I'm sorry, but you are already occupying a booth right now, you can not claim another."})
				end
			elseif(menuOption=="Leave booth") then
					if(player.x<6 and player.y>19) then
							for x=1,5 do
								for y=20,26 do
									checkitem=player:getObjectsInCell(player.m,x,y,BL_ITEM)
									if(#checkitem>0) then
										count=count+1
									end
								end
							end
							if(count==0) then
								if(player.registry["constable"]==0) then
									player.mapRegistry["ownerleftbooth"]=0
								end
								player:warp(52,math.random(6,10),math.random(10,15))
							else
								player:dialogSeq({t,"I'm sorry, but there are still items being exposed on this booth. You need to pick them up before leaving."})
							end
					elseif(player.x>10 and player.y>19) then
							for x=11,15 do
								for y=20,26 do
									checkitem=player:getObjectsInCell(player.m,x,y,BL_ITEM)
									if(#checkitem>0) then
										count=count+1
									end
								end
							end
							if(count==0) then
								if(player.registry["constable"]==0) then
									player.mapRegistry["ownerrightbooth"]=0
								end
								player:warp(52,math.random(6,10),math.random(10,15))
							else
								player:dialogSeq({t,"I'm sorry, but there are still items being exposed on this booth. You need to pick them up before leaving."})
							end
					else
						player:dialogSeq({t,"You are not occupying a booth right now."})
					end
			elseif(menuOption=="Announce sale") then
					if(player.x<6 and player.y>19) then						
						local announce=player:menuString2("This feature costs 1000 gold and can only be done once a day",{"Announce sale - 1000 gold","Nevermind"})
						if(announce=="Announce sale - 1000 gold") then
							if(player.money >= 1000)then
								if(os.time() < player.registry["broadcastsale"] and player.gmLevel<99)then 
									player:dialogSeq({t,"Please wait before doing this again"})									
								else
									player.money=player.money-1000
									player.registry["broadcastsale"]=os.time()+86400
									player:broadcast(-1,""..player.name.." is having a sale in the Mithia Auction House (87,49 Mithia)")
									player:sendStatus()
								end
							else
								player:dialogSeq({t,"I'm sorry, but you do not have enough money"})
							end
						elseif(announce=="Nevermind")then
							player:dialogSeq({t,"Guess I'll see you around..."})
						end
					elseif(player.x>10 and player.y>19) then						
						local announce=player:menuString2("This feature costs 1000 gold and can only be done once a day",{"Announce sale - 1000 gold","Nevermind"})
						if(announce=="Announce sale - 1000 gold") then
							if(player.money >= 1000)then
								if(os.time() < player.registry["broadcastsale"])then 
									player:dialogSeq({t,"Please wait before doing this again"})									
								else
									player.money=player.money-1000
									player.registry["broadcastsale"]=os.time()+86400
									player:broadcast(-1,""..player.name.." is having a sale in the Mithia Auction House (87,49 Mithia)")
									player:sendStatus()
								end
							else
								player:dialogSeq({t,"I'm sorry, but you do not have enough money"})
							end
						elseif(announce=="Nevermind")then
							player:dialogSeq({t,"Guess I'll see you around..."})
						end
					else
						player:dialogSeq({t,"I'm sorry but you're not currently in a booth."})
					end				
			elseif(menuOption=="Deposit Item") then
				player:showBankAdd("What do you wish to deposit?")
			elseif(menuOption=="Withdraw Item") then
				player:showBank("What do you wish to withdraw?")
			elseif(menuOption=="Deposit Money") then
				player:bankAddMoney()
			elseif(menuOption=="Withdraw Money") then
				player:bankWithdrawMoney()
			end
		
	end)
}