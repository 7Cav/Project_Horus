/*
	Author: Bethea.A

	Description:
	Sets variables and settings for Project Horus mission.

	Parameter(s):
	None
	
	
	Returns:
	Nothing.
	
	Examples:
	[] execVM "ph_config.sqf";
*/

//Var Init
ph_playerCount = 0;

//Opfor Controls
ph_minInfantry = 20; 							// Minimum number of infantry for AOs.
ph_maxInfantry = 60;							// Maximum number of infantry to spawn at any given time.


//AO Generation Controls
ph_AO_width = 500; 								// Generated AO Width default
ph_AO_height = 500; 							// Generated AO Height default
ph_AO_safeDistance = 1500;						// Distance objectives must be from base location.

ph_config = true;
ph_debugEnabled = true;