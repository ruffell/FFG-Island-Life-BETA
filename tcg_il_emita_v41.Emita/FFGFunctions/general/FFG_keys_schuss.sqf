    _vcl = _this select 1;
    _sel = _this select 2;
   if (player distance _vcl < 20) then
 {
   if (not(locked _vcl)) then 
 {
	
	
   format ["%1 lock true;", _vcl] call broadcast;
   player groupChat localize "STRS_inv_items_vehiclelock_locked";
 } else {
	
	 
   format ["%1 lock false;", _vcl] call broadcast;
   player groupChat localize "STRS_inv_items_vehiclelock_unlocked";
 };

  } else {
    player groupChat localize "STRS_inv_items_vehiclelock_closer";
 };