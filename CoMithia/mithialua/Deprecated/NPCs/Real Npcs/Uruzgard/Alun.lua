alun = {
	click = async(function(player,npc)
		local t={graphic=convertGraphic(181,"monster"),color=9}
                local opts = { }
                table.insert(opts,"Yes")
                table.insert(opts,"No")
		                
		if(player.registry["suggestionquest"]==1) then
			player:dialogSeq({t,"Hello there! You say Taar sent you? I assume he needs more Delicate Fish. You are in luck, my friend! I just got a fresh shipment.",t,"If it was not for that man, I would be completely out of business. Tell him the price is 10,000 coins a piece.",t,"What do you mean he didn't give you any money? Oh bother, how am I going to feed my pet snakes? They are my only family!",t,"Look, I'll cut you a deal. If you can bring me 30 Bloody Rat meat, I will trade you for the 10 Delicate Fish."},1)
			if(player:hasItem("bloody_rat_meat",30) == true) then
				player:removeItem("bloody_rat_meat",30)
				player:addItem("delicate_fish",10)
				player.registry["suggestionquest"]=2
				player:dialogSeq({t,"Ah I see you have the rat meat! I am a man of my word, here are your fish! Pleasure doing business with you!"})
			end
		else
			player:dialogSeq({t,"Good day to you!"})
		end

	end)
}