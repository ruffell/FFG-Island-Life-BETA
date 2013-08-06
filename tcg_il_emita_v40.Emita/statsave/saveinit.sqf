_h = execVM "statsave\client\savefunc.sqf";
waitUntil{scriptDone  _h};
execVM "statsave\client\clientinit.sqf";
