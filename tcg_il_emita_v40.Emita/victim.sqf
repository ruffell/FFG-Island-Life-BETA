if(isdead == 1)exitwith{};

isdead = 1;

_killer 	= _this select 0;
_nearVehicles  	= _this select 1;
_killerLicense  = 0;
suicided    	= false;
_murdered	= true;
_killerstring	= format["%1", _killer];

if (!(_killer call ISSE_UnitExists)) then 

{
																
(format ["[""Died"", ""%1""] spawn Isse_AddCrimeLogEntry;kopfgeld_%1 = 0;", rolestring]) call broadcast;

} 
else 
{

_killedByVehicle = false;

if (player == _killer) then 

	{

	_murdered = false;

	if(typename _nearVehicles == "STRING" and INV_hunger < 100)exitwith{suicided = true;};

		{

		if (  (speed _x > 10) and (!(isNull(driver _x)))  ) then 

			{

			_killer		 = driver _x;
			_killedByVehicle = true;
			_vehicle         = typeof _x;
			_infos           = _vehicle call INV_getitemArray;
			_killerlicense    = (_infos select 4) select 1;
			_killerstring 	 = format["%1", _killer];
			
			};

		} forEach _nearVehicles;

	};

if(side _killer == EAST and !isPlayer _killer) exitwith

	{

	format['["Died", "%1"] spawn Isse_AddCrimeLogEntry;kopfgeld_%1 = 0;server globalChat "%2 was killed by the military!"', player, name player] call broadcast;

	}; 

(format ["
[""Died"", ""%1""] spawn Isse_AddCrimeLogEntry;
if(%7 and !%5)then{server globalChat ""%3 was killed by %4""};
if (%5) then {server globalChat ""%4 killed %3 with a vehicle. Intentionally running over another player is against server rules"";};
if(INV_hunger == 100)exitwith{server globalChat ""%3 starved to death!""};
if(player == %8) then {[%1, %5, %6] execVM ""killer.sqf""};
", player,  _killer, name player, name _killer, _killedByVehicle, _killerLicense, _murdered, _killerstring]) call broadcast;

};

//kopfgeld_%1 = 0;
 
