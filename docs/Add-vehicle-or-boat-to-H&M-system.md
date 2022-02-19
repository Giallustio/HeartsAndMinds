This explain how to add a new vehicle to the H&M system (cargo, reputation, data base (save vehicle status, cargo ammo and objects loaded)...).

### 1: Add new vehicle to H&M
If the vehicle is destroyed, a wreck will be left. You will need to tow or lift it to the logistic point for a fully repair.
#### 1: By mission editing:
You can add new vehicle in the mision.sqm :
- Open the mission in the editor (mission.sqm).
- Add vehicles.
- Drag and drop them to [EDEN layers](https://community.bistudio.com/wiki/Eden_Editor:_Layer) named "btc_vehicles".
- Save.

#### 2: In game
A garage is available for admin only. Activate the garage through mission parameter. Then if you are admin, you will be allow to spawn a vehicle by interacting with the logisitc point box.

### 2: Add respawn to vehicle or boat

You can add a new vehicle/boat to respawn system by:
- Drag and drop them to [EDEN layers](https://community.bistudio.com/wiki/Eden_Editor:_Layer) named "btc_veh_respawnable".

Note: you can tweak respawn time here: [/core/init_server.sqf L46](https://github.com/Vdauphin/HeartsAndMinds/blob/master/%3DBTC%3Dco%4030_Hearts_and_Minds.Altis/core/init_server.sqf#L46) by changing 30s to what you want.
