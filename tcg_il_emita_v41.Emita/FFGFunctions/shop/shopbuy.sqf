private ["_menge"];
if (shopactivescript == 1) exitwith {player groupchat "script already active"};
_geld  = 'geld' call INV_GetItemAmount;
if ((_this select 1) == -1) exitWith {};
_art        = _this select 0;                            
_itemauswahl= _this select 1;                           
_menge      = _this select 2;                 
 
 if (!(_menge call ISSE_str_isInteger)) exitWith {player groupChat localize "STRS_inv_no_valid_number";};
 _menge      = _menge call ISSE_str_StrToInt;  
 if (_menge <= 0) exitWith {};
 _extrainfo  = _this select 3;                             
 _extraArr   = _this select 4;                            
 _item       = _extraArr select 0;                         
 _einzelCost = _extraArr select 1;                         
 _CostMitTax = _extraArr select 2;
 _itemnumber = _extraArr select 3;
 _cost       = _menge*_CostMitTax;                         
 _infos      = _item  call INV_getitemArray;               
 _itemart    = _infos call INV_getitemType;                
 _classname  = _infos call INV_getitemClassName;
 _shopnumber = INV_ActiveShopNumber;
 _fahne      = ((INV_ItemShops select _shopnumber) select 0);  
 _crate      = ((INV_ItemShops select _shopnumber) select 2);  
 _logic      = ((INV_ItemShops select _shopnumber) select 3);
 _shoparray  = ((INV_ItemShops select _shopnumber) select 4);
 _license    = ((INV_ItemShops select _shopnumber) select 6);
 _itemarray  = (_shoparray select _itemnumber);
 _exitvar    = 0;
 _license1   = _infos call INV_getitemLicense;
 _license2   = _infos call INV_getitemLicense2;


 
//===========================================================BUY===============================================================
if (shopactivescript == 1) exitwith {player groupchat "script already active"};
shopactivescript = 1;
instock=true;
_stock = [_item, INV_ActiveShopNumber] call INV_getstock;
	
if (_stock != -1) then

	{

	if (_stock < _menge)then{_menge = _stock; _cost = _menge*_CostMitTax;};


	};

if(_menge == 0)then{instock=false};

if(_geld == 0)exitwith{player groupchat localize "STRS_inv_buyitems_keingeld"; _exitvar = 1};

_einzelSteuer = ( _CostMitTax - _einzelCost );             								
_gesamtSteuer = _einzelSteuer*_menge;                      																				

if (_itemart == "Item" and instock) then 

	{

	if (!(_license1 call INV_HasLicense) and isciv and _license) exitWith {player groupChat format[localize "STRS_inv_buyitems_nolicense", (_license1 call INV_GetLicenseName)]; _exitvar = 1};
	if (!(_license2 call INV_HasLicense) and iscop and _license) exitWith {player groupChat format[localize "STRS_inv_buyitems_nolicensecop", (_license2 call INV_GetLicenseName)]; _exitvar = 1};
	_amtragen          = (_item call INV_GetItemAmount);           				
	_gesamtmenge       = _amtragen + _menge;                       												
	_gesamtgewicht     = (_infos call INV_getitemTypeKg)*_menge;   												
	_inventargewicht   = call INV_GetOwnWeight;                    																														
	if (((_infos call INV_getitemIsIllegal)) and (! INV_CANDOILLEGAL)) exitWith {player groupChat localize "STRS_inv_buyitems_notallowed"; _exitvar = 1};																				
	
	if ((_gesamtgewicht + _inventargewicht) > INV_Tragfaehigkeit) then 

		{

		_menge = (floor((INV_Tragfaehigkeit - _inventargewicht) / (_infos call INV_getitemTypeKg)));
		_cost  = _menge*_CostMitTax;
		if (_menge <= 0) exitWith {player groupChat localize "STRS_inv_buyitems_maxgewicht"; _exitvar = 1;};

		};
																												
	if (_geld < _cost) then 

		{
												
		_menge = (floor(_geld/_CostMitTax));									
		_cost  = _menge*_CostMitTax;																														
		if (_menge <= 0) exitWith {player groupChat localize "STRS_inv_buyitems_keingeld"; _exitvar = 1;};

		};
																				
	if (_exitvar == 1) exitWith {};
	
	if (_infos call INV_getitemIsIllegal and _cost > 0 and _infos call INV_getitemKindOf == "drug") then

		{

		_control = _fahne getvariable "control";
		
		for "_c" from 0 to (count gangsarray - 1) do 

			{

			_gangarray = gangsarray select _c;
			_gang	   = _gangarray select 0;
			_members   = _gangarray select 1;
					
			if(_control == _gang and count _members > 0)then

				{

				_income = _cost/(count _members);
				format['if(name player in %1)then{player groupchat "You received $%2 from a drug sale"; kontostand = kontostand + %2};', _members, _income] call broadcast;
				
				};

			};

		};

	if(primaryweapon player == "" and secondaryweapon player == "")then{player playmove "AmovPercMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon"}else{player playmove "AinvPknlMstpSlayWrflDnon"};																																														
	[_item, _menge, "INV_InventarArray"] call INV_CreateItem;																												
	['geld', -(_cost)] call INV_AddInvItem;
	INV_SteuernGezahlt = (INV_SteuernGezahlt + (_menge*_einzelSteuer));
	if(_cost == 0)exitwith{player groupchat format['you took %1 %2', (_menge call ISSE_str_IntToStr), (_infos call INV_getitemName)]};																												
	player groupChat format [localize "STRS_inv_buyitems_gekauft", (_menge call ISSE_str_IntToStr), (_infos call INV_getitemName), (_cost call ISSE_str_IntToStr)];		

	};

if (((_itemart == "waffe") or (_itemart == "magazin")) and instock) then 

	{
	
	if (!(_license1 call INV_HasLicense) and isciv and _license) exitWith {player groupChat format[localize "STRS_inv_buyitems_nolicense", (_license1 call INV_GetLicenseName)]; _exitvar = 1};
	if (!(_license2 call INV_HasLicense) and iscop and _license) exitWith {player groupChat format[localize "STRS_inv_buyitems_nolicensecop", (_license2 call INV_GetLicenseName)]; _exitvar = 1};								
	if (_geld < _cost) exitWith {player groupChat localize "STRS_inv_buyitems_keingeld"; _exitvar = 1};																						
	['geld', -(_cost)] call INV_AddInvItem;
	INV_SteuernGezahlt = (INV_SteuernGezahlt + _gesamtSteuer);
	
	if (_itemart == "Waffe") then 

		{
		
		[(_infos call INV_getitemClassName), _menge, _crate] spawn INV_CreateWeapon;
		player groupChat format[localize "STRS_inv_buyitems_gekauft", (_menge call ISSE_str_IntToStr), (_infos call INV_getitemName), (_cost call ISSE_str_IntToStr)];																														
		} 
		else 
		{	
			
		[(_infos call INV_getitemClassName), _menge, _crate] spawn INV_CreateMag;
		player groupChat format [localize "STRS_inv_buyitems_gekauft", (_menge call ISSE_str_IntToStr), (_infos call INV_getitemName), (_cost call ISSE_str_IntToStr)];	
		};			
		
	};
													
if (_itemart == "fahrzeug" and instock) then 

	{

	_menge = 1;
	if (!(_license1 call INV_HasLicense) and isciv and _license) exitWith {player groupChat format[localize "STRS_inv_buyitems_nolicense", (_license1 call INV_GetLicenseName)]; _exitvar = 1};
	if (!(_license2 call INV_HasLicense) and iscop and _license) exitWith {player groupChat format[localize "STRS_inv_buyitems_nolicensecop", (_license2 call INV_GetLicenseName)]; _exitvar = 1};
	if(_shopnumber == 89 && !("mafial" call INV_HasLicense)) exitwith {Player groupchat "You need mafia license for vehicles in this shop."};
	if (INV_UsingCarshop == 1)  exitWith {player groupChat localize "STRS_inv_buyvehicles_store_in_use"; _exitvar = 1};																								
	if (_geld < _CostMitTax) exitWith {player groupChat localize "STRS_inv_buyitems_keingeld"; _exitvar = 1};																		
	if(count (nearestobjects [getpos _logic,["Ship","car","motorcycle","truck"], 3]) > 0)exitwith{player groupchat "there is a vehicle blocking the spawn!"; _exitvar = 1};
	['geld', -(_CostMitTax)] call INV_AddInvItem;						
	INV_SteuernGezahlt = (INV_SteuernGezahlt + _einzelSteuer);								
	player groupChat format [localize "STRS_inv_buyvehicles_buy_car", (_infos call INV_getitemName), (_CostMitTax call ISSE_str_IntToStr)];																												
	[_item, _logic] spawn 

		{
		INV_UsingCarshop = 1;
		sleep 5;
		INV_UsingCarshop = 0;														
		if (not(alive player)) exitWith {};																																																										
		[_this select 0, _this select 1] spawn INV_CreateVehicle;
		};
	
	}; 
if (_shopnumber == 89) then {
		mafiabank = mafiabank + round(_cost / 2);
		publicvariable "mafiabank";
};
if(!instock)exitwith{player groupchat "out of stock"};

if (_stock != -1 and _exitvar == 0) then

	{

	format['["%1", (%2 - %3), %4] call INV_itemstocksupdate;', _item, _stock, _menge, INV_ActiveShopNumber] call broadcast;

	};	 
	
	sleep 3;
shopactivescript = 0;