
/* ----------------------------------------------------------------------------
Function: btc_fnc_info_give_intel

Description:
    Fill me when you edit me !

Parameters:
    _asker - [Object]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_info_give_intel;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_asker", objNull, [objNull]]
];

private _id = 1;
private _n = random 100;

if (btc_hideouts isEqualTo []) then {_n = (btc_info_intel_type select 0) - 10;};

switch (true) do {
    case (_n < (btc_info_intel_type select 0)) : { //cache
        [true, 0] spawn btc_fnc_info_cache;
    };
    case (_n > (btc_info_intel_type select 1) && _n < 101) : { //both
        _id = 4;
        [true, 0] spawn btc_fnc_info_cache;
        [] spawn btc_fnc_info_hideout;
    };
    case (_n > (btc_info_intel_type select 0) && _n < (btc_info_intel_type select 1)) : { //hd
        _id = 5;
        [] spawn btc_fnc_info_hideout;
    };
    default {
        _id = 0;
        [3] remoteExec ["btc_fnc_show_hint", _asker];
    };
};

if (_id isEqualTo 0) exitWith {};
[_id] remoteExec ["btc_fnc_show_hint", 0];
