
params ["_previousPos", "_medicalDeserializeState"];

player setPosASL _previousPos;
[player, _medicalDeserializeState] call ace_medical_fnc_deserializeState;
