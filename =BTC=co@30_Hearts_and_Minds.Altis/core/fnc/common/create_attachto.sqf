
private ["_object","_holder","_pos_type","_bbr","_p1","_p2","_height_box","_maxWidth_box","_height_weapon","_y","_p","_r"];

_object = _this select 0;
_holder = _this select 1;
_pos_type = _this select 2;

_bbr = boundingBoxReal _object;
_p1 = _bbr select 0;
_p2 = _bbr select 1;
_height_box = abs ((_p2 select 2) - (_p1 select 2)) + ((boundingCenter  _object) select 2);
_maxWidth_box = abs ((_p2 select 0) - (_p1 select 0));
_height_weapon = (boundingBoxReal _holder select 1 select 2) - (boundingCenter _holder select 2);

switch (_pos_type) do {
	case "TOP": {
		_holder attachTo [_object, [0, 0, _height_box + _height_weapon]];
		_y = random 180; _p = 0; _r = 0;
	};
	case "FRONT": {
		_holder attachTo [_object, [- _maxWidth_box/6, 0, -0.1]];
		_y = random [-20,0,20]; _p = random [-20,0,20]; _r = 255;
	};
	case "CORNER_L": {
		_holder attachTo [_object, [- _maxWidth_box/6.5, 0, -0.1]];
		_y = 40; _p = random [-10,0,10]; _r = 255;
	};
	case "CORNER_R": {
		_holder attachTo [_object, [- _maxWidth_box/8.5, 0, -0.1]];
		_y = -30; _p = random [-10,0,10]; _r = 255;
	};
	default	{
		_holder attachTo [_object, [0, 0, _height_box + _height_weapon]];
		_y = random 180; _p = 0; _r = 0;
	};
};

_holder setVectorDirAndUp [[ sin _y * cos _p,cos _y * cos _p,sin _p],[[ sin _r,-sin _p,cos _r * cos _p],-_y] call BIS_fnc_rotateVector2D];