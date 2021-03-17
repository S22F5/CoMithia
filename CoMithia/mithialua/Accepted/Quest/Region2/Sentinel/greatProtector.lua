greatProtector = {
questIndex = function(player, npc)
	--npc:talk(0, ""..player.name.." "..player.quest["greatProtector"])

	local greatProtector = player.quest["greatProtector"]

	if (greatProtector == 0) then--NOT STARTED
		gP.r2_warrior_trainer(player, npc, greatProtector)
		gP.r2_knight(player, npc, greatProtector)
	elseif (greatProtector == 1) then
		gP.r2_warrior_trainer(player, npc, greatProtector)--REMINDER
		gP.r2_knight(player, npc, greatProtector)--CONT 1...
	elseif (greatProtector == 2) then
		gP.r2_knight(player, npc, greatProtector)--CONT 2...
	elseif (greatProtector == 3) then
		gP.r2_knight(player, npc, greatProtector)--REMINDER
		gP.r2_c_smith(player, npc, greatProtector)--CONT 1...
	elseif (greatProtector == 4) then--
		gP.r2_c_smith(player, npc, greatProtector)--REMINDER
		gP.r2_m_smith(player, npc, greatProtector)--CONT 1...
	elseif (greatProtector == 5) then--
		gP.r2_m_smith(player, npc, greatProtector)--REMINDER
		gP.r2_lj_tam(player, npc, greatProtector)--CONT 1...
	elseif (greatProtector == 6) then--
		gP.r2_lj_tam(player, npc, greatProtector)--REMINDER
		gP.r2_c_packager(player, npc, greatProtector)--CONT 1...
	elseif (greatProtector == 7) then--
		gP.r2_c_packager(player, npc, greatProtector)--REMINDER
		gP.r2_lj_tam(player, npc, greatProtector)--STEP 2 (CONT...)
	elseif (greatProtector == 8) then--
		gP.r2_lj_tam(player, npc, greatProtector)--STEP 2 REMINDER
		gP.r2_m_smith(player, npc, greatProtector)--STEP 2 (CONT...)
	elseif (greatProtector == 9) then--
		gP.r2_m_coal(player, npc, greatProtector)--CONT 1...
		gP.r2_m_smith(player, npc, greatProtector)--STEP 2 REMINDER
	elseif (greatProtector == 10) then--
		gP.r2_m_coal(player, npc, greatProtector)--REMINDER
		gP.r2_c_smith(player, npc, greatProtector)--STEP 2 (CONT...)
	elseif (greatProtector == 11) then--
		--gP.r2_c_smith(player, npc, greatProtector)--STEP 2 REMINDER
		--gP.r2_c_guard(player, npc, greatProtector)--CONT 1...
	elseif (greatProtector == 12) then--
		gP.r2_c_smith(player, npc, greatProtector)--CONT 1...
	elseif (greatProtector == 13) then--
		gP.r2_c_smith(player, npc, greatProtector)--REMINDER
		gP.r2_c_m_guard(player, npc, greatProtector)--CONT 1...
	elseif (greatProtector == 249) then--
		gP.r2_c_m_guard(player, npc, greatProtector)--REMINDER
		gP.r2_knight(player, npc, greatProtector)--FINISH
	end	
end
}

gP = {
r2_warrior_trainer = function(player, npc, step)
--800k exp sold to start player.expSold
	if (npc.yname == "r2_warrior_trainer") then--Venjis
		local npcG = {graphic = convertGraphic(npc.look, "monster"), color = npc.lookColor}
		player.npcGraphic = npcG.graphic
		player.npcColor = npcG.color
		player.dialogType = 1

		if (step == 0) then--NOT STARTED
			player:dialogSeq({npcG, "The knights are a valiant group of warriors, most notably filling the ranks of the military of Areci Mesuv. They are masters of a particular type of defensive martial arts and serve to protect our land and its inhabitants.",
			"General Kanthor is the leader of the knights and he can be found to the west of this castle in the office near the royal guard."},1)--ending in 1 is pause, 0 is exit
			player.quest["greatProtector"] = 1
		elseif (step == 1) then--BEGUN, REMINDER
		elseif (step == 250) then--FINISHED, CONGRATULATIONS
		end
	end
end,

r2_knight = function(player, npc, step)
--800k exp sold to start
	if (npc.yname == "r2_knight") then--Kanthor
		local npcG = {graphic = convertGraphic(npc.look, "monster"), color = npc.lookColor}
		player.npcGraphic = npcG.graphic
		player.npcColor = npcG.color
		player.dialogType = 1
		local menu
		local options = {}
		player.lastClick = npc.ID
		
		if (step == 0) then--NOT STARTED
			player:dialogSeq({npcG, "Hello young one. The knights are the protectors of Areci Mesuv, we guard the town and it's inhabitants and are the main officers and generals of the military in its current state.",
			"Since the very founding days of Areci Mesuv there were patrolmen and guards, usually being the strongest and most diligent inhabitants and settlers were chosen for the job;",
			"as the city began to grow and the threats from outsiders and beasts alike arose they began training amongst the ranks and practicing our own form of defensive martial arts.",
			"I have dedicated myself to the way of life that comes with being a soldier. In my old age I have become the 3rd general of our military and taken a back seat in regards to fighting battles; I'm now focused on training new members like yourself into the ranks of the knights.",
			"as well as developing wartime strategies and planning, first and foremost, to protect the city. If you are interested in becoming a Knight you must know it is no small task, not only must you dedicate your life to becoming a valiant and upstanding citizen, but to helping those who you protect.",
			"Are you ready to make that step?"}, 1)
			player.quest["greatProtector"] = 2
		elseif (step == 1) then--BEGUN, CONT 1...
			player:dialogSeq({npcG, "Hello young one, I was told you wanted to know more about us? The Knights are the protectors of Areci Mesuv, we guard the town and it's inhabitants and are the main officers and generals of the military in its current state.",
			"Since the very founding days of Areci Mesuv there were patrolmen and guards, usually being the strongest and most diligent inhabitants and settlers were chosen for the job;",
			"as the city began to grow and the threats from outsiders and beasts alike arose they began training amongst the ranks and practicing our own form of defensive martial arts.",
			"I have dedicated myself to the way of life that comes with being a soldier. In my old age I have become the 3rd general of our military and taken a back seat in regards to fighting battles; I'm now focused on training new members like yourself into the ranks of the knights.",
			"as well as developing wartime strategies and planning, first and foremost, to protect the city. If you are interested in becoming a Knight you must know it is no small task, not only must you dedicate your life to becoming a valiant and upstanding citizen, but to helping those who you protect.",
			"Let me know if you're still interested."}, 1)
			player.quest["greatProtector"] = 2
		elseif (step == 2) then
			options = {"Yes", "No"}
			menu = player:menu("Are you ready to take the first step towards becoming a Knight?", options)
			if (menu == 1) then--YES
				player:dialogSeq({npcG, "That is good to hear, but, you must be tested first. I need some things done and would like you to help.",
				"Please take this scroll to the smith for me, he is expecting it. I'm ordering some wares from him that will need to be delivered to the royal guard afterwards."}, 1)
				player.quest["greatProtector"] = 3
			elseif (menu == 2) then--NO
				player:dialog("Ah, well then. If you have a change of heart come back and see me.", npcG)
				player.quest["greatProtector"] = 0
			end
		elseif (step == 3) then--REMINDER
		elseif (step == 249) then--FINISHED, REWARD PENDING
			if (player.class == 1) then
				player:dialogSeq({npcG, "Ah, it seems you've finished."}, 1)
				options = {"Nobody had anything when they should have!", "It's my fault for being slow on the orders, it won't happen again."}
				menu = player:menu("But why did you take so long?", options)
				if (menu == 1) then--Blame
					player:dialogSeq({npcG, "I know this. I set it up so that everyone would have you running around town and through different areas to see your work ethic, see your determination, see if you could focus on getting a task done.",
					"It's important to be responsible for your actions in life; even if something truly is another person's fault you should look past that and focus on what's at hand, no excuses, no dwelling. You will have a lot of time to work on your character and discipline in your time as a knight, congratulations "..player.name.."."}, 1)
					player:addLegend("Great protector. "..curT(), "subpath", 16, 80)
					player.class = 7
					if (player.clan == 1) then
						player.clan = 0
					end
					player:status()
				elseif (menu == 2) then--Responsible
					player:dialogSeq({npcG, "Oh was it? Ha! I admire a person who's willing to take responsibility for the actions of others. You see,  I set it up so that everyone would have you running around town and through different areas to see your work ethic, see your determination, see if you could focus on getting a task done.",
					"You've not only impressed me with your will but with your character as well. Good job "..player.name..", you are worthy of becoming one of us."}, 1)
					player:addLegend("Great protector. "..curT(), "subpath", 16, 80)
					player.class = 7
					if (player.clan == 1) then
						player.clan = 0
					end
					player:status()
				end
				player.quest["greatProtector"] = 250
			else
				player:dialogSeq({npcG, "You can only become a Knight if you're still a warrior."}, 1)
			end
		elseif (step == 250) then--FINISHED, REWARD GIVEN
		end
	end
end,

r2_c_smith = function(player, npc, step)
	if (npc.yname == "r2_c_smith") then--Smith
		local npcG = {graphic = convertGraphic(npc.look, "monster"), color = npc.lookColor}
		player.npcGraphic = npcG.graphic
		player.npcColor = npcG.color
		player.dialogType = 1
		
		if (step == 3) then
			player:dialogSeq({npcG, "Hrm. Yeah, you see, the materials I need to complete this all haven't arrived yet so this order isn't ready. If you need this now you're gon' have to talk to Grog.",
			"You can find grog walking around inside the Mithian Mountains, can probably get there through the Minefield. Good luck, kid."}, 1)
			player.quest["greatProtector"] = 4
		elseif (step == 4) then--REMINDER
		elseif (step == 10) then--STEP 2
			player:dialogSeq({npcG, "What took you so long? You're going to have to come back a little bit later while I fix everything up. Meanwhile you're going to need to get a permit from the city to carry these weapons within city limits.",
			"One of the town guards can sign it for you, run along.",
			"Nah, joking, just come back in a while."},1)
			player.quest["greatProtector"] = 12--11 skipped until charmobs
		elseif (step == 11) then--STEP 2 REMINDER
		elseif (step == 12) then--STEP 3
			player:dialogSeq({npcG,"Just in time kid! I'm finishing the last of it now. Load all of it up and take it off my hands."}, 1)
			player.quest["greatProtector"] = 13
		elseif (step == 13) then--STEP 3 REMINDER
		
		elseif (step == 250) then--FINISHED, REWARD GIVEN
		end
	end
end,

r2_m_smith = function(player, npc, step)
	if (npc.yname == "r2_m_smith") then--Grog
		local npcG = {graphic = convertGraphic(npc.look, "monster"), color = npc.lookColor}
		player.npcGraphic = npcG.graphic
		player.npcColor = npcG.color
		player.dialogType = 0
		
		if (step == 4) then
			player:dialogSeq({npcG, "You come from smith? Wood crates no arrive and you no strong enough to carry this on own. Go get crates from Tam. Come back then Grog give you what you need.",
			"Tam is in Axefell, down with lots of tree, big forest."}, 1)
			player.quest["greatProtector"] = 5
		elseif (step == 5) then--REMINDER
		elseif (step == 8) then--STEP 2
			player:dialogSeq({npcG, "Good. Here's what order wanted, get coal from Mog."}, 1)
			player.quest["greatProtector"] = 9
		elseif (step == 9) then--STEP 2 REMINDER
		elseif (step == 250) then--FINISHED, REWARD GIVEN
		end
	end
end,

r2_lj_tam = function(player, npc, step)
	if (npc.yname == "r2_lj_tam") then--Tam
		local npcG = {graphic = convertGraphic(npc.look, "monster"), color = npc.lookColor}
		player.npcGraphic = npcG.graphic
		player.npcColor = npcG.color
		player.dialogType = 1
		local menu
		local options = {}
		
		if (step == 5) then
			options = {"Can you go get him?"}
			player:dialogSeq({npcG, "Yeah... I mean the crates are finished..."}, 1)
			menu = player:menu("...but I'm waiting on Mr. Ekes to send the parcel boy to come get these crates.", options)
			if (menu == 1) then--CONTINUE
				player:dialogSeq({npcG, "I can't leave right now, I'm busy. You'll have to track him down and get them to come get this."}, 1)
				player.quest["greatProtector"] = 6
			end
		elseif (step == 6) then--REMINDER
		elseif (step == 7) then--STEP 2
			player:dialogSeq({npcG, "We did submit a request, that idiot! Dammit! Go back and give him this request.",
			"Wait... on second thought, he doesn't deserve my money. Can you just take these crates to Grog yourself?"}, 1)
			player.quest["greatProtector"] = 8
		elseif (step == 8) then--STEP 2 REMINDER

		elseif (step == 250) then--FINISHED, REWARD GIVEN		
		end
	end
end,

r2_c_packager = function(player, npc, step)
	if (npc.yname == "r2_c_packager") then--Fred Ekes
		local npcG = {graphic = convertGraphic(npc.look, "monster"), color = npc.lookColor}
		player.npcGraphic = npcG.graphic
		player.npcColor = npcG.color
		player.dialogType = 0
		local menu
		local options = {}
		
		if (step == 6) then
			options = {"Well can you take the order?", "I really need to get these to Grog."}
			menu = player:menu("A request to pick something up from Tam? We haven't gotten anything like that.", options)
			if (menu == 1 or menu == 2) then
				player:dialogSeq({npcG, "What?! No we can not! We're all backed up now working with shipments for Podo, you can't just jump the line. You're on your own champ."}, 1)
				player.quest["greatProtector"] = 7
			end
		elseif (step == 7) then--REMINDER
		elseif (step == 250) then--FINISHED, REWARD GIVEN
		end		
	end
end,

r2_m_coal = function(player, npc, step)
	if (npc.yname == "r2_m_coal") then--Mog
		local npcG = {graphic = convertGraphic(npc.look, "monster"), color = npc.lookColor}
		player.npcGraphic = npcG.graphic
		player.npcColor = npcG.color
		player.dialogType = 0

		if (step == 9) then
			player:dialogSeq({npcG, "Here is coal little one. Go take to smith now."}, 1)
			player.quest["greatProtector"] = 10
		elseif (step == 10) then--REMINDER
		elseif (step == 250) then--FINISHED, REWARD GIVEN
		end			
	end
end,

r2_c_guard = function(player, mob, step)--move function, grab player within distance from guard
	if (mob.yname == "r2_c_guard") then--City Guard
		local npcG = {graphic = convertGraphic(19, "item"), color = 31}
		player.npcGraphic = npcG.graphic
		player.npcColor = npcG.color
		player.dialogType = 1
		
		if (step == 11) then
			if (player.registry["greatProtectorGuardTimer"] <= os.time()) then
				--Right one
				if (player.quest["greatProtectorGuard"] % 3 == 0 and math.random(50) == 5 and player.quest["greatProtectorGuard"] > 0) then
					player:dialogSeq({npcG, "Let me see this. Hm...okay I'll sign it. Here."}, 1)
					player.quest["greatProtectorGuard"] = 0
					player.registry["greatProtectorGuardTimer"] = 0
					player.quest["greatProtector"] = 12
				else
					--Wrong one
					player:dialogSeq({npcG, "I don't have the clearance to sign permits, try someone else."}, 1)
					player.quest["greatProtectorGuard"] = player.quest["greatProtectorGuard"] + 2
					player.registry["greatProtectorGuardTimer"] = os.time() + 10
				end
			end
		end
	end
end,

r2_c_m_guard = function(player, npc, step)
	if (npc.yname == "r2_c_m_guard") then--City Military Guard
		if (step == 13) then
			player:dialogSeq({npcG,"Finally. Take this delivery form back to Kanthor so he can look it over."}, 1)
			player.quest["greatProtector"] = 249
		elseif (step == 249) then--Reminder
		end
	end
end
}