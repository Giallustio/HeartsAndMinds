/*
Original Author of the effects is brians200
https://forums.bistudio.com/forums/topic/161027-randomly-generated-roadside-ieds/
extracted and processed by kuemmel
*/

btc_fnc_ied_effect_smoke = {
  params [["_pos", [0,0,0]]];
  _pos params ["_x","_y"];
  _posASL = [_x,_y, (getTerrainHeightASL _pos)];

  0 = [_pos,_posASL] spawn {
    params ["_pos", "_posASL"];
		private _smokePlu = floor random 8;
		for "_i" from 0 to _smokePlu -1 do {
			private _r = floor random 3;
			switch(_r) do {
				case 0:	{[_pos, _posASL] spawn {call btc_fnc_ied_effect_sand_smoke;};};
				case 1:	{[_pos, _posASL] spawn {call btc_fnc_ied_effect_gray_smoke;};};
				case 2:	{[_pos, _posASL] spawn {call btc_fnc_ied_effect_brown_smoke;};};
			};
		};
	};

  0 = [_posASL] spawn {
    params ["_posASL"];

    private _smoke1 = "#particlesource" createVehicleLocal _posASL;
    _smoke1 setposasl _posASL;
    _smoke1 setParticleCircle [0, [0, 0, 0]];
    _smoke1 setParticleRandom [0, [1.5 + random 2, 1.5 + random 2, 8], [1+random 5, 1+random 5, 15], 0, 0.25, [0.05, 0.05, 0.05, 0.1], 0, 0];
    _smoke1 setParticleParams [["\A3\data_f\cl_fireD", 1, 0, 1], "", "Billboard", 1, 6, [0, 0, 0], [0, 0, 0], 0, 10, 7.85, .375, [6 + random 4, 10 + random 4, 14 + random 4], [[0, 0, 0, 1], [0.35, 0.35, 0.35, 0.35], [0.35, 0.35, 0.35, 0]], [0.08], 1, 0, "", "", _posASL];
    _smoke1 setDropInterval .01;

    private _smoke2 = "#particlesource" createVehicleLocal _posASL;
    _smoke2 setposasl _posASL;
    _smoke2 setParticleCircle [0, [0, 0, 0]];
    _smoke2 setParticleRandom [0, [1.5 + random 2, 1.5 + random 2, 8], [1+random 5, 1+random 5, 15], 0, 0.25, [0.05, 0.05, 0.05, 0.1], 0, 0];
    _smoke2 setParticleParams [["\A3\data_f\cl_fireD", 1, 0, 1], "", "Billboard", 1, 6, [0, 0, 0], [0, 0, 0], 0, 10, 7.85, .375, [6 + random 4, 10 + random 4, 14 + random 4], [[.78, .76, .71, 1], [.35, .35, .35, 0.35], [0.35, 0.35, 0.35, 0]], [0.08], 1, 0, "", "", _posASL];
    _smoke2 setDropInterval .01;

    private _smoke3 = "#particlesource" createVehicleLocal _posASL;
    _smoke3 setposasl _posASL;
    _smoke3 setParticleCircle [0, [0, 0, 0]];
    _smoke3 setParticleRandom [0, [1.5 + random 2, 1.5 + random 2, 8], [1+random 5, 1+random 5, 15], 0, 0.25, [0.05, 0.05, 0.05, 0.1], 0, 0];
    _smoke3 setParticleParams [["\A3\data_f\cl_fireD", 1, 0, 1], "", "Billboard", 1, 6, [0, 0, 0], [0, 0, 0], 0, 10, 7.85, .375, [6 + random 4, 10 + random 4, 14 + random 4], [[.55, .47, .37, 1], [.35, .35, .35, 0.35], [0.35, 0.35, 0.35, 0]], [0.08], 1, 0, "", "", _posASL];
    _smoke3 setDropInterval .01;

    private _smoke4 = "#particlesource" createVehicleLocal _posASL;
    _smoke4 setposasl _posASL;
    _smoke4 setParticleCircle [0, [0, 0, 0]];
    _smoke4 setParticleRandom [0, [1.5 + random 2, 1.5 + random 2, 8], [1+random 5, 1+random 5, 15], 0, 0.25, [0.05, 0.05, 0.05, 0.1], 0, 0];
    _smoke4 setParticleParams [["\A3\data_f\cl_fireD", 1, 0, 1], "", "Billboard", 1, 6, [0, 0, 0], [0, 0, 0], 0, 10, 7.85, .375, [6 + random 4, 10 + random 4, 14 + random 4], [[.1, .1, .1, 1], [.2, .2, .2, 0.35], [0.35, 0.35, 0.35, 0]], [0.08], 1, 0, "", "", _posASL];
    _smoke4 setDropInterval .01;

    private _smokes = [_smoke1,_smoke2, _smoke3,_smoke4];

    sleep 1;

    _smoke1 setParticleRandom [0, [1.5 + random 2, 1.5 + random 2, 5], [1+random 5, 1+random 5, 10], 0, 0.25, [0.05, 0.05, 0.05, 0.1], 0, 0];
    _smoke1 setParticleParams [["\A3\data_f\cl_fireD", 1, 0, 1], "", "Billboard", 1, 9, [0, 0, 0], [0, 0, 0], 0, 10, 7.85, .375, [6 + random 4, 10 + random 4, 14 + random 4], [[.35, .35, .35, 1], [.2, .2, .2, 0.9], [0.35, 0.35, 0.35, 0]], [0.08], 1, 0, "", "", _posASL];
    _smoke1 setDropInterval .03;

    _smoke2 setParticleRandom [0, [1.5 + random 2, 1.5 + random 2, 5], [1+random 5, 1+random 5, 10], 0, 0.25, [0.05, 0.05, 0.05, 0.1], 0, 0];
    _smoke2 setParticleParams [["\A3\data_f\cl_fireD", 1, 0, 1], "", "Billboard", 1, 9, [0, 0, 0], [0, 0, 0], 0, 10, 7.85, .375, [6 + random 4, 10 + random 4, 14 + random 4], [[.35, .35, .35, 1], [.2, .2, .2, 0.9], [0.35, 0.35, 0.35, 0]], [0.08], 1, 0, "", "", _posASL];
    _smoke2 setDropInterval .03;

    _smoke3 setParticleRandom [0, [1.5 + random 2, 1.5 + random 2, 5], [1+random 5, 1+random 5, 10], 0, 0.25, [0.05, 0.05, 0.05, 0.1], 0, 0];
    _smoke3 setParticleParams [["\A3\data_f\cl_fireD", 1, 0, 1], "", "Billboard", 1, 9, [0, 0, 0], [0, 0, 0], 0, 10, 7.85, .375, [6 + random 4, 10 + random 4, 14 + random 4], [[.35, .35, .35, 1], [.2, .2, .2, 0.9], [0.35, 0.35, 0.35, 0]], [0.08], 1, 0, "", "", _posASL];
    _smoke3 setDropInterval .03;

    _smoke4 setParticleRandom [0, [1.5 + random 2, 1.5 + random 2, 5], [1+random 5, 1+random 5, 10], 0, 0.25, [0.05, 0.05, 0.05, 0.1], 0, 0];
    _smoke4 setParticleParams [["\A3\data_f\cl_fireD", 1, 0, 1], "", "Billboard", 1, 9, [0, 0, 0], [0, 0, 0], 0, 10, 7.85, .375, [6 + random 4, 10 + random 4, 14 + random 4], [[.35, .35, .35, 1], [.2, .2, .2, 0.9], [0.35, 0.35, 0.35, 0]], [0.08], 1, 0, "", "", _posASL];
    _smoke4 setDropInterval .03;

    sleep 1;
    _smoke1 setParticleRandom [0, [1.5 + random 2, 1.5 + random 2, 5], [1+random 5, 1+random 5, 6], 0, 0.25, [0.05, 0.05, 0.05, 0.1], 0, 0];
    _smoke1 setParticleParams [["\A3\data_f\cl_fireD", 1, 0, 1], "", "Billboard", 1, 12, [0, 0, 0], [0, 0, 0], 0, 10, 7.85, .375, [6 + random 4, 10 + random 4, 14 + random 4], [[.35, .35, .35, 1], [.2, .2, .2, 0.9], [0.35, 0.35, 0.35, 0]], [0.08], 1, 0, "", "", _posASL];
    _smoke1 setDropInterval .05;

    _smoke2 setParticleRandom [0, [1.5 + random 2, 1.5 + random 2, 5], [1+random 5, 1+random 5, 6], 0, 0.25, [0.05, 0.05, 0.05, 0.1], 0, 0];
    _smoke2 setParticleParams [["\A3\data_f\cl_fireD", 1, 0, 1], "", "Billboard", 1, 12, [0, 0, 0], [0, 0, 0], 0, 10, 7.85, .375, [6 + random 4, 10 + random 4, 14 + random 4], [[.35, .35, .35, 1], [.2, .2, .2, 0.9], [0.35, 0.35, 0.35, 0]], [0.08], 1, 0, "", "", _posASL];
    _smoke2 setDropInterval .05;

    _smoke3 setParticleRandom [0, [1.5 + random 2, 1.5 + random 2, 5], [1+random 5, 1+random 5, 6], 0, 0.25, [0.05, 0.05, 0.05, 0.1], 0, 0];
    _smoke3 setParticleParams [["\A3\data_f\cl_fireD", 1, 0, 1], "", "Billboard", 1, 12, [0, 0, 0], [0, 0, 0], 0, 10, 7.85, .375, [6 + random 4, 10 + random 4, 14 + random 4], [[.35, .35, .35, 1], [.2, .2, .2, 0.9], [0.35, 0.35, 0.35, 0]], [0.08], 1, 0, "", "", _posASL];
    _smoke3 setDropInterval .05;

    _smoke4 setParticleRandom [0, [1.5 + random 2, 1.5 + random 2, 5], [1+random 5, 1+random 5, 6], 0, 0.25, [0.05, 0.05, 0.05, 0.1], 0, 0];
    _smoke4 setParticleParams [["\A3\data_f\cl_fireD", 1, 0, 1], "", "Billboard", 1, 12, [0, 0, 0], [0, 0, 0], 0, 10, 7.85, .375, [6 + random 4, 10 + random 4, 14 + random 4], [[.35, .35, .35, 1], [.2, .2, .2, 0.9], [0.35, 0.35, 0.35, 0]], [0.08], 1, 0, "", "", _posASL];
    _smoke4 setDropInterval .05;

    sleep 1;
    _smoke1 setParticleRandom [0, [1 + random 3, 1 + random 3, 5], [1, 1, 4], 0, 0.25, [0.05, 0.05, 0.05, 0.1], 0, 0];
    _smoke1 setParticleParams [["\A3\data_f\cl_fireD", 1, 0, 1], "", "Billboard", 1, 16, [0, 0, 0], [0, 0, 0], 0, 10, 7.85, .375, [6 + random 4, 10 + random 4, 14 + random 4], [[.35, .35, .35, 1], [.2, .2, .2, 0.9], [0.35, 0.35, 0.35, 0]], [0.08], 1, 0, "", "", _posASL];
    _smoke1 setDropInterval .05;

    _smoke2 setParticleRandom [0, [1 + random 3, 1 + random 3, 5], [1, 1, 4], 0, 0.25, [0.05, 0.05, 0.05, 0.1], 0, 0];
    _smoke2 setParticleParams [["\A3\data_f\cl_fireD", 1, 0, 1], "", "Billboard", 1, 16, [0, 0, 0], [0, 0, 0], 0, 10, 7.85, .375, [6 + random 4, 10 + random 4, 14 + random 4], [[.35, .35, .35, 1], [.2, .2, .2, 0.9], [0.35, 0.35, 0.35, 0]], [0.08], 1, 0, "", "", _posASL];
    _smoke2 setDropInterval .05;

    _smoke3 setParticleRandom [0, [1 + random 3, 1 + random 3, 5], [1, 1, 4], 0, 0.25, [0.05, 0.05, 0.05, 0.1], 0, 0];
    _smoke3 setParticleParams [["\A3\data_f\cl_fireD", 1, 0, 1], "", "Billboard", 1, 16, [0, 0, 0], [0, 0, 0], 0, 10, 7.85, .375, [6 + random 4, 10 + random 4, 14 + random 4], [[.35, .35, .35, 1], [.2, .2, .2, 0.9], [0.35, 0.35, 0.35, 0]], [0.08], 1, 0, "", "", _posASL];
    _smoke3 setDropInterval .05;

    _smoke4 setParticleRandom [0, [1 + random 3, 1 + random 3, 5], [1, 1, 4], 0, 0.25, [0.05, 0.05, 0.05, 0.1], 0, 0];
    _smoke4 setParticleParams [["\A3\data_f\cl_fireD", 1, 0, 1], "", "Billboard", 1, 16, [0, 0, 0], [0, 0, 0], 0, 10, 7.85, .375, [6 + random 4, 10 + random 4, 14 + random 4], [[.35, .35, .35, 1], [.2, .2, .2, 0.9], [0.35, 0.35, 0.35, 0]], [0.08], 1, 0, "", "", _posASL];
    _smoke4 setDropInterval .05;

    sleep 2;
    { deletevehicle _x; false} count _smokes;
  };
};

btc_fnc_ied_effect_sand_smoke = {
  params [
    ["_pos", [0,0,0]],
    ["_posASL", [0,0,0]],
    ["_horizontal", 500],
    ["_upwards", 300]
  ];

  private _size = 1 + random 3;

  private _thingToFling = "Land_Bucket_F" createVehicleLocal [0,0,0];
  _thingToFling hideObject true;
  _thingToFling setPos _pos;
  private _smoke = "#particlesource" createVehicleLocal _posASL;
  _smoke setPosASL _posASL;
  _smoke setParticleCircle [0, [0, 0, 0]];
  _smoke setParticleRandom [0, [0.25, 0.25, 0], [0, 0, 0], 0, 1, [0, 0, 0, 0.1], 0, 0];
  _smoke setParticleParams [["\A3\data_f\cl_fireD", 1, 0, 1], "", "Billboard", 1, 10, [0, 0, 2], [0, 0, 0], 0, 10, 7.85, 0.375, [_size,2*_size], [[.55, .47, .37, .75], [0.78, 0.76, 0.71, 0]], [0.08], 1, 0, "", "", _thingToFling];
  _smoke setDropInterval 0.005;

  _thingToFling setVelocity [(random _horizontal)-(_horizontal/2), (random _horizontal)-(_horizontal/2), 5+(random _upwards)];
  _thingToFling allowDamage false;
  private _sleepTime = (random .5);
  private _currentTime = 0;

  while { _currentTime < _sleepTime and _size > 0} do {
    _smoke setParticleParams [["\A3\data_f\cl_fireD", 1, 0, 1], "", "Billboard", 1, 10, [0, 0, 2], [0, 0, 0], 0, 10, 7.85, 0.375, [_size,2*_size], [[.55, .47, .37, .75], [0.78, 0.76, 0.71, 0]], [0.08], 1, 0, "", "", _thingToFling];

    _sleep = random .05;
    _size = _size - (6*_sleep);
    _currentTime = _currentTime + _sleep;
    sleep _sleep;
  };

  _thingToFling setpos [0,0,0];
  deletevehicle _smoke;
  deletevehicle _thingToFling;
};

btc_fnc_ied_effect_gray_smoke = {
  params [
    ["_pos", [0,0,0]],
    ["_posASL", [0,0,0]],
    ["_horizontal", 500],
    ["_upwards", 300]
  ];

  private _size = 1 + random 3;

  private _thingToFling = "Land_Bucket_F" createVehicleLocal [0,0,0];
  _thingToFling hideObject true;
  _thingToFling setPos _pos;
  private _smoke = "#particlesource" createVehicleLocal _posASL;
  _smoke setPosASL _posASL;
  _smoke setParticleCircle [0, [0, 0, 0]];
  _smoke setParticleRandom [0, [0.25, 0.25, 0], [0, 0, 0], 0, 1, [0, 0, 0, 0.1], 0, 0];
  _smoke setParticleParams [["\A3\data_f\cl_fireD", 1, 0, 1], "", "Billboard", 1, 10, [0, 0, 2], [0, 0, 0], 0, 10, 7.85, 0.375, [_size,2*_size], [[.1, .1, .1, .75], [0.78, 0.76, 0.71, 0]], [0.08], 1, 0, "", "", _thingToFling];
  _smoke setDropInterval 0.005;

  _thingToFling setVelocity [(random _horizontal)-(_horizontal/2), (random _horizontal)-(_horizontal/2), 5+(random _upwards)];
  _thingToFling allowDamage false;
  private _sleepTime = (random .5);
  private _currentTime = 0;

  while { _currentTime < _sleepTime and _size > 0} do {
    _smoke setParticleParams [["\A3\data_f\cl_fireD", 1, 0, 1], "", "Billboard", 1, 10, [0, 0, 2], [0, 0, 0], 0, 10, 7.85, 0.375, [_size,2*_size], [[.1, .1, .1, .75], [0.78, 0.76, 0.71, 0]], [0.08], 1, 0, "", "", _thingToFling];

    _sleep = random .05;
    _size = _size - (6*_sleep);
    _currentTime = _currentTime + _sleep;
    sleep _sleep;
  };

  _thingToFling setpos [0,0,0];
  deletevehicle _smoke;
  deletevehicle _thingToFling;
};

btc_fnc_ied_effect_brown_smoke = {
  params [
    ["_pos", [0,0,0]],
    ["_posASL", [0,0,0]],
    ["_horizontal", 500],
    ["_upwards", 300]
  ];
  private _size = 1 + random 3;

	private _thingToFling = "Land_Bucket_F" createVehicleLocal [0,0,0];
	_thingToFling hideObject true;
	_thingToFling setPos _pos;
	private _smoke = "#particlesource" createVehicleLocal _posASL;
	_smoke setPosASL _posASL;
	_smoke setParticleCircle [0, [0, 0, 0]];
	_smoke setParticleRandom [0, [0.25, 0.25, 0], [0, 0, 0], 0, 1, [0, 0, 0, 0.1], 0, 0];
	_smoke setParticleParams [["\A3\data_f\cl_fireD", 1, 0, 1], "", "Billboard", 1, 10, [0, 0, 2], [0, 0, 0], 0, 10, 7.85, 0.375, [_size,2*_size], [[0.55, 0.41, 0.25, 1], [0.55, 0.41, 0.25, 0]], [0.08], 1, 0, "", "", _thingToFling];
	_smoke setDropInterval 0.005;

	_thingToFling setVelocity [(random _horizontal)-(_horizontal/2), (random _horizontal)-(_horizontal/2), 5+(random _upwards)];
	_thingToFling allowDamage false;
	private _sleepTime = (random .5);
	private _currentTime = 0;

	while { _currentTime < _sleepTime and _size > 0} do {
		_smoke setParticleParams [["\A3\data_f\cl_fireD", 1, 0, 1], "", "Billboard", 1, 10, [0, 0, 2], [0, 0, 0], 0, 10, 7.85, 0.375, [_size,2*_size], [[0.55, 0.41, 0.25, 1], [0.55, 0.41, 0.25, 0]], [0.08], 1, 0, "", "", _thingToFling];

		_sleep = random .05;
		_size = _size - (6*_sleep);
		_currentTime = _currentTime + _sleep;
		sleep _sleep;
	};

	_thingToFling setpos [0,0,0];
	deletevehicle _smoke;
	deletevehicle _thingToFling;
};

btc_fnc_ied_effect_rocks = {
  params [["_pos", [0,0,0]]];

  0 = _pos spawn {
    _this params ["_x","_y"];
    _posASL = [_x,_y, (getTerrainHeightASL _this)];

    private _rocks1 = "#particlesource" createVehicleLocal _posASL;
    _rocks1 setPosASL _posASL;
    _rocks1 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Mud.p3d", 1, 0, 1], "", "SpaceObject", 1, 12.5, [0, 0, 0], [0, 0, 15], 5, 100, 7.9, 1, [.45, .45], [[0.1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", _posASL,0,false,0.3];
    _rocks1 setParticleRandom [0, [1, 1, 0], [20, 20, 15], 3, 0.25, [0, 0, 0, 0.1], 0, 0];
    _rocks1 setDropInterval 0.01;
    _rocks1 setParticleCircle [0, [0, 0, 0]];

    private _rocks2 = "#particlesource" createVehicleLocal _posASL;
    _rocks2 setPosASL _posASL;
    _rocks2 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Mud.p3d", 1, 0, 1], "", "SpaceObject", 1, 12.5, [0, 0, 0], [0, 0, 15], 5, 100, 7.9, 1, [.27, .27], [[0.1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", _posASL,0,false,0.3];
    _rocks2 setParticleRandom [0, [1, 1, 0], [25, 25, 15], 3, 0.25, [0, 0, 0, 0.1], 0, 0];
    _rocks2 setDropInterval 0.01;
    _rocks2 setParticleCircle [0, [0, 0, 0]];

    private _rocks3 = "#particlesource" createVehicleLocal _posASL;
    _rocks3 setPosASL _posASL;
    _rocks3 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Mud.p3d", 1, 0, 1], "", "SpaceObject", 1, 12.5, [0, 0, 0], [0, 0, 15], 5, 100, 7.9, 1, [.09, .09], [[0.1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", _posASL,0,false,0.3];
    _rocks3 setParticleRandom [0, [1, 1, 0], [30, 30, 15], 3, 0.25, [0, 0, 0, 0.1], 0, 0];
    _rocks3 setDropInterval 0.01;
    _rocks3 setParticleCircle [0, [0, 0, 0]];

    private _rocks = [_rocks1,_rocks2, _rocks3];
    sleep 0.125;
    {deletevehicle _x; false} count _rocks;
  };
};

btc_fnc_ied_effect_blurEffect = {
  params [["_pos", [0,0,0]],["_caller", objNull]];
  if (!isPlayer _caller) exitWith {};
	if (alive _caller) then {
    private _distance = (getPos _caller) distance _pos;
    if (_distance < 75) then {
      //handle sound
        private _volume = linearConversion [0,60,75-_distance, 0.1, 1, true];
        playSound3d ["A3\Missions_F_EPA\data\sounds\combat_deafness.wss", player, false, getpos player, _volume];
		};

    //blurry screen with cam shake
    if(_distance < 35) then {
      [] spawn {
  			addCamShake [1, 3, 3];

  			private _blur = ppEffectCreate ["DynamicBlur", 474];
  			_blur ppEffectEnable true;
  			_blur ppEffectAdjust [0];
  			_blur ppEffectCommit 0;

  			waitUntil {ppEffectCommitted _blur};

  			_blur ppEffectAdjust [10];
  			_blur ppEffectCommit 0;

  			_blur ppEffectAdjust [0];
  			_blur ppEffectCommit 5;

  			waitUntil {ppEffectCommitted _blur};

  			_blur ppEffectEnable false;
  			ppEffectDestroy _blur;
  		};
    };
	};
};

btc_fnc_ied_effect_shock_wave = {
  params [["_pos", [0,0,0]]];
  _pos params ["_x","_y"];
  _posASL = [_x,_y, (getTerrainHeightASL _pos)];

  0 = [_posASL] spawn {
      params ["_posASL"];

    	private _smoke1 = "#particlesource" createVehicleLocal _posASL;
    	_smoke1 setposasl _posASL;
    	_smoke1 setParticleCircle [0, [0, 0, 0]];
    	_smoke1 setParticleRandom [0, [8, 8, 2], [300, 300, 0], 0, 0.25, [0.05, 0.05, 0.05, 0.1], 0, 0];
    	_smoke1 setParticleParams [["\A3\data_f\cl_fireD", 1, 0, 1], "", "Billboard", 1, 3, [0, 0, -1], [0, 0, -8], 0, 10, 7.85, .375, [6, 8, 10], [[0, 0, 0, 1], [0.35, 0.35, 0.35, 0.35], [0.35, 0.35, 0.35, 0]], [0.08], 1, 0, "", "", _posASL];
    	_smoke1 setDropInterval .0004;

    	private _smoke2 = "#particlesource" createVehicleLocal _posASL;
    	_smoke2 setposasl _posASL;
    	_smoke2 setParticleCircle [0, [0, 0, 0]];
    	_smoke2 setParticleRandom [0, [8, 8, 2], [300, 300, 0], 0, 0.25, [0.05, 0.05, 0.05, 0.1], 0, 0];
    	_smoke2 setParticleParams [["\A3\data_f\cl_fireD", 1, 0, 1], "", "Billboard", 1, 3, [0, 0, -1], [0, 0, -8], 0, 10, 7.85, .375, [6, 8, 10], [[.78, .76, .71, 1], [.35, .35, .35, 0.35], [0.35, 0.35, 0.35, 0]], [0.08], 1, 0, "", "", _posASL];
    	_smoke2 setDropInterval .0004;

    	private _smoke3 = "#particlesource" createVehicleLocal _posASL;
    	_smoke3 setposasl _posASL;
    	_smoke3 setParticleCircle [0, [0, 0, 0]];
    	_smoke3 setParticleRandom [0, [8, 8, 2], [300, 300, 0], 0, 0.25, [0.05, 0.05, 0.05, 0.1], 0, 0];
    	_smoke3 setParticleParams [["\A3\data_f\cl_fireD", 1, 0, 1], "", "Billboard", 1, 3, [0, 0, -1], [0, 0, -8], 0, 10, 7.85, .375, [6, 8, 10], [[.55, .47, .37, 1], [.35, .35, .35, 0.35], [0.35, 0.35, 0.35, 0]], [0.08], 1, 0, "", "", _posASL];
    	_smoke3 setDropInterval .0004;

    	private _smoke4 = "#particlesource" createVehicleLocal _posASL;
    	_smoke4 setposasl _posASL;
    	_smoke4 setParticleCircle [0, [0, 0, 0]];
    	_smoke4 setParticleRandom [0, [8, 8, 2], [300, 300, 0], 0, 0.25, [0.05, 0.05, 0.05, 0.1], 0, 0];
    	_smoke4 setParticleParams [["\A3\data_f\cl_fireD", 1, 0, 1], "", "Billboard", 1, 3, [0, 0, -1], [0, 0, -8], 0, 10, 7.85, .375, [6, 8, 10], [[.1, .1, .1, 1], [.2, .2, .2, 0.35], [0.35, 0.35, 0.35, 0]], [0.08], 1, 0, "", "", _posASL];
    	_smoke4 setDropInterval .0004;

    	private _smokes = [_smoke1, _smoke2, _smoke3, _smoke4];

    	sleep .07;

    	{ deletevehicle _x; false	} count _smokes;
  };
};

params [
  ["_pos", [0,0,0]],
  ["_caller", player]
];

[_pos,_caller] call btc_fnc_ied_effect_blurEffect;
[_pos] call btc_fnc_ied_effect_smoke;
[_pos] call btc_fnc_ied_effect_rocks;
[_pos] call btc_fnc_ied_effect_shock_wave;
