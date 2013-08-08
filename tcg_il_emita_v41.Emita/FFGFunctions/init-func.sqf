startLoadingScreen["" , "loading_loadingScreen"];
_functionarray =
[
//FUNCTION				DIR					SQF
//Car keys
["keys_use",          	"general\",        "FFG_keys_use"	],
["keys_give",         	"general\",        "FFG_keys_give"	],
["keys_drop",         	"general\",        "FFG_keys_drop"	],
["keys_schuss",        	"general\",        "FFG_keys_schuss"],
//Shops
["shop_dialog",         "shop\",        	"shops"		],
["shop_sell",          	"shop\",        	"shopsell"	],
["shop_buy",          	"shop\",        	"shopbuy"	],
//Dialogs
//Civilians
["civ_gangs",          	"dialogs\",        	"FFG_civ_gang"			],
["civ_gangcontrol",     "dialogs\",        	"FFG_civ_gangcontrol"	],
//Cops
["cop_coplog",          "dialogs\",        	"FFG_cop_coplog"		],
["cop_licensecheck",    "dialogs\",        	"FFG_cop_licensecheck"	],
["cop_menu",          	"dialogs\",        	"FFG_cop_menu"			],
["cop_menul",          	"dialogs\",        	"FFG_cop_menul"			],
//General
["FFG_Dialogs",         "dialogs\",        	"FFG_dialogs_playerlist"],
["general_impound",     "dialogs\",        	"FFG_general_impound"	],
["inventory_invcheck",  "dialogs\",        	"FFG_inventory_invcheck"],
//elections
["election_mayor",      "dialogs\",        	"FFG_election_mayor"	],
["election_police",     "dialogs\",        	"FFG_election_police"	],
//mayor
["mayor_control",       "dialogs\",        	"FFG_mayor_control"		],
["mayor_law",          	"dialogs\",        	"FFG_mayor_law"			],
//Jail
["jail_bail",          	"dialogs\",        	"FFG_jail_bail"			],
["jail_release",        "dialogs\",        	"FFG_jail_release"		],
["storage_unit",        "storage\",        	"FFG_general_storage"	],
["storage_add",        "storage\",        	"FFG_general_addstorage"]
];
_scriptamount = (count (_functionarray));
diag_log format ["SCRIPT AMOUNT: %1", _scriptamount];
_progress = 0;
_progressincrease = _progress + ((round(100 / _scriptamount)) / 100);
diag_log format ["INCREASE AMOUNT: %1", _progressincrease];
_maindir = "FFGFunctions\";
{
call compile format["%4 = compile preprocessFileLineNumbers (""%1%2%3.sqf"");",_maindir,_x select 1,_x select 2,_x select 0];
diag_log format ["%4 = %1%2%3",_maindir,_x select 1,_x select 2,_x select 0];
_progress = _progress + _progressincrease;
_loading = format ["Loading Functions: %1", _x select 2]; 
startLoadingScreen [_loading, "loading_loadingScreen"];
progressLoadingScreen _progress;
sleep 0.1;
} foreach _functionarray;
