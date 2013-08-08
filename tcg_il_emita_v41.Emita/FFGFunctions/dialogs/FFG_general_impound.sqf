_array = _this select 3;
_art   = _array select 0;
_geld  = 'geld' call INV_GetItemAmount;_zusatzString = "";
if ((count _array)>1) then 
{
	_zusatzString = _array select 1;
};
//================
if (!(createDialog "distribute")) exitWith {hint "Dialog Error!"};
private "_j"; /// BUG FIX
ctrlSetText [3, format["Retrieve impounded vehicle ($%1)", impoundpay]];

for [{_j=0}, {_j < (count INV_VehicleArray)}, {_j=_j+1}] do 

	{

	_vehicle = (INV_VehicleArray select _j);

	if (!isNull _vehicle and _vehicle distance impoundarea1 < 200) then 

		{																																										

		_index = lbAdd [1, format["%1 (%2)", _vehicle, typeof _vehicle] ];
		lbSetData [1, _index, format["%1", _vehicle] ];															
		
		};		

	};

buttonSetAction [2, "[lbData [1, (lbCurSel 1)],""buy""] execVM ""impound.sqf"";"];