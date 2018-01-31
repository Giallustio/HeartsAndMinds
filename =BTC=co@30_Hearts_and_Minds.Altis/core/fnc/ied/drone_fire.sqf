
params ["_trigger"];

private _driver_drone = _trigger getVariable "btc_ied_drone";

_driver_drone forceWeaponFire ["BombDemine_01_F", "BombDemine_01_F"];
