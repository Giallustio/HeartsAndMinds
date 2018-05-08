params ["_args", "_id"];
_args params ["_display", "_maxFps", "_maxWidth", "_width", "_GRPframes", "_TXTfps"];

if (isNull _display || !btc_debug_graph) exitWith {
    [_id] call CBA_fnc_removePerFrameHandler;
    _display closeDisplay 1;
};

remoteExecCall ["btc_fnc_debug_getFrames", 2];
private _frames = btc_debug_frames;
_TXTfps ctrlSetText format ["SERVER FPS: %1", _frames];

private _newBar = _display ctrlCreate ["RscVProgress", -1, _GRPframes];
{
    _x ctrlSetPosition [_maxWidth - ((_forEachIndex + 2) * _width), 0];
    _x ctrlCommit 0;
} forEach btc_barArray;
btc_barArray = [_newBar] + btc_barArray;
_newBar ctrlSetPosition [
    _maxWidth-_width,
    0,
    _width,
    0.252 * safezoneH
];

private _firstCtrl = btc_barArray select (count btc_barArray -1);
_newBar ctrlCommit 0;
_newBar progressSetPosition (_frames/_maxFps);
if ((ctrlPosition _firstCtrl) select 0 < 0) then {
    ctrlDelete _firstCtrl;
    btc_barArray = btc_barArray - [_firstCtrl];
};
