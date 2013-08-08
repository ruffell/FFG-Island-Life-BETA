_array = _this select 3;
_art   = _array select 0;
_geld  = 'geld' call INV_GetItemAmount;_zusatzString = "";
if ((count _array)>1) then 
{
	_zusatzString = _array select 1;
};
if (!(createDialog "liste_1_button")) exitWith {hint "Dialog Error!";};
	_trennlinie = "---------------------------------------------";
	lbAdd [1, format ["Date:     %3.%2.%1", (date select 0), (date select 1), (date select 2)]];
	lbAdd [1, format ["Runtime: %1 minutes", (round(time/60))]];		
	lbAdd [1, _trennlinie];
	lbAdd [1, localize "STRS_statdialog_playerinfo"];
	lbAdd [1, format ["Money: $%2", localize "STRS_statdialog_health", (('geld' call INV_GetItemAmount) call ISSE_str_IntToStr)]];
	lbAdd [1, format ["Savings: $%2", localize "STRS_statdialog_health", kontostand]];
	lbAdd [1, format ["%1: %2",    localize "STRS_statdialog_hunger", round(INV_hunger)]];
	lbAdd [1, format ["%1: %2/%3", localize "STRS_statdialog_weight", (call INV_GetOwnWeight), INV_Tragfaehigkeit]];
	lbAdd [1, format ["%1: %2",    localize "STRS_statdialog_copkills", CopsKilled]];
	lbAdd [1, format ["%1: %2",    localize "STRS_statdialog_civkills", CivsKilled]];
	lbAdd [1, format ["%1: %2",    localize "STRS_statdialog_selfkills", SelfKilled]];
	lbAdd [1, format ["%1: %2",    localize "STRS_statdialog_streetcred", streetrep]];
	lbAdd [1, format ["%1: %2",    localize "STRS_statdialog_deaths", deadtimes]];
	lbAdd [1, format ["%1: %2 seconds",    "Respawn time", round(DeadWaitSec+extradeadtime)]];
	if(isciv)then{lbAdd [1, format ["%1: %2",    "Demerit points", demerits]]};
	
	lbAdd [1, _trennlinie];
	lbAdd [1, localize "STRS_statdialog_licenselist"];
	for [{_i=0}, {_i < (count INV_Lizenzen)}, {_i=_i+1}] do 
	{
		if (((INV_Lizenzen select _i) select 0) call INV_HasLicense) then 
		{
			lbAdd [1, ((INV_Lizenzen select _i) select 2)];
		};
	};
	lbAdd [1, _trennlinie];
	lbAdd [1, "T C G Island Governor"];
	if (not(MayorNumber == -1)) then 
	{
		lbAdd [1, (playerstringarray select MayorNumber)];
	};
	lbAdd [1, _trennlinie];
	lbAdd [1, "T C G Chief of Police"];
	if (not(chiefNumber == -1)) then 
	{
		lbAdd [1, (playerstringarray select chiefNumber)];
	};

	lbAdd [1, _trennlinie];
	lbAdd [1, "Mafia Members:"];
	_members   = mafs getvariable "mafiamembers";
	for [{_r=0}, {_r < (count _members)}, {_r=_r+1}] do {_tro = _members select _r; _addo = name _tro; lbAdd [1, format["%1",_addo]];};
	lbAdd [1, _trennlinie];
	lbAdd [1, "GANGS:"];
	lbAdd [1, _trennlinie];
	for [{_i=0}, {_i < (count gangsarray)}, {_i=_i+1}] do 
	
	{

	_gangarray = gangsarray select _i;
	_gangname  = _gangarray select 0;
	_members   = _gangarray select 1;
	_territory = "None";
	
	_control1 = gangarea1 getvariable "control";
	_control2 = gangarea2 getvariable "control";
	_control3 = gangarea3 getvariable "control";
	_control4 = gangarea4 getvariable "control";

	if(_control1 == _gangname)then{if(_territory == "None")then{_territory = "West Side"}else{_territory = _territory + ", West Side"};};
	if(_control2 == _gangname)then{if(_territory == "None")then{_territory = "Little Havana"}else{_territory = _territory + ", Little Havana"};};
	if(_control3 == _gangname)then{if(_territory == "None")then{_territory = "East side"}else{_territory = _territory + ", East Side"};};	
	if(_control4 == _gangname)then{if(_territory == "None")then{_territory = "The Safe House"}else{_territory = _territory + ", The Safe House"};};	
	
	lbAdd [1, format["%1", _gangarray select 0]];
	lbAdd [1, format["Territory: %1",_territory]];
	lbAdd [1, format["Members:"]];
	private "_j"; /// BUG FIX
	for [{_j=0}, {_j < (count _members)}, {_j=_j+1}] do {if(_j == 0)then{lbAdd [1, format["%1 (leader)", _members select _j]]}else{lbAdd [1, format["%1", _members select _j]]};};
	lbAdd [1, _trennlinie];
	};		
		
	lbAdd [1, "TCG Island Bank Funds:"];
	lbAdd [1, (format ["Est. total funds in the main bank safe: $%1", robpoolsafe1])];
	lbAdd [1, "Goodfella's Safe Funds:"];
	lbAdd [1, (format ["Est. total funds in the Goodfellas bank safe: $%1", mafiabank])];
	if(!local_useBankPossible)then{lbAdd [1, (format ["Bank lockout time remaining: %1 seconds.", round rblock])]};		
		
	lbAdd [1, _trennlinie];
			
	lbAdd [1, localize "STRS_statdialog_laws"];		
	_i = 0;
	{
		if (not(_x == "")) then 
		{
			_i = _i + 1;
			lbAdd [1, (format ["%1: %2", _i, _x])];
		};
	}
	forEach GesetzArray;
	lbAdd [1, _trennlinie];	
	lbAdd [1, localize "STRS_statdialog_taxes"];	
	{
		if ((_x select 2) > 0) then 
		{
			lbAdd [1, format["%1: %2", (_x select 1), (_x select 2)] ];	
		};
	}
	foreach INV_ItemTypenArray;	
	lbAdd [1, format["Transfer: %1", bank_steuer] ];

	lbAdd [1, _trennlinie];

	lbAdd [1, "D E M A N D (Oil):"];
	_demand = (((tankencost - 100)/200)*100);	
	lbAdd [1, format["Oil Barrel Trader: %1", _demand ]];

	lbAdd [1, _trennlinie];
	lbAdd [1, localize "STRS_statdialog_playerlist"];
	lbAdd [1, _trennlinie];
	private "_i"; /// ADDED TO FIX BUG

	for [{_i=0}, {_i < (count playerarray)}, {_i=_i+1}] do 
	{
		_spieler = playerarray select _i;
		if (!isnull _spieler and isPlayer _spieler) then {lbAdd [1, (format ["%1: %2", _spieler, name _spieler])];};
	};
	lbAdd [1, _trennlinie];
	lbAdd [1, "W A N T E D:"];
	for [{_i=0}, {_i < (count civarray)}, {_i=_i+1}] do 
	{
	
	_civ	  = civarray select _i;
	
	if(!isnull _civ and isPlayer _civ)then

		{
	
		_wanted = call compile format ["%1_wanted", _civ];
		_reason = call compile format ["%1_reason", _civ];
		_bounty = call compile format ["kopfgeld_%1", _civ];
		
		if(_wanted == 1) then

			{

			lbAdd [1, (format ["%1 (Bounty: %3): %2 is wanted for:", _civ, name _civ, _bounty])];
			_str = "";
			{if(_str == "")then{_str = _str + _x}else{_str = _str + ", "; _str = _str + _x;};} foreach _reason;
			lbAdd [1, (format ["%1.", _str])]; 
			lbAdd [1, _trennlinie];
			};

		};

	};
	lbAdd [1, _trennlinie];