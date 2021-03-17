atkin = {
	click = async(function(player,npc)
		local t={graphic=convertGraphic(638,"monster"),color=0}
	        local opts = { }

                              player.npcGraphic=t.graphic
			      player.npcColor=t.color
                              table.insert(opts,"Buy")     
                              if(#opts~=0) then
                                  local menuOption=player:menuString("Hello! I've settled myself here to sell Mining Picks to the adventurers seeking fortune, are you interested in buying one? ",opts)
                                  if(menuOption=="Buy") then
                                     player:buyExtend("I have this most perfect pick for you, take a look:",{177,530})
                                  end
                              end
        end)

}