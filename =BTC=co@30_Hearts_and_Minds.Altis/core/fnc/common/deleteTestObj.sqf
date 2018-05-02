params ["_testObj"];

_testObj addMPEventHandler ["MPKilled", {
    params ["_testObj"];

    {
        deleteVehicle _x;
    } forEach (_testObj getVariable ["effects", []]);
    if (isServer) then {
        deleteVehicle _testObj;
    };
}];
_testObj setDamage 1;
