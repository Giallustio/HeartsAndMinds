
closeDialog 0;

btc_int_ask_data = nil;
[6, Nil, player] remoteExec ["btc_fnc_int_ask_var", 2];

waitUntil {!(isNil "btc_int_ask_data")};

if ((btc_int_ask_data select 0) isEqualTo []) exitWith {
    hint localize "STR_BTC_HAM_O_FOB_REDEPLOY_H_NOFOB"; //"No FOBs deployed"
};

private _fobs = btc_int_ask_data;

forceMap true;

btc_fob_dlg = false;

createDialog "btc_fob_redeploy";

waitUntil {dialog};

private _idc = 778;
{lbAdd [ _idc, _x];} forEach (_fobs select 0);
lbSetCurSel [_idc, 0];

waitUntil {!dialog || btc_fob_dlg};

if (!btc_fob_dlg) exitWith {forceMap false;};

private _fob = lbText [_idc, lbCurSel _idc];
private _marker = lbText [_idc, lbCurSel _idc];

if (_marker isEqualTo "Base") then {_marker = btc_respawn_marker;};

forceMap false;
closeDialog 0;

private _pos = ((_fobs select 1) select ((_fobs select 0) find _marker)) buildingPos -1;
private _text = format [localize "STR_BTC_HAM_O_FOB_REDEPLOY_H_MOVING", _fob]; //"Moving to %1"

titleText [_text, "BLACK OUT"];
sleep 3;
titleText [_text, "BLACK FADED"];
player setPosATL selectRandom (_pos select [0, [count _pos, 4] select (count _pos >= 4)]);
sleep 2;
titleText ["", "BLACK IN"];
