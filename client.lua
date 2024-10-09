exports('actuation', Init)

function Init()
    ShutdownLoadingScreenNui()
    InitiateSelectionScaleform()
end

CreateThread(function()
    Init()
end)

function InitiateSelectionScaleform()

end