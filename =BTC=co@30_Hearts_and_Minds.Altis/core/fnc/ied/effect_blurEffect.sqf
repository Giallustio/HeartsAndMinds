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
  if(_distance < 40) then {
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
