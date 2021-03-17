fildas = {
	click = async(function(player,npc)
		local t={graphic=convertGraphic(86,"monster"),color=10}
	        local opts = { }
		table.insert(opts,"Yes")
		table.insert(opts,"No")


                              player.npcGraphic=t.graphic
			      player.npcColor=t.color
				
			if(player.level>=86) then
				player:dialogSeq({t,"These damned pirates are infesting us, raiding and killing our citizens like we're dogs!",t,"I wish someone would give them a good lesson, but I'm too weak to do so. I've spotted their Hideout to the north east, if you'd like to try and pay them a visit, then I'd gladly use my boat to bring you there."},1)
        			local choice=player:menuString2("Do you want to reach the pirate Hideout ?",opts)
					if(choice=="Yes") then
							player:warp(43,57,95)
							player:sendMinitext("You sail for a few minutes until Fildas drops you on a little Island")
					else
							player:dialogSeq({t,"Alright, if you change your mind, just let me know."})
					end
			else
				player:dialogSeq({t,"These damned pirates are infesting us, raiding and killing our citizens like we're dogs!"})
			end
		end)			
}
