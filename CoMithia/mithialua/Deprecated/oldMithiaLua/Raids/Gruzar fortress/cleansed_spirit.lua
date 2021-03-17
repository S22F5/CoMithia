cleansed_spirit = {
	click=async(function(player)
		local t={graphic=convertGraphic(324,"monster"),color=0}
                player.npcGraphic=t.graphic
		player.npcColor=t.color

		if(player.state==1) then
			player.state=0
			player:addHealth(player.maxHealth)
			player:addMana(player.maxMagic)
			player:updateState()
			player:sendAnimation(177)
			return
		end
		player:dialogSeq({t,"Hello, adventurer.\n\nI am surprised you have managed to reach this place, I do not see many... living people around here. If they are, they usually do not stay that way for very long.",t,"I am afraid it is too late for me, but you could save a lot of people from certain death if you manage to defeat Gruzar.",t,"I should warn you however, his chamber is magically protected and you will not be able to enter it again for five minutes should you decide to fall back to safety, here with me.",t,"I will heal your wounds to the best of my abilities.\n\nGood luck, friend, Gruzar is a Master of the Dark Arts and you will need to throw everything you've got at him should you want to stand a chance in battle."},1)

	end)
}