archer_bow = {
	thrown = function(player,target)

	if(target==nil) then
		player:sendMinitext("You have no target!")
		return
	end

	if(player.registry["currentspecialization"]~=2) then
		player:sendMinitext("You need to be an Archer to use this")
		return
	end

	if(player.registry["marksmanammo"]==1 and player:hasItem("piercing_arrow",1)~=true) then
		player:sendMinitext("You have no Piercing arrows!")
		return
	end

	if(player.registry["marksmanammo"]==2 and player:hasItem("poison_arrow",1)~=true) then
		player:sendMinitext("You have no Poison arrows!")
		return
	end

	if(player.registry["marksmanammo"]==3 and player:hasItem("fragmentation_arrow",1)~=true) then
		player:sendMinitext("You have no Fragmentation arrows!")
		return
	end

	if(player.registry["marksmanammo"]==4 and player:hasItem("crippling_arrow",1)~=true) then
		player:sendMinitext("You have no Crippling arrows!")
		return
	end


	if(target.blType==BL_PC and player.pvp==false) then
		player:sendMinitext("You cannot hurt another player")
		return
	end


	local arrowcolor=0

		if(player.registry["marksmanammo"]==0) then	

			arrowcolor=0
			--player:sendAction(1,35)
	
			local bowdamage=player:calcRangedDamage(player,target)
	
			local hitcheck=player:calcRangedHit(player,target)

	
			bowdamage=bowdamage*hitcheck
	
			if(bowdamage==0) then
				player:sendMinitext("You missed!")
				return
			end
			if(hitcheck==3) then
				player:sendMinitext("Critical hit!")
			end
		
			target.attacker=player.ID
			if(target.blType==BL_MOB and target.state~=MOB_HIT) then
				target.state=MOB_HIT
				target.target=player.ID
			end

			target:removeHealthExtend(bowdamage, 1, 1, 1, 1, 0)
			if(target.blType==BL_MOB and target.state==MOB_DEAD) then
				player.rangeTarget=0
			elseif(target.blType == BL_PC and target.state == 1) then
				player.rangeTarget = 0
			end

		end






		if(player.registry["marksmanammo"]==1) then	
	
			player:removeItem("piercing_arrow",1)
			
			arrowcolor=2
			player:sendAction(1,35)
	
			local bowdamage=player:calcRangedDamage(player,target)
	
			local hitcheck=player:calcRangedHit(player,target)


			-- Piercing Arrow, +15% damage buff

			bowdamage=bowdamage*1.15

			-- Piercing Arrow, +15% damage buff
	
			bowdamage=bowdamage*hitcheck

	
			if(bowdamage==0) then
				player:sendMinitext("You missed!")
				return
			end
			if(hitcheck==3) then
				player:sendMinitext("Critical hit!")
			end
		
			target.attacker=player.ID

			if(target.blType==BL_MOB and target.state~=MOB_HIT) then
				target.state=MOB_HIT
				target.target=player.ID
			end

			target:removeHealthExtend(bowdamage, 1, 1, 1, 1, 0)

			if(target.blType==BL_MOB and target.state==MOB_DEAD) then
				player.rangeTarget=0
			elseif(target.blType == BL_PC and target.state == 1) then
				player.rangeTarget = 0
			end

		end




		if(player.registry["marksmanammo"]==2) then	
	
			player:removeItem("poison_arrow",1)

			arrowcolor=10
			player:sendAction(1,35)
	
			local bowdamage=player:calcRangedDamage(player,target)
	
			local hitcheck=player:calcRangedHit(player,target)

	
			bowdamage=bowdamage*hitcheck

	
			if(bowdamage==0) then
				player:sendMinitext("You missed!")
				return
			end
			if(hitcheck==3) then
				player:sendMinitext("Critical hit!")
			end
		
			target.attacker=player.ID

			if(target.blType==BL_MOB and target.state~=MOB_HIT) then
				target.state=MOB_HIT
				target.target=player.ID
			end

			target:setDuration("poison_arrow_spell",8000,player.ID)
			target:sendAnimation(289)

			target:removeHealthExtend(bowdamage, 1, 1, 1, 1, 0)

			if(target.blType==BL_MOB and target.state==MOB_DEAD) then
				player.rangeTarget=0
			elseif(target.blType == BL_PC and target.state == 1) then
				player.rangeTarget = 0
			end

		end






		if(player.registry["marksmanammo"]==3) then	
	
			player:removeItem("fragmentation_arrow",1)

			arrowcolor=15
			player:sendAction(1,35)
	
			local bowdamage=player:calcRangedDamage(player,target)
	
			local hitcheck=player:calcRangedHit(player,target)

	
			bowdamage=bowdamage*hitcheck

	
			if(bowdamage==0) then
				player:sendMinitext("You missed!")
				return
			end
			if(hitcheck==3) then
				player:sendMinitext("Critical hit!")
			end
		
			target.attacker=player.ID

			if(target.blType==BL_MOB and target.state~=MOB_HIT) then
				target.state=MOB_HIT
				target.target=player.ID
			end

			

			for x=target.x-1,target.x+1 do

				for y=target.y-1,target.y+1 do

					local xcheck=math.abs(target.x-x)
					local ycheck=math.abs(target.y-y)
					
					if((xcheck+ycheck)<=1) then

						targetcheckmob=player:getObjectsInCell(player.m,x,y,BL_MOB)
						if(#targetcheckmob>0) then
							for z=1,#targetcheckmob do
								if(targetcheckmob[z]~=target) then
									targetcheckmob[z].attacker=player.ID
									targetcheckmob[z]:sendAnimation(285)
									targetcheckmob[z]:removeHealthExtend(bowdamage/8, 1, 1, 1, 1, 0)
								end

							end
						end

						targetcheckplayer=player:getObjectsInCell(player.m,x,y,BL_PC)
						if(#targetcheckplayer>0) then
							for z=1,#targetcheckplayer do
								if(targetcheckplayer[z]~=target and targetcheckplayer[z].state~=1) then
									targetcheckplayer[z].attacker=player.ID
									targetcheckplayer[z]:sendAnimation(285)
									targetcheckplayer[z]:removeHealthExtend(bowdamage/8, 1, 1, 1, 1, 0)
								end

							end
						end



					end
				end
			end

			target:sendAnimation(285)
			target:removeHealthExtend(bowdamage, 1, 1, 1, 1, 0)
			

			if(target.blType==BL_MOB and target.state==MOB_DEAD) then
				player.rangeTarget=0
			elseif(target.blType == BL_PC and target.state == 1) then
				player.rangeTarget = 0
			end

		end



		if(player.registry["marksmanammo"]==4) then	
	
			player:removeItem("crippling_arrow",1)
			
			arrowcolor=26
			player:sendAction(1,35)
	
			local bowdamage=player:calcRangedDamage(player,target)
	
			local hitcheck=player:calcRangedHit(player,target)

	
			bowdamage=bowdamage*hitcheck

	
			if(bowdamage==0) then
				player:sendMinitext("You missed!")
				return
			end
			if(hitcheck==3) then
				player:sendMinitext("Critical hit!")
			end
		
			target.attacker=player.ID
			
			if(target.blType==BL_MOB and target.state~=MOB_HIT) then
				target.state=MOB_HIT
				target.target=player.ID
			end

			local spellduration = 0

			if(target.blType==BL_MOB) then 
				spellduration=15000
			end

			if(target.blType==BL_PC) then
				spellduration=6000
			end

			if(not target:hasDuration("crippling_arrow_spell")) then

				if(target.blType==BL_MOB) then
					target:setDuration("crippling_arrow_spell",spellduration,player.ID)
					target.newMove=target.baseMove*1.1
					target:sendAnimation(91)
				end

				if(target.blType==BL_PC) then
					target:setDuration("crippling_arrow_spell",spellduration,player.ID)
					target.speed=target.speed+50
					target:sendAnimation(91)
					target:updateState()
				end


			end

			target:removeHealthExtend(bowdamage, 1, 1, 1, 1, 0)

			if(target.blType==BL_MOB and target.state==MOB_DEAD) then
				player.rangeTarget=0
			elseif(target.blType == BL_PC and target.state == 1) then
				player.rangeTarget = 0
			end

		end








	local xabscheck = math.abs(player.x-target.x)
	local yabscheck = math.abs(player.y-target.y)

	if (xabscheck>=yabscheck) then

		if(player.x<target.x) then
			player:throw(target.x,target.y,7,arrowcolor,1)
		else
			player:throw(target.x,target.y,9,arrowcolor,1)
		end

	else

		if(player.y<target.y) then
			player:throw(target.x,target.y,8,arrowcolor,1)
		else
			player:throw(target.x,target.y,6,arrowcolor,1)
		end
	
	end




	end
}