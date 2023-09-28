/*
	Author: Bethea.A

	Description:
	Creates a patrol mission for players to prosecute.

	Parameter(s):
	0: _AO_width <NUMBER>			- Width of AO in meters.
	1: _AO_height <NUMBER>			- Height of AO in meters.
	2: _AO_safeDistance <NUMBER>	- Minimum distance from base object to spawn AO.
	
	
	Returns:
	Nothing.
	
	Examples:
	[500,500] spawn phm_fnc_m_Patrol;
*/

params ["_AO_width","_AO_height","_AO_safeDistance"];
_spawnRange = 250;

//Find AO

_AO_pos = [_AO_width,_AO_height,_AO_safeDistance] call phm_fnc_findAO;

if (ph_debugEnabled) then {
	_debugMessage = format ["The AO position was set to: %1",_AO_pos];
	[_debugMessage] call phm_fnc_systemMessage;
};

//Create Marker
_currentMarker = [_AO_pos,_AO_width,_AO_height] call phm_fnc_createMissionMarker;
_currentMarkerPos = markerPos _currentMarker;

// Get actual objective location
_actualObjectiveCenter = [[[_currentMarkerPos,400]],["water"]]call BIS_fnc_randomPos;

if (ph_debugEnabled) then {
	[_actualObjectiveCenter] call phm_fnc_markLocation;
};

//Generate present Opfor counts
_unitCounts = [ph_minInfantry,ph_playerCount,true,2,0,0,0,0] call phm_fnc_calculateForces;

//Spawn Forces
_spawnArray = [_unitCounts,_actualObjectiveCenter,_spawnRange] call phm_fnc_spawnOpForces;
_missionGroups = (_spawnArray select 0);

{
	_groupVehs = [_x,true] call BIS_fnc_groupVehicles;

	if ((count _groupVehs) == 0) then {
		[_x,_actualObjectiveCenter,200,4,[],false,false] call lambs_wp_fnc_taskPatrol;
	};

} forEach _missionGroups;

//Generate Tasks

//Register Mission

//Completion Listener