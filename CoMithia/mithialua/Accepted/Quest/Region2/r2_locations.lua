r2_locations = {
quest = function(player, npc)
	local npcGraphics = {graphic = convertGraphic(npc.look, "monster"), color = npc.lookColor}
	local blank = {graphic = 0, color = 0}
	
	player.npcGraphic = npcGraphics.graphic
	player.npcColor = npcGraphics.color
	player.lastClick = npc.ID
	player.dialogType = 0
	
	if (player.quest["locations"] == 0 and npc.id == 136) then
		player:dialogSeq({npcGraphics, "I see you are finally awake!",
			"You look a little confused, that was some wreck, I saw it all the way from here! You're on a beach a little ways from the town right now, I suggest you make your way towards there to seek some help.",
			"Head south to Sudden Valley ((17,49)), then east to Mithian Woods ((74,55)).",
			"Then South to Areci Mesuv ((30,74)), talk to the guard at the gates, he will explain more in detail."}, 1)
		player:giveXP(500)
		player.quest["locations"] = 1
	elseif (player.quest["locations"] == 1 and npc.id == 139) then
		player:dialogSeq({npcGraphics, "Hello! You must've been sent by Myuro. Welcome to our town, the Great City of Areci Mesuv, it has stood here for hundreds of years!",
			"Here once stood a mightly stronghold, until Corthol destroyed much of it.",
			"As we try to rebuild and restart, people are finally returning.",
			"To the south you will find the Castle in all it's glory, and where you can pick your path if you choose to stay here.",
			"To the Southeast is our market, inns and stables, a Smith, Tailor, Meat Seller, and an Alchemist.",
			"To the Farthest south is our Arena, Library, and a number of other useful buildings.",
			"To the West you will also find Stables and the Chapel.",
			"South of the market you will find our smith, head there, he will have work for you."}, 1)
		player:giveXP(500)
		player.quest["locations"] = 2
	elseif (player.quest["locations"] == 2 and npc.id == 64) then
		player:dialogSeq({npcGraphics, "New here are you? If you are staying we are always in need of a helping hand to rebuild the town.",
			"We are taking donations of crafts and gold, each donation will shape this town in a new way to make it as glorious as it once was.",
			"If you need something repaired, or perhaps need armor or weapons for a Rogue or Warrior, you are in the right place."}, 1)
		player:menu("However if you are in need of armor or weapons for a Poet or Mage, head to the Tailor to the left of here.", {"How can I acquire what is needed?"})
		player:dialogSeq({npcGraphics, "Im glad you are interested in helping! They can be acquired through gathering and crafting, head to Axefel, a small town to the north of here.",
			"Talk to Sharpe, she will be able to give you more information regarding crafts.",
			"Head north of Areci Mesuv, into the Mithian Woods. Keep heading north until you arrive at Axefel. ((32,35))"}, 1)
		player:giveXP(500)
		player.quest["locations"] = 3
	elseif (player.quest["locations"] == 3 and npc.id == 18) then
		player:menu("Hello young one! How can I help you today?", {"Tell me about crafting and gathering."})
		player:dialogSeq({npcGraphics, "Crafting is the process of gathering materials, processing them, and finally using those materials to make items. You can craft wood here in Axefel, wool in Shepton, and ore in the Minefield.",
			"To the west of Mithian woods is Shepton, in Sudden Valley, to the North is Minefield and the mining caverns.",
			"Oh! Before you leave, do you mind taking some wood back to Harom it should help a bit with the rebuilding that is going on. Thank you for your help, hope to see you around!"}, 1)
		player:addItem("wood_pile", 1)
		player:giveXP(500)
		player.quest["locations"] = 4
	elseif (player.quest["locations"] == 4 and npc.id == 139) then
		player:menu("Hello again!", {"I brought some wood from Sharpe."})
		player:dialogSeq({npcGraphics, "Thank you so much for your contribution it will help us rebuild towards becoming more prosperous in the future.",
			"Here is some gold and experience for all of your troubles and if you need any help don't hesistate to ask!"}, 1)
		player.lastClick = NPC("r2_c_judge").ID
		player.dialogType = 1
		player:dialogSeq({blank, "I heard the judge is looking for some help with the rats luring in the sewers, go find him near the courthouse. ((107, 34))"}, 1)
		player:removeItem("wood_pile", 1)
		player:addGold(250)
		player:giveXP(500)
		player.quest["locations"] = 250
	elseif (player.quest["locations"] == 250 and player.quest["r2_c_judge_rat"] == 0) then
		player.lastClick = NPC("r2_c_judge").ID
		player.dialogType = 1
		player:dialogSeq({blank, "You should go visit the judge. He's around the courthouse. ((107, 34))"}, 1)
	end
end
}