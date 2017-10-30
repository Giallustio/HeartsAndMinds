params [
  ["_pos", [0,0,0]],
  ["_caller", player]
];

[_pos,_caller] call btc_fnc_ied_effect_blurEffect;
[_pos] call btc_fnc_ied_effect_smoke;
[_pos] call btc_fnc_ied_effect_rocks;
[_pos] call btc_fnc_ied_effect_shock_wave;
