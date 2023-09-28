/*
	Author: Bethea.A

	Description:
	Function to spawn opposing forces.

	Parameter(s):
	0: _unitCounts <ARRAY>			- [Infantry,Mechanized,Armor,Artillery,Rotary,Fixed Wing]
	1: _objLoc <ARRAY>				- Position to spawn units.
	2: _spawnRange <NUMBER>			- Range around objective location to spawn units.
	
	
	Returns:
	Array with an array of created groups and leftover reinforcements.
	
	Examples:
	[_unitCounts,_objLoc,_spawnRange] call phm_fnc_spawnOpForces;
*/

params ["_unitCounts","_objLoc","_spawnRange"];

_Groups = [];

_infantryPool = _unitCounts select 0;
_mechanizedPool = _unitCounts select 1;
_armorPool = _unitCounts select 2;
_artilleryPool = _unitCounts select 3;
_rotaryPool = _unitCounts select 4;
_fixedWingPool = _unitCounts select 5; 

//Infantry

_reinforcementInfantryPool = 0 max (_infantryPool - ph_maxInfantry);
_infantryPool = _infantryPool - _reinforcementInfantryPool; 

while {_infantryPool >= 8} do {
	_createdGroup = createGroup [east,true];
    _randomPos = [[[_objLoc,_spawnRange]],["water"]] call BIS_fnc_randomPos;

    {
    	_createdGroup createUnit [_x,_randomPos,[],5,"none"];
	} forEach rf_squad;

    _infantryPool = _infantryPool - 8;
    _Groups pushback _createdGroup;
};

while {_infantryPool >= 4} do {
	_createdGroup = createGroup [east,true];
    _randomPos = [[[_objLoc,_spawnRange]],["water"]] call BIS_fnc_randomPos;

    {
    	_createdGroup createUnit [_x,_randomPos,[],5,"none"];
	} forEach rf_fireteam;

    _infantryPool = _infantryPool - 4;
    _Groups pushback _createdGroup;
};

while {_infantryPool >= 2} do {
	_createdGroup = createGroup [east,true];
    _randomPos = [[[_objLoc,_spawnRange]],["water"]] call BIS_fnc_randomPos;

    {
    	_createdGroup createUnit [_x,_randomPos,[],5,"none"];
	} forEach rf_sentry_team;

    _infantryPool = _infantryPool - 2;
    _Groups pushback _createdGroup;
};

//Mechanized
while {_mechanizedPool > 0} do {
	_createdGroup = createGroup [east,true];
	_randomPos = [[[_objLoc,_spawnRange]],["water"]] call BIS_fnc_randomPos;

	_createdVehicle = createVehicle [rf_apc,_randomPos,[],20,"none"];
	_mechanizedPool = _mechanizedPool - 1;

	[_createdVehicle,rf_ground_crew,_randomPos] call phm_fnc_createCrew;
	_Groups pushback _createdGroup;
};

//Armor
while {_armorPool > 0} do {
	_createdGroup = createGroup [east,true];
	_randomPos = [[[_objLoc,_spawnRange]],["water"]] call BIS_fnc_randomPos;

	_createdVehicle = createVehicle [rf_tank_heavy,_randomPos,[],20,"none"];
	_armorPool = _armorPool - 1;

	[_createdVehicle,rf_ground_crew,_randomPos] call phm_fnc_createCrew;
	_Groups pushback _createdGroup;
};

//Artillery
while {_artilleryPool > 0} do {
	_createdGroup = createGroup [east,true];
	_randomPos = [[[_objLoc,_spawnRange]],["water"]] call BIS_fnc_randomPos;

	_createdVehicle = createVehicle [rf_sp_artillery,_randomPos,[],20,"none"];
	_artilleryPool = _artilleryPool - 1;

	[_createdVehicle,rf_ground_crew,_randomPos] call phm_fnc_createCrew;
	_Groups pushback _createdGroup;
};

//Rotary
while {_rotaryPool > 0} do {
	_createdGroup = createGroup [east,true];
	_randomPos = [[[_objLoc,_spawnRange]],["water"]] call BIS_fnc_randomPos;

	_createdVehicle = createVehicle [rf_rotary_attack_heavy,_randomPos,[],20,"FLY"];
	_rotaryPool = _rotaryPool - 1;

	[_createdVehicle,rf_rotary_crew,_randomPos] call phm_fnc_createCrew;

	_randomPos = [_randomPos select 0,_randomPos select 1, (_randomPos select 2) + 300];
	_createdVehicle setPos _randomPos;

	_waypoint = _createdGroup addWayPoint [_randomPos,0];
	_waypoint setWaypointType "LOITER";
	_waypoint setWaypointSpeed "FULL";
	_waypoint setWaypointBehaviour "AWARE";
	_waypoint setWaypointCombatMode "RED";
	_createdVehicle flyInHeight 250;

	_Groups pushback _createdGroup;
};

//Fixed Wing
while {_fixedWingPool > 0} do {
	_createdGroup = createGroup [east,true];
	_randomPos = [[[_objLoc,_spawnRange]],["water"]] call BIS_fnc_randomPos;

	_createdVehicle = createVehicle [rf_fw_cas,_randomPos,[],20,"FLY"];
	_fixedWingPool = _fixedWingPool - 1;

	[_createdVehicle,rf_fixed_crew,_randomPos] call phm_fnc_createCrew;

	_randomPos = [_randomPos select 0,_randomPos select 1, (_randomPos select 2) + 800];
	_createdVehicle setPos _randomPos;

	_waypoint = _createdGroup addWayPoint [_randomPos,0];
	_waypoint setWaypointType "LOITER";
	_waypoint setWaypointSpeed "FULL";
	_waypoint setWaypointBehaviour "AWARE";
	_waypoint setWaypointCombatMode "RED";
	_createdVehicle flyInHeight 250;

	_Groups pushback _createdGroup;
};

_returnArray = [_Groups,[_reinforcementInfantryPool]];
_returnArray
