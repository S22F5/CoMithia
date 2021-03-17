noble_exertion = {
	cast=function(player,target)
		if(player.state==1) then
			player:sendMinitext("Spirits can't do that")
			return
		end
		if(player.class~=6 and player.gmLevel<99) then
			player:sendMinitext("You are not a Templar.")
			player:removeSpell("noble_exertion")
			return
		end
		if(player.state==3) then
			player:sendMinitext("You can not cast this spell on a mount.")
			return
		end
		
		local m=player.m
		local x=player.x
		local y=player.y

		
		local d=player:getObjectsInCell(m,x,y-1,BL_PC)
		local e=player:getObjectsInCell(m,x+1,y,BL_PC)
		local f=player:getObjectsInCell(m,x,y+1,BL_PC)
		local g=player:getObjectsInCell(m,x-1,y,BL_PC)

		player:sendAction(18,500)
		player:sendMinitext("You cast Noble Exertion.")
		player:playSound(84)
		if(player.gmLevel<99) then
			if(player.pvp==true) then
				player:setAether("noble_exertion",30000)
			else
				player:setAether("noble_exertion",5000)
			end
		end
		
		if((#d+#e+#f+#g)>1) then
			player:talk(2,"Out of my way, pathetic oafs.")
		else
			player:talk(2,"Out of my way, pathetic oaf.")
		end
		-- Facing North
		if(#d>0) then
			local checkplayernorth=player:getObjectsInCell(player.m,player.x,player.y-2,BL_PC)
			local checkmobnorth=player:getObjectsInCell(player.m,player.x,player.y-2,BL_MOB)
			local checknpcnorth=player:getObjectsInCell(player.m,player.x,player.y-2,BL_NPC)
			local checkplayereast=player:getObjectsInCell(player.m,player.x+1,player.y-1,BL_PC)
			local checkmobeast=player:getObjectsInCell(player.m,player.x+1,player.y-1,BL_MOB)
			local checknpceast=player:getObjectsInCell(player.m,player.x+1,player.y-1,BL_NPC)
			local checkplayerwest=player:getObjectsInCell(player.m,player.x-1,player.y-1,BL_PC)
			local checkmobwest=player:getObjectsInCell(player.m,player.x-1,player.y-1,BL_MOB)
			local checknpcwest=player:getObjectsInCell(player.m,player.x-1,player.y-1,BL_NPC)

			if(#checkplayernorth+#checkmobnorth+#checknpcnorth==0 and player:objectCanMove(player.x,player.y-2,0)==true and getPass(player.m,player.x,player.y-2)==0) then
				d[1]:warp(player.m,player.x,player.y-2)
				d[1]:sendAnimation(10)
			elseif(#checkplayereast+#checkmobeast+#checknpceast==0 and player:objectCanMove(player.x+1,player.y-1,1)==true and getPass(player.m,player.x+1,player.y-1)==0) then
				d[1]:warp(player.m,player.x+1,player.y-1)
				d[1]:sendAnimation(10)
			elseif(#checkplayerwest+#checkmobwest+#checknpcwest==0 and player:objectCanMove(player.x-1,player.y-1,3)==true and getPass(player.m,player.x-1,player.y-1)==0) then
				d[1]:warp(player.m,player.x-1,player.y-1)
				d[1]:sendAnimation(10)
			else
				d[1]:sendAnimation(10)
			end
		end

		--Facing East
		if(#e>0) then

			local checkplayereast=player:getObjectsInCell(player.m,player.x+2,player.y,BL_PC)
			local checkmobeast=player:getObjectsInCell(player.m,player.x+2,player.y,BL_MOB)
			local checknpceast=player:getObjectsInCell(player.m,player.x+2,player.y,BL_NPC)

			local checkplayernorth=player:getObjectsInCell(player.m,player.x+1,player.y-1,BL_PC)
			local checkmobnorth=player:getObjectsInCell(player.m,player.x+1,player.y-1,BL_MOB)
			local checknpcnorth=player:getObjectsInCell(player.m,player.x+1,player.y-1,BL_NPC)

			local checkplayersouth=player:getObjectsInCell(player.m,player.x+1,player.y+1,BL_PC)
			local checkmobsouth=player:getObjectsInCell(player.m,player.x+1,player.y+1,BL_MOB)
			local checknpcsouth=player:getObjectsInCell(player.m,player.x+1,player.y+1,BL_NPC)

			if(#checkplayereast+#checkmobeast+#checknpceast==0 and player:objectCanMove(player.x+2,player.y,1)==true and getPass(player.m,player.x+2,player.y)==0) then
				e[1]:warp(player.m,player.x+2,player.y)
				e[1]:sendAnimation(10)
			elseif(#checkplayernorth+#checkmobnorth+#checknpcnorth==0 and player:objectCanMove(player.x+1,player.y-1,0)==true and getPass(player.m,player.x+1,player.y-1)==0) then
				e[1]:warp(player.m,player.x+1,player.y-1)
				e[1]:sendAnimation(10)
			elseif(#checkplayersouth+#checkmobsouth+#checknpcsouth==0 and player:objectCanMove(player.x+1,player.y+1,2)==true and player:objectCanMove(player.x+1,player.y,0)==true and getPass(player.m,player.x+1,player.y+1)==0) then
				e[1]:warp(player.m,player.x+1,player.y+1)
				e[1]:sendAnimation(10)
			else
				e[1]:sendAnimation(10)
			end
		end
		--Facing South
		if(#f>0) then

			local checkplayersouth=player:getObjectsInCell(player.m,player.x,player.y+2,BL_PC)
			local checkmobsouth=player:getObjectsInCell(player.m,player.x,player.y+2,BL_MOB)
			local checknpcsouth=player:getObjectsInCell(player.m,player.x,player.y+2,BL_NPC)

			local checkplayereast=player:getObjectsInCell(player.m,player.x+1,player.y+1,BL_PC)
			local checkmobeast=player:getObjectsInCell(player.m,player.x+1,player.y+1,BL_MOB)
			local checknpceast=player:getObjectsInCell(player.m,player.x+1,player.y+1,BL_NPC)

			local checkplayerwest=player:getObjectsInCell(player.m,player.x-1,player.y+1,BL_PC)
			local checkmobwest=player:getObjectsInCell(player.m,player.x-1,player.y+1,BL_MOB)
			local checknpcwest=player:getObjectsInCell(player.m,player.x-1,player.y+1,BL_NPC)


			if(#checkplayersouth+#checkmobsouth+#checknpcsouth==0 and player:objectCanMove(player.x,player.y+2,2)==true and player:objectCanMove(player.x,player.y+1,0)==true and getPass(player.m,player.x,player.y+2)==0) then
				f[1]:warp(player.m,player.x,player.y+2)
				f[1]:sendAnimation(10)
			elseif(#checkplayereast+#checkmobeast+#checknpceast==0 and player:objectCanMove(player.x+1,player.y+1,1)==true and getPass(player.m,player.x+1,player.y+1)==0) then
				f[1]:warp(player.m,player.x+1,player.y+1)
				f[1]:sendAnimation(10)
			elseif(#checkplayerwest+#checkmobwest+#checknpcwest==0 and player:objectCanMove(player.x-1,player.y+1,3)==true and getPass(player.m,player.x-1,player.y+1)==0) then
				f[1]:warp(player.m,player.x-1,player.y+1)
				f[1]:sendAnimation(10)
			else
				f[1]:sendAnimation(10)
			end
		end
		--Facing West
		if(#g>0) then

			local checkplayerwest=player:getObjectsInCell(player.m,player.x-2,player.y,BL_PC)
			local checkmobwest=player:getObjectsInCell(player.m,player.x-2,player.y,BL_MOB)
			local checknpcwest=player:getObjectsInCell(player.m,player.x-2,player.y,BL_NPC)

			local checkplayernorth=player:getObjectsInCell(player.m,player.x-1,player.y-1,BL_PC)
			local checkmobnorth=player:getObjectsInCell(player.m,player.x-1,player.y-1,BL_MOB)
			local checknpcnorth=player:getObjectsInCell(player.m,player.x-1,player.y-1,BL_NPC)

			local checkplayersouth=player:getObjectsInCell(player.m,player.x-1,player.y+1,BL_PC)
			local checkmobsouth=player:getObjectsInCell(player.m,player.x-1,player.y+1,BL_MOB)
			local checknpcsouth=player:getObjectsInCell(player.m,player.x-1,player.y+1,BL_NPC)

			

			if(#checkplayerwest+#checkmobwest+#checknpcwest==0 and player:objectCanMove(player.x-2,player.y,3)==true and getPass(player.m,player.x-2,player.y)==0) then
				g[1]:warp(player.m,player.x-2,player.y)
				g[1]:sendAnimation(10)
			elseif(#checkplayernorth+#checkmobnorth+#checknpcnorth==0 and player:objectCanMove(player.x-1,player.y-1,0)==true and getPass(player.m,player.x-1,player.y-1)==0) then
				g[1]:warp(player.m,player.x-1,player.y-1)
				g[1]:sendAnimation(10)
			elseif(#checkplayersouth+#checkmobsouth+#checknpcsouth==0 and player:objectCanMove(player.x-1,player.y+1,2)==true and player:objectCanMove(player.x-1,player.y,0)==true and getPass(player.m,player.x-1,player.y+1)==0) then
				d[1]:warp(player.m,player.x-1,player.y+1)
				g[1]:sendAnimation(10)
			else
				d[1]:sendAnimation(10)
			end
		end		
	end,
	requirements=function(player)
		local l=60
		local i={0,5,66,6}
		local ia={2000,100,10,1}
		local d={"Noble Exertion\n\nPushes filthy scum away from you.","You shall sacrifice (100) Chestnut, (10) Amethyst, (1) Squirrel fur and 2000 coins to learn this ability."}
		return l,i,ia,d
	end

}