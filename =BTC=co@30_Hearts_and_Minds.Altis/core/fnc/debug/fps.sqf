//https://forums.bohemia.net/forums/topic/204157-display-graph-in-dialog/

disableSerialization;

params ["_display"];

private _GRPframes = _display displayCtrl 9901;
private _TXTfps = _display displayCtrl 1000;
btc_barArray = [];
private _maxFps = 60;
private _maxWidth = ctrlPosition _GRPframes select 2;
private _width = _maxWidth/300;

[{
    params ["_args", "_id"];
    _args params ["_display", "_maxFps", "_maxWidth", "_width", "_GRPframes", "_TXTfps"];

    if (isNull _display) exitWith {
        [_id] call CBA_fnc_removePerFrameHandler;
    };

    private _frames = diag_fps;
    _TXTfps ctrlSetText format ["FPS: %1", _frames toFixed 2];
    private _newBar = _display ctrlCreate ["RscVProgress", -1, _GRPframes];
    {
        _x ctrlSetPosition [_maxWidth-((_forEachIndex+2)*_width), 0];
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
}, 0.1, [_display, _maxFps, _maxWidth, _width, _GRPframes, _TXTfps]] call CBA_fnc_addPerFrameHandler;
