

params ["_unit"];

private _data = [
    getPosASL _unit,
    [_unit] call ace_medical_fnc_serializeState
];
btc_player_serialize set [_unit getVariable ["btc_respawn_slotName", [0, 0, 0]], _data];
