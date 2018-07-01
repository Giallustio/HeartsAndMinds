params ["_headless"];

if (_headless in (entities "HeadlessClient_F")) then {
    //Remove HC player when disconnect
    deleteVehicle _headless;
};
