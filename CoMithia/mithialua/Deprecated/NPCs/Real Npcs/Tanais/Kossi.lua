kossi = {
	click = async(function(player,npc)
		local t={graphic=convertGraphic(839,"monster"),color=0}
	        local opts = { }

                              player.npcGraphic=t.graphic
			      player.npcColor=t.color
                              table.insert(opts,"Buy")
                              table.insert(opts,"Sell")
                              table.insert(opts,"Deposit Item")
                              table.insert(opts,"Withdraw Item")
                              table.insert(opts,"Deposit Money")
                              table.insert(opts,"Withdraw Money")
                              table.insert(opts,"Tanais tokens")     


                                local menuOption=player:menuString("Welcome to my shop, Can I help you?",opts)
                                if(menuOption=="Buy") then
                                        player:buyExtend("What do you wish to buy?",{16,24,25})
                                elseif(menuOption=="Sell") then
                                        player:sellExtend("What do you wish to sell?",{16,24,25})
                                elseif(menuOption=="Deposit Item") then
                                        player:showBankAdd("What do you wish to deposit?")
                                elseif(menuOption=="Withdraw Item") then
                                        player:showBank("What do you wish to withdraw?")
                                elseif(menuOption=="Deposit Money") then
                                        player:bankAddMoney()
                                elseif(menuOption=="Withdraw Money") then
                                        player:bankWithdrawMoney()
                                elseif(menuOption=="Tanais tokens") then
                                	player:dialogSeq({t,"If you provide me with a few safety tokens, I can transform them into for Tanais tokens for you."},1)
					local num=math.abs(tonumber(math.ceil(player:input("How many Safety tokens do you wish to transform"))))
						if(player:hasItem("safety_token",num) == true) then
								player:sendMinitext("You transformed "..num.." Safety tokens into Tanais tokens") 
								player:removeItem("safety_token",num)
								player:addItem("tanais_token",num)
						else
								player:dialogSeq({t,"You do not have enough Safety tokens."})
						end
										
                                  end
        end)
}