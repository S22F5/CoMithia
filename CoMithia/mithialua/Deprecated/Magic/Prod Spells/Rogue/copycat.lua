copycat = {
cast = function(player)
	local mobTarget = getTargetFacing(player, BL_MOB)
	local pcTarget = getTargetFacing(player, BL_PC)
	local npcTarget = getTargetFacing(player, BL_NPC)
	local aether = 60000
	local duration = 60000
	local magicCost = 300
	
	if (not player:canCast(1, 1, 2)) then
		return
	end
	
	if (player.magic < magicCost) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	if (player.gmLevel == 0 and pcTarget ~= nil and pcTarget.gmLevel > 0) then
		player:sendMinitext("That being is too powerful, they see right through your guise.")
		return
	end
	
	if (player:hasDuration("copycat")) then
		player:sendMinitext("That spell is already cast.")
		return
	end
	
	if (pcTarget ~= nil) then
		if (pcTarget.state == 1 or pcTarget.state == 2 or pcTarget.state == 5) then
			return
		end
		
		player:setDuration("copycat", duration, pcTarget.ID)
		player:sendAnimation(103, 0)
	elseif (npcTarget ~= nil) then
		if (npcTarget.state == 1 or npcTarget.state == 2 or npcTarget.state == 5) then
			return
		end
		
		player:setDuration("copycat", duration, npcTarget.ID)
		player:sendAnimation(103, 0)
	elseif (mobTarget ~= nil) then
		if (mobTarget.charState == 1 or mobTarget.charState == 2 or mobTarget.charState == 5) then
			return
		end
		
		player:setDuration("copycat", duration, mobTarget.ID)
		player:sendAnimation(103, 0)
	end
	
	player:sendAction(6, 20)
	player:setAether("copycat", aether)
	player:calcStat()
	player:sendMinitext("You cast Copycat.")
end,

recast = function(player, caster)
	local item
	
	if (caster ~= nil) then
		if (caster.blType == BL_PC) then
			if (caster.state == 1 or caster.state == 2 or caster.state == 5) then
				return
			end		
			
			if (caster.gfxClone == 0 and caster.state ~= 4) then
				if (caster:getEquippedItem(EQ_WEAP) ~= nil) then
					item = caster:getEquippedItem(EQ_WEAP)
					player.gfxWeap = item.look
					player.gfxWeapC = item.lookC
				else 
					player.gfxWeap = 65535
				end
				
				if (caster:getEquippedItem(EQ_ARMOR) ~= nil) then
					item = caster:getEquippedItem(EQ_ARMOR)
					player.gfxArmor = item.look
					player.gfxArmorC = item.lookC
				else
					player.gfxArmor = caster.sex
				end
				
				if (caster:getEquippedItem(EQ_COAT) ~= nil) then
					item = caster:getEquippedItem(EQ_COAT)
					player.gfxArmor = item.look
					player.gfxArmorC = item.lookC
				end
				
				if (caster:getEquippedItem(EQ_SHIELD) ~= nil) then
					item = caster:getEquippedItem(EQ_SHIELD)
					player.gfxShield = item.look
					player.gfxShieldC = item.lookC
				else
					player.gfxShield = 65535
				end
				
				if (caster:getEquippedItem(EQ_HELM) ~= nil and (caster.settings - (caster.settings % 8192)) / 8192 == 1) then
					item = caster:getEquippedItem(EQ_HELM)
					player.gfxHelm = item.look
					player.gfxHelmC = item.lookC
				else
					player.gfxHelm = 255
				end
				
				if (caster:getEquippedItem(EQ_FACEACC) ~= nil) then
					item = caster:getEquippedItem(EQ_FACEACC)
					player.gfxFaceA = item.look
					player.gfxFaceAC = item.lookC
				else
					player.gfxFaceA = 65535
				end
				
				player.gfxFaceAT = 65535
				
				if (caster:getEquippedItem(EQ_CROWN) ~= nil) then
					item = caster:getEquippedItem(EQ_CROWN)
					player.gfxCrown = item.look
					player.gfxCrownC = item.lookC
				else
					player.gfxCrown = 65535
				end
				
				if (caster:getEquippedItem(EQ_MANTLE) ~= nil) then
					item = caster:getEquippedItem(EQ_MANTLE)
					player.gfxCape = item.look
					player.gfxCapeC = item.lookC
				else
					player.gfxCape = 65535
				end
				
				if (caster:getEquippedItem(EQ_NECKLACE) ~= nil) then
					item = caster:getEquippedItem(EQ_NECKLACE)
					player.gfxNeck = item.look
					player.gfxNeckC = item.lookC
				else
					player.gfxNeck = 65535
				end
				
				if (caster:getEquippedItem(EQ_BOOTS) ~= nil) then
					item = caster:getEquippedItem(EQ_BOOTS)
					player.gfxBoots = item.look
					player.gfxBootsC = item.lookC
				else
					player.gfxBoots = caster.sex
				end
				
				player.gfxFace = caster.face
				player.gfxHair = caster.hair
				player.gfxHairC = caster.hairColor
				player.gfxFaceC = caster.faceColor
				player.gfxSkinC = caster.skinColor
				player.gfxDye = caster.armorColor
				
				if (caster.title ~= "") then
					player.gfxName = caster.title.." "..caster.name
				else
					player.gfxName = caster.name
				end
				
				player.gfxClone = 1
			elseif (caster.gfxClone == 1 and caster.state ~= 4) then
				player.gfxWeap = caster.gfxWeap
				player.gfxWeapC = caster.gfxWeapC
				player.gfxArmor = caster.gfxArmor
				player.gfxArmorC = caster.gfxArmorC
				player.gfxShield = caster.gfxShield
				player.gfxShieldC = caster.gfxShieldC
				player.gfxHelm = caster.gfxHelm
				player.gfxHelmC = caster.gfxHelmC
				player.gfxFaceA = caster.gfxFaceA
				player.gfxFaceAC = caster.gfxFaceAC
				player.gfxFaceAT = 65535
				player.gfxCrown = caster.gfxCrown
				player.gfxCrownC = caster.gfxCrownC
				player.gfxCape = caster.gfxCape
				player.gfxCapeC = caster.gfxCapeC
				player.gfxNeck = caster.gfxNeck
				player.gfxNeckC = caster.gfxNeckC
				player.gfxBoots = caster.gfxBoots
				player.gfxBootsC = caster.gfxBootsC
				player.gfxFace = caster.gfxFace
				player.gfxHair = caster.gfxHair
				player.gfxHairC = caster.gfxHairC
				player.gfxFaceC = caster.gfxFaceC
				player.gfxSkinC = caster.gfxSkinC
				player.gfxDye = caster.gfxDye
				player.gfxName = caster.gfxName
				player.gfxClone = 1
			elseif (caster.state == 4) then
				player.disguise = caster.disguise
				player.disguiseColor = caster.disguiseColor
				player.state = 4
			end
		elseif (caster.blType == BL_NPC) then
			if (caster.state == 1 or caster.state == 2 or caster.state == 5) then
				return
			end		
			
			if (caster.gfxClone == 0 and caster.npcType == 1 and caster.state ~= 4) then
				if (caster:getEquippedItem(EQ_WEAP) ~= nil) then
					item = caster:getEquippedItem(EQ_WEAP)
					player.gfxWeap = item[1]
					player.gfxWeapC = item[2]
				else 
					player.gfxWeap = 65535
				end
				
				if (caster:getEquippedItem(EQ_ARMOR) ~= nil) then
					item = caster:getEquippedItem(EQ_ARMOR)
					player.gfxArmor = item[1]
					player.gfxArmorC = item[2]
				else
					player.gfxArmor = caster.sex
				end
				
				if (caster:getEquippedItem(EQ_COAT) ~= nil) then
					item = caster:getEquippedItem(EQ_COAT)
					player.gfxArmor = item[1]
					player.gfxArmorC = item[2]
				end
				
				if (caster:getEquippedItem(EQ_SHIELD) ~= nil) then
					item = caster:getEquippedItem(EQ_SHIELD)
					player.gfxShield = item[1]
					player.gfxShieldC = item[2]
				else
					player.gfxShield = 65535
				end
				
				if (caster:getEquippedItem(EQ_HELM) ~= nil) then
					item = caster:getEquippedItem(EQ_HELM)
					player.gfxHelm = item[1]
					player.gfxHelmC = item[2]
				else
					player.gfxHelm = 65535
				end
				
				if (caster:getEquippedItem(EQ_FACEACC) ~= nil) then
					item = caster:getEquippedItem(EQ_FACEACC)
					player.gfxFaceA = item[1]
					player.gfxFaceAC = item[2]
				else
					player.gfxFaceA = 65535
				end
				
				player.gfxFaceAT = 65535
				
				if (caster:getEquippedItem(EQ_CROWN) ~= nil) then
					item = caster:getEquippedItem(EQ_CROWN)
					player.gfxCrown = item[1]
					player.gfxCrownC = item[2]
				else
					player.gfxCrown = 65535
				end
				
				if (caster:getEquippedItem(EQ_MANTLE) ~= nil) then
					item = caster:getEquippedItem(EQ_MANTLE)
					player.gfxCape = item[1]
					player.gfxCapeC = item[2]
				else
					player.gfxCape = 65535
				end
				
				if (caster:getEquippedItem(EQ_NECKLACE) ~= nil) then
					item = caster:getEquippedItem(EQ_NECKLACE)
					player.gfxNeck = item[1]
					player.gfxNeckC = item[2]
				else
					player.gfxNeck = 65535
				end
				
				if (caster:getEquippedItem(EQ_BOOTS) ~= nil) then
					item = caster:getEquippedItem(EQ_BOOTS)
					player.gfxBoots = item[1]
					player.gfxBootsC = item[2]
				else
					player.gfxBoots = caster.sex
				end
				
				player.gfxFace = caster.face
				player.gfxHair = caster.hair
				player.gfxHairC = caster.hairColor
				player.gfxFaceC = caster.faceColor
				player.gfxSkinC = caster.skinColor
				player.gfxDye = caster.armorColor
				player.gfxName = ""--caster.name
				player.gfxClone = 1
			elseif (caster.gfxClone == 1 and caster.npcType == 1 and caster.state ~= 4) then
				player.gfxWeap = caster.gfxWeap
				player.gfxWeapC = caster.gfxWeapC
				player.gfxArmor = caster.gfxArmor
				player.gfxArmorC = caster.gfxArmorC
				player.gfxShield = caster.gfxShield
				player.gfxShieldC = caster.gfxShieldC
				player.gfxHelm = caster.gfxHelm
				player.gfxHelmC = caster.gfxHelmC
				player.gfxFaceA = caster.gfxFaceA
				player.gfxFaceAC = caster.gfxFaceAC
				player.gfxFaceAT = 65535
				player.gfxCrown = caster.gfxCrown
				player.gfxCrownC = caster.gfxCrownC
				player.gfxCape = caster.gfxCape
				player.gfxCapeC = caster.gfxCapeC
				player.gfxNeck = caster.gfxNeck
				player.gfxNeckC = caster.gfxNeckC
				player.gfxBoots = caster.gfxBoots
				player.gfxBootsC = caster.gfxBootsC
				player.gfxFace = caster.gfxFace
				player.gfxHair = caster.gfxHair
				player.gfxHairC = caster.gfxHairC
				player.gfxFaceC = caster.gfxFaceC
				player.gfxSkinC = caster.gfxSkinC
				player.gfxDye = caster.gfxDye
				player.gfxName = ""--caster.gfxName
				player.gfxClone = 1
			elseif (caster.npcType == 0 or caster.state == 4) then
				player.disguise = caster.look
				player.disguiseColor = caster.lookColor
				player.state = 4
			end
		elseif (caster.blType == BL_MOB) then
			if (caster.charState == 1 or caster.charState == 2 or caster.charState == 5) then
				return
			end		
			
			if (caster.gfxClone == 0 and caster.mobType == 1 and caster.charState ~= 4) then
				if (caster:getEquippedItem(EQ_WEAP) ~= nil) then
					item = caster:getEquippedItem(EQ_WEAP)
					player.gfxWeap = item[1]
					player.gfxWeapC = item[2]
				else 
					player.gfxWeap = 65535
				end
				
				if (caster:getEquippedItem(EQ_ARMOR) ~= nil) then
					item = caster:getEquippedItem(EQ_ARMOR)
					player.gfxArmor = item[1]
					player.gfxArmorC = item[2]
				else
					player.gfxArmor = caster.sex
				end
				
				if (caster:getEquippedItem(EQ_COAT) ~= nil) then
					item = caster:getEquippedItem(EQ_COAT)
					player.gfxArmor = item[1]
					player.gfxArmorC = item[2]
				end
				
				if (caster:getEquippedItem(EQ_SHIELD) ~= nil) then
					item = caster:getEquippedItem(EQ_SHIELD)
					player.gfxShield = item[1]
					player.gfxShieldC = item[2]
				else
					player.gfxShield = 65535
				end
				
				if (caster:getEquippedItem(EQ_HELM) ~= nil) then
					item = caster:getEquippedItem(EQ_HELM)
					player.gfxHelm = item[1]
					player.gfxHelmC = item[2]
				else
					player.gfxHelm = 65535
				end
				
				if (caster:getEquippedItem(EQ_FACEACC) ~= nil) then
					item = caster:getEquippedItem(EQ_FACEACC)
					player.gfxFaceA = item[1]
					player.gfxFaceAC = item[2]
				else
					player.gfxFaceA = 65535
				end
				
				player.gfxFaceAT = 65535
				
				if (caster:getEquippedItem(EQ_CROWN) ~= nil) then
					item = caster:getEquippedItem(EQ_CROWN)
					player.gfxCrown = item[1]
					player.gfxCrownC = item[2]
				else
					player.gfxCrown = 65535
				end
				
				if (caster:getEquippedItem(EQ_MANTLE) ~= nil) then
					item = caster:getEquippedItem(EQ_MANTLE)
					player.gfxCape = item[1]
					player.gfxCapeC = item[2]
				else
					player.gfxCape = 65535
				end
				
				if (caster:getEquippedItem(EQ_NECKLACE) ~= nil) then
					item = caster:getEquippedItem(EQ_NECKLACE)
					player.gfxNeck = item[1]
					player.gfxNeckC = item[2]
				else
					player.gfxNeck = 65535
				end
				
				if (caster:getEquippedItem(EQ_BOOTS) ~= nil) then
					item = caster:getEquippedItem(EQ_BOOTS)
					player.gfxBoots = item[1]
					player.gfxBootsC = item[2]
				else
					player.gfxBoots = caster.sex
				end
				
				player.gfxFace = caster.face
				player.gfxHair = caster.hair
				player.gfxHairC = caster.hairColor
				player.gfxFaceC = caster.faceColor
				player.gfxSkinC = caster.skinColor
				player.gfxDye = caster.armorColor
				player.gfxName = ""--caster.name
				player.gfxClone = 1
			elseif (caster.gfxClone == 1 and caster.mobType == 1 and caster.charState ~= 4) then
				player.gfxWeap = caster.gfxWeap
				player.gfxWeapC = caster.gfxWeapC
				player.gfxArmor = caster.gfxArmor
				player.gfxArmorC = caster.gfxArmorC
				player.gfxShield = caster.gfxShield
				player.gfxShieldC = caster.gfxShieldC
				player.gfxHelm = caster.gfxHelm
				player.gfxHelmC = caster.gfxHelmC
				player.gfxFaceA = caster.gfxFaceA
				player.gfxFaceAC = caster.gfxFaceAC
				player.gfxFaceAT = 65535
				player.gfxCrown = caster.gfxCrown
				player.gfxCrownC = caster.gfxCrownC
				player.gfxCape = caster.gfxCape
				player.gfxCapeC = caster.gfxCapeC
				player.gfxNeck = caster.gfxNeck
				player.gfxNeckC = caster.gfxNeckC
				player.gfxBoots = caster.gfxBoots
				player.gfxBootsC = caster.gfxBootsC
				player.gfxFace = caster.gfxFace
				player.gfxHair = caster.gfxHair
				player.gfxHairC = caster.gfxHairC
				player.gfxFaceC = caster.gfxFaceC
				player.gfxSkinC = caster.gfxSkinC
				player.gfxDye = caster.gfxDye
				player.gfxName = ""--caster.gfxName
				player.gfxClone = 1
			elseif (caster.mobType == 0 or caster.charState == 4) then
				player.disguise = caster.look
				player.disguiseColor = caster.lookColor
				player.state = 4
			end
		end
		
		player:refresh()
	end
end,

uncast = function(player)
	if (player.gfxClone == 1) then
		player.gfxClone = 0
	elseif (player.state == 4) then
		player.state = 0
	end
	
	player:updateState()
end,

requirements = function(player)
	local level = 20
	local items = {}
	local itemAmounts = {}
	local description = {"Take the form of another"}
	return level, items, itemAmounts, description
end
}