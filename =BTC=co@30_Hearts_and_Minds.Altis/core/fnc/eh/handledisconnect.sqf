params [
    ["_headless", objNull, [objNull]]
];

if (_headless in (entities "HeadlessClient_F")) then {
    //Remove HC player when disconnect
    deleteVehicle _headless;
};
