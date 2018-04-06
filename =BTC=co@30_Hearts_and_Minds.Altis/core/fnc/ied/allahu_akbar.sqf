params ["_trigger"];

private _suicider = _trigger getVariable "suicider";

private _soundPath = [str missionConfigFile, 0, -15] call BIS_fnc_trimString;
private _soundToPlay = _soundPath + "core\sounds\allahu_akbar.ogg";
if (Alive _suicider && [_suicider] call ace_common_fnc_isAwake) then {
    playSound3d [_soundToPlay, _suicider, false, getPosASL _suicider, 40, random [0.9, 1, 1.2], 100];
};

[{
    params ["_suicider"];

    if (Alive _suicider && [_suicider] call ace_common_fnc_isAwake) then {
        {deleteVehicle _x;} forEach attachedObjects _suicider;
        (getPos _suicider) params ["_x", "_y", "_z"];
        "Bo_GBU12_LGB_MI10" createVehicle [_x, _y, 0.1 + _z];
        [_pos] call btc_fnc_deaf_earringing;
    };
}, [_suicider], 1.4] call CBA_fnc_waitAndExecute;
