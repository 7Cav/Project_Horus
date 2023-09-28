/*
	Author: Bethea.A

	Description:
	Finds a suitable AO location for a mission. Tries to ignore areas with large amounts of water.

	Parameter(s):
	0: _AO_width <NUMBER>			- Width of AO in meters.
	1: _AO_height <NUMBER>			- Height of AO in meters.
	2: _AO_safeDistance <NUMBER>	- Minimum distance from base location to generate.
	
	
	Returns:
	Position for AO center.
	
	Examples:
	[500,500,1500] spawn phm_fnc_findAO;
*/

params ["_AO_width","_AO_height","_AO_safeDistance"];

_temp_ao_location = [];
_ao_safetyMargin = 0.85;
_xSafety = ceil (_AO_width * _ao_safetyMargin);
_ySafety = ceil (_AO_height * _ao_safetyMargin);
_waterCount = 0;
_result = false;
_baseCheck = false;
_waterCheck = false;

while {!_result} do {

	_temp_ao_location = [nil,["water"]] call BIS_fnc_randomPos;

	// Check distance to base
	_distanceCheck = _temp_ao_location distance getPos blufor_base_location;

	if (_distanceCheck <= _AO_safeDistance) then { _baseCheck = false; } else { _baseCheck = true; };

	// Check cardinal points for water

	if (_baseCheck) then {

		_waterCount = 0;

		_nCheck = surfaceIsWater [  (_temp_ao_location select 0),             (_temp_ao_location select 1)+ _ySafety]; 
		_neCheck = surfaceIsWater [ (_temp_ao_location select 0) + _xSafety,    (_temp_ao_location select 1)+ _ySafety]; 
		_eCheck = surfaceIsWater [  (_temp_ao_location select 0) + _xSafety,    (_temp_ao_location select 1)]; 
		_seCheck = surfaceIsWater [ (_temp_ao_location select 0) + _xSafety,    (_temp_ao_location select 1)- _ySafety]; 
		_sCheck = surfaceIsWater [  (_temp_ao_location select 0),             (_temp_ao_location select 1)- _ySafety]; 
		_swCheck = surfaceIsWater [ (_temp_ao_location select 0) - _xSafety,    (_temp_ao_location select 1)- _ySafety]; 
		_wCheck = surfaceIsWater [  (_temp_ao_location select 0) - _xSafety,    (_temp_ao_location select 1)]; 
		_nwCheck = surfaceIsWater [ (_temp_ao_location select 0) - _xSafety,    (_temp_ao_location select 1)+ _ySafety];

		_cardinalArray = [_nCheck,_neCheck,_eCheck,_seCheck,_sCheck,_swCheck,_wCheck,_nwCheck];

		{
			if (_x) then {_waterCount = _waterCount + 1} else {_waterCount};

		} forEach _cardinalArray;

		if (_waterCount > 2) then {waterCheck = false} else {_waterCheck = true};

	} 

	else {
		_waterCheck = false;
	};

	if(_baseCheck && _waterCheck) then {_result = true} else {_result = false};
};

_temp_ao_location

