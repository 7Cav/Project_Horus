/*
	Author: Bethea.A

	Description:
	Calls mission creation scripts based on provided mission type.

	Parameter(s):
	0: _missionType <STRING>			- String name of mission type.
	
	
	Returns:
	Nothing.
	
	Examples:
	["Patrol"] call phm_fnc_createMission;
*/

params ["_missionType"];

_missionData = [];

_debugMessage = format ["The mission type from create mission was: %1.",_missionType];
[_debugMessage] call phm_fnc_systemMessage;

switch (_missionType) do {

	case "Patrol": 			{[ph_AO_width, ph_AO_height, ph_AO_safeDistance] spawn phm_fnc_m_Patrol;};
	default					{[ph_AO_width, ph_AO_height, ph_AO_safeDistance] spawn phm_fnc_m_Patrol;};

};