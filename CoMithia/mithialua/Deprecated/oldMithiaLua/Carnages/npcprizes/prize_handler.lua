prize_handler_carnage = {
	click = async(function(player,npc)
		local t={graphic=convertGraphic(44,"monster"),color=23}
	        local opts = { }

                player.npcGraphic=t.graphic
		player.npcColor=t.color


		player:dialogSeq({t,"Congratulations, your team won!",t,"By clicking next, you will be awarded five Game token as well as your victory mark. You can exchange Game tokens in Taar's shop."},1)
		player.registry["gametokens"]=player.registry["gametokens"]+5

		player.registry["carnagevictories"]=player.registry["carnagevictories"]+1
		player:removeLegendbyName("carnagevictories")
		player:addLegend(""..player.registry["carnagevictories"].." Carnage victories","carnagevictories",1,51)
		player:sendMinitext("You now own "..player.registry["gametokens"].." Game tokens!")
		player:warp(9,3,6)

        end)

}

prize_handler_assault = {
	click = async(function(player,npc)
		local t={graphic=convertGraphic(44,"monster"),color=23}
	        local opts = { }

                player.npcGraphic=t.graphic
		player.npcColor=t.color


		player:dialogSeq({t,"Congratulations, your team won!",t,"By clicking next, you will be awarded five Game token as well as your victory mark. You can exchange Game tokens in Taar's shop."},1)
		player.registry["gametokens"]=player.registry["gametokens"]+5

		player.registry["assaultvictories"]=player.registry["assaultvictories"]+1
		player:removeLegendbyName("assaultvictories")
		player:addLegend(""..player.registry["assaultvictories"].." Assault victories","assaultvictories",1,51)
		player:sendMinitext("You now own "..player.registry["gametokens"].." Game tokens!")
		player:warp(9,3,6)

        end)

}

prize_handler_domination = {
	click = async(function(player,npc)
		local t={graphic=convertGraphic(44,"monster"),color=23}
	        local opts = { }

                player.npcGraphic=t.graphic
		player.npcColor=t.color


		player:dialogSeq({t,"Congratulations, your team won!",t,"By clicking next, you will be awarded five Game token as well as your victory mark. You can exchange Game tokens in Taar's shop."},1)
		player.registry["gametokens"]=player.registry["gametokens"]+5

		player.registry["dominationvictories"]=player.registry["dominationvictories"]+1
		player:removeLegendbyName("dominationvictories")
		player:addLegend(""..player.registry["dominationvictories"].." Domination victories","dominationvictories",1,51)
		player:sendMinitext("You now own "..player.registry["gametokens"].." Game tokens!")
		player:warp(9,3,6)

        end)

}
prize_handler_elixirwar = {
	click = async(function(player,npc)
		local t={graphic=convertGraphic(44,"monster"),color=23}
	        local opts = { }

                player.npcGraphic=t.graphic
		player.npcColor=t.color


		player:dialogSeq({t,"Congratulations, your team won!",t,"By clicking next, you will be awarded five Game token as well as your victory mark. You can exchange Game tokens in Taar's shop."},1)
		player.registry["gametokens"]=player.registry["gametokens"]+5

		player.registry["elixirwarvictories"]=player.registry["elixirwarvictories"]+1
		player:removeLegendbyName("elixirwarvictories")
		player:addLegend(""..player.registry["elixirwarvictories"].." Elixir war victories","elixirwarvictories",1,51)
		player:sendMinitext("You now own "..player.registry["gametokens"].." Game tokens!")
		player:warp(9,3,6)

        end)

}