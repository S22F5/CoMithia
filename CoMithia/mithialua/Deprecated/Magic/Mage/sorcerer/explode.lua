explode = {
	cast=function(player,target)
		local center={}
		local m=player.m
		local xp=player.x
		local yp=player.y
		local countdamage=0
			
	if(player.magic<(player.maxMagic/2)) then
		player:sendMinitext("You do not have enough mana.")
		return
	end
	
	if(player.state==1) then
		player:sendMinitext("Spirits can't do that.")
		return
	end
	if(player.state==3) then
		player:sendMinitext("You can not cast this spell on a mount.")
		return
	end

	if(player.registry["currentspecialization"]~=1) then
		player:sendMinitext("Only Sorcerers may use this ability.")
		return
	end

	local countdamage=(player.magic*0.5)

	if(player.will>100) then
		countdamage=countdamage*player.will/100
	end

	local countdamage2=countdamage
	local calc=0





	player:addHealth(-player.maxMagic*0.15)
	for x=-4,4 do
		for y=-4,4 do
			center=player:getObjectsInCell(m,xp+x,yp+y,BL_MOB)			
			if(#center>0) then
				for z=1,#center do				
					calc=(math.abs(x)*4)+(math.abs(y)*4)					
					countdamage2=countdamage-(countdamage*(calc/100))
					center[z]:sendAnimation(274)
					center[z].attacker=player.ID
					center[z]:removeHealthExtend(countdamage2, 1, 1, 1, 1, 0)
				end
			end
		end
	end
	player:sendAction(6,35)
	player:playSound(94)

	player:addMana(-player.maxMagic*0.15)
	player:sendMinitext("You cast Explode.")

	if(player.will<110) then
		player:setAether("explode",20000)
	elseif(player.will>=110 and player.will<130) then
		player:setAether("explode",16000)
	elseif(player.will>=130 and player.will<150) then
		player:setAether("explode",12000)
	elseif(player.will>=150) then
		player:setAether("explode",10000)
	end





        end,
	requirements=function(player)
		local l=94
		local i={0,466,467}
		local ia={7500,5,1}
		local d={"Explode\n\nAn elemental attack of fire, at the risk of hurting and possibly killing yourself. Damage and Aether depends on your will and mana","You shall have to sacrifice (5) Bottled rum, (1) Golden helm and 7500 coins to learn this ability"}
		return l,i,ia,d
	end       
}