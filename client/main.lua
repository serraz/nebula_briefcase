local QBCore = exports['qb-core']:GetCoreObject()
local CaseMoney = 0
local CaseData = {}
local Props = {}

-- Prop Creation Function
CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local reqprop = QBCore.Functions.HasItem('briefcase')
        if reqprop and not IsPedInAnyVehicle(ped) then
            if not DoesEntityExist('prop_security_case_01') then
                local case = CreateObject('prop_security_case_01', GetEntityCoords(ped), true, false, false)
                AttachEntityToEntity(case, ped, GetPedBoneIndex(ped, 28422), 0.1, 0.0, -0.02, 0.0, -91.94, 62.0, 1, 1, 0, 1, 1, 1)
                
                while not DoesEntityExist(case) do
                    Wait(1)
                end
            end
        elseif reqprop and IsPedInAnyVehicle(ped) then
            Wait(300)
            DetachEntity('prop_security_case_01')
            DeleteObject('prop_security_case_01')
        elseif not reqprop and DoesEntityExist('prop_security_case_01') then
            DetachEntity('prop_security_case_01')
            DeleteObject('prop_security_case_01')
        end
        Wait(100)
    end
end)


--MAIN BRIEFCASE MENU
RegisterNetEvent('nebula_briefcase:client:casemenu', function(ItemData)
    CaseMoney = ItemData.info.cash
	CaseData = ItemData
    exports['nebula_briefcase']:CreateMenu({
        {
            
            header = "| Briefcase |",
            txt = "$ ".. CaseMoney .." Available",
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
            header = "Close (ESC)",
        },
    })
end)

--STORE MONEY IN BRIEFCASE
RegisterNetEvent('nebula_briefcase:client:storemoney',function()

    local input, keyboard = exports['nebula_briefcase']:CreateInput({
        header = "| Briefcase |",
		inputs = {
            {
                text = "Ammount to store", -- text you want to be displayed as a place holder
               -- name = "storemon", -- name of the input should be unique otherwise it might override
               -- type = "text", -- type of the input
               -- isRequired = true, -- Optional [accepted values: true | false] but will submit the form if no value is inputted

            },    
        }
    })
 if input then
   kbdinput = tonumber(keyboard)
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
end)

--TAKE MONEY OUT
RegisterNetEvent('nebula_briefcase:client:removemoney',function()

    local input, keyboard = exports['nebula_briefcase']:CreateInput({
        header = "| Briefcase |",
		inputs = {
            {
                text = "$ ".. CaseMoney .." Available", -- text you want to be displayed as a place holder
               -- name = "scleanamnt", -- name of the input should be unique otherwise it might override
               -- type = "text", -- type of the input
               -- isRequired = true, -- Optional [accepted values: true | false] but will submit the form if no value is inputted

            },    
        }
    })
 if input then    
   kbdinput = tonumber(keyboard)
    if kbdinput <= CaseMoney then
       rmoney = kbdinput
	   TriggerServerEvent('nebula_briefcase:server:remvalue', rmoney, CaseData)
	else
	   QBCore.Functions.Notify('The case does not have that much money in it!', 'error', 4000)
    end
  end
end)