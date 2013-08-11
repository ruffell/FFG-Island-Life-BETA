////////////////////////////////////
//			         //
//      Copyright © TCG         //
//www.tcgaming.enjin.com       //
////////////////////////////////
CBA_display_ingame_warnings = false;
publicVariable "CBA_display_ingame_warnings"; 
if (isServer) then 
{
mafiamembers = [];
mafs setVariable ["mafiamembers", mafiamembers, true];
};
enableSaving [false, false];
version        	= "32";
debug          	= false;
dedicatedServer = false;
copscount      	= 16;
civscount      	= 42;
playercount    	= 58;
debugarray     	= [];
execVM "briefing.sqf";
if(!debug)then{["basicintro"] execVM "introcam.sqf";};
call compile preprocessfile "triggers.sqf";

_h = [] execVM "playerarrays.sqf";																												
waitUntil{scriptDone  _h};
_h = [65, rolenumber] execVM "initfuncs.sqf";
waitUntil{scriptDone  _h};
_h = [playerarray, playerstringarray, !iscop] execVM "INVvars.sqf";
waituntil{scriptDone  _h};
_h = [] execVM "bankexec.sqf";
waitUntil{scriptDone  _h};
_h = [] execVM "initWPmissions.sqf";
waitUntil{scriptDone  _h};
_h = [] execVM "gfx.sqf";
waitUntil{scriptDone  _h};
_h = [] execVM "animList.sqf";
waitUntil{scriptDone  _h};
_h = []	execVM "miscfunctions.sqf";
waitUntil{scriptDone  _h};
_h = [] execVM "variables.sqf";
waitUntil{scriptDone  _h};
execVM "BTK\Cargo Drop\Start.sqf";
execVM "weather.sqf";
execVM "motd.sqf";
execVM "antibs.sqf";
//[SkipTimeDay, SkipTimeNight, 1] execVM "skiptime.sqf"; 
setPitchBank = compile preprocessfile "setPitchBank.sqf";
BIS_Effects_Burn=compile preprocessFile "\ca\Data\ParticleEffects\SCRIPTS\destruction\burn.sqf";
if (isServer) then 
{
_initServer = execVM "init\InitServer.sqf";
_h = execVM "statsave\server\savefunc.sqf";
waitUntil{scriptDone  _h};
_h = execVM "statsave\server\serverevents.sqf";
waitUntil{scriptDone  _h};
};
if(!dedicatedserver) then
{
[] execVM "mafiasyn\mafiafunc.sqf";
_initClient = execVM "init\InitClient.sqf";
sleep 5;
waitUntil {alive player};
execVM "statsave\saveinit.sqf";
};

disableSerialization;

while {true} do
{
	waitUntil {!(isNull (findDisplay 70001))};
	((findDisplay 70001) displayCtrl 153040) ctrlEnable false;
	_time = time;
	waitUntil {(isNull (findDisplay 70001)) || time >= _time + 5};
	if (!(isNull (findDisplay 70001))) then
	{
		((findDisplay 70001) displayCtrl 153040) ctrlEnable true;
		waitUntil {isNull (findDisplay 70001)};
	};
};

