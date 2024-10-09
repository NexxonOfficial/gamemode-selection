exports('actuation', Init)

function Init()
    ShutdownLoadingScreenNui()
    local handle = InitiateSelectionScaleform()

    while true do
        DrawScaleformMovieFullscreen(handle, 255, 255, 255, 255, 0)
        Wait(0)
    end
end

CreateThread(function()
    Init()
end)

-- Initialising the selector (grid menu) scaleform.
-- RETURNS: The handle for the scaleform.
function InitiateSelectionScaleform()
    local handle = RequestScaleformMovie('MP_NEXT_JOB_SELECTION')
    while not HasScaleformMovieLoaded(handle) do
        Wait(0)
    end 

    BeginScaleformMovieMethod(handle, 'SET_TITLE')
    PushScaleformMovieMethodParameterString('Select A Gamemode')
    PushScaleformMovieMethodParameterString('')
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(handle, 'SET_GRID_ITEM')
    ScaleformMovieMethodAddParamInt(0)
    PushScaleformMovieMethodParameterString('Test')
    PushScaleformMovieMethodParameterString('') -- Texture Directory
    PushScaleformMovieMethodParameterString('') -- Texture String
    ScaleformMovieMethodAddParamInt(0) -- Texture Load Type
    ScaleformMovieMethodAddParamBool(false) -- Verified Type
    ScaleformMovieMethodAddParamInt(0) -- Icon?
    ScaleformMovieMethodAddParamBool(false) -- Check?
    ScaleformMovieMethodAddParamInt(0) -- RP Multiplier
    ScaleformMovieMethodAddParamInt(0) -- Cash Multiplier
    ScaleformMovieMethodAddParamBool(false) -- Disabled
    ScaleformMovieMethodAddParamInt(0) -- Column
    ScaleformMovieMethodAddParamInt(0) -- AP Multiplier
    EndScaleformMovieMethod()

    Wait(100)

    BeginScaleformMovieMethod('SET_SELECTION')
    ScaleformMovieMethodAddParamInt(0)
    PushScaleformMovieMethodParameterString('Test')
    PushScaleformMovieMethodParameterString('Another Test')
    ScaleformMovieMethodAddParamBool(false)
    EndScaleformMovieMethod()

    return handle
end