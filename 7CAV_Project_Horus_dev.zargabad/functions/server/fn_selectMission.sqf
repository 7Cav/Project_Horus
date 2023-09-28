/*
	Author: Bethea.A

	Description:
	Selects a main or side mission based on the provided parameters. Functions may call a specific mission type via the optional parameters.

	Parameter(s):
	0: _MissionGroup <STRING> 			- Which mission group should be used to select. (default: Main)

	Returns:
	The selected mission type.
	
	Examples:
	["Main"] call phm_fnc_selectMission;
*/

params [["_missionGroup","Main"]];
_finalMissionType = "";
if (_missionGroup == "Main") then {

	_finalMissionType = selectRandom [

				"Patrol"

			];

} else {};

_finalMissionType
