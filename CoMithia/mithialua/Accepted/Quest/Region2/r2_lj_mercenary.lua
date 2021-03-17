r2_lj_mercenary = {
click = async(function(player,npc)
	local npcG = {graphic = 0, color = 0}
	player.npcGraphic = npcG.graphic
	player.npcColor = npcG.color
	player.dialogType = 1
	local wolfQuest = player.quest["wolfQuest"]
	local wolfQuestRepeat = player.quest["wolfQuestRepeat"]
	local nanaG = {graphic = convertGraphic(205, "monster"), color = 9}
	local mangyWolfG = {graphic = convertGraphic(572, "monster"), color = 3}--81
	local angryWolfG = {graphic = convertGraphic(623, "monster"), color = 3}--82
	local timberWolfG = {graphic = convertGraphic(571, "monster"), color = 3}--83
	local direWolfG = {graphic = convertGraphic(23, "monster"), color = 3}--84
	local options = {}
	local menu
	local killAmount = 25 + (player.level * 5)
	local killCount81 = player:killCount(81)
	local killCount82 = player:killCount(82)
	local killCount83 = player:killCount(83)
	local killCount84 = player:killCount(84)
	local killTotal = killCount81 + killCount82 + killCount83 + killCount84
	local wQKA = player.registry["wolfQuestKillAmount"]
	
	if (wolfQuest == 0) then--first time
		if (player.level >= 12) then
			player:dialogSeq({npcG, "Hey there, you look like you can handle yourself."}, 1)
			options = {"I'm in.", "Who are you?", "No, thanks."}
			menu = player:menu("Would you be interested in a job?", options)
			if (menu == 1) then
				player:dialogSeq({npcG, "Well, the job seems quite easy; but once I got to it I found it was different.",
				nanaG, "The grandma in Shepton posted on the mercenary board an E-ranked job, it was supposed to be protect the sheep in Sudden Valley from the wolves.",
				mangyWolfG, "But after a couple of days I realized there are more wolves than I could handle, so I have been asking if anyone wants to help.\n\nThis is certainly not an E-ranked job.",
				npcG, "I'm willing to share the bounty; I just want to finish this job so I can move on!",
				mangyWolfG, "Come back to me every "..killAmount.." wolves you kill, for a reward.\n\nThis is the mangy wolf.",
				angryWolfG, "This is the angry wolf.",
				timberWolfG, "This is the timber wolf.",
				direWolfG, "This is the dire wolf.",
				npcG, "They all count towards the "..killAmount.." that you need to kill."}, 1)
				player.quest["wolfQuest"] = 1
				player.registry["wolfQuestKillAmount"] = killAmount
				player:flushKills(81)
				player:flushKills(82)
				player:flushKills(83)
				player:flushKills(84)
			elseif (menu == 2) then
				player:dialogSeq({npcG, "I'm a mercenary; part of a mercenary guild.\n\nWe take jobs from citizens in exchange for money or resources.",
				"But right now, I'm on a job and the job has taken longer than I expected.\n\nI really need a break."}, 1)
			elseif (menu == 3) then
				--CLOSE
				return
			end
		else
			player:dialogSeq({npcG, "Hmm, I need some help, but you don't look like you can handle it yet."}, 1)
			return
		end
	elseif (wolfQuest == 1) then
		if (killTotal >= wQKA) then
			player:dialogSeq({npcG, "Thanks for dispatching those wolves.\n\nHere is your part of the bounty."}, 1)
			player.quest["wolfQuest"] = 249
			player:addGold(1500)
			player:giveXP(25000)
			player:flushKills(81)
			player:flushKills(82)
			player:flushKills(83)
			player:flushKills(84)
			player.registry["wolfQuestKillAmount"] = 0
			
		else
			player:dialogSeq({npcG, "You have killed "..killTotal.." wolves out of "..wQKA..".",
			"Wolves killed:\n"..killCount81.." mangy wolves\n"..killCount82..
			" angry wolves\n"..killCount83.." timber wolves\n"..killCount84.." dire wolves."}, 1)
			return
		end
	elseif (wolfQuest == 249) then--Transition from quest to repeatable.
		player:dialogSeq({npcG, "Argh, those wolves, there are just too many of them!"}, 1)
		player.quest["wolfQuest"] = 250
	elseif (wolfQuest == 250 and wQKA == 0) then--main quest completed
		player:dialogSeq({npcG, "Well, there's just too many of them! Would you like to go again? I have some bounty left."}, 1)
		options = {"Sure.", "No thanks."}
		menu = player:menu("Would you like to help me slaughter some more wolves?", options)
		if (menu == 1) then
			player:dialogSeq({npcG, "I'm willing to share the bounty; I just want to finish this job so I can move on!",
			mangyWolfG, "Come back to me every "..killAmount.." wolves you kill, for a reward.\n\nThis is the mangy wolf.",
			angryWolfG, "This is the angry wolf.",
			timberWolfG, "This is the timber wolf.",
			direWolfG, "This is the dire wolf.",
			npcG, "They all count towards the "..killAmount.." that you need to kill."}, 1)
			player.registry["wolfQuestKillAmount"] = killAmount
			player:flushKills(81)
			player:flushKills(82)
			player:flushKills(83)
			player:flushKills(84)
		elseif (menu == 2) then
			player:dialogSeq({npcG, "Well if you change your mind let me know."}, 1)
			return
		end
	elseif (wQKA > 0) then--repeating
		if (killTotal >= wQKA) then
			player:dialogSeq({npcG, "Thanks for dispatching those wolves.\n\nHere is your part of the bounty."}, 1)
			player.quest["wolfQuestRepeat"] = wolfQuestRepeat + 1
			player:addGold(350)
			--player:giveXP()
			player:flushKills(81)
			player:flushKills(82)
			player:flushKills(83)
			player:flushKills(84)
			player.registry["wolfQuestKillAmount"] = 0			
		else
			player:dialogSeq({npcG, "You have killed "..killTotal.." wolves out of "..wQKA..".",
			"Wolves killed:\n"..killCount81.." mangy wolves\n"..killCount82..
			" angry wolves\n"..killCount83.." timber wolves\n"..killCount84.." dire wolves."}, 1)
			return
		end
	else
		player:dialogSeq({npcG, "We have no business."}, 1)
	end
end),

action = function(npc)
	local str = {"Mercenary: Ugh, I thought this would be an easy job.",
	"Mercenary: I wonder if anyone can help me with this job.",
	"Mercenary: The wolves are getting on my nerves.",
	"Mercenary: Hey there, interested in a job?",
	"Mercenary: What nerve from that grandma to post this as an E-rank job."}
	local rstr = math.random(#str)

	if (math.random(1000) >= 850) then
		npc:talk(0,""..str[rstr])
	end
end

}