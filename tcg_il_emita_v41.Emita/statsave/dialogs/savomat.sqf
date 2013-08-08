if (!(createDialog "savemenusd")) exitWith {hint "Dialog Error!";};
  {
  if (not(isnull _x) && _x isKindOf "LandVehicle") then 
 {
    _index = lbAdd [153433, format ["%1", typeOf _x]];
    lbSetData [153433, _index, format ["%1", _x]];
    };

   } forEach INV_VehicleArray;