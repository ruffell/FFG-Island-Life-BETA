 _item = _this select 1;
 _anzahl = _this select 2;
  if (!(createDialog "schluessel")) exitWith {
hint "Dialog Error!";
};

   {
  if (not(isnull _x)) then 
 {
    _index = lbAdd [1, format ["%1 (%2)", typeOf _x, _x]];
    lbSetData [1, _index, format ["%1", _x]];
    };

   } forEach INV_VehicleArray;
  buttonSetAction [2, "if ((lbCurSel 1) > -1) then 
 {
 [""schluessel"",  (INV_VehicleArray select lbCurSel 1), lbCurSel 1] call keys_schuss;
};

 closedialog 0;
"];
    buttonSetAction [4, "if ((lbCurSel 1) > -1) then 
 {
 [""dropschluessel"", (INV_VehicleArray select lbCurSel 1), lbCurSel 1] call keys_drop;
};

 closedialog 0;
"];
 buttonSetAction [5, "if ((lbCurSel 1) > -1) then 
 {
 [""schluesseluebergabe"", (INV_VehicleArray select lbCurSel 1), lbCurSel 1] call keys_give;
};

 closedialog 0;
"];