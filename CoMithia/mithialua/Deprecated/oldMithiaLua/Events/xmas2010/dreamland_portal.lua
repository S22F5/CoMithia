dreamland_portal = {
	use = async(function(player)
		
		player:dialogSeq({"The Xmas 2010 event is over, happy New Year!"})
		if(player.state==1) then
			player:sendMinitext("Spirits can't do that")
			return
		end
		local t={graphic=convertGraphic(0,"monster"),color=0}
		player.npcGraphic=t.graphic
		player.npcColor=t.color

		if(os.time()<player.registry["dreamlandportal"]) then
			player:sendMinitext("You have teleported to the dreamland recently and cannot go back there just yet. ["..player.registry["dreamlandportal"]-os.time().." seconds remaining]")
			return
		end
		player:dialogSeq({"By using the portal, you will be transported to the Dreamland where the Evil Spirit was imprisoned by Santa.","You should go prepared, who knows what dangers you will face over there...","Press next to be transported. Please note that you will only be able to use the portal every 15 minutes"},1)
		player.registry["dreamlandportal"]=os.time()+900
		player:warp(11003,math.random(8,14),math.random(8,14))
		player:sendMinitext("You feel a strange feeling as you step in the portal and transport to this place... Oh no! It's Gredinch !")

		
	end)
}