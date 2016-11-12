
private ["_color"];

_color = [0,0.25,0,1];
[getMarkerPos "btc_base","Loading ...",20,30,240,0,[
['\A3\ui_f\data\map\vehicleicons\iconhelicopter_ca.paa',[0.7,0,0,1], getPos btc_helo_1, 1.0, 1.0, 0, "Only Respawnable", 1],
['\A3\ui_f\data\igui\cfg\simpleTasks\types\run_ca.paa',_color, getPos btc_gear_object, 1.0, 1.0, 0, "Arsenal/Re-deploy", 1],
['\A3\Ui_f\data\Logos\a_64_ca.paa',_color, [getPos btc_gear_object select 0,getPos btc_gear_object select 1,(getPos btc_gear_object select 2) + 2], 1.0, 1.0, 0, "", 1],
['\A3\ui_f\data\map\vehicleicons\iconCar_ca.paa',_color, [getPos btc_create_object select 0,getPos btc_create_object select 1,(getPos btc_create_object select 2) + 5], 1.0, 1.0, 90, "", 1],
['\A3\ui_f\data\igui\cfg\simpleTasks\types\repair_ca.paa',_color, [getPos btc_create_object select 0,getPos btc_create_object select 1,(getPos btc_create_object select 2) + 2.5], 1.0, 1.0, 0, "", 1],
['\A3\ui_f\data\igui\cfg\simpleTasks\types\rearm_ca.paa',_color, getPos btc_create_object, 1.0, 1.0, 0, "Rearm/Repair and Objects", 1]
],0] spawn BIS_fnc_establishingShot;