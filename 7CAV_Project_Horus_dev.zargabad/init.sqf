#include "ph_config.sqf";
#include "presets\preset_init.sqf";


if (isServer) then {

    [] execVM "scripts\server_init.sqf";
    
};