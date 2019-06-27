
/* ----------------------------------------------------------------------------
Function: btc_fnc_civ_add_grenade

Description:
    Add grenade to a unit.

Parameters:
    _unit - Unit where a grenade will be added. [Object]

Returns:

Examples:
    (begin example)
        [_unit] call btc_fnc_civ_add_grenade;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_unit", objNull, [objNull]]
];

_unit addMagazines [selectRandom btc_g_civs, 1];

_unit addEventHandler ["Fired", {
    params ["_unit", "_weapon"];

    if (_weapon isEqualTo "Throw") then {
        _unit removeEventHandler ["Fired", _thisEventHandler];
        [_unit] joinSilent createGroup [civilian, true];
        [{
            params ["_unit"];

            _unit call btc_fnc_rep_add_eh;
            [group _unit] call btc_fnc_civ_addWP;
        }, [_unit], 20] call CBA_fnc_waitAndExecute;
    };
}];
