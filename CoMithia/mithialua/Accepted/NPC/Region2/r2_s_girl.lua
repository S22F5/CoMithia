r2_s_girl = {
click = async(function(player, npc)
	local npcG = {graphic = convertGraphic(npc.look, "monster"), color = npc.lookColor}
	player.npcGraphic = npcG.graphic
	player.npcColor = npcG.color
	player.dialogType = 0
	local r2_c_beggar = player.quest["r2_c_beggar"]
	local quest = player.quest["r2_s_girl"]
	
	if (r2_c_beggar < 7 and quest == 0) then
		player:dialogSeq({npcG, "I used to know a boy in Areci, haven't talked to him in long time."}, 1)
	elseif (r2_c_beggar == 7 and quest == 0) then
		if (math.random(100) < 15) then
			player:dialogSeq({npcG, "Did you just mention Checkers?\n\nYou know Checkers?",
			"Oh so Checkers wanted to know how I am doing?",
			"\nTell him the hen laid an egg."}, 1)
			player.quest["r2_s_girl"] = 1
			player.quest["r2_c_beggar"] = 8
		else
			randString = {"Uh? Who are you?", "Do I know you?",
			"I am not supposed to talk to strangers.", "I am sorry, I do not know you.",
			"Stranger! stranger!!! Help! He wants to kidnap me!",
			"I have never seen you around before.", "What do you want?",
			"Leave me alone!", "Do you see my going up to strangers and randomly talking to them?\n\nNo? Then why do you?",
			"Are you here to give me a quest?\n\nOh, what did you say?"}
			player:dialogSeq({npcG, randString[math.random(#randString)]}, 1)
		end
	elseif (quest == 1) then
		if (r2_c_beggar == 10) then
			player:dialogSeq({npcG, "Look who's back!\n\nDid you deliver the message to Checkers?"}, 1)
			options = {"Yes", "No"}
			menu = player:menuString("So will you help me?", options)
			if (menu == "Yes") then
				player.quest["r2_s_girl"] = 2
				player:flushKills(10002)
				player:dialogSeq({npcG, "Great!\n\nThe other day I was taking a stroll around Minefield and I saw this terrifying dusky squirrel.",
				"If you could get rid of thirty of them, I would be most glad."}, 1)
			elseif (menu == "No") then
				player:dialog("You are rude.\n\n\nGet lost!", {})
			end
		else
			player:dialogSeq({npcG, "Did you know grandma near the well uses wool as a wig?\n\nHa ha ha ha!"}, 1)
		end
	elseif (quest == 2) then--1
		if (player:killCount(10002) >= 30) then
			player:flushKills(10002)
			player.quest["r2_s_girl"] = 3
			xp = getExp(player, 12)
			player:giveXP(xp)
		else
			player:dialogSeq({npcG, "You still need to kill another "..(30 - player:killCount(10002)).." dusky squirrels."}, 1)
		end
	elseif (quest == 3) then
		if (r2_c_beggar == 10) then
			player:dialogSeq({npcG, "Did you know grandma near the well uses wool as a wig?\n\nHa ha ha ha!"}, 1)
		elseif (r2_c_beggar == 11) then
			player:dialog("I have nothing for you now, come back later.", {})
		elseif (r2_c_beggar == 12) then
			if (player:killCount(10001) >= 5) then
				player:flushKills(10001)
				player.quest["r2_c_beggar"] = 13
				player:dialogSeq({npcG, "Checkers told you to kill 5 quick brown foxes? I didn't tell him that!",
				"Check back with Checkers for the right instructions!"}, 1)
			else
				player:dialog("I think Checkers was looking for you.", {})
			end
		end
	elseif (quest == 4) then
		if (player:killCount(10001) >= 10) then
			player:flushKills(10001)
			player.quest["r2_s_girl"] = 5
			player.quest["r2_c_beggar"] = 14
			xp = getExp(player, 12)
			player:giveXP(xp)
			player:dialogSeq({npcG, "Finally!\n\nWhy can't people follow instructions?"}, 1)
		else
			player:dialog("Did you kill the 10 quick brown foxes yet?", {})
		end		
	elseif (quest == 5) then
		player:dialog("Well, there's nothing for you for the time being. Thanks for everything!", {})
		--?
	else
		--nothing
	end
	
	
end),

action = function (npc, player)
	local m = npc.m
	local tile = getTileFacing(npc)
	local obj = getObjFacing(npc)
	local pass = getPassFacing(npc)
	if (m == 31) then
		local tileList = {42, 64, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110,
		111, 112, 113, 114, 115, 116}
		
		for i = 1, #tileList do
			if (tileList[i] == tile and pass == true) then--and obj == 0
				if(math.random(2) == 1) then
					--if (r2_s_girl.check_warp(npc) == false) then
						npc:move()
						break
--					end
				end
			end
		end
	else
		if (obj == 0 and pass == true) then
			--if (r2_s_girl.check_warp(npc) == false) then
				npc:move()
			--end
		end
	end

	if (math.random(5) < 3) then
		npc.side = math.random(0,3)
		npc:sendSide()
	end
end,

check_warp = function(npc)
	
	local m = npc.m
	local x = npc.x
	local y = npc.y
	local side = npc.side
	local check = false
	
	if (m == 31) then
		if (side == 0) then
			if (y == 10) then
				if (x == 5) then
					npc:warp(136, 9, 13)
					check = true
				elseif (x == 6) then
					npc:warp(136, 10, 13)
					check = true
				elseif (x == 8) then
					npc:warp(136, 18, 13)
					check = true
				elseif (x == 9) then
					npc:warp(136, 19, 13)
					check = true
				end
			elseif (y == 8) then
				if (x == 18) then
					npc:warp(22, 7, 12)
					check = true
				elseif (x == 19) then
					npc:warp(22, 8, 12)
					check = true
				end
			end
		end
	elseif (m == 136) then
		if (side == 2) then
			if (y == 13) then
				if (x == 9) then
					npc:warp(31, 5, 10)
					check = true
				elseif (x == 10) then
					npc:warp(31, 6, 10)
					check = true
				elseif (x == 18) then
					npc:warp(31, 8, 10)
					check = true
				elseif (x == 19) then
					npc:warp(31, 9, 10)
					check = true
				end
			end
		end
	elseif (m == 22) then
		if (side == 2) then
			if (y == 12) then
				if (x == 7) then
					npc:warp(31, 18, 8)
					check = true
				elseif (x == 8) then
					npc:warp(31, 19, 8)
					check = true
				end
			end
		end
	end
	--[[
	if (check == true) then
		npc:sendAction(0, 80)
		local pcBlocks = npc:getObjectsInArea(BL_PC)
		if (#pcBlocks > 0) then
			for i = 1, #pcBlocks do
				pcBlocks[i]:refresh()
			end
		end
	end]]--
	
	return check
end
}