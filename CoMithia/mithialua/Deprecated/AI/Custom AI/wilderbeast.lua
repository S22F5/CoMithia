wilderbeast = {
	move = function(mob,target)
		local moved=true
		local tl= { }
		local tr= { }
		local bl= { }
		local br= { }
		local cho
		local ra=math.random(1,12)
		local count=0
		
		
		tl=target:getObjectsInCell(1710,17,13,BL_PC)
		tr=target:getObjectsInCell(1710,19,13,BL_PC)
		bl=target:getObjectsInCell(1710,17,15,BL_PC)
		br=target:getObjectsInCell(1710,19,15,BL_PC)
		
		

		if(#tl>0) then
			if(tl[1].class==4 and tl[1].state~=1) then
				count=count+1
			end
		end
		if(#tr>0) then
			if(tr[1].class==3 and tr[1].state~=1) then
				count=count+1
			end
		end
		if(#bl>0) then
			if(bl[1].class==1 and bl[1].state~=1) then
				count=count+1
			end
		end
		if(#br>0) then
			if(br[1].class==2 and br[1].state~=1) then
				count=count+1
			end
		end
		
		if(target.mapRegistry["countcalling"]==0 and count==4) then
			target.mapRegistry["countcalling"]=1
			target:broadcast(1710,"-The Wilderbeast is cut from the power of the statues and now vulnerable!-")
		elseif(target.mapRegistry["countcalling"]==1 and count<4) then
			target.mapRegistry["countcalling"]=0
			target:broadcast(1710,"-The Wilderbeast becomes infused by the power of the statues!-")
		end
		if(count<4 and mob.health>100) then
			mob:sendAnimation(132)
			mob:addHealth(10000)
		end
		
		if(target.group~=nil) then	
		if(target.blType==BL_PC and #target.group>1 and ra==1) then
			cho=math.random(1,#target.group)
				while(Player(target.group[cho]).m~=mob.m or Player(target.group[cho]).state==1) do
					cho=math.random(1,#target.group)
					ran=ran+1
					if(ran>100) then break end
				end
				frozen_touch.cast(mob,Player(target.group[cho]))
		end
                else
			if(ra==1) then
				frozen_touch.cast(mob,target)
			end				

		end





		
		if(mob.state ~= MOB_HIT) then
			
			--while moved==true do

			--math.randomseed( os.time() )
				mob.side=math.random(0,3)
				moved=mob:move()
			--end
						
			
		else
			if(target~=nil) then
			mobAIbasic.move_hit(mob,target)
			end
		end
		
	end,
	move_hit=function(mob,target)
		
		if target then
				
				
				local moved=FindCoords(mob,target,1)
				if(moved) then
					--We are right next to them, so attack!	
					
					mob:attackIT(target,mob.might,mob.might/2)
				end
				-- mob:spawn(1,mob.x+1,mob.y,1,5)	
				
			
		end
		
	end,
	on_spawn=function(mob)
	local g=math.random(24,29)
	local h=math.random(6,28)

	mob.x=g
	mob.y=h

	end,
	on_death=function(mob,player)
	local e=math.random(1,100)
	local d=math.random(1,2)
	local f=math.random(1,9)
	local c=math.random(1,100)
	local gold=math.random(800,1000)

		if(c>1 and c<=10) then
			if(d==1) then
				mob:dropItem("recipe_winters_chill",1)
			elseif(d==2) then
				mob:dropItem("recipe_frostbane",1)
			end
		elseif(c>10 and c<=25) then
			mob:dropItem("headband",1)
		elseif(c>25 and c<=40) then
			mob:dropItem("celerity",1)
		elseif(c>40 and c<=60) then
			mob:dropItem("azure_band",1)
		elseif(c>60 and c<=90) then
			mob:dropItem("tattered_cape",1)
		elseif(c>90 and c<=95) then
			if(f==1) then
				mob:dropItem("recipe_rugged_armor",1)
			elseif(f==2) then
				mob:dropItem("recipe_rugged_armor_dress",1)
			elseif(f==3) then
				mob:dropItem("recipe_rugged_platemail",1)
			elseif(f==4) then
				mob:dropItem("recipe_rugged_plate_dress",1)
			elseif(f==5) then
				mob:dropItem("recipe_rugged_mantle",1)
			elseif(f==6) then
				mob:dropItem("recipe_rugged_drapery",1)
			elseif(f==7) then
				mob:dropItem("recipe_rugged_clothes",1)
			elseif(f==8) then
				mob:dropItem("recipe_rugged_skirt",1)
			elseif(f==9) then
				mob:dropItem("recipe_tigers_eye_ring",1)				
			end
		else
			mob:dropItem(0,gold)
		end
		if(e<=50) then
			mob:dropItem("frozen_heart",1)
		end

	end
}
