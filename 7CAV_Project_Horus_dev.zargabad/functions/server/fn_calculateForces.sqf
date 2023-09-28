/*
	Author: Bethea.A

	Description:
	Calculates forces to use at an objective based on player count and slotting(WIP).

	Parameter(s):
	0: _minForce <NUMBER>			- Minimum number of infantry to spawn.
	1: _playerCount <NUMBER>		- Number of players on the server when the script was called.
	2: _infantry <BOOL>				- Spawn infantry?
	3: _mechanized <NUMBER>			- Spawn mechanized?
	4: _armor <NUMBER>				- Spawn armor?
	5: _artillery <NUMBER>			- Spawn artillery?
	6: _rotary <NUMBER>				- Spawn rotary?
	7: _fixedWing <NUMBER>			- Spawn fixed wing?
	
	Returns:
	Array of compositions to spawn.
	
	Examples:
	[100,20,true,0,0,0,0,0] call phm_fnc_calculateForces;
*/

// Infantry, Medics, Mechanized,Armor, CAP, CAS

params ["_minForce","_playerCount","_infantry","_mechanized","_armor","_artillery","_rotary","_fixedWing"];

_infantryCount = 0;
_mechanizedCount = 0;
_armorCount = 0;
_artilleryCount = 0;
_rotaryCount = 0;
_fixedWingCount=0;

if (_infantry) then {
	_infantryCount = _minForce max (_playerCount * 3);
};

// Need to come back once slotting recognition is in. Amount of units to be influenced by players in role.
if (_mechanized > 0) then {
	_mechanizedCount = [1,_mechanized] call BIS_fnc_randomInt;
};

if (_armor > 0) then {
	_armorCount = [1,_armor] call BIS_fnc_randomInt;
};

if (_artillery > 0) then {
	_artilleryCount = [1,_artillery] call BIS_fnc_randomInt;
};

if (_rotary > 0) then {
	_rotaryCount = [1,_rotary] call BIS_fnc_randomInt;
};

if (_fixedWing > 0) then {
	_fixedWingCount = [1,_fixedWing] call BIS_fnc_randomInt;
};

_unitCountArray = [_infantryCount,_mechanizedCount,_armorCount,_artilleryCount,_rotaryCount,_fixedWingCount];

_unitCountArray