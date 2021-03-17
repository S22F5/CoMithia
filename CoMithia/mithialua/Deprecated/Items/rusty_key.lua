rusty_key = {
	use = async(function(player)
	local t={graphic=convertGraphic(809,"monster"),color=2}
	local x=math.random(1,100)
	local y=math.random(1,3)
	local z=math.random(1,5)
	local gold=50*y 

		if(player.state==1) then
			player:sendMinitext("Spirits can't do that")
			return
		end

	if(player.m==1108 and player.x==14 and player.y==4 and player.side==0) then
			if(player.mapRegistry["swagchesttimer"]+60<os.time()) then
					player.mapRegistry["swagchesttimer"]=os.time()
					if(x<40) then
						player:removeItem(245,1)
						player.money=player.money+gold
						player:sendMinitext("You receive some gold.")
						player:sendStatus()
						player:dialogSeq({t,"You unlocked the chest and grabbed some swag."})
					elseif(x>=40 and x<75) then
						player:removeItem(245,1)
						player:addItem("amethyst",z)
						player:dialogSeq({t,"You unlocked the chest and grabbed some swag."})
					elseif(x>=75) then
						player:removeItem(245,1)
						player:addItem("blood_ring",1)
						player:dialogSeq({t,"You unlocked the chest and grabbed some swag."})
					end
					
			else
				player:sendMinitext("The Swag chest can only be opened every 60 seconds.")
			end
	else
		player:sendMinitext("You can't use that.")
	end
  end)
}