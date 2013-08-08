//================Important stuff=============
//This calls the server to send back our milkshake of stats!
_load =
"
	loadSprofile = _this;
	publicVariableServer 'loadSprofile';
";

l_profile = compile _load;
//This creates a new save.
_new_save =
"
	newaccount = _this;
	publicVariableServer 'newaccount';
";

s_newsave = compile _new_save;
//This one is to save everything including vehicles.
_save =
"
	supdate = _this;
	publicVariableServer 'supdate';
";
s_update = compile _save;
//This one is to everything except vehicles.
_stats_loop =
"
	sloop = _this;
	publicVariableServer 'sloop';
";

s_save_stats = compile _stats_loop;
//===============All of the things above are to call the event handlers, these should never need to be changed.

colour_hint = 
{
_text = _this select 0; //STRING
_colour = _this select 1; //colour
_Stxt = parseText format
["
<t color='%2'>%1</t><br/>
", _text, _colour];
hintSilent _Stxt;
};

//Makes the inventory string that's sendable via the arma mysql extention
inv_to_string = 
{
_weparray = _this select 0;
_strWep = "";

for "_i" from 0 to (count _weparray) -1 do
{
	if (_i == ((count _weparray) -1)) then
	{
		_strWep1 = format ["%1`%2", (_weparray select _i) select 0, (_weparray select _i) select 1];
		_strWep = _strWep + _strWep1;
	}else 
	{
		_strWep1 = format ["%1`%2`", (_weparray select _i) select 0,(_weparray select _i) select 1];
		_strWep = _strWep + _strWep1;
	};
};
_strWep
};
//Combines inventory back from [´xxx´0´xx] to [["xxx",0],["xoxo",30]]
combine_inv = 
{
_weparray = _this select 0;
_weparray = _weparray select 3;
_strWep = [];
_selection = 0;
_selectionamount = 0;
_to = (count _weparray) / 2;
for "_i" from 0 to _to - 1 do
{
	_strWep = _strWep + [[(_weparray select _selection)]];
	_insidewep = _strWep select _selectionamount;
	call compile format ["
	_insidewep set [1, %1];
	",_weparray select _selection + 1];
	_selectionamount = _selectionamount + 1;
	_selection = _selection + 2;
};
_strWep
};

//Load everything into the character!
load_variables = 
{
_vars = _this select 0;
_bank = _vars select 2;
_inventory = _vars select 3;
_license = _vars select 4;
_streetrep = _vars select 5;
_vehs = call compile (_vars select 6);
_vehclass = _vehs select 0;
_vehname = _vehs select 1;
if (isnil _vehname) then {
[_vehclass, impoundarea1, _vehname] spawn INV_reCreateVehicle;
}
else
{
player sidechat "Your vehicle did not respawn because it already exists, go find it!";
};
call compile format ["
kontostand = %1; 
INV_InventarArray = %2;
INV_LizenzOwner = %3; 
streetrep = %4;"
, _bank, _inventory, _license, _streetrep];
};

//Incase of the player switching sides, let's make sure he dosn't get old shit.
setdefaults = 
{
kontostand = 25000;
INV_LizenzOwner = []; 
streetrep = 0;
};

//This next bit is just for the vehicle saving UI,  to mix it all up into one big happy milkshake of stats!
final_update = 
{
_vehicle = _this select 0;
_vehiclen = typeOf call compile (_vehicle);
_veharray = [];
_veharray = _veharray + [_vehiclen, _vehicle];
_inventory = [INV_InventarArray] call inv_to_string;
[player, kontostand, _inventory, INV_LizenzOwner, streetrep, _veharray] call s_update;
["Your stats saved succesfully!", "#00FF33"] call colour_hint;
};

//RECREATING VEHICLE
INV_reCreateVehicle = 

{

private ["_classname", "_position","_dir"];
_classname = _this select 0;
_logic	   = _this select 1;
_ID 	   = _this select 2;
_type = typeof vehicle player;
_type1 = ["MH6J_EP1"];
_type2 = ["Mi17_Civilian","bd5j_civil_3","bd5j_civil_2","bd5j","GazelleUN","GazelleD","Gazelle","Gazelle1","Gazelle3","adf_as350","ibr_as350_specops","ibr_as350_jungle","OH58g","UH1H_TK_GUE_EP1","MH60S","HH65C","ibr_as350_civ"];


	if ((_classname in _type1) or (_classname in _type2))  then 
	{

	
		if (_classname in _type1) then 
		{
		
		call compile format ['

		newvehicle = _classname createVehicle %4; 
		newvehicle setpos %4; 
		newvehicle setdir %5; 
		newvehicle setVehicleInit "
		nul = [this] execVM ""heliDoor\heliDoor_init.sqf"";
		this setVehicleVarName ""%2"";
		%2 = this; 
		clearWeaponCargo this; 
		clearMagazineCargo this;
		newvehicle lock true;
		";
		processInitCommands;
		INV_VehicleArray = INV_VehicleArray + [%2]; 
		"INV_ServerVclArray = INV_ServerVclArray + [%2];if (""%3"" != """") then {[""CreatedVehicle"", %2, typeOf %2, %4] execVM ""%3"";};" call broadcast;
		', player, _ID, INV_CALL_CREATVEHICLE, getpos _logic, getdir _logic];
		newvehicle setpos [(getPos impoundarea1 select 0)-(random 20)+(random 20), (getPos impoundarea1 select 1)-(random 20)+(random 20), getPos impoundarea1 select 2];
		};
		if (_classname in _type2) then 
		{
		
		call compile format ['

		newvehicle = _classname createVehicle %4; 
		newvehicle setpos %4; 
		newvehicle setdir %5; 
		newvehicle setVehicleInit "
		nul = [this, 1] execVM ""\norrn_dbo_fastrope\scripts\NORRN_fastRope_init.sqf"";
		this setVehicleVarName ""%2"";
		%2 = this; 
		clearWeaponCargo this; 
		clearMagazineCargo this;
		newvehicle lock true;
		";
		processInitCommands;
		INV_VehicleArray = INV_VehicleArray + [%2]; 
		"INV_ServerVclArray = INV_ServerVclArray + [%2];if (""%3"" != """") then {[""CreatedVehicle"", %2, typeOf %2, %4] execVM ""%3"";};" call broadcast;
		', player, _ID, INV_CALL_CREATVEHICLE, getpos _logic, getdir _logic];
		newvehicle setpos [(getPos impoundarea1 select 0)-(random 20)+(random 20), (getPos impoundarea1 select 1)-(random 20)+(random 20), getPos impoundarea1 select 2];
		};

	
	}

	else 
	{
	
	call compile format ['

	newvehicle = _classname createVehicle %4; 
	newvehicle setpos %4; 
	newvehicle setdir %5; 
	newvehicle setVehicleInit "
	this setVehicleVarName ""%2""; 
	%2 = this; 
	clearWeaponCargo this; 
	clearMagazineCargo this;
	newvehicle lock true;
	"; 
	processInitCommands;
	INV_VehicleArray = INV_VehicleArray + [%2]; 
	"INV_ServerVclArray = INV_ServerVclArray + [%2];if (""%3"" != """") then {[""CreatedVehicle"", %2, typeOf %2, %4] execVM ""%3"";};" call broadcast;
	', player, _ID, INV_CALL_CREATVEHICLE, getpos _logic, getdir _logic];
	newvehicle setpos [(getPos impoundarea1 select 0)-(random 20)+(random 20), (getPos impoundarea1 select 1)-(random 20)+(random 20), getPos impoundarea1 select 2];
	};

};