Citizen.CreateThread(function()
    for _, pedData in pairs(Config.pedList) do
        local x, y, z, heading, model = pedData[1], pedData[2], pedData[3]-1, pedData[4], pedData[5]

        local modelHash = GetHashKey(model)

        RequestModel(modelHash)
        while not HasModelLoaded(modelHash) do
            Citizen.Wait(0)
        end

        local ped = CreatePed(4, modelHash, x, y, z, heading, false, true)
        if DoesEntityExist(ped) then
            FreezeEntityPosition(ped, true)
            SetEntityInvincible(ped, true)
            SetBlockingOfNonTemporaryEvents(ped, true)
        end
    end
end)
