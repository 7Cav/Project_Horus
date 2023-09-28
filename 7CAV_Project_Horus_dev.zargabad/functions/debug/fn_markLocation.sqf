/*
	Author: Bethea.A

	Description:
	Places a black dot at a given position.

	Parameter(s):
	0: _position <ARRAY> 			- Position on which to place mark.
	
	
	Returns:
	Nothing.
	
	Examples:
	[_markTheSpot] call phm_fnc_markLocation;
*/

params ["_position"];

_currentMarker = format ["DB_Marker_%1",systemTime];

if (ph_debugEnabled) then {
	_debugMessage = format ["The actual objective position is marked as: %1",_position];
	[_debugMessage] call phm_fnc_systemMessage;
};

_marker = createMarkerLocal [_currentMarker,_position]; 
_currentMarker setMarkerShapeLocal "Icon"; 
_currentMarker setMarkerColorLocal "ColorBlack"; 
_currentMarker setMarkerAlphaLocal 1; 
_currentMarker setMarkerType "mil_dot";