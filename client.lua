Tuslar = {
    ['ESC'] = 322, ['F1'] = 288, ['F2'] = 289, ['F3'] = 170, ['F5'] = 166, ['F6'] = 167, ['F7'] = 168, ['F8'] = 169, ['F9'] = 56, ['F10'] = 57,
    ['~'] = 243, ['1'] = 157, ['2'] = 158, ['3'] = 160, ['4'] = 164, ['5'] = 165, ['6'] = 159, ['7'] = 161, ['8'] = 162, ['9'] = 163, ['-'] = 84, ['='] = 83, ['BACKSPACE'] = 177,
    ['TAB'] = 37, ['Q'] = 44, ['W'] = 32, ['E'] = 38, ['R'] = 45, ['T'] = 245, ['Y'] = 246, ['U'] = 303, ['P'] = 199, ['['] = 39, [']'] = 40, ['ENTER'] = 18,
    ['CAPS'] = 137, ['A'] = 34, ['S'] = 8, ['D'] = 9, ['F'] = 23, ['G'] = 47, ['H'] = 74, ['K'] = 311, ['L'] = 182,
    ['LEFTSHIFT'] = 21, ['Z'] = 20, ['X'] = 73, ['C'] = 26, ['V'] = 0, ['B'] = 29, ['N'] = 249, ['M'] = 244, [','] = 82, ['.'] = 81,
    ['LEFTCTRL'] = 36, ['LEFTALT'] = 19, ['SPACE'] = 22, ['RIGHTCTRL'] = 70,
    ['HOME'] = 213, ['PAGEUP'] = 10, ['PAGEDOWN'] = 11, ['DELETE'] = 178,
    ['LEFT'] = 174, ['RIGHT'] = 175, ['TOP'] = 27, ['DOWN'] = 173,
}

local CrossTusu = Tuslar["F5"]          --Crosshair açma/kapama tuşu buradan ayarlanabilir.

local crosshair = false

Citizen.CreateThread(function()
    local ped = GetPlayerPed(-1)
    while true do
        Citizen.Wait(2)
        if IsControlJustPressed(1, CrossTusu) and DoesEntityExist(ped) then
            if IsPedArmed(ped, 4) then
                if crosshair then
                    crosshair = false
                    exports['mythic_notify']:SendAlert('inform', 'Cross Kapatıldı!')
                elseif not crosshair then
                    crosshair = true
                    exports['mythic_notify']:SendAlert('inform', 'Cross Açıldı!')
                end
            else
                exports['mythic_notify']:SendAlert('inform', 'Cross açamazsın silah tutmuyorsun!')
            end
        end

        if not IsPedArmed(ped, 4) then
            crosshair = false
        end
        
        if crosshair then
            ShowHudComponentThisFrame(14)
        elseif not crosshair then
            HideHudComponentThisFrame(14)
        end
    end
end)
