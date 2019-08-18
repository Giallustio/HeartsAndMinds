
/* ----------------------------------------------------------------------------
Function: btc_fnc_chem_damage

Description:
    Apply chemical damage.

Parameters:
    _unit - Unit to apply the damage. [Object]
    _notAlready - false if is already contaminated. [Boolean]
    _bodyParts - List of body part. [Array]
    _cfgGlasses - Glasses config. [Config]

Returns:

Examples:
    (begin example)
        [cursorObject, true, ["head","body","hand_l","hand_r","leg_l","leg_r"], configFile >> "CfgGlasses"] call btc_fnc_chem_damage;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_unit", objNull, [objNull]],
    ["_notAlready", true, [true]],
    ["_bodyParts", [], [[]]],
    ["_cfgGlasses", configNull, [configNull]]
];

if !(
    (
        goggles _unit isKindOf ["G_RegulatorMask_base_F", _cfgGlasses] ||
        goggles _unit isKindOf ["G_AirPurifyingRespirator_01_base_F", _cfgGlasses]
    ) && (
        backpack _unit isKindOf "B_SCBA_01_base_F" ||
        backpack _unit isKindOf "B_CombinationUnitRespirator_01_Base_F"
    ) &&
    uniform _unit find "CBRN" > -1
) then { // Don't always apply damage to unit already contaminated
    if (selectRandom [true, _notAlready]) then {
        _this set [1, false];
        [_unit, random [0.05, 0.1, 0.1], selectRandom _bodyParts, "stab"] call ace_medical_fnc_addDamageToUnit; // ropeburn
    };
};

_this
