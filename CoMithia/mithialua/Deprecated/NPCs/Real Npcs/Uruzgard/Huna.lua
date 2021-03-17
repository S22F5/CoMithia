huna = {
	click = async(function(player,npc)
		local t={graphic=convertGraphic(16,"monster"),color=10}
                local opts = { }
                table.insert(opts,"Yes")
                table.insert(opts,"No")
                
		if(player.state~=1) then
			player:dialogSeq({t,"I see you're alive and well going, good day to you."})
		else
			player.npcGraphic=t.graphic
			player.npcColor=t.color
			local menuOption=player:menuString("Even the best sometimes fall. Do you wish to be resurrected?",opts)
			if(menuOption=="Yes") then
				player.state=0
				player:addHealth(10000000)
				player:addMana(10000000)
				player:updateState()
				player:addHealth2(1)
				player:sendAnimation(96)
				player:playSound(112)
				player.registry["lastrez"]=os.time()
				npc:talk(0,"Huna: We shall meet again, " .. player.name.. ".")
			else
				player:dialogSeq({t,"Suit yourself, spirit. Come to visit me anytime."})
			end
		end
	end)
}