hauk = {
	click = async(function(player,npc)
		local t={graphic=convertGraphic(61,"monster"),color=5}
	        local opts = { }

                              player.npcGraphic=t.graphic
			      player.npcColor=t.color
                              table.insert(opts,"Buy")
                              table.insert(opts,"Sell")     
                              if(#opts~=0) then
                                  local menuOption=player:menuString("Hey there. Have fun, play a game?",opts)
                                  if(menuOption=="Buy") then
                                     player:buyExtend("What do you wish to buy?",{438,439,440,441,442,443,444,445,446,447,448,449})
                                  elseif(menuOption=="Sell") then
                                     player:sellExtend("What do you wish to sell?",{438,439,440,441,442,443,444,445,446,447,448,449})
                                  end
                              end
        end)

}