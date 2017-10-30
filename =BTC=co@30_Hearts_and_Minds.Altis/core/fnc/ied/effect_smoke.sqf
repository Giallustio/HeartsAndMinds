params [["_pos", [0,0,0]]];
_pos params ["_x","_y"];
_posASL = [_x,_y, (getTerrainHeightASL _pos)];

[_pos,_posASL] spawn {
  params ["_pos", "_posASL"];
  private _smokePlu = floor random 8;
  for "_i" from 0 to _smokePlu -1 do {
    private _selection = selectRandom ["sand","gray","brown"];
      [_pos, _posASL, _selection] spawn btc_fnc_ied_effect_color_smoke;
    };
};

[_posASL] spawn {
  params ["_posASL"];

  //create smoke
  private _smokes = [];
  for "_i" from 1 to 7 step 1 do {
      if (_i <= 4) then {
        private _smoke = "#particlesource" createVehicleLocal _posASL;
        _smoke setposasl _posASL;
        _smoke setParticleCircle [0, [0, 0, 0]];
        _smoke setParticleRandom [0, [1.5 + random 2, 1.5 + random 2, 8], [1+random 5, 1+random 5, 15], 0, 0.25, [0.05, 0.05, 0.05, 0.1], 0, 0];

        private _color = [] call {
          if (_i isEqualTo 1) exitWith {[[0, 0, 0, 1], [0.35, 0.35, 0.35, 0.35], [0.35, 0.35, 0.35, 0]];};
          if (_i isEqualTo 2) exitWith {[[.78, .76, .71, 1], [.35, .35, .35, 0.35], [0.35, 0.35, 0.35, 0]];};
          if (_i isEqualTo 3) exitWith {[[.55, .47, .37, 1], [.35, .35, .35, 0.35], [0.35, 0.35, 0.35, 0]];};
          if (_i isEqualTo 4) exitWith {[[.55, .47, .37, 1], [.35, .35, .35, 0.35], [0.35, 0.35, 0.35, 0]];};
        };

        _smoke setParticleParams [["\A3\data_f\cl_fireD", 1, 0, 1], "", "Billboard", 1, 8, [0, 0, 0], [0, 0, 0], 0, 10, 7.85, .375, [6 + random 4, 6 + random 4, 10 + random 4], _color, [0.08], 1, 0, "", "", _posASL];
        _smoke setDropInterval .01;

        _smokes pushBack _smoke;
      };
      _modPPar = [["\A3\data_f\cl_fireD", 1, 0, 1], "", "Billboard", 1, 10, [0, 0, 0], [0, 0, 0], 0, 10, 7.85, .375, [6 + random 4, 10 + random 4, 14 + random 4], [[.35, .35, .35, 1], [.2, .2, .2, 0.9], [0.35, 0.35, 0.35, 0]], [0.08], 1, 0, "", "", _posASL];
      if (_i isEqualTo 5) then {
        {
            //sleep 1;
            _x setParticleRandom [0, [1.5 + random 2, 1.5 + random 2, 5], [1+random 5, 1+random 5, 10], 0, 0.25, [0.05, 0.05, 0.05, 0.1], 0, 0];
            _x setParticleParams _modPPar;
            _x setDropInterval .03;
        } count _smokes;
      };
      if (_i isEqualTo 6) then {
        {
            //sleep 1;
            _x setParticleRandom [0, [1.5 + random 2, 1.5 + random 2, 5], [1+random 5, 1+random 5, 6], 0, 0.25, [0.05, 0.05, 0.05, 0.1], 0, 0];
            _x setParticleParams _modPPar;
            _x setDropInterval .05;
        } count _smokes;
      };
      if (_i isEqualTo 7) then {
        {
            //sleep 1;
            _x setParticleRandom [0, [1 + random 3, 1 + random 3, 5], [1, 1, 4], 0, 0.25, [0.05, 0.05, 0.05, 0.1], 0, 0];
            _x setParticleParams _modPPar;
            _x setDropInterval .05;
        } count _smokes;
      };
  };
  sleep 2;
  { deletevehicle _x; false} count _smokes;
};
