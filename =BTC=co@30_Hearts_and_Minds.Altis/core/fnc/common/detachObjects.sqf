params ["_unit"];

{
    detach _x;
    deleteVehicle _x;
} forEach attachedObjects _unit;
