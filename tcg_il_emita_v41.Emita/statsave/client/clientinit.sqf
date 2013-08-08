disableUserInput true;
startLoadingScreen ["Loading Stats Functions", "loading_loadingScreen"];
progressLoadingScreen 0;
ReturnedDatabaseLoadOuts = nil;
//Call the event to load profile.
uisleep 5;
startLoadingScreen ["Searching database for player save", "loading_loadingScreen"];
uisleep 2;
[player] call l_profile;

//Just to make sure everything keeps up.

waitUntil{!isNil("ReturnedDatabaseLoadOuts")};
//If you get something returned to you, you have a profile, else you aint got nothin' pal so we better create something for you.

//This will exit if you got returned false (You don't have a profile) and create a profile for you.
if (count (ReturnedDatabaseLoadOuts) == 0) exitwith
{
			startLoadingScreen ["No profile found, creating a new profile!", "loading_loadingScreen"];
			[player] call s_newsave;
			[] call setdefaults;
			_inventory = [INV_InventarArray] call inv_to_string;
			[player, kontostand, _inventory, INV_LizenzOwner, streetrep] call s_save_stats;
			ReturnedDatabaseLoadOuts = 0;
			uisleep 2;
			endLoadingScreen;
			disableUserInput false;
			["New Profile created succesfully!", "#00FF33"] call colour_hint;
};
startLoadingScreen ["Profile Found!", "loading_loadingScreen"];
//Because you had a profile lets load it!
uisleep 2;
	_get = ReturnedDatabaseLoadOuts;
	_newinv = [_get] call combine_inv;
	_get set [3, _newinv];
	[_get] call load_variables;
	["Your stats loaded succesfully!", "#FF9933"] call colour_hint;
disableUserInput false;
endLoadingScreen;