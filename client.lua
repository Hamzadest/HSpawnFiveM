--Crédit : Hamza#8602
--For Afterlife (Script opensource pour aider tout le monde)
--Modification autorisé, mais appropriation intellectuel interdite. Merci de me contacter en cas de problème. 
--Ce script optimise et désactive certains scénarion et véhicule. 


Citizen.CreateThread(function()
	for i = 1, 13 do
		EnableDispatchService(i, EnableDispatch)
	end
	while true do
		-- These natives has to be called every frame.
		SetVehicleDensityMultiplierThisFrame((TrafficAmount/100)+.0)
		SetPedDensityMultiplierThisFrame((PedestrianAmount/100)+.0)
		SetRandomVehicleDensityMultiplierThisFrame((TrafficAmount/100)+.0)
		SetParkedVehicleDensityMultiplierThisFrame((ParkedAmount/100)+.0)
		SetScenarioPedDensityMultiplierThisFrame((PedestrianAmount/100)+.0, (PedestrianAmount/100)+.0)
		SetRandomBoats(EnableBoats)
		SetRandomTrains(EnableTrains)
		SetVehicleModelIsSuppressed(GetHashKey("Planes"))
		SetVehicleModelIsSuppressed(GetHashKey("Trains"))
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
    -- Ici ce sont les scènarios que on désactive. NE SURTOUT PAS AJOUTER DES SCENARION QUI N'EXISTE PAS SINON CRASH
    local SCENARIO_TYPES = {
        "WORLD_VEHICLE_MILITARY_PLANES_SMALL", -- Petit avion base militaire
        "WORLD_VEHICLE_MILITARY_PLANES_BIG", -- Gros avion base militiaire
    }
    local SCENARIO_GROUPS = {
        2017590552, -- LSIA avions
        2141866469, -- Sandy Shores avions
        1409640232, -- Grapeseed avions
        "ng_planes", -- Jet
    }
	-- Ici ce sont les véhicules qui ne spawn plus naturellement. 
    local SUPPRESSED_MODELS = {
        "SHAMAL", -- Ils apparaissent sur LSIA et essaient de décoller
        "LUXOR", -- Ils apparaissent sur LSIA et essaient de décoller
        "LUXOR2", -- Ils apparaissent sur LSIA et essaient de décoller
        "JET", -- Ils apparaissent sur LSIA et essaient de décoller et d'atterrir.
        "LAZER", -- Ils apparaissent sur Zancudo et essaient de décoller
        "TITAN", -- Ils apparaissent sur Zancudo et essaient de décoller
        "BARRACKS", -- Conduit régulièrement autour de la surface de l'aéroport de Zancudo
        "BARRACKS2", -- Conduit régulièrement autour de la surface de l'aéroport de Zancudo
        "CRUSADER", -- Conduit régulièrement autour de la surface de l'aéroport de Zancudo
        "RHINO", -- Conduit régulièrement autour de la surface de l'aéroport de Zancudo
        "AIRTUG", -- Apparaît régulièrement sur la surface de l'aéroport LSIA
        "RIPLEY", -- Apparaît régulièrement sur la surface de l'aéroport LSIA
	"BLIMP", -- Les foutus dirigeable
	"BLIMP2", -- dirigeable
	"BLIMP3", -- Dirigeable
	"Buzzard", -- Hélico lambda je sais plus le nom de l'hélico noir qui crash no stop
	"Buzzard2", --
	"Maverick", -- hélico au dessus comico
        "polmav", --
		
    }

-- Ne pas modifier la boucle risque de perte de performance
    while true do
        for _, sctyp in next, SCENARIO_TYPES do
            SetScenarioTypeEnabled(sctyp, false)
        end
        for _, scgrp in next, SCENARIO_GROUPS do
            SetScenarioGroupEnabled(scgrp, false)
        end
        for _, model in next, SUPPRESSED_MODELS do
            SetVehicleModelIsSuppressed(GetHashKey(model), true)
        end
        Wait(10000)
    end
end)
