tocca = {
	click = async(function(player,npc)
		local t={graphic=convertGraphic(69,"monster"),color=30}
	        local opts = { }

                              player.npcGraphic=t.graphic
			      player.npcColor=t.color
                              table.insert(opts,"Buy")
                              table.insert(opts,"Sell")
                              table.insert(opts,"Deposit Item")
                              table.insert(opts,"Withdraw Item")
                              table.insert(opts,"Deposit Money")
                              table.insert(opts,"Withdraw Money")
                              table.insert(opts,"Safety tokens")     
                              if(#opts~=0) then
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
                                  elseif(menuOption=="Safety tokens") then
                                     player:dialogSeq({t,"Hello!\n\nEvery day I see people appearing by magic in my Tavern!",t,"I once asked a fellow traveller and he said he was using a Safety token to get transported directly in one of Mithia's inns.",t,"If you ask me, this is powerful magic. Someone who's more accurate than myself with magical arts could probably tell you more about these."})
                                  end
                               end
        end)
}