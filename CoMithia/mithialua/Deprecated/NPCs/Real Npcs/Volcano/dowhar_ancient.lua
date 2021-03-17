dowhar_ancient = {
	click = async(function(player,npc)
		local t={graphic=convertGraphic(251,"monster"),color=11}
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
			      table.insert(rewardsI,"150 points: Dowhar viridian band")
			      table.insert(rewardsI,"250 points: Dowhar shield")

   			
			if(player.registry["alliancebjorn"]==1) then
				player:dialogSeq({t,"We know you, you've been helping the Bjorn! Leave this place, you are not welcomed here!"})
				return
			end

			if(player.registry["alliancedowhar"]==0) then
				player:dialogSeq({t,"Good day. You should talk to Arrt'hal if you want to help us."})
				return
			end

			if(player.registry["alliancedowhar"]==1) then
				local menuOption=player:menuString("Welcome, friend.",opts)
				if(menuOption=="Daily duty") then
					if(os.time()>=player.registry["dowhardailyduty"]+86400) then
						player:dialogSeq({t,"You can help us by killing members of the Bjorn tribe.",t,"You can get credited for up to 10 tribesmen, 10 fighters and 1 leader per day.",t,"Tribesmen and fighters are both worth one point each, and their leader is worth five.",t,"Be careful as you will only be able to get your kills credited once a day, even if you killed less than the maximum amount authorized.",t,"Do you want me to credit your kills now?"},1)
						local credit=player:menuString2("Do you wish to credit your kills? Beware, this will reset your killing track.",opts2)
							if(credit=="Yes") then
								local fighter=player:killCount("bjorn_fighter")
								local tribe=player:killCount("bjorn_tribesman")
								local leader=player:killCount("bjorn_leader")
									if fighter>=10 then fighter=10 end
									if tribe>=10 then tribe=10 end
									if leader>=1 then leader=1 end
								local count=tribe+fighter+(leader*5)
								player.registry["dowharpointscurrent"]=player.registry["dowharpointscurrent"]+count
								player.registry["dowharpointstotal"]=player.registry["dowharpointstotal"]+count
								player:flushKills()
								player.registry["dowhardailyduty"]=os.time()
								if(player.registry["dowharpointstotal"]<1000) then
									player:removeLegendbyName("dowharlevel")
									player:addLegend("Friend amongst the Dowhar tribe","dowharlevel",2,128)
								elseif(player.registry["dowharpointstotal"]>=1000 and player.registry["dowharpointstotal"]<5000) then
									player:removeLegendbyName("dowharlevel")
									player:addLegend("Regarded amongst the Dowhar tribe","dowharlevel",2,128)
								elseif(player.registry["dowharpointstotal"]>=5000 and player.registry["dowharpointstotal"]<15000) then
									player:removeLegendbyName("dowharlevel")
									player:addLegend("Esteemed amongst the Dowhar tribe","dowharlevel",2,128)
								elseif(player.registry["dowharpointstotal"]>=15000 and player.registry["dowharpointstotal"]<30000) then
									player:removeLegendbyName("dowharlevel")								
									player:addLegend("Revered amongst the Dowhar tribe","dowharlevel",2,128)
								elseif(player.registry["dowharpointstotal"]>=30000) then
									player:removeLegendbyName("dowharlevel")
									player:addLegend("Worshipped amongst the Dowhar tribe","dowharlevel",2,128)
								end
								player:dialogSeq({t,"Your kills for the day have been credited"})
							else
								player:dialogSeq({t,"Suit yourself, friend."})
							end
					else
					player:dialogSeq({t,"You can only credit your kills once a day, come back later."})
					end
				elseif(menuOption=="Donations") then
					if(os.time()>=player.registry["dowhardonation"]+86400) then
					player:dialogSeq({t,"We are always in need of material such as ore, wood and wool. We will gladly accept any donation to our cause. Each donation is worth 25 points."},1)
						local dona=player:menuString2("What do you wish to donate?",donations)
							if(dona=="50 Ash log") then
								if(player:hasItem("ash_log",50) == true) then
									player:removeItem(185,50)
									player.registry["dowharpointscurrent"]=player.registry["dowharpointscurrent"]+25
									player.registry["dowharpointstotal"]=player.registry["dowharpointstotal"]+25
									player.registry["dowhardonation"]=os.time()
										if(player.registry["dowharpointstotal"]<1000) then
											player:removeLegendbyName("dowharlevel")
											player:addLegend("Friend amongst the Dowhar tribe","dowharlevel",2,128)
										elseif(player.registry["dowharpointstotal"]>=1000 and player.registry["dowharpointstotal"]<5000) then
											player:removeLegendbyName("dowharlevel")
											player:addLegend("Regarded amongst the Dowhar tribe","dowharlevel",2,128)
										elseif(player.registry["dowharpointstotal"]>=5000 and player.registry["dowharpointstotal"]<15000) then
											player:removeLegendbyName("dowharlevel")
											player:addLegend("Esteemed amongst the Dowhar tribe","dowharlevel",2,128)
										elseif(player.registry["dowharpointstotal"]>=15000 and player.registry["dowharpointstotal"]<30000) then
											player:removeLegendbyName("dowharlevel")								
											player:addLegend("Revered amongst the Dowhar tribe","dowharlevel",2,128)
										elseif(player.registry["dowharpointstotal"]>=30000) then
											player:removeLegendbyName("dowharlevel")
											player:addLegend("Worshipped amongst the Dowhar tribe","dowharlevel",2,128)
										end
									player:dialogSeq({t,"Thank you for your donation!"})
								else
									player:dialogSeq({t,"You do not have the required items."})
								end
							elseif(dona=="50 Tin ore") then
								if(player:hasItem("tin_ore",50) == true) then
									player:removeItem(181,50)
									player.registry["dowharpointscurrent"]=player.registry["dowharpointscurrent"]+25
									player.registry["dowharpointstotal"]=player.registry["dowharpointstotal"]+25
									player.registry["dowhardonation"]=os.time()
										if(player.registry["dowharpointstotal"]<1000) then
											player:removeLegendbyName("dowharlevel")
											player:addLegend("Friend amongst the Dowhar tribe","dowharlevel",2,128)
										elseif(player.registry["dowharpointstotal"]>=1000 and player.registry["dowharpointstotal"]<5000) then
											player:removeLegendbyName("dowharlevel")
											player:addLegend("Regarded amongst the Dowhar tribe","dowharlevel",2,128)
										elseif(player.registry["dowharpointstotal"]>=5000 and player.registry["dowharpointstotal"]<15000) then
											player:removeLegendbyName("dowharlevel")
											player:addLegend("Esteemed amongst the Dowhar tribe","dowharlevel",2,128)
										elseif(player.registry["dowharpointstotal"]>=15000 and player.registry["dowharpointstotal"]<30000) then
											player:removeLegendbyName("dowharlevel")								
											player:addLegend("Revered amongst the Dowhar tribe","dowharlevel",2,128)
										elseif(player.registry["dowharpointstotal"]>=30000) then
											player:removeLegendbyName("dowharlevel")
											player:addLegend("Worshipped amongst the Dowhar tribe","dowharlevel",2,128)
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
					local rewards=player:menuString2("Your currently have: "..player.registry["dowharpointscurrent"].." points.\nYour total number of points is "..player.registry["dowharpointstotal"]..".",rewardsI)
						if(rewards=="10 points : 10 Amethyst") then
							if(player.registry["dowharpointscurrent"]>=10) then
								player.registry["dowharpointscurrent"]=player.registry["dowharpointscurrent"]-10
								player:sendMinitext("You exchanged 10 points for 10 Amethysts.")
								player:addItem(66,10)
							else
								player:dialogSeq({t,"You do not have enough points."})
							end
						elseif(rewards=="150 points: Dowhar viridian band") then
							if(player.registry["dowharpointscurrent"]>=150) then
								player.registry["dowharpointscurrent"]=player.registry["dowharpointscurrent"]-150
								player:sendMinitext("You exchanged 150 points for a Dowhar viridian band.")
								player:addItem(149,1)
							else
								player:dialogSeq({t,"You do not have enough points."})
							end
						elseif(rewards=="250 points: Dowhar shield") then
							if(player.registry["dowharpointscurrent"]>=250) then
								player.registry["dowharpointscurrent"]=player.registry["dowharpointscurrent"]-250
								player:sendMinitext("You exchanged 250 points for a Dowhar shield.")
								player:addItem(329,1)
							else
								player:dialogSeq({t,"You do not have enough points."})
							end
						end
				end
			end
			
        end)

}