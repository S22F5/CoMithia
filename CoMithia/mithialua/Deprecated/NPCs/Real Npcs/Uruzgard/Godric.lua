godric = {
	click = async(function(player,npc)
		local t={graphic=convertGraphic(54,"monster"),color=15}
	        local opts = { }

                              player.npcGraphic=t.graphic
			      player.npcColor=t.color
                              table.insert(opts,"Buy")
                              table.insert(opts,"Sell")     
                              if(#opts~=0) then
                                  local menuOption=player:menuString("Hey there. Need a good piece of meat?",opts)
                                  if(menuOption=="Buy") then
                                     player:buyExtend("What do you wish to buy?",{28,5,6,25})
                                  elseif(menuOption=="Sell") then
                                     player:sellExtend("What do you wish to sell?",{5,6,7,29,30,207,742})
                                  end
                              end
        end)

}