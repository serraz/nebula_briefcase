local QBCore = exports['qb-core']:GetCoreObject()
local CaseMoney = 0
local CaseData = {}
--MAIN BRIEFCASE MENU
RegisterNetEvent('nebula_briefcase:client:casemenu', function(ItemData)
    CaseMoney = ItemData.info.cash
	CaseData = ItemData
        print(ItemData.info.cash)
    exports['qb-menu']:openMenu({
        {
            
            header = "| Briefcase |",
            txt = "$ ".. CaseMoney .." Available",
            isMenuHeader = true, 
        },
        {
            
            header = "• Store Money",
            txt = "Store Money in briefcase",
            params = {
                event = "nebula_briefcase:client:storemoney"
            }
        },  
        {
            
            header = "• Take out Money",
            txt = "Take money our of briefcase",
            params = {
                event = "nebula_briefcase:client:removemoney"
            }
        },
        {
            id = 7,
            header = "Close (ESC)",
            isMenuHeader = true,
        },
    })
end)
--STORE MONEY IN BRIEFCASE
RegisterNetEvent('nebula_briefcase:client:storemoney',function()

    local keyboard = exports['qb-input']:ShowInput({
        header = "| Briefcase |",
		inputs = {
            {
                text = "Ammount to store", -- text you want to be displayed as a place holder
                name = "storemon", -- name of the input should be unique otherwise it might override
                type = "text", -- type of the input
                isRequired = true, -- Optional [accepted values: true | false] but will submit the form if no value is inputted

            },    
        }
    })
        
 if keyboard ~= nil then
  for k,v in pairs(keyboard) do
   kbdinput = tonumber(v)
    amoney = kbdinput
     if CaseMoney >= 50000 then
      QBCore.Functions.Notify('The briefcase cant hold anymore!', 'error', 5000)           
     else
       if kbdinput <= 50000 then
	    TriggerServerEvent('nebula_briefcase:server:addvalue', amoney, CaseData)
       else
        QBCore.Functions.Notify('The briefcase cant hold that amount!', 'error', 5000)
       end
     end
  end
 end
end)
--TAKE MONEY OUT
RegisterNetEvent('nebula_briefcase:client:removemoney',function()

    local keyboard = exports['qb-input']:ShowInput({
        header = "| Briefcase |",
		inputs = {
            {
                text = "$ ".. CaseMoney .." Available", -- text you want to be displayed as a place holder
                name = "scleanamnt", -- name of the input should be unique otherwise it might override
                type = "text", -- type of the input
                isRequired = true, -- Optional [accepted values: true | false] but will submit the form if no value is inputted

            },    
        }
    })
        
 if keyboard ~= nil then
  for k,v in pairs(keyboard) do
   kbdinput = tonumber(v)
    if kbdinput <= CaseMoney then
       rmoney = kbdinput
	   TriggerServerEvent('nebula_briefcase:server:remvalue', rmoney, CaseData)
	else
	   QBCore.Functions.Notify('The case does not have that much money in it!', 'error', 4000)
    end    
  end
 end
end)