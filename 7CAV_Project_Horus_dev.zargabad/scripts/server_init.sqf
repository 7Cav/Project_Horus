/*
	Author: Bethea.A

	Description:
	Initializes variables and functions for mission generator.

	Parameter(s):
	None
	
	
	Returns:
	Nothing.
	
	Examples:
	[] execVM "scripts\server_init.sqf";
*/
#include "..\presets\preset_init.sqf";
waitUntil {ph_config == true};

ph_markerList = [];
ph_mMissionInProgress = false;
ph_mMissionType = "Wombat";
ph_sMissionInProgress = false;
ph_sMissionType = 0;

//Initialize player counter.
[
	{
		ph_playerCount = count (allPlayers - entities "HeadlessClient_F");
	},
	5
] call CBA_fnc_addPerFrameHandler;

// Start first main mission if one does not exist.
if !(ph_mMissionInProgress) then {

	ph_mMissionType = ["Main"] call phm_fnc_selectMission;

	if (ph_debugEnabled) then {
		_debugMsg = format ["The mission type selected was: %1",ph_mMissionType];
		[_debugMsg] call phm_fnc_systemMessage;
	};

	[ph_mMissionType] call phm_fnc_createMission;

};