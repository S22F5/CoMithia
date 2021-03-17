gleem = {
	click = async(function(player,npc)
		local t={graphic=convertGraphic(488,"monster"),color=30}
	        local opts = { }

                              player.npcGraphic=t.graphic
			      player.npcColor=t.color
                              table.insert(opts,"Buy")
                              table.insert(opts,"Sell")     
                              if(#opts~=0) then
                                  local menuOption=player:menuString("Hey there, how can I help you today?",opts)
                                  if(menuOption=="Buy") then
                                     player:buyExtend("What do you wish to buy?",{})
                                  elseif(menuOption=="Sell") then
                                     player:sellExtend("What do you wish to sell?",{"amethyst","shining_amethyst","chrysocolla","shining_chrysocolla","tigers_eye","shining_tigers_eye","reef_bead"})
                                  end
                              end
        end)

}