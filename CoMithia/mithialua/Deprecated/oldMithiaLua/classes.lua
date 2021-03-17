warrior = {
	learn_spell = function(player)
		local tSpellName = {"Searing edge","Irritate","Whirlwind","Bandage","Cross Cleave","Charge","Rush!","Climhazzard","Sage"}
	      local tSpellYName = {"searing_edge","irritate","whirlwind","bandage","cross_cleave","charge","rush","climhazzard","sage_warrior"}
		local tSpellItemReq = { }
		local tSpellItemAmount={ }
		local tSpellLevelReq = { }
		local tSpellDesc = { }
		local tSpellYName2 = { }
		local tSpellName2 = { }
	      for i=1,#tSpellYName do
		local l=1
		local t={0}
		local t1={100}
		local d={"A spell"}

		if(not player:hasSpell(tSpellYName[i])) then
			if(_G[tSpellYName[i]]) then
				if(_G[tSpellYName[i]].requirements) then
					l,t,t1,d = _G[tSpellYName[i]].requirements(player)
				end
			end
			if(player.level>=l) then
				table.insert(tSpellLevelReq,l)
				table.insert(tSpellItemReq,t)
				table.insert(tSpellItemAmount,t1)
				table.insert(tSpellDesc,d)
				table.insert(tSpellYName2,tSpellYName[i])
				table.insert(tSpellName2,tSpellName[i])
				
			end
		end		
		
	      end
		return tSpellName2,tSpellYName2,tSpellItemReq,tSpellItemAmount,tSpellLevelReq,tSpellDesc



	end
	
	
}

rogue = {
	learn_spell = function(player)
		local tSpellName = {"Lure","Loki's Shroud","Dexterity","Examine","Swift bolt","Set target","Set Arrow Type","Utsusemi","Survival","Sneak attack","Last resort","Remedy","Expose armor","Adrenaline","Sage","Manipulate"}
	        local tSpellYName = {"lure","lokis_shroud","dexterity","examine","swift_bolt","set_target","set_arrow_type","utsusemi","survival","sneak_attack","last_resort","remedy","expose_armor","adrenaline","sage_rogue","manipulate"}
		local tSpellItemReq = { }
		local tSpellItemAmount={ }
		local tSpellLevelReq = { }
		local tSpellDesc = { }
		local tSpellYName2 = { }
		local tSpellName2 = { }

	        for i=1,#tSpellYName do
			local l=1
			local t={0}
			local t1={100}
			local d={"A spell"}

		if(not player:hasSpell(tSpellYName[i])) then
			if(_G[tSpellYName[i]]) then
				if(_G[tSpellYName[i]].requirements) then
					l,t,t1,d =_G[tSpellYName[i]].requirements(player)
				end
			end
			if(player.level>=l) then
				table.insert(tSpellLevelReq,l)
				table.insert(tSpellItemReq,t)
				table.insert(tSpellItemAmount,t1)
				table.insert(tSpellDesc,d)
				table.insert(tSpellYName2,tSpellYName[i])
				table.insert(tSpellName2,tSpellName[i])
			end
		end		
	        end
		return tSpellName2,tSpellYName2,tSpellItemReq,tSpellItemAmount,tSpellLevelReq,tSpellDesc




	end
}

mage = {
	learn_spell = function(player)
		local tSpellName = {"Thunderbolt","Quake","Convert","Minor healing","Ice ward","Bubble","Will","Minor shielding","Lightning","Hypnotize","Meditate","Magical roots","Magical ward","Liberate","Holy protection","Electrocute","Slumber","Sage","Explode","Flames of the Aesir"}
	      local tSpellYName = {"thunderbolt","quake","convert","minor_healing","ice_ward","bubble","will","minor_shielding,","lightning","hypnotize","meditate","magical_roots","magical_ward","liberate","holy_protection","electrocute","slumber","sage_mage","explode","flames_of_the_aesir"}
		local tSpellItemReq = { }
		local tSpellItemAmount={ }
		local tSpellLevelReq = { }
		local tSpellDesc = { }
local tSpellYName2 = { }
		local tSpellName2 = { }

	      for i=1,#tSpellYName do
			local l=1
		local t={0}
		local t1={100}
		local d={"A spell"}

		if(not player:hasSpell(tSpellYName[i])) then
			if(_G[tSpellYName[i]]) then
				if(_G[tSpellYName[i]].requirements) then
					l,t,t1,d =_G[tSpellYName[i]].requirements(player)
				end
			end
			if(player.level>=l) then
			table.insert(tSpellLevelReq,l)
			table.insert(tSpellItemReq,t)
			table.insert(tSpellItemAmount,t1)
			table.insert(tSpellDesc,d)
table.insert(tSpellYName2,tSpellYName[i])
				table.insert(tSpellName2,tSpellName[i])

			end
			end		
		end
		return tSpellName2,tSpellYName2,tSpellItemReq,tSpellItemAmount,tSpellLevelReq,tSpellDesc




	end
}

poet = {
	learn_spell = function(player)
		local tSpellName = {"Honey rain","Malevolent strike","Convert","Healing seed","Pandemic","Rejuvenate","Release focus","Curative salve","Clean Hex","Hex","Holy hands","Expand mind","Stone skin","Dispell","Nova","Sage","Second wind","Ritual","Tenebrae"}
		local tSpellYName = {"honey_rain","malevolent_strike","convert_poet","healing_seed","pandemic","rejuvenate","release_focus","curative_salve","clean_hex","hex","holy_hands","expand_mind","stone_skin","dispell","nova","sage_poet","second_wind","ritual","tenebrae"}
		local tSpellItemReq = { }
		local tSpellItemAmount={ }
		local tSpellLevelReq = { }
		local tSpellDesc = { }
		local tSpellYName2 = { }
		local tSpellName2 = { }

	      for i=1,#tSpellYName do
			local l=1
		local t={0}
		local t1={100}
		local d={"A spell"}

		if(not player:hasSpell(tSpellYName[i])) then
			if(_G[tSpellYName[i]]) then
				if(_G[tSpellYName[i]].requirements) then
					 l,t,t1,d =_G[tSpellYName[i]].requirements(player)
				end
			end
			if(player.level>=l) then
			table.insert(tSpellLevelReq,l)
			table.insert(tSpellItemReq,t)
			table.insert(tSpellItemAmount,t1)
			table.insert(tSpellDesc,d)
			table.insert(tSpellYName2,tSpellYName[i])
				table.insert(tSpellName2,tSpellName[i])

			end
		end			
		end
		return tSpellName2,tSpellYName2,tSpellItemReq,tSpellItemAmount,tSpellLevelReq,tSpellDesc

	end
}


templar = {
	learn_spell = function(player)

		local tSpellName = {"Noble Exertion"}
		local tSpellYName = {"noble_exertion"}
		local tSpellItemReq = { }
		local tSpellItemAmount={ }
		local tSpellLevelReq = { }
		local tSpellDesc = { }
		local tSpellYName2 = { }
		local tSpellName2 = { }
		for i=1,#tSpellYName do
		local l=1
		local t={0}
		local t1={100}
		local d={"A spell"}

		if(not player:hasSpell(tSpellYName[i])) then
			if(_G[tSpellYName[i]]) then
				if(_G[tSpellYName[i]].requirements) then
					l,t,t1,d = _G[tSpellYName[i]].requirements(player)
				end
			end
			if(player.level>=l) then
				table.insert(tSpellLevelReq,l)
				table.insert(tSpellItemReq,t)
				table.insert(tSpellItemAmount,t1)
				table.insert(tSpellDesc,d)
				table.insert(tSpellYName2,tSpellYName[i])
				table.insert(tSpellName2,tSpellName[i])
				
			end
		end		
		
		end
		return tSpellName2,tSpellYName2,tSpellItemReq,tSpellItemAmount,tSpellLevelReq,tSpellDesc



	end
	
	
}

learnSpell = {
	run=function(player)
		local found=0
		local tsn,tsyn,tsir,tsia,tslr,tsd
		if(player.classBase==1) then
			tsn,tsyn,tsir,tsia,tslr,tsd=warrior.learn_spell(player)
		elseif(player.classBase==2) then
			tsn,tsyn,tsir,tsia,tslr,tsd=rogue.learn_spell(player)
		elseif(player.classBase==3) then
			tsn,tsyn,tsir,tsia,tslr,tsd=mage.learn_spell(player)
		elseif(player.classBase==4) then
			tsn,tsyn,tsir,tsia,tslr,tsd=poet.learn_spell(player)
		end
		if(tsn==nil) then 
			return false
		end
		--if(#tsn==0 or tsn) then return false end

		local c=player:menuString("What would you like to learn?",tsn)
		if(c ~= "" ) then
			for x=1,#tsn do
				if(tsn[x]==c) then
					found=x
					break
				end
			end	
		end
		
		if(found>0) then
			if(not player:dialogSeq(tsd[found],1)) then return false end
			local c=player:menuString("Do you swear to use this for good?",{"Yes","No"})
			if(c=="Yes") then
				if(learnSpell.checkItems(player,tsir[found],tsia[found])) then
					learnSpell.removeItems(player,tsir[found],tsia[found])
					player:addSpell(tsyn[found])
					player:sendMinitext("Your mind expands as you learn " .. tsn[found])
				else
					player:dialog("You do not have the required items.",{})
				end
			elseif(c=="No") then
				return false
			end
		end
	  end,
	  checkItems=function(player,t,u)

			for x=1,#t do
				if(t[x]==0) then
					if(player.money<u[x]) then
					    return false
					end
				else
				if(player:hasItem(t[x],u[x]) == true) then
				else
					return false
				end
				end
			end
			return true
	  end,
	  removeItems=function(player,t,u)
		for x=1,#t do
			if(t[x]==0) then
				player.money=player.money-u[x]
				player:sendStatus()
			else
			player:removeItem(t[x],u[x])
			end
		end
	  end,
	remove_spell=function(player)
		local splist_table={}
		local spyn_table={}
		local placeholder
		local x
		local found
		local selection

		for x=1,52 do
			if(player:getSpells(x) ~= false) then
				placeholder = player:getSpells(x)
				table.insert(splist_table,placeholder)
			end
			if(player:getSpellName(x) ~= false) then
				placeholder = player:getSpellName(x)
				table.insert(spyn_table,placeholder)
			end
		end

		selection=player:menuString("What would you like to forget?",splist_table)
		if(selection ~= "" ) then
			for x=1,#splist_table do
				if(splist_table[x]==selection) then
					found=x
					break
				end
			end	
		end
		selection=player:menuString("Are you sure you wish to forget "..splist_table[found].."?",{"Yes","No"})
		if(selection == "Yes") then
			player:removeSpell(spyn_table[found])
		end
	end
}

learnSpellSub = {
        run=function(player)
		local found=0
		local tsn,tsyn,tsir,tsia,tslr,tsd
		if(player.class==6) then
			tsn,tsyn,tsir,tsia,tslr,tsd=templar.learn_spell(player)
		end
		if(tsn==nil) then 
			return false
		end
		--if(#tsn==0 or tsn) then return false end

		local c=player:menuString("What would you like to learn?",tsn)
		if(c ~= "" ) then
			for x=1,#tsn do
				if(tsn[x]==c) then
					found=x
					break;
				end
			end	
		end
		
		if(found>0) then
			if(not player:dialogSeq(tsd[found],1)) then return false end
			local c=player:menuString("Do you swear to use this for good?",{"Yes","No"})
			if(c=="Yes") then
				if(learnSpell.checkItems(player,tsir[found],tsia[found])) then
					learnSpell.removeItems(player,tsir[found],tsia[found])
					player:addSpell(tsyn[found])
					player:sendMinitext("Your mind expands as you learn " .. tsn[found])
				else
					player:dialog("You do not have the required items.",{})
				end
			elseif(c=="No") then
				return false
			end
		end
	  end,
	  checkItems=function(player,t,u)

			for x=1,#t do
				if(t[x]==0) then
					if(player.money<u[x]) then
					    return false
					end
				else
				if(player:hasItem(t[x],u[x]) == true) then
				else
					return false
				end
				end
			end
			return true
	  end,
	  removeItems=function(player,t,u)
		for x=1,#t do
			if(t[x]==0) then
				player.money=player.money-u[x]
				player:sendStatus()
			else
			player:removeItem(t[x],u[x])
			end
		end
	  end
		
}
