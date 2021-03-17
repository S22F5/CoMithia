npc001725 = {
	click = async(function(player,npc)
		player.npcGraphic=convertGraphic(836,"monster")
		player.npcColor=12
			
		if player.registry["tut2"]==0 then
			player:dialogSeq({"Hi there!  My name is Rolf, I'm a simple farmer with simple needs. THAT'S FARMING!","Unforunately, Farming hasn't been going so well since these damn rabbits seem to eat everything I grow."},1)
			player:addItem("Wooden stick",1)
			if player.sex==0 then player:addItem("rags_male",1) end
			if player.sex==1 then player:addItem("rags_female",1) end
			player.registry["tut2"]=1
			player:flushKills()
			player:dialogSeq({"I have given you some basic equipment..a Stick and some rags i have lying around..","Kill 10 Rabbits for me and bring me 5 Peas, I'll pay you for your work once you've done that."})
		elseif player.registry["tut2"]==1 then
			player.npcGraphic=convertGraphic(836,"monster")
			player.npcColor=12

			if player:killCount("Rabbit")>=10 and player:hasItem("Peas",5) == true then
				player:removeItem("Peas",5)
				player.registry["tut2"]=2
				player:dialogSeq({"Thank you so much!  You have no idea how much that has helped me.\n\n Go inside and talk to my wife for your reward."})
			else
				player:dialog("I'm waiting for those 10 rabbits and 5 peas...",{})
			end
		elseif player.registry["tut2"]==2 then
			player:dialog("Go talk to my wife dammit!",{})
		end

		player.npcGraphic=0
		player.npcColor=0

	end)
}
npc010503 = {
	click = async(function(player,npc)
		local t={convertGraphic(206,"monster"),1}
		player.npcGraphic=convertGraphic(206,"monster")
		player.npcColor=1
		if(player.registry["tut2"]==2) then
			player:giveXP(50)
			player:addSpell(1)
			player:sendMinitext("You have learned Recovery.")
			player.registry["tut2"]=3
			player:dialogSeq({t,"Thank you for helping my husband. In return, I have given you more insight into your soul, and given you the knowledge of recovering ones own wounds.","You should visit my husbands twin brother in Country Creek, His name is Ralf.  Maybe he has something you can help him with?"},0)

		elseif(player.registry["tut2"]<=2) then
			player:dialog("Please talk to my husband, he seems to be having some trouble..",{})
		else
			player:sendMinitext("She seems to be done talking to you...")
		end
	end)
}
npc030204 = {
	click = async(function(player,npc)
			player.npcGraphic=convertGraphic(836,"monster")
			player.npcColor=11
			if(player.registry["tut2"]==3) then
				player.registry["tut2"]=4
				player:dialogSeq({"Hey! Did my sister-in-law send you? Great! I don't really need anything, but my friend Grabthoor does(in the cave to the west).  He could use your help.","He doesn't come out because of his hideous looks, but I'm afraid he might have gone hungry, perhaps you could help him?"},0)
			else
				player:dialog("Please help my friend, he might be going hungry...",{})
			end
	end)
}

npc040507 = {
	click=async(function(player,npc)
			player.npcGraphic=convertGraphic(185,"monster")
			player.npcColor=23
			
			if(player.registry["tut2"]==4) then
				player.registry["tut2"]=5
				player:dialogSeq({"Peas...Chestnuts...Bring me!!!  Please?!?!","I sorry.  Please bring me chestnuts and peas! I love peas! I love chestnuts! I make soup from them.","If you bring me 5 each, I make worth your while! Me promise!"})
			elseif(player.registry["tut2"]==5) then
				if(player:hasItem("Peas",5) == true and player:hasItem("Chestnut",5) == true) then
					player:removeItem("peas",5)
					player:removeItem("chestnut",5)
					player:addItem("steel sword",1)
					player.registry["tut2"]=6
					player:dialog("Ooh, thank you! Here, I give you item.  I made promise. I keep..",{})
				else
					player:dialog("Where my peas? Where my nuts?",{})
				end
			end
	end)
}
