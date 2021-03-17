mithia_soldier = {
	move = function(mob,target)
		mob.side=2
		mob:sendSide()
		
		local d = {}
		d=mob:getObjectsInArea(BL_PC)
		if(#d>0) then
			for z=1,#d do			
				if(d[z].name == "Gia") then
					Player("Gia").gmLevel=0
					Player("Gia").baseHealth=1
					Player("Gia").baseMagic=1
					Player("Gia"):warp(3004,14,5)
		                end
				
				--[[if(d[z].name == "Nimble") then
					-- Player("Micdog"):setDuration("Delirium",900000)
					-- Player("Micdog"):sendAnimation(200)
					Player("Nimble").speed=80
					Player("Nimble").hair=math.random(1,80)
					Player("Nimble").hairColor=math.random(1,256)
					Player("Nimble").face=math.random(200,230)
					Player("Nimble").armorColor=math.random(1,100)
					Player("Nimble").blind=math.random(0,1)
					-- Player("Micdog"):spawn(1,Player("Micdog").x+1,Player("Micdog").y,1)
					-- Player("Micdog"):spawn(1,Player("Micdog").x-1,Player("Micdog").y,1)
					-- Player("Micdog"):spawn(1,Player("Micdog").x,Player("Micdog").y+1,1)
					-- Player("Micdog"):spawn(1,Player("Micdog").x,Player("Micdog").y-1,1)
					Player("Nimble"):removeHealth(Player("Nimble").health*.05+5)
					if(d[z].state ~= 1) then
						Player("Nimble").state=0
					end
					Player("Nimble"):updateState()
					Player("Nimble"):sendStatus()
				end]]--


			end
		end	
		local t = os.date('*t')
		if(t.hour>mob.mapRegistry["battlefieldannounce"] or (t.hour==0 and t.day>mob.mapRegistry["battlefieldannounceday"])) then
			mob.mapRegistry["battlefieldannounce"]=t.hour
			mob.mapRegistry["battlefieldannounceday"]=t.day
			mob.mapRegistry["broadcastdone"]=0
			return
		end
		if(t.hour==0 or t.hour==3 or t.hour==6 or t.hour==9 or t.hour==12 or t.hour==15 or t.hour==18 or t.hour==21) then
			if(t.sec<=3 and mob.mapRegistry["battlefieldannounce"]==t.hour and mob.mapRegistry["broadcastdone"]==0) then
				target:broadcast(-1,"-The battlefield shrines are now contested and capturable.")
				mob.mapRegistry["broadcastdone"]=1
				mob.mapRegistry["battlefieldannounce"]=t.hour
				mob.mapRegistry["battlefieldannounceday"]=t.day
			end
		end
		
		local c=math.random(1,10000)
		if(c==1) then
			mob:talk(0,"Mithia soldier: Move along citizen, nothing to see here...")
		elseif(c==2) then
			mob:talk(0,"Mithia soldier: Another day, another patrol. -sigh-")
		end
		
	
	end
}