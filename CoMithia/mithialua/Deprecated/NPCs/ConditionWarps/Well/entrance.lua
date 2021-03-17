hid1794106 = {
	click = async(function(player,npc)
		local t={graphic=convertGraphic(752,"monster"),color=0}
	        local opts = { }
		if(player.level<16) then
			player:sendMinitext("You feel you shouldn't get anywhere closer yet.")
			player:warp(17,94,107)
			return
		end


		if(player:hasItem(79,1) == true and player.registry["thewell"]>=5) then
			player.npcGraphic=t.graphic
			player.npcColor=t.color
			table.insert(opts,"Yes")
			table.insert(opts,"No")
			local menuOption=player:menuString("You found the rope! Are you ready to descend in the in the well?",opts)
			if(menuOption=="Yes") then
				player:warp(32,7,4)
				player:sendMinitext("You carefully tie the rope to a rock nearby and descend in the well.")
				return
			end
			if(menuOption=="No") then
				player:warp(17,94,107)
				player:sendMinitext("Maybe next time...")
				return
		        end
		  end
		  if(player:hasItem(79,1) ~= true) then
			
			     player:dialogSeq({t,"You hear odd rumbles and roars from beneath. Venturing down there will require a rope..."})
			     return
                  end
        end)
}