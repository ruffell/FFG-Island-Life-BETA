
_art = _this select 0;

if (_art == "clientloop") then 

{

_w1 = 0;
_w2 = 0;
_w3 = 0;
_streetrepold = 0;
_LetzterKontostand = 0;
_prevINV_InventarArray = [];
while {true} do 

	{
	//if(vehicle player != player and !(vehicle player in INV_VehicleArray) and !(vehicle player in INV_ServerVclArray))then{deletevehicle (vehicle player)};
	
	if(alive player and isciv and captive player)then{format['%1 setcaptive false;', player] call broadcast};
	
	
	sleep 1;

	};

};