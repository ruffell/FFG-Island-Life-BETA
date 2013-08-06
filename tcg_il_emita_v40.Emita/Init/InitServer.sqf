////////////////////////////////////
////			         //
//      Copyright © TCG         //
//www.tcgaming.enjin.com       //
////////////////////////////////
["serverloop1"] execVM "servermissionfile4\commonloop.sqf";
[0, 0, 0, ["serverloop"]] execVM "mayor.sqf";
[0, 0, 0, ["serverloop"]] execVM "chief.sqf";
[0, 0, 0, ["serverloop"]] execVM "gangs.sqf";
[] execVM "servermissionfile4\druguse.sqf";
[] execVM "servermissionfile4\robpool.sqf";
[] execVM "servermissionfile4\hunting.sqf";
[] execVM "servermissionfile4\governmentconvoy.sqf";
[] execVM "servermissionfile4\admins.sqf";
[] execVM "servermissionfile4\pmc.sqf";
[] execVM "servermissionfile4\donators.sqf";
//[] execVM "servermissionfile\terrorist.sqf";
//["mem"] execVM "servermissionfile\members.sqf";

//=======================rob gas station init and variables================
[] execVM "stationrobloop.sqf";
station1money = 5000;
publicvariable "station1money";
station2money = 5000;
publicvariable "station2money";
station3money = 5000;
publicvariable "station3money";
station4money = 5000;
publicvariable "station4money";
station5money = 5000;
publicvariable "station5money";
station6money = 5000;
publicvariable "station6money";
station7money = 5000;
publicvariable "station7money";
station8money = 5000;
publicvariable "station8money";
station9money = 5000;
publicvariable "station9money";
pharmmoney = 5000;
publicvariable "pharmmoney";
barmoney = 5000;
publicvariable "barmoney";
barmoney1 = 5000;
publicvariable "barmoney1";
barmoney2 = 5000;
publicvariable "barmoney2";
barmoney3 = 5000;
publicvariable "barmoney3";
