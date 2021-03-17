clone = {

cast = function(player, target)
	if (player:hasDuration("clone")) then
		player:sendMinitext("You have already cloned someone.")
		return
	end
	
	if (player.x == target.x and player.y == target.y) then
		player:sendMinitext("You are too close to clone that target.")
		return
	end
	
	if (player.state == 1) then
		player:sendMinitext("You cannot do that while dead.")
		return
	end
	
	if (player.state == 3) then
		player:sendMinitext("You cannot do that while mounted.")
		return
	end
	
	if (target.state == 1) then
		player:die()
		player:sendMinitext("You asked for it...")
		return
	end
	
	if (target.state == 2 or target.state == 5) then
		player:sendMinitext("You peer through the shadows, but cannot make out your target.")
		return
	end
	
	if (target.state == 3) then
		player:sendMinitext("You try to make a mount out of thin air, but realize how silly this looks.")
		return
	end
	
	if (target.state == 4 or target.blType == BL_MOB) then
		player:sendMinitext("What are you thinking?! Run away!")
		return
	end
	
	if (player.blType == BL_PC and (target.blType == BL_NPC or (target.gmLevel >= 50 and player.gmLevel < 50))) then
		player:sendMinitext("That being is too powerful, they see right through your guise.")
		return
	end
	
	if (target.gfxClone == 1) then
		player:sendMinitext("You try to discern their true identity, but cannot seem to pull it off.")
		return
	end
	
	local item
	
	if (target:getEquippedItem(EQ_WEAP) ~= nil) then
		item = target:getEquippedItem(EQ_WEAP)
		player.gfxWeap = item.look
		player.gfxWeapC = item.lookC
	else 
		player.gfxWeap = 65535
	end
	if (target:getEquippedItem(EQ_ARMOR) ~= nil) then
		item = target:getEquippedItem(EQ_ARMOR)
		player.gfxArmor = item.look
		player.gfxArmorC = item.lookC
	else
		player.gfxArmor = target.sex
	end
	if (target:getEquippedItem(EQ_COAT) ~= nil) then
		item = target:getEquippedItem(EQ_COAT)
		player.gfxArmor = item.look
		player.gfxArmorC = item.lookC
	end
	if (target:getEquippedItem(EQ_SHIELD) ~= nil) then
		item = target:getEquippedItem(EQ_SHIELD)
		player.gfxShield = item.look
		player.gfxShieldC = item.lookC
	else
		player.gfxShield = 65535
	end
	if (target:getEquippedItem(EQ_HELM) ~= nil) then
		item = target:getEquippedItem(EQ_HELM)
		player.gfxHelm = item.look
		player.gfxHelmC = item.lookC
	else
		player.gfxHelm = 65535
	end
	if (target:getEquippedItem(EQ_FACEACC) ~= nil) then
		item = target:getEquippedItem(EQ_FACEACC)
		player.gfxFaceA = item.look
		player.gfxFaceAC = item.lookC
	else
		player.gfxFaceA = 65535
	end
	player.gfxFaceAT = 65535
	if (target:getEquippedItem(EQ_CROWN) ~= nil) then
		item = target:getEquippedItem(EQ_CROWN)
		player.gfxCrown = item.look
		player.gfxCrownC = item.lookC
	else
		player.gfxCrown = 65535
	end
	if (target:getEquippedItem(EQ_MANTLE) ~= nil) then
		item = target:getEquippedItem(EQ_MANTLE)
		player.gfxCape = item.look
		player.gfxCapeC = item.lookC
	else
		player.gfxCape = 65535
	end
	if (target:getEquippedItem(EQ_NECKLACE) ~= nil) then
		item = target:getEquippedItem(EQ_NECKLACE)
		player.gfxNeck = item.look
		player.gfxNeckC = item.lookC
	else
		player.gfxNeck = 65535
	end
	if (target:getEquippedItem(EQ_BOOTS) ~= nil) then
		item = target:getEquippedItem(EQ_BOOTS)
		player.gfxBoots = item.look
		player.gfxBootsC = item.lookC
	else
		player.gfxBoots = target.sex
	end
	
	player.gfxFace = target.face
	player.gfxHair = target.hair
	player.gfxHairC = target.hairColor
	player.gfxFaceC = target.faceColor
	player.gfxSkinC = target.skinColor
	player.gfxDye = target.armorColor
	player.gfxName = target.name
	
	player.gfxClone = 1
	
	if (player.blType == BL_MOB) then
		local players = player:getObjectsInArea(BL_PC)
		
		if (#players > 0) then
			for x = 1, #players do
				players[x]:refresh()
			end
		end
	else
		player:refresh()
	end
	
	player:setDuration("clone", 5000)
end,

uncast = function(player)
	player.gfxClone = 0
	
	if (player.blType == BL_MOB) then
		local players = player:getObjectsInArea(BL_PC)
		
		if (#players > 0) then
			for x = 1, #players do
				players[x]:refresh()
			end
		end
	else
		player:refresh()
	end
end,

recast = function(player)
	player.gfxClone = 1
	player:refresh()
end,

requirements = function(player)

end

}