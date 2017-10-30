params [["_pos", [0,0,0]]];

_pos spawn {
  _this params ["_x","_y"];
  _posASL = [_x,_y, (getTerrainHeightASL _this)];

  private _rockesArr = [];
  for "_i" from 1 to 3 step 1 do {
    private _rocks = "#particlesource" createVehicleLocal _posASL;
    _rocks setPosASL _posASL;
    _rocks setParticleCircle [0, [0, 0, 0]];

    private _rubVar = [];
    private _rVar = [];
    [] call {
      if (_i isEqualTo 1) exitWith {
        _rubVar = [.45, .45];
        _rVar = [0, [1, 1, 0], [20, 20, 15], 3, 0.25, [0, 0, 0, 0.1], 0, 0];
      };
      if (_i isEqualTo 2) exitWith {
        _rubVar = [.27, .27];
        _rVar = [0, [1, 1, 0], [25, 25, 15], 3, 0.25, [0, 0, 0, 0.1], 0, 0];
      };
      if (_i isEqualTo 3) exitWith {
        _rubVar = [.09, .09];
        _rVar = [0, [1, 1, 0], [30, 30, 15], 3, 0.25, [0, 0, 0, 0.1], 0, 0];
      };
    };

    _rocks setParticleRandom _rVar;
    _rocks setParticleParams [["\A3\data_f\ParticleEffects\Universal\Mud.p3d", 1, 0, 1], "", "SpaceObject", 1, 12.5, [0, 0, 0], [0, 0, 15], 5, 100, 7.9, 1, _rubVar, [[0.1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", _posASL,0,false,0.3];
    _rocks setDropInterval 0.01;

    _rockesArr pushBack _rocks;
  };

  sleep 0.22;
  {deletevehicle _x; false} count _rockesArr;
};
