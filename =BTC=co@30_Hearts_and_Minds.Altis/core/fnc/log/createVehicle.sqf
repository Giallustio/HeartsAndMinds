
params ["_type", "_pos", "_dir", ["_customization", [false, false]]];

_veh  = createVehicle [_type, ASLToATL _pos, [], 0, "CAN_COLLIDE"];
_veh setDir _dir;
_veh setPosASL _pos;
[_veh, _customization select 0, _customization select 1] call BIS_fnc_initVehicle;

_veh setVariable ["btc_dont_delete",true];

if (getNumber(configFile >> "CfgVehicles" >> typeof _veh >> "isUav") isEqualTo 1) then {
    createVehicleCrew _veh;
};

_veh call btc_fnc_db_add_veh;

_veh
