 _vcl = _this select 1;
 _sel = _this select 2;
 _spielernum = call compile INV_InventarGiveReceiver;
_spieler = INV_PLAYERSTRINGLIST select _spielernum;
 _playerobject = INV_PLAYERLIST select _spielernum;
   if (!(_spieler call ISSE_UnitExists))  exitWith {
player groupChat localize "STRS_inv_not_ingame";
};

 if (_playerobject == player)   exitWith {
player groupChat localize "STRS_inv_inventar_uebergabe_self";
};

   if (player distance _playerobject > 20)  exitWith {
player groupChat localize "STRS_inv_inventar_uebergabe_distance";
};

    format ["if (INV_ROLESTRING == ""%1"") then 
 {
INV_VehicleArray = INV_VehicleArray + [%2];
 player groupChat localize ""STRS_inv_items_uebergabe_schluessel_success""};

", _spieler, _vcl] call broadcast;
 //INV_VehicleArray = INV_VehicleArray - [_vcl];
  player groupChat localize "STRS_inv_items_uebergabe_schluessel_success_self";
