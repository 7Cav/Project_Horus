/*
	Author: Bethea.A

	Description:
	Creates custom crews for vehicle.

	Parameter(s):
	0: _vehicle <OBJECT>			- Vehicle to spawn crew for.
	1: _crewClass <STRING>			- Classname of crew to spawn.
	2: _pos <ARRAY>					- Position to spawn units.
	
	Returns:
	Nothing.
	
	Examples:
	[_vehicle,_crewClass,_pos] call phm_fnc_createCrew;
*/

params ["_vehicle","_crewClass","_pos"];

_driver = _createdGroup createUnit 		[_crewClass,_pos,[],5,"none"];
_gunner = _createdGroup createUnit 		[_crewClass,_pos,[],5,"none"];
_commander = _createdGroup createUnit 	[_crewClass,_pos,[],5,"none"];

_driver assignAsDriver _vehicle;
_gunner assignAsGunner _vehicle;
_commander assignAsCommander _vehicle;

_driver moveInDriver _vehicle;
_gunner moveInGunner _vehicle;
_commander assignAsCommander _vehicle;

_units = [_driver,_gunner,_commander];

{
	if !(_x in _createdVehicle) then {deleteVehicle _x;};
} forEach _units;