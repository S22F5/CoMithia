housekeeper5356 = {

	click=async(function(player,npc)
		local t={graphic=convertGraphic(489,"monster"),color=31}
		local mainopts = {}
		local rentopts = {}

		table.insert(mainopts,"Ressucitate")
		if(player.registry["house5356owner"]==1 or player.registry["house5356guest"]==1) then		
			table.insert(mainopts,"Live in house")
		end
		if(player.registry["house5356owner"]==1 or player.registry["house5356guest"]==1) then	
			table.insert(mainopts,"Home tokens")
		end



		if(player.registry["house5356owner"]==1) then
			table.insert(mainopts,"Change PVP settings")			
		end
		if(player.registry["house5356owner"]==1) then
			table.insert(mainopts,"Change lights")			
		end 
		if(player.registry["house5356owner"]==1) then
			table.insert(mainopts,"Rent house features")			
		end
		if(player.registry["house5356owner"]==1) then
			table.insert(mainopts,"Nuisance")			
		end


		table.insert(rentopts,"Bank service")


		if(player.mapRegistry["houserentbank"]>=os.time()) then
			if(player.registry["house5356owner"]==1 or player.registry["house5356guest"]==1) then
				table.insert(mainopts,"Deposit Item")
				table.insert(mainopts,"Withdraw Item")
				table.insert(mainopts,"Deposit money")
				table.insert(mainopts,"Withdraw money")
			end
		end

                        player.npcGraphic=t.graphic
			player.npcColor=t.color

			local choice=player:menuString("How can I help you?",mainopts)
			
				if(choice=="Live in house") then
						player:dialogSeq({t,"This tool allows you to make this house your primary residence, granting you warp access with the use of Home tokens. Click next if you want to proceed."},1)
						player.registry["houseofresidencem"]=player.m
						player.registry["houseofresidencex"]=player.x
						player.registry["houseofresidencey"]=player.y
						player:sendMinitext("This house is now your primary residency")
				elseif(choice=="Home tokens") then
						player:dialogSeq({t,"This tool allows you to transform safety tokens into Home tokens, granting you warp access to your home."},1)
						local amount=math.abs(tonumber(math.ceil(player:input("How many Safety tokens do you wish to transform"))))
						if(player:hasItem("safety_token",amount) == true) then
								player:sendMinitext("You transformed "..amount.." Safety tokens into Home tokens") 
								player:removeItem("safety_token",amount)
								player:addItem("home_token",amount)
						else
								player:dialogSeq({t,"You do not have enough Safety tokens."})
						end
				elseif(choice=="Change PVP settings" and player.registry["house5356owner"]==1) then
						player:dialogSeq({t,"Not implemented yet."})
				elseif(choice=="Change lights" and player.registry["house5356owner"]==1) then
						player:dialogSeq({t,"Not implemented yet."})
				elseif(choice=="Rent house features" and player.registry["house5356owner"]==1) then
						player:dialogSeq({t,"This tool allows you to rent services in your house. The price and duration of the rent depends on the Service."},1)
						local rentfeatures=player:menuString2("Which feature do you wish to rent?",rentopts)
							if(rentfeatures=="Bank service") then
								if(player.mapRegistry["houserentbank"]<os.time()) then
								player:dialogSeq({t,"You can rent Bank services during 30 days for 10,000 Coins. Click next to proceed."},1)
									if(player.money>=10000) then
										player.mapRegistry["houserentbank"]=os.time()+2592000
										player.money=player.money-10000
										player:sendStatus()
										player:sendMinitext("You rented Bank services for 30 days")
									else
										player:sendMinitext("You do not have enough money")
									end
								else
									local banktimeamount=player.mapRegistry["houserentbank"]-os.time()
									banktimeamount=(banktimeamount/(60*60*24))
									banktimeamount=math.floor(banktimeamount)
									player:dialogSeq({t,"You are already renting Bank services for "..banktimeamount.." more days. Clicking next will make you purchase 30 more days for 10.000 Coins."},1)
										if(player.money>=10000) then
											player.mapRegistry["houserentbank"]=player.mapRegistry["houserentbank"]+2592000
											player.money=player.money-10000
											player:sendStatus()
											player:sendMinitext("You rented Bank services for 30 additional days")
										else
											player:sendMinitext("You do not have enough money")
										end
								end
							elseif(rentfeatures=="Carpentry tools") then
									--blablabla
							end
				elseif(choice=="Deposit Item" and player.mapRegistry["houserentbank"]>=os.time()) then
					player:showBankAdd()
				elseif(choice=="Withdraw Item" and player.mapRegistry["houserentbank"]>=os.time()) then
					local banktimeamount=player.mapRegistry["houserentbank"]-os.time()
					banktimeamount=(banktimeamount/(60*60*24))
					banktimeamount=math.floor(banktimeamount)
					player:showBank("What do you wish to withdraw? (Your house banking service is still available for "..banktimeamount.." more days).")
				elseif(choice=="Deposit money" and player.mapRegistry["houserentbank"]>=os.time()) then
					player:bankAddMoney()
				elseif(choice=="Withdraw money" and player.mapRegistry["houserentbank"]>=os.time()) then
					player:bankWithdrawMoney()
				elseif(choice=="Carpentry tools") then
						--blabla
				elseif(choice=="Nuisance") then
					local nuisance=string.lower(player:input("Who needs to be nuisanced?"))
						if(Player(nuisance).m==10005) then
							Player(nuisance):warp(53,5,8)
							Player(nuisance):sendMinitext("You have been nuisanced.")
							player:sendMinitext(""..Player(nuisance).name.." has been nuisanced.")
						end
				elseif(choice=="Ressucitate") then
					if(player.state==1) then
						player.state=0
						player.magic=player.maxMagic
						player.health=player.maxHealth
						player:sendStatus()
						player:updateState()
					end
				end
		end)
}
	
							
						
								
		