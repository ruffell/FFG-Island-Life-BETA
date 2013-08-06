loadedfunc = 0;
serverRunningQuery = false;
//This is to create a new profile
Save_new = 
{
_puid  		= getplayeruid (_this select 0);
_pname 		= name (_this select 0);
_side 		= side (_this select 0);
_query = format ["INSERT into users (uid, name, side, bank, inventory, license, streetrep, vehicle) VALUES('%1', '%2', '%4', '%3', '%3', '%3', '%3', '[]')", _puid, _pname, 0, _side];
while{!isNil("serverRunningQuery") && serverRunningQuery} do { //busy wait
		};
		serverRunningQuery = true;
		_return = nil;
		while {isNil("_return")} do 
		{
			_return = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommandAsync ['life', '%1']", _query];
			if (_return == "") then 
			{
				_return = nil;
			};
			diag_log format ["Called new save once (Player:%1)", _pname];
			sleep 0.5;  //sleep for a half-second so we don't thrash the server with callExtension calls
		};
		serverRunningQuery = false;
		//we don't care about a return result
};

//This is to update stats and vehicle.
Save_update = 
{
_puid  		= getplayeruid (_this select 0);
_pname 		= name (_this select 0);
_side 		= side (_this select 0);
_konto 		= _this select 1;
_inventory 	= _this select 2;
_license	= _this select 3;
_rep 		= _this select 4;
_veh		= _this select 5;
_query = "UPDATE users SET ";
_query_strings = format ["bank = '%1', inventory = '%2', license = '%3', streetrep = '%4', vehicle = '%5'", _konto, _inventory, _license, _rep, _veh];
_query = _query + _query_strings;
_check = format [" WHERE uid = '%1' AND name = '%2' AND side = '%3'", _puid, _pname, _side];
_query = _query + _check;
while{!isNil("serverRunningQuery") && serverRunningQuery} do 
{ //busy wait
};
serverRunningQuery = true;
_return = nil;
		while {isNil("_return")} do 
		{
_return = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommandAsync ['life', '%1']", _query];
			if (_return == "") then 
			{
				_return = nil;
			};
			diag_log format ["Called saving once (Player:%1)", _pname];
			sleep 0.5;  //sleep for a half-second so we don't thrash the server with callExtension calls
		};
		serverRunningQuery = false;
		//we don't care about a return result
};

//Saving all stats but vehicle for general saving when shopping etc
presistent_saving = 
{
_puid  		= getplayeruid (_this select 0);
_pname 		= name (_this select 0);
_side 		= side (_this select 0);
_konto 		= _this select 1;
_inventory 	= _this select 2;
_license	= _this select 3;
_rep 		= _this select 4;
_query = "UPDATE users SET ";
_query_strings = format ["bank = '%1', inventory = '%2', license = '%3', streetrep = '%4'", _konto, _inventory, _license, _rep];
_query = _query + _query_strings;
_check = format [" WHERE uid = '%1' AND name = '%2' AND side = '%3'", _puid, _pname, _side];
_query = _query + _check;
while{!isNil("serverRunningQuery") && serverRunningQuery} do 
{ //busy wait
};
serverRunningQuery = true;
_return = nil;
		while {isNil("_return")} do 
		{
_return = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommandAsync ['life', '%1']", _query];
			if (_return == "") then 
			{
				_return = nil;
			};
			diag_log format ["Called saving (No car) (Player:%1)", _pname];
			sleep 0.5;  //sleep for a half-second so we don't thrash the server with callExtension calls
		};
		serverRunningQuery = false;
		//we don't care about a return result
};

//Load the clients profile
load_profile = {
_puid  = getplayeruid (_this select 0);
_pname = name (_this select 0);
_owner = owner (_this select 0);
_side  = side (_this select 0);
_selectTest = nil;
_query = format ["SELECT uid, name, bank, inventory, license, streetrep, vehicle FROM users WHERE uid = '%1' AND name = '%2' AND side = '%3'", _puid, _pname, _side];
while{!isNil("serverRunningQuery") && serverRunningQuery} do { //busy wait
		};
		serverRunningQuery = true;
		_get = nil;
		while {isNil("_get")} do {
			_get = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommandAsync ['life', '%1']", _query];
		if (_get == "") then {
				_get = nil;
			};
			diag_log format ["Called Loading (Player:%1) gave: %2", _pname, _get];
			sleep 0.5;  //sleep for a half-second so we don't thrash the server with callExtension calls
		};
		serverRunningQuery = false;

_get = call compile _get;
_get = _get select 0;
_get = _get select 0;
_returnA = [_get] call split_array;
_get set [3,_returnA];
ReturnedDatabaseLoadOuts = _get;
if (isNil("ReturnedDatabaseLoadOuts")) then {
ReturnedDatabaseLoadOuts = [];
};
_owner publicVariableClient "ReturnedDatabaseLoadOuts";
};

//Create an array out of ' delimiters
split_array = {
_get = _this select 0;
_ammo = [];
if ([(_get select 3), "`"] call CBA_fnc_find > 0) then {
	_ammo = [(_get select 3), "`"] call CBA_fnc_split;
} else {
	_ammo set [0, (_get select 3)];
};
_ammo
};
loadedfunc = 1;
