Step1. Add the following to qb-inventory\server\server.lua under harness

			    elseif itemData["name"] == "briefcase" then
				    info.cash = 0

Step2. add the following to qb-core\shared\items.lua

   --CASHBRIEFCASE
   ["briefcase"]		= {["name"] = "briefcase",		   ["label"] = "Briefcase",		       ["weight"] = 1000,	 ["type"] = "item",	   ["image"] = "briefcase.png",	           ["unique"] = true,	   ["useable"] = true,	   ["shouldClose"] = true,	 ["combinable"] = nil,	   ["description"] = "A briefcase full of money?."},