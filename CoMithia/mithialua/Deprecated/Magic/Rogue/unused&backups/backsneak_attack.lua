backupsneak_attack = {
	cast=function(player,target)
		local x=player.x
		local y=player.y
		local m=player.m
		local x2=x
		local y2=y
		if(player.state==1) then
			player:sendMinitext("Spirits can't do that")
			return
		end
		if(player.state==3) then
			player:sendMinitext("You can not cast this spell on a mount.")
			return
		end
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
			player:sendMinitext("You cast Sneak attack.")
			player:playSound(337)	
			player.side=oside+2
			if(player.side>3) then player.side=player.side-4 end
			player:warp(m,x,y)
			player:sendAction(1,14)
		end		
	end,
	requirements=function(player)
		local l=48
		local i={0,5,66,6}
		local ia={2000,100,10,1}
		local d={"Sneak attack\n\nQuickly move around an ennemy to attack it's weak spots.","You shall sacrifice (100) Chestnut, (10) Amethyst, (1) Squirrel fur and 2000 coins to learn this ability."}
		return l,i,ia,d
	end

}