params ["_ui", "_PFH_id"];
_ui params ["_arrow_up", "_arrow_down", "_complete", "_incomplete", "_obj_img", "_obj_pic", "_arrow", "_obj_name", "_obj_alt"];

disableSerialization;

if !((alive player && vehicle player != player) && btc_log_hud) then {
    [_PFH_id] call CBA_fnc_removePerFrameHandler;
    939996 cutRsc ["Default", "PLAIN"];
};

private _chopper = vehicle player;
private _array = [_chopper] call btc_fnc_log_get_liftable;
private _cargo_array = nearestObjects [_chopper, _array, 30];
if (_array isEqualTo []) then {_cargo_array = [];};
_cargo_array = _cargo_array - [_chopper];
_cargo_array = _cargo_array select {!(
    _x isKindOf "ACE_friesGantry" ||
    (typeOf _x) isEqualTo "ACE_friesAnchorBar" ||
    _x isKindOf "ace_fastroping_helper"
)};

_cargo_array params [["_cargo", objNull]];
private _can_lift = ({_cargo isKindOf _x} count _array) > 0;

if (!isNull _cargo) then {
    _cargo_pos = getPosATL _cargo;
    (_chopper worldToModel _cargo_pos) params ["_cargo_x", "_cargo_y"];
    _cargo_z = ((getPosATL _chopper) select 2) - (_cargo_pos select 2);
    _obj_img ctrlShow true;
    private _hud_x = _cargo_x / 100;
    private _hud_y = - _cargo_y / 100;
    private _hud_x_1 = (btc_lift_HUD_x + _hud_x) * safeZoneW + safeZoneX;
    private _hud_y_1 = (btc_lift_HUD_y + _hud_y) * safeZoneH + safeZoneY;
    _obj_img ctrlSetPosition [_hud_x_1, _hud_y_1];
    _obj_img ctrlCommit 0;
    private _pic_cargo = "";
    if (_cargo isKindOf "LandVehicle") then {
        _pic_cargo = getText (configFile >> "cfgVehicles" >> typeOf _cargo >> "picture");
    };
    private _name_cargo = getText (configFile >> "cfgVehicles" >> typeOf _cargo >> "displayName");
    private _obj_pic ctrlSetText _pic_cargo;
    private _obj_name ctrlSetText _name_cargo;
    if (btc_lifted) then {
        _obj_alt ctrlSetText (format ["%1 m", (round((getPos _cargo select 2) * 10))/10]);
        _obj_img ctrlSetTextColor [0, 1, 0, 1];
    };

    if ((abs _cargo_z) > (btc_lift_max_h + 3)) then {
        _arrow ctrlSetText _arrow_down;
        _arrow ctrlSetTextColor [1, 0, 0, 1];
    } else {
        if ((abs _cargo_z) > btc_lift_max_h) then {
            _arrow ctrlSetText _arrow_down;
            _arrow ctrlSetTextColor [1, 1, 0, 1];
        };
    };
    if ((abs _cargo_z) < (btc_lift_min_h - 3)) then {
        _arrow ctrlSetText _arrow_up;
        _arrow ctrlSetTextColor [1, 0, 0, 1];
    } else {
        if ((abs _cargo_z) < btc_lift_min_h) then {
            _arrow ctrlSetText _arrow_up;
            _arrow ctrlSetTextColor [1, 1, 0, 1];
        };
    };
    if ((abs _cargo_z) > btc_lift_min_h && (abs _cargo_z) < btc_lift_max_h) then {
        _arrow ctrlSetText _complete;
        _arrow ctrlSetTextColor [0, 1, 0, 1];
    };
    if !(_can_lift) then {
        _arrow ctrlSetText _incomplete;
        _arrow ctrlSetTextColor [1, 0, 0, 1];
    };
} else {
    _obj_img ctrlShow false;
    _obj_pic ctrlSetText "";
    _obj_name ctrlSetText "";
    _arrow ctrlSetText "";
};
