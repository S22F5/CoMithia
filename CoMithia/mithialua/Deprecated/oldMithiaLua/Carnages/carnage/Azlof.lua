azlof_carnage = {
	click=async(function(player,npc)
		local opts = { }
		local t={graphic=convertGraphic(38,"monster"),color=0}
                              player.npcGraphic=t.graphic
			      player.npcColor=t.color

		
		table.insert(opts,"Deposit money")
		table.insert(opts,"Withdraw money")
		table.insert(opts,"Deposit item")
		table.insert(opts,"Withdraw item")
		table.insert(opts,"Enter Carnage")
		if(player.registry["carnagehost"]>0) then
			table.insert(opts,"Hosts den")
		end

		local menuOption=player:menuString("Good day to you, "..player.name.."",opts)
		
				  if(menuOption=="Deposit item") then
                                     player:showBankAdd("What do you wish to deposit?")
                                  elseif(menuOption=="Withdraw item") then
                                     player:showBank("What do you wish to withdraw?")
                                  elseif(menuOption=="Deposit money") then
                                     player:bankAddMoney()
                                  elseif(menuOption=="Withdraw money") then
                                     player:bankWithdrawMoney()
                                  elseif(menuOption=="Enter Carnage") then
					player:dialogSeq({t,"Welcome, "..player.name..".\n\nBy entering the Carnage, you agree to obey the hosts and follow all the rules.",t,"The participation fee is 500 coins, click Next if you wish to enter the Carnage"},1)
					if(player.money>=500) then
						player.money=player.money-500
						player.armorColor=0
						player:updateState()
						player:sendStatus()
               					player:warp(2100,math.random(10,40),math.random(10,30))
						player.registry["carnageparticipations"]=player.registry["carnageparticipations"]+1
						player:removeLegendbyName("carnageparticipations")
						player:addLegend("Participated in "..player.registry["carnageparticipations"].." Carnages","carnageparticipations",1,51)
						--player:flushDuration()
						for x=1,600 do
							if(player:hasDuration(x)) then
								player:setDuration(x,0)
							end
						end
						player:sendMinitext("Azlof dispells and bleaches you.")
					else
						player:dialogSeq({t,"You do not have enough money!"})
					end
				elseif(menuOption=="Hosts den" and player.registry["carnagehost"]>0) then
						player:warp(2003,9,9)
				end
	end)
}