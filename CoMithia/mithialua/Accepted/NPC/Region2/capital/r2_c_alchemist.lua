r2_c_alchemist = {
click = async(function(player, npc)
	local npcG = {graphic = 0, color = 0}
	player.npcGraphic = npcG.graphic
	player.npcColor = npcG.color
	player.dialogType = 1
	r2_c_alchemist.quest(player, npc)
end),

quest = function(player, npc)

	local npcG = {graphic = 0, color = 0}
	local alchemist_wolf = player.quest["r2_c_alchemist_wolf"]
	local meteoriteExtraction = player.quest["meteoriteExtraction"]
	
	player.npcGraphic = npcG.graphic
	player.npcColor = npcG.color
	player.dialogType = 1
	player.lastClick = npc.ID
	
	local options = {}
	local menuStr
	local menu

	if (player.level >= 15 and alchemist_wolf < 250) then
		table.insert(options, "Werewolves")
	end
	
	if (meteoriteExtraction > 0 and meteoriteExtraction < 250) then
		table.insert(options, "Identify rock")
	end

	if (#options > 0) then
		menuStr = player:menuString("Which quest?", options)
		if (menuStr == "Werewolves") then
			local i = {graphic = convertGraphic(1531, "item"), color = 0}
			local m = {graphic = convertGraphic(570, "monster"), color = 12}
			local b = {graphic = convertGraphic(245, "item"), color = 0}

			if (alchemist_wolf == 0) then
				if (player.level >= 15) then
					player:dialogSeq({npcG, "Blast! I must make this antidote! So many people... -fidgets-",
					i, "Wofl pelts! I need them! -looks up from his work- You, go get them!"}, 1)
					player.quest["r2_c_alchemist_wolf"] = 1
				else
					player:dialogSeq({npcG, "Blast! I must make this antidote! So many people... -fidgets-",
					d, "Get stronger, come help! (15th Insight)"}, 1)
				end
			elseif (alchemist_wolf == 1) then
				if (player:hasItem(4, 1) == true) then
					player:dialogSeq({npcG, "-snatches the wolf pelt and looks it over- Perfect! Come back later, more work to do. (20th Insight)"}, 1)
					player:removeItem(4, 1)
					player:addGold(2500)
					player:giveXP(15000)
					player.quest["r2_c_alchemist_wolf"] = 2
				else
					player:dialogSeq({i, "Hurry, they might get you next!"}, 1)
				end
			elseif (alchemist_wolf == 2) then
				if (player.level >= 20) then
					player:dialogSeq({npcG, "Go, get it! Now! Must hurry...",
					b, "Werewolf blood! Final ingredient, go get it, save people!",
					m, "Get out of here, help the citizens!"}, 1)
					player.quest["r2_c_alchemist_wolf"] = 3
				else
					player:dialogSeq({npcG, "Go, get it! Now! Must hurry...",
					d, "Come back later, more work to do. (20th Insight)"}, 1)
				end
			elseif (alchemist_wolf == 3) then
				if (player:hasItem(5, 1) == true) then
					player:dialogSeq({npcG, "-gasps- Is that what... Let me see that! -snatches the werewolf blood-",
					d, "-drops some blood into a mixture- Here goes nothing! Take your money and go, must complete my research... -kaboom-"}, 1)
					player:addLegend("Killed the Great Werewolf. "..curT(), "werewolf", 10, 80)
					player:removeItem(5, 1)
					player:addGold(5000)
					player:giveXP(200000)
					player.quest["r2_c_alchemist_wolf"] = 250
				else
					player:dialogSeq({npcG, "Hurry, must go faster!"}, 1)
				end
			else
				if (not player:hasLegend("werewolf")) then
					player:addLegend("Killed the Great Werewolf. "..curT(), "werewolf", 10, 80)
				end
				
				player:dialogSeq({npcG, "Leave me be!"}, 1)
			end
		elseif (menuStr == "Identify rock") then
			if (meteoriteExtraction > 0 and meteoriteExtraction < 250) then
				local rockG = {graphic = Item("sample_rock").icon, color = Item("sample_rock").iconC}
				local meteoriteG = {graphic = Item("meteorite_rock").icon, color = Item("meteorite_rock").iconC}
				options = {"Bomi needs this rock identified.",
				"Erm... nothing! Sorry!"}
				menu = player:menu("*He lifts his goggles up* What can I do for you?! Hm?!", options)

				if (menu == 1) then
					if (player:hasItem("sample_rock", 1) == true) then
						if (meteoriteExtraction > 10) then
							player:dialogSeq({npcG, "You have spent so much time near that meteorite that you have a strange glow, let me look.",
							"Your presence alone has turned this stone into a rare mineral, I believe it to be what Bomi needs."}, 1)
								player.quest["meteoriteExtraction"] = 250
								player:removeItem("sample_rock", 1)
								player:addItem("meteorite_rock", 1)
						else
							player:dialogSeq({rockG, "Ah, yes very good. Let me see! *Pours a small jar of purple liquid over the stone*"}, 1)
							local rand = math.random(100)
							if (rand < 10) then
								player.quest["meteoriteExtraction"] = 250
								player:removeItem("sample_rock", 1)
								player:addItem("meteorite_rock", 1)
								player:dialogSeq({meteoriteG, "The rock has a strange dim glow as he pours a small jar of purple liquid...",
								"This is some very old material. Divine in nature for certain. Take it back to Bomi."}, 1)
							elseif (rand < 50) then
								player:removeItem("sample_rock", 1)
								player.quest["meteoriteExtraction"] = meteoriteExtraction + 1
								player:dialogSeq({rockG, "*The rock hums a bit* Hrm... well this isn't a normal rock but it's no meteorite.",
								"Some sort of other element. I'm going to keep this and run more tests."}, 1)
							else
								player:removeItem("sample_rock", 1)
								player.quest["meteoriteExtraction"] = meteoriteExtraction + 1
								player:dialogSeq({rockG, "Well, this is actually just a rock. Nothing I can get from this."}, 1)
							end
						end
					else
						player:dialogSeq({npcG, "I can't identify something you don't have!"}, 1)
					end
				elseif (menu == 2) then
					--exit
				end
			end
		end
	end
end,

action = function(npc)
	local questText = {"This doesn't smell right...",
	"I need to stop lighting myself on fire.",
	"Err... how much of this was I supposed to add? Maybe a bit more..."}
	
	npc:talk(0, "Alchemist: "..questText[math.random(#questText)])
end
}