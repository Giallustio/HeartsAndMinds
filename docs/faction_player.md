# Change player faction :

You can change player faction by:
- In /mission.sqm
	- Migrate all playable slot to the desired side.
	- Change the marker named `respawn_west` to the one of the new side (`respawn_east`...).
- In /core/def/mission.sqf
	- Define the correct player side in [/core/def/mission.sqf#L469](https://github.com/Vdauphin/HeartsAndMinds/blob/master/%3DBTC%3Dco%4030_Hearts_and_Minds.Altis/core/def/mission.sqf#L469).
	- Define the same marker from mission.sqm in [/core/def/mission.sqf#L470](https://github.com/Vdauphin/HeartsAndMinds/blob/master/%3DBTC%3Dco%4030_Hearts_and_Minds.Altis/core/def/mission.sqf#L470).
- Choose in mission parameter an enemy faction with a different side from player side.
