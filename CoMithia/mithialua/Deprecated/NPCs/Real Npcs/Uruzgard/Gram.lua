gram = {
	click = async(function(player,npc)
		local t={graphic=convertGraphic(61,"monster"),color=3}
	        local opts = { }

                              player.npcGraphic=t.graphic
			      player.npcColor=t.color
                              table.insert(opts,"Buy")
                              table.insert(opts,"Sell")     
                              if(#opts~=0) then
                                  local menuOption=player:menuString("Hey there. Have fun, play a game?",opts)
                                  if(menuOption=="Buy") then
                                     player:buyExtend("What do you wish to buy?",{436,437})
                                  elseif(menuOption=="Sell") then
                                     player:sellExtend("What do you wish to sell?",{436,437})
                                  end
                              end
        end)

}