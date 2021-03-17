backupexplode = {
	cast=function(player,target)
		local center={}
                local up={}
                local right={}
                local down={}
                local left={} 		
                local m=player.m
                local centerx=target.x
                local centery=target.y
                local upx=target.x
                local upy=target.y-1
                local rightx=target.x+1
                local righty=target.y
                local downx=target.x
                local downy=target.y+1
                local leftx=target.x-1
                local lefty=target.y
		local pcenter={}
                local pup={}
                local pright={}
                local pdown={}
                local pleft={} 		
                local pm=player.m
                local pcenterx=target.x
                local pcentery=target.y
                local pupx=target.x
                local pupy=target.y-1
                local prightx=target.x+1
                local prighty=target.y
                local pdownx=target.x
                local pdowny=target.y+1
                local pleftx=target.x-1
                local plefty=target.y
		

                if(player.state==1) then
                    player:sendMinitext("Spirits can't do that") 
                    return
                end
		if(player.state==3) then
			player:sendMinitext("You can not cast this spell on a mount.")
			return
		end

                 
                if(player.magic<310) then
                    player:sendMinitext("You do not have enough Mana")
                    return
                end
		if(target.ID==player.ID) then
		    player:sendMinitext("Something went wrong.")
		    return
		end        

        calc=(player.will*5)+(player.magic/200)
        center=player:getObjectsInCell(m,centerx,centery,BL_MOB)
        up=player:getObjectsInCell(m,upx,upy,BL_MOB)
        right=player:getObjectsInCell(m,rightx,righty,BL_MOB)
        down=player:getObjectsInCell(m,downx,downy,BL_MOB)
        left=player:getObjectsInCell(m,leftx,lefty,BL_MOB)
	pcenter=player:getObjectsInCell(m,centerx,centery,BL_PC)
        pup=player:getObjectsInCell(m,upx,upy,BL_PC)
        pright=player:getObjectsInCell(m,rightx,righty,BL_PC)
        pdown=player:getObjectsInCell(m,downx,downy,BL_PC)
        pleft=player:getObjectsInCell(m,leftx,lefty,BL_PC)


	if(player.pvp==false) then
	if(#center>0) then
		if(#center>0) then
                      center[1]:sendAnimation(188)
		      center[1].attacker=player.ID
		      center[1]:removeHealthExtend(calc, 1, 1, 1, 1, 0)
		      center[1].target=player.ID
		end
		if(#up>0) then
			up[1]:sendAnimation(188)
			up[1].attacker=player.ID
			up[1]:removeHealthExtend(calc, 1, 1, 1, 1, 0)
			up[1].target=player.ID
		end
		if(#right>0) then
			right[1]:sendAnimation(188)
			right[1].attacker=player.ID
			right[1]:removeHealthExtend(calc, 1, 1, 1, 1, 0)
			right[1].target=player.ID
		end
		if(#down>0) then
			down[1]:sendAnimation(188)
			down[1].attacker=player.ID
			down[1]:removeHealthExtend(calc, 1, 1, 1, 1, 0)
			down[1].target=player.ID
		end
		if(#left>0) then
			left[1]:sendAnimation(188)
			left[1].attacker=player.ID
			left[1]:removeHealthExtend(calc, 1, 1, 1, 1, 0)
			left[1].target=player.ID
		end
		player:sendMinitext("You cast Explode.")
	else
	player:sendMinitext("Something went wrong.")
	end
	else
	if(#center>0 or #pcenter>0) then
		if(#center>0) then
                      center[1]:sendAnimation(188)
		      center[1].attacker=player.ID
		      center[1]:removeHealthExtend(calc, 1, 1, 1, 1, 0)
		      center[1].target=player.ID
		end
		if(#up>0) then
			up[1]:sendAnimation(188)
			up[1].attacker=player.ID
			up[1]:removeHealthExtend(calc, 1, 1, 1, 1, 0)
			up[1].target=player.ID
		end
		if(#right>0) then
			right[1]:sendAnimation(188)
			right[1].attacker=player.ID
			right[1]:removeHealthExtend(calc, 1, 1, 1, 1, 0)
			right[1].target=player.ID
		end
		if(#down>0) then
			down[1]:sendAnimation(188)
			down[1].attacker=player.ID
			down[1]:removeHealthExtend(calc, 1, 1, 1, 1, 0)
			down[1].target=player.ID
		end
		if(#left>0) then
			left[1]:sendAnimation(188)
			left[1].attacker=player.ID
			left[1]:removeHealthExtend(calc, 1, 1, 1, 1, 0)
			left[1].target=player.ID
		end
		if(#pcenter>0) then
			if(pcenter[1].ID~=player.ID and pcenter[1].state~=1) then
                      	pcenter[1]:sendAnimation(188)
		      	pcenter[1]:sendMinitext(""..player.name.." casts Explode on you.")
		      	pcenter[1].attacker=player.ID
		      	pcenter[1]:removeHealthExtend(calc, 1, 1, 1, 1, 0)
		      	pcenter[1].target=player.ID
			end
		end
		if(#pup>0) then
			if(pup[1].ID~=player.ID and pup[1].state~=1) then
			pup[1]:sendAnimation(188)
		      	pup[1]:sendMinitext(""..player.name.." casts Explode on you.")
			pup[1].attacker=player.ID
			pup[1]:removeHealthExtend(calc, 1, 1, 1, 1, 0)
			pup[1].target=player.ID
			end
		end
		if(#pright>0) then
			if(pright[1].ID~=player.ID and pright[1].state~=1) then
			pright[1]:sendAnimation(188)
		      	pright[1]:sendMinitext(""..player.name.." casts Explode on you.")
			pright[1].attacker=player.ID
			pright[1]:removeHealthExtend(calc, 1, 1, 1, 1, 0)
			pright[1].target=player.ID
			end
		end
		if(#pdown>0) then
			if(pdown[1].ID~=player.ID and down[1].state~=1) then
			pdown[1]:sendAnimation(188)
		      	pdown[1]:sendMinitext(""..player.name.." casts Explode on you.")
			pdown[1].attacker=player.ID
			pdown[1]:removeHealthExtend(calc, 1, 1, 1, 1, 0)
			pdown[1].target=player.ID
			end
		end
		if(#pleft>0) then
			if(pleft[1].ID~=player.ID and pleft[1].state~=1) then
			pleft[1]:sendAnimation(188)
		      	pleft[1]:sendMinitext(""..player.name.." casts Explode on you.")
			pleft[1].attacker=player.ID
			pleft[1]:removeHealthExtend(calc, 1, 1, 1, 1, 0)
			pleft[1].target=player.ID
			end
		end
		player:sendMinitext("You cast Explode.")
	end
	end
        end,
requirements=function(player)
		local l=94
		local i={0}
		local ia={1000000}
		local d={"Explode\n\nAn elemental attack of fire. Damage depends on your will and mana","You shall have to sacrifice 1000000 coins to learn this ability"}
		return l,i,ia,d
	end       
}