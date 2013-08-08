_w1 = 0;
_w2 = 0;
_w3 = 0;
_streetrepold = 0;
_LetzterKontostand = 0;
_prevINV_InventarArray = [];
_money_limit = 10000000;

cop_weapon_check = {
		_updateweps = false;
		_updatemags = false;

		_weapons = weapons player;
		
		for [{_i=0}, {_i < (count _weapons)}, {_i=_i+1}] do 

			{

			if(!((_weapons select _i) in playerweapons))then

				{

				playerweapons = playerweapons + [(_weapons select _i)];
				_updateweps = true;
				

				};

			};

		_weapons = weapons player;

		for [{_i=0}, {_i < (count playerweapons)}, {_i=_i+1}] do 

			{

			if(!((playerweapons select _i) in _weapons))then

				{

				playerweapons = playerweapons - [(playerweapons select _i)];
				_updateweps = true;

				};

			};

		_mags	 = magazines player;

		for [{_i=0}, {_i < (count _mags)}, {_i=_i+1}] do 

			{

			if((_i + 1) > count playermagazines)then

				{

				playermagazines = playermagazines + [(_mags select _i)];
				_updatemags = true;

				};

			};

		_mags	 = magazines player;

		for [{_i=0}, {_i < (count playermagazines)}, {_i=_i+1}] do 

			{

			if((_i + 1) > count _mags)then

				{

				playermagazines set[_i, ""];
				_updatemags = true;

				};

			};

		_mags	 = magazines player;

		for [{_i=0}, {_i < (count _mags)}, {_i=_i+1}] do 

			{

			if((playermagazines select _i) != (_mags select _i))then

				{

				playermagazines set[_i, ""];
				_updatemags = true;

				};

			};

		playermagazines = playermagazines - [""];

		if(_updateweps)then{["playerweapons", playerweapons] spawn ClientSaveVar};
		if(_updatemags)then{["playermagazines", playermagazines] spawn ClientSaveVar};
		};

dead_time_loop = {
if ((alive player) and (DeadWaitSec > (respawnzeit+deadtimebonus))) then 

		{

		DeadWaitSec = DeadWaitSec - deadtimebonus;

		};
		};

money_limit = {
	_geld = 'geld' call INV_GetItemAmount;
	if (_geld < 0) then {['geld', 0] call INV_SetItemAmount; _geld = 0;};
	if (Kontostand > bank_limit) then {Kontostand = bank_limit;player groupChat localize "STRS_maxbank";};
	if (_geld > _money_limit) then {['geld', money_limit] call INV_SetItemAmount; player groupChat localize "STRS_maxmoney";};
	};

player_array_loop = {
	coparray = [cop1,cop2,cop3,cop4,cop5,cop6,cop7,cop8,cop9,cop10,cop11,cop12,cop13,cop14,cop15,cop16];
	civarray = [civ1,civ2,civ3,civ4,civ5,civ6,civ7,civ8,civ9,civ10,civ11,civ12,civ13,civ14,civ15,civ16,civ17,civ18,civ19,civ20,civ21,civ22,civ23,civ24,civ25,civ26,civ27,civ28,civ29,civ30,civ31,civ32,civ33,civ34,civ35,civ36,civ37,civ38,civ39,civ40,civ41,civ42];
	playerarray = [civ1,civ2,civ3,civ4,civ5,civ6,civ7,civ8,civ9,civ10,civ11,civ12,civ13,civ14,civ15,civ16,civ17,civ18,civ19,civ20,civ21,civ22,civ23,civ24,civ25,civ26,civ27,civ28,civ29,civ30,civ31,civ32,civ33,civ34,civ35,civ36,civ37,civ38,civ39,civ40,civ41,civ42,cop1,cop2,cop3,cop4,cop5,cop6,cop7,cop8,cop9,cop10,cop11,cop12,cop13,cop14,cop15,cop16];
	};

debug_loop = {
if (!debug and (player distance deadcamlogic < 500) and alive player and iscop) then {titleText [localize "STRS_southChernarus_area", "plain"]};

if (!debug and (player distance deadcamlogic < 300) and alive player and iscop) then {call TeleToMainbaseFunc;};
};

hud_loop = {
	disableSerialization;
     1000 cutRsc ["WastelandHud","PLAIN"];
    _ui = uiNameSpace getVariable "WastelandHud";
    _vitals = _ui displayCtrl 3600;
    
    //Calculate Health 0 - 100
    _decimalPlaces = 2;
    _health = damage player;
    _health = round (_health * (10 ^ _decimalPlaces)) / (10 ^ _decimalPlaces);
    _health = 100 - (_health * 100);
    
    _playerMoney = ('geld' call INV_GetItemAmount);
    
    if (_playerMoney >= 10000) then {
		_temp = _playerMoney/1000;
		_temp2 = floor _temp;
    	_playerMoney = format["%1k",_temp2];
    };
    
    _vitals ctrlSetStructuredText parseText format ["FPS: %4<br/>%1 <img size='0.8' image='FFGFunctions\hud\health.paa'/><br/>%2 <img size='0.8' image='FFGFunctions\hud\food.paa'/><br/>%3 <img size='0.8' image='\CA\misc\data\icons\picture_money_CA.paa'/>", _health, (round(INV_hunger)), _playerMoney, (round(diag_fps))];
    _vitals ctrlCommit 0;
};

client_loop = {
	private ["_client_loop_i"];
	_client_loop_i = 0; 

	while {_client_loop_i < 5000} do {
		if(iscop and alive player and weaponsloaded)then {call cop_weapon_check;};		
		call dead_time_loop;
		call money_limit;
		call player_array_loop;
		call debug_loop;
		call hud_loop;
		sleep 1;
		_client_loop_i = _client_loop_i + 1;
	};
	[] spawn client_loop;
};

[] spawn client_loop;