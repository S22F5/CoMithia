housing53146 = {
	click = async(function(player,npc)
		local t={graphic=convertGraphic(1024,"monster"),color=0}
	        local opts = { }
		local check = { }
		local count = 0
		local name
		table.insert(opts,"Enter house")
		table.insert(opts,"Relinquish Ownership")
		table.insert(opts,"Sell house")	
		table.insert(opts,"Invite guest")
		table.insert(opts,"Remove guest access")
		if(player.mapRegistry["house53146setting"]==0) then
			table.insert(opts,"Set House Entrance : Public")
		else
			table.insert(opts,"Set House Entrance : Private")
		end





                              player.npcGraphic=t.graphic
			      player.npcColor=t.color

		if(player.registry["house53146owner"]==1) then
			local choice=player:menuString2("What do you wish to do?",opts)
				if(choice=="Enter house" and player.registry["house53146owner"]==1) then
					player:warp(10008,10,13)
				elseif(choice=="Relinquish Ownership" and player.registry["house53146owner"]==1) then
					player:dialogSeq({"This tool allows you to Relinquish the Ownership of your house. The new Owner must be online and near the house. Only proceed if you are certain of your decision."},1)
					name=player:input("Who do you wish to relinquish ownership to?")
					if(string.lower(name)~=string.lower(player.name)) then
					for x=-5,5 do
						for y=-5,5 do
							check=player:getObjectsInCell(player.m,player.x+x,player.y+y,BL_PC)
							if(#check>0) then
								for z=1,#check do
									if(string.lower(check[z].name)==string.lower(name)) then
										check[z].registry["popuphouseownership"]=player.ID
										housing53146.ownercheck(Player(name),npc)
									end
								end
							end
						end
					end
					else
						player:dialogSeq({"You can not relinquish ownership to yourself!"})
					end
				elseif(choice=="Set House Entrance : Private" and player.registry["house53146owner"]==1) then
					player:dialogSeq({"This tool allows you to close your house to the Public (Non guests). Click next to proceed."},1)
					player.mapRegistry["house53146setting"]=0
					player:sendMinitext("Your house is now set on private.")
				elseif(choice=="Set House Entrance : Public" and player.registry["house53146owner"]==1) then
					player:dialogSeq({"This tool allows you to open your house to the Public (Non guests). Click next to proceed."},1)
					player.mapRegistry["house53146setting"]=1
					player:sendMinitext("Your house is now set on public.")
				elseif(choice=="Sell house" and player.registry["house53146owner"]==1) then
					player:dialogSeq({"This tool allows you to sell your house. The new Owner must be online and near the house. Only proceed if you are certain of your decision."},1)
					amount=math.abs(tonumber(math.ceil(player:input("How much coins do you want to sell your House for?"))))
					player:dialogSeq({"You set your house price to "..amount..". Hit next only if the price is correct."},1)
					name=player:input("Who do you wish to relinquish ownership to?")
					if(string.lower(name)~=string.lower(player.name)) then
					for x=-5,5 do
						for y=-5,5 do
							check=player:getObjectsInCell(player.m,player.x+x,player.y+y,BL_PC)
							if(#check>0) then
								for z=1,#check do
									if(string.lower(check[z].name)==string.lower(name)) then
										check[z].registry["popuphouseownership"]=player.ID
										check[z].registry["popuphouseprice"]=amount
										housing53146.sellcheck(Player(name),npc)
									end
								end
							end
						end
					end
					else
						player:dialogSeq({"You can not relinquish ownership to yourself!"})
					end

				elseif(choice=="Invite guest" and player.registry["house53146owner"]==1) then
					player:dialogSeq({"This tool allows you to give permanent acces to your house to someone. The guest must be online and near the house. Only proceed if you are certain of your decision."},1)
					name=player:input("Who do you wish to grant access to?")
					if(string.lower(name)~=string.lower(player.name)) then
					for x=-5,5 do
						for y=-5,5 do
							check=player:getObjectsInCell(player.m,player.x+x,player.y+y,BL_PC)
							if(#check>0) then
								for z=1,#check do
									if(string.lower(check[z].name)==string.lower(name)) then
										check[z].registry["popuphouseguest"]=player.ID
										housing53146.guestcheck(Player(name),npc)
									end
								end
							end
						end
					end
					else
						player:dialogSeq({"You can not invite yourself!"})
					end
				elseif(choice=="Remove guest access" and player.registry["house53146owner"]==1) then
					player:dialogSeq({"This tool allows you to remove the access to your house from someone. The guest must be online. Only proceed if you are certain of your decision."},1)
					name=player:input("Who shall lose their access?")
					if(string.lower(name)~=string.lower(player.name)) then
						if(Player(name).registry["house53146guest"]==1) then
						Player(name).registry["house53146guest"]=0
						Player(name):sendMinitext(""..player.name.." has expelled you from his house.")
						player:sendMinitext("If online, "..name.." was expelled.")
						if(Player(name).registry["houseofresidencem"]==10008) then
							Player(name).registry["houseofresidencem"]=0
							Player(name).registry["houseofresidencex"]=0
							Player(name).registry["houseofresidencey"]=0
						end
						if(Player(name).m==10008) then
							Player(name):warp(53,14,8)
						end
						end
					else
						player:dialogSeq({"You can not remove your own access."})
					end
				end
		elseif(player.registry["house53146guest"]==1 or player.mapRegistry["house53146setting"]==1) then
				player:warp(10008,10,13)
		else
			player:warp(53,14,8)
			player:sendMinitext("You are not allowed inside this house")
		end
			

									
	end),

	ownercheck=async(function(player,npc)

			local t={graphic=convertGraphic(1024,"monster"),color=0}
			local opts = {}
			local check = {}
			table.insert(opts,"Yes")
			table.insert(opts,"No")
                        player.npcGraphic=t.graphic
			player.npcColor=t.color

			local choice=player:menuString2(""..Player(player.registry["popuphouseownership"]).name.." Wishes to relinquish ownership of his house to you, do you accept?",opts)
				if(choice=="No") then
					Player(player.registry["popuphouseownership"]):dialogSeq({""..player.name" has refused your offer."})
				elseif(choice=="Yes") then
					for x=-5,5 do
						for y=-5,5 do
							check=player:getObjectsInCell(player.m,player.x+x,player.y+y,BL_PC)
							if(#check>0) then
								for z=1,#check do
									if(string.lower(check[z].name)==string.lower(Player(player.registry["popuphouseownership"]).name)) then
										check[z].registry["house53146owner"]=0
										check[z].registry["house53146guest"]=0
										player.registry["house53146owner"]=1
										player.registry["house53146guest"]=0
										check[z]:sendMinitext("You gave up ownership of your house to "..player.name..".")
										player:sendMinitext("You are now the new Owner of the house")
									end
								end
							end
						end
					end
				end
	end),
	sellcheck=async(function(player,npc)

			local t={graphic=convertGraphic(1024,"monster"),color=0}
			local opts = {}
			local check = {}
			table.insert(opts,"Yes")
			table.insert(opts,"No")
                        player.npcGraphic=t.graphic
			player.npcColor=t.color

			local choice=player:menuString2(""..Player(player.registry["popuphouseownership"]).name.." Wishes to sell his house to you for "..player.registry["popuphouseprice"]..", do you accept?",opts)
				if(choice=="No") then
					Player(player.registry["popuphouseownership"]):dialogSeq({""..player.name" has refused your offer."})
				elseif(choice=="Yes") then
					if(player.money>=player.registry["popuphouseprice"]) then
					for x=-5,5 do
						for y=-5,5 do
							check=player:getObjectsInCell(player.m,player.x+x,player.y+y,BL_PC)
							if(#check>0) then
								for z=1,#check do
									if(string.lower(check[z].name)==string.lower(Player(player.registry["popuphouseownership"]).name)) then
										check[z].registry["house53146owner"]=0
										check[z].registry["house53146guest"]=0
										player.registry["house53146owner"]=1
										player.registry["house53146guest"]=0
										player.money=player.money-player.registry["popuphouseprice"]
										check[z].money=check[z].money+player.registry["popuphouseprice"]
										check[z]:sendMinitext("You sold your house to "..player.name.." for "..player.registry["popuphouseprice"].." coins.")
										player:sendMinitext("You bought a house from "..check[z].name.." for "..player.registry["popuphouseprice"].." coins.")
										check[z]:sendStatus()
										player:sendStatus()
									end
								end
							end
						end
					end
					else
						Player(player.registry["popuphouseownership"]):sendMinitext(""..player.name.." does not have the money.")
						player:dialogSeq({"You do not have the required money to buy this house."})
					end
				end
	end),

	guestcheck=async(function(player,npc)

			local t={graphic=convertGraphic(1024,"monster"),color=0}
			local opts = {}
			local check = {}
			table.insert(opts,"Yes")
			table.insert(opts,"No")
                        player.npcGraphic=t.graphic
			player.npcColor=t.color

			local choice=player:menuString2(""..Player(player.registry["popuphouseguest"]).name.." Wishes to grant you access to his house, do you accept?",opts)
				if(choice=="No") then
					Player(player.registry["popuphouseguest"]):dialogSeq({""..player.name" has refused your offer."})
				elseif(choice=="Yes") then
					for x=-5,5 do
						for y=-5,5 do
							check=player:getObjectsInCell(player.m,player.x+x,player.y+y,BL_PC)
							if(#check>0) then
								for z=1,#check do
									if(string.lower(check[z].name)==string.lower(Player(player.registry["popuphouseguest"]).name)) then
										player.registry["house53146guest"]=1
										check[z]:sendMinitext("You granted access to your house to "..player.name..".")
										player:sendMinitext("You are now a guest in this house.")
									end
								end
							end
						end
					end
				end
	end)


}