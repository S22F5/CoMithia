box = {
use = function(player)
	if(player.state==1) then
		player:sendMinitext("You try to with your ghostly mittens but fail...")
		return
	elseif (player.state == 3) then
		player:sendMinitext("Can't do that while riding.")
		return
	end
	
	if (player:hasItem("box",1)) then
		player:addItem("wooden_sword",1,0,player.ID,""..player.name.."'s first sword")
		player:removeItem("box",1)
	end
end
}