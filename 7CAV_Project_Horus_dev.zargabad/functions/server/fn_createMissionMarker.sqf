/*
	Author: Bethea.A

	Description:
	Used to create mission markers (Main and Side)

	Parameter(s):
	0: _markerLoc <ARRAY>			- Center of marker creation area.
	1: _AO_width <NUMBER>			- Width of AO in meters.
	2: _AO_height <NUMBER>			- Height of AO in meters.

	
	
	Returns:
	Created marker.
	
	Examples:
	[500,500,1500] spawn phm_fnc_createMissionMarker;
*/

params ["_markerLoc","_AO_width","_AO_height"];

_currentMarker = format ["AO_Marker_%1",systemTime];

_marker = createMarkerLocal [_currentMarker,_markerLoc];
_currentMarker setMarkerShapeLocal "RECTANGLE";
_currentMarker setMarkerSizeLocal [_AO_width,_AO_height];
_currentMarker setMarkerColorLocal "colorOPFOR";
_currentMarker setMarkerAlphaLocal 0.20;
_currentMarker setMarkerBrush "SolidBorder";

ph_markerList pushback _currentMarker;

_currentMarker