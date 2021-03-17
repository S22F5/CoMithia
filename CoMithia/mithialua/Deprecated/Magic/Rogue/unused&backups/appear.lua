appear = {

	cast=function(player,target)
		local ma=player.maxMagic*0.5
		local mb=player.magic*0.2
		local m=player.m
		local x=target.x
		local y=target.y
		local t={}
		local u={}
		local v={}
		local sidep=0


		if(player.state==1) then
			player:sendMinitext("Spirits can't do that.")
			return
		end
	
		if(player.magic<100) then
			player:sendMinitext("You do not have enough mana.")
			return
		end

		if target.side==0 then y=y+1 end
		if target.side==1 then x=x-1 end
		if target.side==2 then y=y-1 end
		if target.side==3 then x=x+1 end

		if target.side==0 then sidep=0 end
		if target.side==1 then sidep=1 end
		if target.side==2 then sidep=2 end
		if target.side==3 then sidep=3 end

		t=player:getObjectsInCell(m,x,y,BL_PC)
		u=player:getObjectsInCell(m,x,y,BL_NPC)
		v=player:getObjectsInCell(m,x,y,BL_MOB)
		local d=#t+#u+#v
		if(d>0) then
			player:sendMinitext("Your target's back is guarded")
			return
		end
		if(player:objectCanMove(x,y,sidep)~=true) then
			player:sendMinitext("Your target's back is obstructed")
			return
		end
		if(getPass(m,x,y)~=0) then
			player:sendMinitext("Your target's back is blocked")
			return
		end

		player.side=target.side
		player:warp(m,x,y)
		player:sendMinitext("You appear behind your target!")
		player:sendAction(6,35)
		player:sendAnimation(3)
		player:addMana(-100)
		player:setAether("appear",3000)
		player:sendStatus()
		player:updateState()
		player:sendSide()

		end,

		requirements=function(player)
		local l=97
		local i={0}
		local ia={1000000}
		local d={"Appear\n\nDisappear and reappear behind your target, striking him from the back.","You shall have to sacrifice 1000000 coins to learn this ability."}
		return l,i,ia,d
		
	end
}


		