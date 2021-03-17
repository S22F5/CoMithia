thorne_aura = {
	cast=function(player,target)

		player:sendMinitext("This spell has been deprecated and does not exist anymore.")
		return

--[[
	if(player.state==1) then
             player:sendMinitext("Spirits can't do that.")
             return
        end
	if(player.state==3) then
		player:sendMinitext("You can not cast this spell on a mount.")
		return
	end



        if(player.magic<player.maxMagic/10) then
	     player:sendMinitext("You do not have enough Mana.")
	     return
        end

	if(player.registry["currentspecialization"]~=2) then
		player:sendMinitext("Only Valkyrs may use this ability.")
		return
	end


	if(player:hasDuration("retribution")) then
		player:sendMinitext("Retribution is already in effect.")
		return
	end

	if(player:hasDuration("thorne_aura")) then
		player:sendMinitext("Thorne aura is already in effect.")
		return
	end

	player:addMana(-player.maxMagic/10)
	player:setDuration("thorne_aura",150000)
	player:sendMinitext("You cast Thorne aura.")	
	player:playSound(721)
]]--
	end,

	while_cast=function(player)
                local center={}


	if(player.group~=nil) then
		calc=0
		for _,gID in pairs(player.group) do
			local gMember=Player(gID)
			if(gMember.m==player.m) then
				calc=calc+1 
			end
		end
	else
		calc=1
	end

	if(calc<=4) then
		calc=calc*0.25
	else
		calc=1+((calc-4)*0.075)
	end
	if(calc>=3) then
		calc=3
	end
	
	
	-- Adding check to make sure that will does not get negative and if it does, then set will to 1.
	willcheck=player.will/130
	if (willcheck<1) then
		willcheck=1
	end
	-- end will check.
	-- changed player.will to willcheck so that it takes into account the  changes above
	-- Previous line was:
	-- calc=(player.maxMagic/1000)*calc*(player.will/100)
	calc=(player.maxMagic/200)*calc*(willcheck)

	if(player:hasDuration("suggestion")) then
		calc=calc*2
	end	
	
		for xa=player.x-4,player.x+4 do
			for ya=player.y-4,player.y+4 do
				local xacheck=math.abs(player.x-xa)
				local yacheck=math.abs(player.y-ya)
				--if((xacheck+yacheck)<=4) then
				--	player:sendAnimationXY(235,xa,ya)
				--end
			end
		end

		center=player:getObjectsInArea(BL_MOB)
		if(#center>0) then
			for x=1,#center do
				local xcheck=math.abs(center[x].x-player.x)
				local ycheck=math.abs(center[x].y-player.y)
				if((xcheck+ycheck)<=4 and center[x].name~="Ash tree" and center[x].name~="Barricade" and center[x].name~="Tin vein" and center[x].name~="Bronze vein" and center[x].name~="Sheep" and center[x].name~="Perendale sheep" and center[x].name~="Cedar tree" and center[x].name~="Shetland sheep" and center[x].name~="Copper vein" and center[x].name~="Silver vein" and center[x].name~="Iron vein" and center[x].name~="Gold vein" and center[x].name~="Oak tree" and center[x].name~="Merino sheep" and center[x].name~="Rambouillet sheep" and center[x].name~="Referee" and center[x].name~="Ramithia elite" and center[x].name~="Mithia soldier" and center[x].name~="Stone of Empowerment") then
        				center[x]:sendAnimation(235)
        				center[x].attacker=player.ID
        				center[x]:removeHealthExtend(calc, 1, 1, 1, 1, 0)
				end
			end
		end

	end,

	uncast=function(player)

        end,
	requirements=function(player)
		local l=18
		local i={0,66,5}
		local ia={125,1,50}
		local d={"Retribution\n\nA magical Aura to damage your ennemies.","You shall sacrifice (50) Chestnut, (1) Amethyst and 125 coins to learn this ability"}
		return l,i,ia,d
	end 
          
}