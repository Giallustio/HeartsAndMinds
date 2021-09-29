This explain how to add a new vehicle to the H&M system (cargo, reputation, data base (save vehicle status, cargo ammo and objects loaded)...).

### 1: Add new vehicle to H&M
If the vehicle is destroyed, a wreck will be left. You will need to tow or lift it to the logistic point for a fully repair.
#### 1: By mission editing:
You can add new vehicle in the mision.sqm :
- Open the mission in the editor (mission.sqm).
- Add vehicles.
- Add in the init field: `this call btc_db_fnc_add_veh;`
- Save.

#### 2: In game
A garage is available for admin only. Activate the garage through mission parameter. Then if you are admin, you will be allow to spawn a vehicle by interacting with the logisitc point box.

### 2: Add respawn to vehicle or boat

You can add a new vehicle/boat to respawn system by:
- Add in the init field: `[this, 30] call btc_veh_fnc_addRespawn;`

Note: you can tweak respawn time here by changing 30 (s) to what you want.
