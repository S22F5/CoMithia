add_legend = {
	--[[
	cast = async(function(player,target)
		nameofPlayer=player:input("Who shall receive this legend?")
		legend=player:input("What shall the legend say?")
		legendName=player:input("What shall the legend be called?")
		icon=player:input("What shall the icon be?")
		color=player:input("What shall the color of the text be?")

		Player(nameofPlayer):addLegend(legend,legendName,tonumber(icon),tonumber(color))
		Player(nameofPlayer):sendMinitext("A legend has been added by " .. player.name)
		player:sendMinitext("The legend has been added to " .. nameofPlayer)
	end),
	uncast = function(player)
	end,
	recast = function(player)
	end
	]]--
}



freeze1 = {
	cast=function(player,target)

		if(target.blType==BL_MOB) then
			if(target:hasDuration("freeze")) then
				player:sendMinitext("You already cast that.")
			else
            		target.paralyzed=true
			target:sendAnimation(99)
            	target:setDuration("freeze",20000)
			target:playSound(40)
			player:sendMinitext("You cast Paralyze.")

			end
		else
			player:sendMinitext("That doesn't work.")
		end
	end,
      uncast=function(player)
            if player.paralyzed then
               player.paralyzed=false
            end
      end,
      recast = function(player)
            player.paralyzed=true
      end,
}

vex = {
	cast=function(player,target)
		if(target.blType==BL_MOB) then
			target.ac=target.ac+25
			target:sendAnimation(53)
			target:playSound(43)
			target:setDuration(8,10)
		end
	end,
	uncast=function(player)
		player.ac=player.ac-25
	end
}

heal_other= {
	cast=function(player,target)
		if(target.blType==BL_PC) then
			target:sendAnimation(63)
			target:addHealth(500)
		end
	end
}

--[[ambush = {
	cast=function(player,target)
		local x=player.x
		local y=player.y
		local m=player.m
		local x2=x
		local y2=y
		local oside=player.side
		if(player.side==0) then
			y=y-2
			y2=y+1
		elseif(player.side==1) then
			x=x+2
			x2=x-1
		elseif(player.side==2) then
			y=y+2
			y2=y-1
		elseif(player.side==3) then
			x=x-2
			x2=x+1
		end
		
		local a=player:getObjectsInCell(m,x2,y2,BL_PC)
		local b=player:getObjectsInCell(m,x2,y2,BL_NPC)
		local c=player:getObjectsInCell(m,x2,y2,BL_MOB)
		local d=#a+#b+#c
		if(d<1) then return 1 end

		local a=player:getObjectsInCell(m,x,y,BL_PC)
		local b=player:getObjectsInCell(m,x,y,BL_NPC)
		local c=player:getObjectsInCell(m,x,y,BL_MOB)
		local d=#a+#b+#c

		if(d==0) then
			player:sendMinitext("You cast Ambush.")
			player:playSound(337)	
			player.side=oside+2
			if(player.side>3) then player.side=player.side-4 end
			player:warp(m,x,y)
			player:sendAction(1,14)
		end		
		
		--player:sendMinitext("Your stats: " .. #a)
	end
}]]--
rez={
	cast=function(player,target)
		--player:mapSelection("wmkru",{100,100,"map1",0,5,5,200,200,"map2",0,5,5,300,300,"map3",0,5,5})
		--player:talk(0,"ac "..target.ac.."")
		--player:talk(0,"sleep "..target.sleep.."")
		--player:talk(0,"deduction "..target.deduction.."")
		--target.deduction=0	
		if(target.state==1) then
			target.state=0
			target:addHealth(10000000000000000)
			target:addMana(10000000000000000)
			target:updateState()
		end
	end
}
