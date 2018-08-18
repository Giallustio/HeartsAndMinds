
#### 1: Remove RHS US dependency

You can remove RHS US mod dependency by :
- Open the mission in the editor (mission.sqm)
- **Replace** all RHS vehicle by Vanilla (**Not delete**!, each vehicle as a name (like `btc_veh_3`) and is used by the H&M for logistic system).
- All vehicles have RHS weapons and ammo in cargo. If you want to remove the RHS dependency, make sure to check the [vehicle contents](https://forums.bistudio.com/topic/165948-btc-hearts-and-minds/?p=3094122) also.
- Save.

Note: more information about vehicle integration in H&M [Here](https://github.com/Vdauphin/HeartsAndMinds/wiki/Add-vehicle-or-boat-to-H&M-system).

#### 2: ACE3 dependency

You can't remove ACE 3 mod dependency because H&M mission has a deep ACE3 implementation.
ACE3 gives a nice framework for all interaction (talk to civil and enemy), logistic system, rearm system and more complex side mission.