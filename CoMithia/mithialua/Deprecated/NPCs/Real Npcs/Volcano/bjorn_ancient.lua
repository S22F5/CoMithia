bjorn_ancient = {
	click = async(function(player,npc)
		local t={graphic=convertGraphic(251,"monster"),color=14}
	        local opts = { }
		local opts2 = { }
		local donations = { }
		local rewardsI = { }

                              player.npcGraphic=t.graphic
			      player.npcColor=t.color
                              table.insert(opts,"Daily duty")
                              table.insert(opts,"Donations")
			      table.insert(opts,"Rewards I")
			      table.insert(opts2,"Yes")
			      table.insert(opts2,"No")
			      table.insert(donations,"50 Ash log")
			      table.insert(donations,"50 Tin ore")
			      table.insert(rewardsI,"10 points : 10 Amethyst")
			      table.insert(rewardsI,"150 points: Bjorn battle gauntlet")
			      table.insert(rewardsI,"250 points: Bjorn shield")
			

   			
			if(player.registry["alliancedowhar"]==1) then
				player:dialogSeq({t,"We know you, you've been helping the Dowhar! Leave this place, you are not welcomed here!"})
				return
			end

			if(player.registry["alliancebjorn"]==0) then
				player:dialogSeq({t,"Good day. You should talk to Ketill if you want to help us."})
				return
			end

			if(player.registry["alliancebjorn"]==1) then
				local menuOption=player:menuString("Welcome, friend.",opts)
				if(menuOption=="Daily duty") then
					if(os.time()>=player.registry["bjorndailyduty"]+86400) then
						player:dialogSeq({t,"You can help us by killing members of the Dowhar tribe.",t,"You can get credited for up to 10 tribesmen, 10 fighters and 1 leader per day.",t,"Tribesmen and fighters are both worth one point each, and their leader is worth five.",t,"Be careful as you will only be able to get your kills credited once a day, even if you killed less than the maximum amount authorized.",t,"Do you want me to credit your kills now?"},1)
						local credit=player:menuString2("Do you wish to credit your kills? Beware, this will reset your killing track.",opts2)
							if(credit=="Yes") then
								local fighter=player:killCount("dowhar_fighter")
								local tribe=player:killCount("dowhar_tribesman")
								local leader=player:killCount("dowhar_leader")
									if fighter>=10 then fighter=10 end
									if tribe>=10 then tribe=10 end
									if leader>=1 then leader=1 end
								local count=tribe+fighter+(leader*5)
								player.registry["bjornpointscurrent"]=player.registry["bjornpointscurrent"]+count
								player.registry["bjornpointstotal"]=player.registry["bjornpointstotal"]+count
								player:flushKills()
								player.registry["bjorndailyduty"]=os.time()
								if(player.registry["bjornpointstotal"]<1000) then
									player:removeLegendbyName("bjornlevel")
									player:addLegend("Friend amongst the Bjorn tribe","bjornlevel",2,128)
								elseif(player.registry["bjornpointstotal"]>=1000 and player.registry["bjornpointstotal"]<5000) then
									player:removeLegendbyName("bjornlevel")
									player:addLegend("Regarded amongst the Bjorn tribe","bjornlevel",2,128)
								elseif(player.registry["bjornpointstotal"]>=5000 and player.registry["bjornpointstotal"]<15000) then
									player:removeLegendbyName("bjornlevel")
									player:addLegend("Esteemed amongst the Bjorn tribe","bjornlevel",2,128)
								elseif(player.registry["bjornpointstotal"]>=15000 and player.registry["bjornpointstotal"]<30000) then
									player:removeLegendbyName("bjornlevel")								
									player:addLegend("Revered amongst the Bjorn tribe","bjornlevel",2,128)
								elseif(player.registry["bjornpointstotal"]>=30000) then
									player:removeLegendbyName("bjornlevel")
									player:addLegend("Worshipped amongst the Bjorn tribe","bjornlevel",2,128)
								end
								player:dialogSeq({t,"Your kills for the day have been credited"})
							else
								player:dialogSeq({t,"Suit yourself, friend."})
							end
					else
					player:dialogSeq({t,"You can only credit your kills once a day, come back later."})
					end
				elseif(menuOption=="Donations") then
					if(os.time()>=player.registry["bjorndonation"]+86400) then
					player:dialogSeq({t,"We are always in need of material such as ore, wood and wool. We will gladly accept any donation to our cause. Each donation is worth 25 points."},1)
						local dona=player:menuString2("What do you wish to donate?",donations)
							if(dona=="50 Ash log") then
								if(player:hasItem("ash_log",50) == true) then
									player:removeItem(185,50)
									player.registry["bjornpointscurrent"]=player.registry["bjornpointscurrent"]+25
									player.registry["bjornpointstotal"]=player.registry["bjornpointstotal"]+25
									player.registry["bjorndonation"]=os.time()
										if(player.registry["bjornpointstotal"]<1000) then
											player:removeLegendbyName("bjornlevel")
											player:addLegend("Friend amongst the Bjorn tribe","bjornlevel",2,128)
										elseif(player.registry["bjornpointstotal"]>=1000 and player.registry["bjornpointstotal"]<5000) then
											player:removeLegendbyName("bjornlevel")
											player:addLegend("Regarded amongst the Bjorn tribe","bjornlevel",2,128)
										elseif(player.registry["bjornpointstotal"]>=5000 and player.registry["bjornpointstotal"]<15000) then
											player:removeLegendbyName("bjornlevel")
											player:addLegend("Esteemed amongst the Bjorn tribe","bjornlevel",2,128)
										elseif(player.registry["bjornpointstotal"]>=15000 and player.registry["bjornpointstotal"]<30000) then
											player:removeLegendbyName("bjornlevel")								
											player:addLegend("Revered amongst the Bjorn tribe","bjornlevel",2,128)
										elseif(player.registry["bjornpointstotal"]>=30000) then
											player:removeLegendbyName("bjornlevel")
											player:addLegend("Worshipped amongst the Bjorn tribe","bjornlevel",2,128)
										end
									player:dialogSeq({t,"Thank you for your donation!"})
								else
									player:dialogSeq({t,"You do not have the required items."})
								end
							elseif(dona=="50 Tin ore") then
								if(player:hasItem("tin_ore",50) == true) then
									player:removeItem(181,50)
									player.registry["bjornpointscurrent"]=player.registry["bjornpointscurrent"]+25
									player.registry["bjornpointstotal"]=player.registry["bjornpointstotal"]+25
									player.registry["bjorndonation"]=os.time()
										if(player.registry["bjornpointstotal"]<1000) then
											player:removeLegendbyName("bjornlevel")
											player:addLegend("Friend amongst the Bjorn tribe","bjornlevel",2,128)
										elseif(player.registry["bjornpointstotal"]>=1000 and player.registry["bjornpointstotal"]<5000) then
											player:removeLegendbyName("bjornlevel")
											player:addLegend("Regarded amongst the Bjorn tribe","bjornlevel",2,128)
										elseif(player.registry["bjornpointstotal"]>=5000 and player.registry["bjornpointstotal"]<15000) then
											player:removeLegendbyName("bjornlevel")
											player:addLegend("Esteemed amongst the Bjorn tribe","bjornlevel",2,128)
										elseif(player.registry["bjornpointstotal"]>=15000 and player.registry["bjornpointstotal"]<30000) then
											player:removeLegendbyName("bjornlevel")								
											player:addLegend("Revered amongst the Bjorn tribe","bjornlevel",2,128)
										elseif(player.registry["bjornpointstotal"]>=30000) then
											player:removeLegendbyName("bjornlevel")
											player:addLegend("Worshipped amongst the Bjorn tribe","bjornlevel",2,128)
										end
									player:dialogSeq({t,"Thank you for your donation!"})
								else
									player:dialogSeq({t,"You do not have the required items."})
								end
							end
					else
						player:dialogSeq({t,"Thank you, but you can only donate one time a day! Come back later."})
					end
				elseif(menuOption=="Rewards I") then
					local rewards=player:menuString2("Your currently have: "..player.registry["bjornpointscurrent"].." points.\nYour total number of points is "..player.registry["bjornpointstotal"]..".",rewardsI)
						if(rewards=="10 points : 10 Amethyst") then
							if(player.registry["bjornpointscurrent"]>=10) then
								player.registry["bjornpointscurrent"]=player.registry["bjornpointscurrent"]-10
								player:sendMinitext("You exchanged 10 points for 10 Amethysts.")
								player:addItem(66,10)
							else
								player:dialogSeq({t,"You do not have enough points."})
							end
						elseif(rewards=="150 points: Bjorn battle gauntlet") then
							if(player.registry["bjornpointscurrent"]>=150) then
								player.registry["bjornpointscurrent"]=player.registry["bjornpointscurrent"]-150
								player:sendMinitext("You exchanged 150 points for a Bjorn battle gauntlet.")
								player:addItem(331,1)
							else
								player:dialogSeq({t,"You do not have enough points."})
							end
						elseif(rewards=="250 points: Bjorn shield") then
							if(player.registry["bjornpointscurrent"]>=250) then
								player.registry["bjornpointscurrent"]=player.registry["bjornpointscurrent"]-250
								player:sendMinitext("You exchanged 250 points for a Bjorn shield.")
								player:addItem(330,1)
							else
								player:dialogSeq({t,"You do not have enough points."})
							end
						end
				end
			end
			
        end)

}