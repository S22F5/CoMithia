thurlow = {
	click = async(function(player,npc)
		local t={graphic=convertGraphic(738,"monster"),color=7}
	        local opts = { }
		local optsbuy ={}
		local menuOption
		local menuOptionBuy

                              player.npcGraphic=t.graphic
			      player.npcColor=t.color
                              table.insert(opts,"Buy")
                              table.insert(opts,"Sell")
			      table.insert(optsbuy,"Woodcutting axe")
				  table.insert(optsbuy,"Marksmen bows")
			      table.insert(optsbuy,"Mage and Poet weaponry")    
                              if(#opts~=0) then
                                  menuOption=player:menuString("Welcome to my shop, Can I help you?",opts)
                                  if(menuOption=="Buy") then
						menuOptionBuy=player:menuString("What kind of object would you like to buy ?",optsbuy)
							if(menuOptionBuy=="Woodcutting axe") then
								player:buyExtend("Ahhh you wish to take down some trees?",{186,528})
							elseif(menuOptionBuy=="Mage and Poet weaponry") then
								player:buyExtend("What do you wish to buy?",{212,221,213,215,216,217,219,220})
							elseif(menuOptionBuy=="Marksmen bows") then
								player:buyExtend("What do you wish to buy?",{790,794,796,805})
							end
  											
                                 elseif(menuOption=="Sell") then
                                     player:sellExtend("What do you wish to sell?",{212,221,213,215,216,217,219,220})
                                 end
                              end
        end)
}