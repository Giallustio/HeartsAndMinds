disableSerialization;

private ["_ui","_radar","_obj_img","_obj_pic","_arrow","_obj_name","_array_hud","_arrow_up","_arrow_down","_complete","_incomplete","_obj_alt","_radar_background"];

939996 cutRsc ["btc_log_hud","PLAIN"];
_ui        = uiNamespace getVariable "btc_log_hud";
_radar_background  = _ui displayCtrl 1001;
_radar     = _ui displayCtrl 1002;
_obj_img   = _ui displayCtrl 1003;
_obj_pic   = _ui displayCtrl 1004;
_arrow     = _ui displayCtrl 1005;
_obj_name  = _ui displayCtrl 1006;
_obj_alt	= _ui displayCtrl 1007;
_array_hud = [_radar_background,_radar,_obj_img,_obj_pic,_arrow,_obj_name,_obj_alt];
{_x ctrlShow true;} foreach _array_hud;_obj_img ctrlShow false;

_arrow_up   = "\A3\ui_f\data\igui\cfg\actions\arrow_up_gs.paa";
_arrow_down = "\A3\ui_f\data\igui\cfg\actions\arrow_down_gs.paa";
_complete   = "\A3\ui_f\data\map\markers\nato\b_unknown.paa";
_incomplete = "\A3\ui_f\data\map\markers\nato\b_unknown.paa";

[btc_fnc_log_lift_hud_loop, 0, [_arrow_up,_arrow_down,_complete,_incomplete,_obj_img,_obj_pic,_arrow,
_obj_name,_obj_alt]] call CBA_fnc_addPerFrameHandler;