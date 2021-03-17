retribution = {
	cast=function(player,target)

	player:sendMinitext("This spell has been deprecated and does not exist anymore")
	return


--[[	if(player.state==1) then
             player:sendMinitext("Spirits can't do that.")
             return
        end
	if(player.state==3) then
		player:sendMinitext("You can not cast this spell on a mount.")
		return
	end


        if(player.magic<200) then
	     player:sendMinitext("You do not have enough Mana.")
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

	player:addMana(-200)
	player:setDuration("retribution",150000)
	player:sendMinitext("You cast Retribution.")	
	player:playSound(721)
]]--
	
	end,

	while_cast=function(player)
		local calc
                local center={}
                local up={}
                local right={}
                local down={}
                local left={}
                local upright={}
                local downright={}
                local downleft={}
                local upleft={}
		local topleft={}
                local topright={}
                local topbottom={}
                local toptop={}                                          
                local m=player.m
                local centerx=player.x
                local centery=player.y
                local upx=player.x
                local upy=player.y-1
                local rightx=player.x+1
                local righty=player.y
                local downx=player.x
                local downy=player.y+1
                local leftx=player.x-1
                local lefty=player.y
                local uprightx=player.x+1
                local uprighty=player.y-1
                local downrightx=player.x+1
                local downrighty=player.y+1
                local downleftx=player.x-1
                local downlefty=player.y+1
                local upleftx=player.x-1
                local uplefty=player.y-1
                local topleftx=player.x-2
                local toplefty=player.y
                local toprightx=player.x+2
                local toprighty=player.y
                local topbottomx=player.x
                local topbottomy=player.y+2
                local toptopx=player.x
                local toptopy=player.y-2    
                local ccenter
                local cup
                local cright
                local cdown
                local cleft
                local cupright
                local cdownright
                local cdownleft
                local cupleft
                local ctopleft
		local ctopright
		local ctopbottom
		local ctoptop




        center=player:getObjectsInCell(m,centerx,centery,BL_MOB)
        up=player:getObjectsInCell(m,upx,upy,BL_MOB)
        right=player:getObjectsInCell(m,rightx,righty,BL_MOB)
        down=player:getObjectsInCell(m,downx,downy,BL_MOB)
        left=player:getObjectsInCell(m,leftx,lefty,BL_MOB)
        upright=player:getObjectsInCell(m,uprightx,uprighty,BL_MOB)
        downright=player:getObjectsInCell(m,downrightx,downrighty,BL_MOB)
        downleft=player:getObjectsInCell(m,downleftx,downlefty,BL_MOB)
        upleft=player:getObjectsInCell(m,upleftx,uplefty,BL_MOB)
	topright=player:getObjectsInCell(m,toprightx,toprighty,BL_MOB)
	topleft=player:getObjectsInCell(m,topleftx,toplefty,BL_MOB)
	topbottom=player:getObjectsInCell(m,topbottomx,topbottomy,BL_MOB)
	toptop=player:getObjectsInCell(m,toptopx,toptopy,BL_MOB)

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
		calc=1+((calc-4)*0.125)
	end
	
	calc=25*calc

	if(player.magic>=5) then
        if(#center>0) then
                if(center[1].blType==BL_MOB) then
                      center[1]:sendAnimation(280)
                      center[1].attacker=player.ID
                      center[1]:removeHealth(calc)                 
                end
        end
        if(#up>0) then
		if(up[1].blType==BL_MOB) then
                      up[1]:sendAnimation(280)
		      up[1].attacker=player.ID
                      up[1]:removeHealthExtend(calc, 1, 1, 1, 1, 0)
                end
        end
        if(#right>0) then
                if(right[1].blType==BL_MOB) then
                      right[1]:sendAnimation(280)
                      right[1].attacker=player.ID
                      right[1]:removeHealthExtend(calc, 1, 1, 1, 1, 0)
                end
        end
        if(#down>0) then
                if(down[1].blType==BL_MOB) then
                      down[1]:sendAnimation(280)
                      down[1].attacker=player.ID
                      down[1]:removeHealthExtend(calc, 1, 1, 1, 1, 0)
                end
        end
        if(#left>0) then
                if(left[1].blType==BL_MOB) then
                      left[1]:sendAnimation(280)
		      left[1].attacker=player.ID
                      left[1]:removeHealthExtend(calc, 1, 1, 1, 1, 0)
                end
        end
	if(#upright>0) then
                if(upright[1].blType==BL_MOB) then
                      upright[1]:sendAnimation(280)
		      upright[1].attacker=player.ID
                      upright[1]:removeHealthExtend(calc, 1, 1, 1, 1, 0)
                end
        end
	if(#downright>0) then
                if(downright[1].blType==BL_MOB) then
                      downright[1]:sendAnimation(280)
 		      downright[1].attacker=player.ID
                      downright[1]:removeHealthExtend(calc, 1, 1, 1, 1, 0)
                end
        end
	if(#downleft>0) then
                if(downleft[1].blType==BL_MOB) then
                      downleft[1]:sendAnimation(280)
                      downleft[1].attacker=player.ID
                      downleft[1]:removeHealthExtend(calc, 1, 1, 1, 1, 0)
                end
        end
	if(#upleft>0) then
                if(upleft[1].blType==BL_MOB) then
                      upleft[1]:sendAnimation(280)
                      upleft[1].attacker=player.ID
                      upleft[1]:removeHealthExtend(calc, 1, 1, 1, 1, 0)
                end
        end
	if(#topright>0) then
                if(topright[1].blType==BL_MOB) then
                      topright[1]:sendAnimation(280)
                      topright[1].attacker=player.ID
                      topright[1]:removeHealthExtend(calc, 1, 1, 1, 1, 0)
                end
        end
	if(#topleft>0) then
                if(topleft[1].blType==BL_MOB) then
                      topleft[1]:sendAnimation(280)
                      topleft[1].attacker=player.ID
                      topleft[1]:removeHealthExtend(calc, 1, 1, 1, 1, 0)
                end
        end
	if(#topbottom>0) then
                if(topbottom[1].blType==BL_MOB) then
                      topbottom[1]:sendAnimation(280)
                      topbottom[1].attacker=player.ID
                      topbottom[1]:removeHealth(calc, 1, 1, 1, 1, 0)
                end
        end
	if(#toptop>0) then
                if(toptop[1].blType==BL_MOB) then
                      toptop[1]:sendAnimation(280)
                      toptop[1].attacker=player.ID
                      toptop[1]:removeHealthExtend(calc, 1, 1, 1, 1, 0)
                end
        end

	if(player.magic>=5) then
        player:addMana(-5)
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