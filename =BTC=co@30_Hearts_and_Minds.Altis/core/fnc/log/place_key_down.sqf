/*
	DIK_KeyCodes:	https://community.bistudio.com/wiki/DIK_KeyCodes
	16 Q ||	44 Z (Y:German keyboard) ||	30 A ||	32 D ||	45 X ||	46 C ||	33 F ||	19 R
*/
params ["_display","_key","_shift","_ctrl","_alt",["_keyPressed",false]];

private _turbo = if (_shift) then {1} else {0};

//height +
if (_key isEqualTo 16) then {
	//check for max height
	if !(btc_log_placing_h > btc_log_placing_max_h) then {
		//add/remove value
		btc_log_placing_h = btc_log_placing_h + 0.1 + (_turbo/2);
		//placing
		btc_log_placing_obj attachTo [player,[0,btc_log_placing_d,btc_log_placing_h]];
	};
	//set var
	_keyPressed = true;
};
//height -
if (_key isEqualTo 44) then {
	//check for min height
	if !(btc_log_placing_h < - 2) then {
		//add/remove value
		btc_log_placing_h = btc_log_placing_h - 0.1 - (_turbo/2);
		//placing
		btc_log_placing_obj attachTo [player,[0,btc_log_placing_d,btc_log_placing_h]];
	};
	//set var
	_keyPressed = true;
};
//yaw +
if (_key isEqualTo 45) then {
	//add value
	btc_log_placing_dir = btc_log_placing_dir + 0.5 + _turbo;
	//set var
	_keyPressed = true;
};
//yaw -
if (_key isEqualTo 46) then {
	//remove value
	btc_log_placing_dir = btc_log_placing_dir - 0.5 - _turbo;
	//set var
	_keyPressed = true;
};
//roll +
if (_key isEqualTo 33) then {
	//add value
	btc_log_rotating_dir = btc_log_rotating_dir + 0.5 + _turbo;
	//set var
	_keyPressed = true;
};
//roll -
if (_key isEqualTo 19) then {
	//remove value
	btc_log_rotating_dir = btc_log_rotating_dir - 0.5 - _turbo;
	//set var
	_keyPressed = true;
};

//set object position
if (_keyPressed) then {
	btc_log_placing_obj setVectorDirAndUp [
		 [
		 	(sin btc_log_placing_dir) * (cos btc_log_ptich_dir),
			(cos btc_log_placing_dir) * (cos btc_log_ptich_dir),
			(sin btc_log_ptich_dir)
		 ],
		 [
		 		[
		 			(sin btc_log_rotating_dir),
					(-sin btc_log_ptich_dir),
					(cos btc_log_rotating_dir * cos btc_log_ptich_dir)
				],
		 -btc_log_placing_dir
		 ] call BIS_fnc_rotateVector2D
	];
};

_keyPressed
