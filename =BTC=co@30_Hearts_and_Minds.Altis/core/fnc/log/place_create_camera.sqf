
private _terminal = _this select 0;
private _campos = _this select 1;

_terminal setObjectTexture [0, "#(argb,512,512,1)r2t(uavrtt,1)"];

/* create camera and stream to render surface */
private _cam = "camera" camCreate _campos;
_cam cameraEffect ["Internal", "Back", "uavrtt"];

private _y = -180; private _p = 50; private _r = 0;
_cam setVectorDirAndUp [
	[ sin _y * cos _p,cos _y * cos _p,sin _p],
	[ [ sin _r,-sin _p,cos _r * cos _p],-_y] call BIS_fnc_rotateVector2D
];

btc_log_place_camera = _cam;
btc_log_place_camera_created = true;