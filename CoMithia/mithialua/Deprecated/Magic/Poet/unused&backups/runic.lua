runic = {
	cast=function(player,target)

		player:sendMinitext("This spell has been deprecated and does not exist anymore")
		return

--[[		local m
		local w
		local g
                if(player.state==1) then
			player:sendMinitext("Spirits can't do that.")
			return
		end
		if(player.state==3) then
			player:sendMinitext("You can not cast this spell on a mount.")
			return
		end


		if(target.state==1) then
			player:sendMinitext("This wouldn't be of very much help right now.")
			return
		end

		if(player.magic<480) then
			player:sendMinitext("You do not have enough mana.")
			return
		end
		
		if(target.blType==BL_MOB) then
			player:sendMinitext("Something went wrong.")
			return
		end

		if(target:hasDuration("evade")) then
			player:sendMinitext("Evade is already in effect.")
			return
		end
		if(target:hasDuration("will")) then
			player:sendMinitext("Will is already in effect.")
			return
		end
		if(target:hasDuration("empower")) then
			player:sendMinitext("Empower is already in effect.")
			return
		end
		if(target:hasDuration("runic")) then
			player:sendMinitext("Runic is already in effect.")
			return
		end
		if(target:hasDuration("guardian")) then
				player:sendMinitext("Guardian is already running.")
				return
		end
		     m=target.might
		     w=target.will
		     g=target.grace
		     target.grace=g+16
		     target.might=m+16
		     target.will=w+16
		     target:sendStatus()
                     target:sendAnimation(125)
                     player:playSound(726)
                     player:addMana(-480)
		     if(player.ID~=target.ID) then
   			target:sendMinitext(player.name .." casts Runic on you.")
		     end  
                     target:setDuration("runic",320000)
		     player:sendMinitext("You cast Runic.")
		     target:sendMinitext("You feel a like a whole new person!")
                     player:sendAction(6,35)
]]--
        end,

	uncast=function(player)
		player.grace=player.grace-16
		player.will=player.will-16
		player.might=player.might-16
		player:sendStatus()
		
	end,
	recast=function(player)
		player.grace=player.grace+16
		player.will=player.will+16
		player.might=player.might+16
		player:sendStatus()
	end,
	fix=function(player)
		player.grace=player.grace+16
		player.will=player.will+16
		player.might=player.might+16
		player:sendStatus()
	end,
	requirements=function(player)
		local l=67
		local i={0,372}
		local ia={3500,5}
		local d={"Runic\n\nA powerful spell bettering one's attributes.","You shall have to sacrifice (5) Stolen money sack and 3500 coins to learn this ability"}
		return l,i,ia,d
	end       
}