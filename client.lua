-- Made by Dexelir for RyanxyzMc, have fun mate!

function GetPedVehicleSeat(ped) -- Snippet from previous projects because i am lazy AF
    local vehicle = GetVehiclePedIsIn(ped, false)
    for i=-2,GetVehicleMaxNumberOfPassengers(vehicle) do
        if(GetPedInVehicleSeat(vehicle, i) == ped) then return i end
    end
    return -2
end

Citizen.CreateThread(function()
	local playerInAirVeh = false 
	while true do
		Citizen.Wait(0) -- good practice :3

    	local ped = GetPlayerPed(-1) -- Get local player

		if IsPedInAnyPlane(ped) or IsPedInAnyHeli(ped) then -- Is local player in any plane or heli
			playerInAirVeh = true -- if so set this to true
		else
			playerInAirVeh = false -- if not set it to false
		end

		if not playerInAirVeh then -- check if the player is in a heli or plane thing returned false
			DisableControlAction(0,25,true) -- Disable right click
			DisableControlAction(1,25,true) -- Disable right click
		else -- if not false it should be true 
			DisableControlAction(1,25,false) -- Enable right click since player is in a plane or a heli
			DisableControlAction(1,25,false) -- Enable right click since player is in a plane or a heli
		end
	end
end)

