Briefcase script designed to enhance your roleplay. When you hold the item it will be in your hand and when you use it you can store money in the briefcase. The money is stored as metadata so the briefcase is transferable between players.

NOTE: QB Only

For support and to see our other scrips join the discord at https://discord.nebuladesigns.dev/

Step1. Add the following to qb-inventory\server\server.lua under harness

			    elseif itemData["name"] == "briefcase" then
				    info.cash = 0

Step2. add the following to qb-core\shared\items.lua

   --CASHBRIEFCASE
   ["briefcase"]		= {["name"] = "briefcase",		   ["label"] = "Briefcase",		       ["weight"] = 1000,	 ["type"] = "item",	   ["image"] = "briefcase.png",	           ["unique"] = true,	   ["useable"] = true,	   ["shouldClose"] = true,	 ["combinable"] = nil,	   ["description"] = "A briefcase full of money?."},
