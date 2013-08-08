_array = _this select 3;
_art   = _array select 0;
_geld  = 'geld' call INV_GetItemAmount;_zusatzString = "";
if ((count _array)>1) then 
{
	_zusatzString = _array select 1;
};
//====
if (player distance copdispatch <= 3) then
	{
		if (!(createDialog "CopMenuLite")) exitWith {hint "Dialog Error!";};	
	}
	else {player groupchat "You must be in a cop car or at dispatch";};