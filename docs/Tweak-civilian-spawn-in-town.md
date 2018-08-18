# Civilian spawn :

You can tweak civilian spawn in town by modify file : [core/fnc/city/activate.sqf L82-L94](https://github.com/Vdauphin/HeartsAndMinds/blob/master_stable/%3DBTC%3Dco%4030_Hearts_and_Minds.Altis/core/fnc/city/activate.sqf#L82-L94)

You can change spawn factor of city by type (capital, village ...) or globally : `_n = 3 * _factor;` (change `3` to more or less).
You can check city type by launching the H&M in debug mode in mission parameter and read the type of city show by debug.

Note : if the factor is too high you can have performance issue.

# Civilian traffic :

Here you can tweak the max number of vehicle : [core/def/mission.sqf L216](https://github.com/Vdauphin/HeartsAndMinds/blob/master_stable/%3DBTC%3Dco%4030_Hearts_and_Minds.Altis/core/def/mission.sqf#L216)

Here you can tweak probability of spawn of vehicle : [core/fnc/city/activate.sqf L197-L200](https://github.com/Vdauphin/HeartsAndMinds/blob/master_stable/%3DBTC%3Dco%4030_Hearts_and_Minds.Altis/core/fnc/city/activate.sqf#L197-L200)