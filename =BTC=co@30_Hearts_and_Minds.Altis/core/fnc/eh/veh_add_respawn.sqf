
private ["_vehicle","_time","_has_marker","_type","_pos","_dir","_veh"];

_vehicle = _this select 0;
_time = _this select 1;
_has_marker = _this select 2;

_type = typeOf _vehicle;
_pos = getPosASL _vehicle;
_dir = getDir _vehicle;
private _customization = [_vehicle] call BIS_fnc_getVehicleCustomization;
_vehicle setVariable ["data_respawn",[_type,_pos,_dir,_time,_has_marker, _customization]];

if ((isNumber (configfile >> "CfgVehicles" >> typeof _vehicle >> "ace_fastroping_enabled")) && !(typeof _vehicle isEqualTo "RHS_UH1Y_d")) then {[_vehicle] call ace_fastroping_fnc_equipFRIES};
_vehicle addMPEventHandler ["MPKilled", {if (isServer) then {_this call btc_fnc_eh_veh_respawn};}];
