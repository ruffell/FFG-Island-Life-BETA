_h = execVM "statsave\client\savefunc.sqf";
waitUntil{scriptDone  _h};
_FUNCTION = execVM "FFGFunctions\init-func.sqf";
waitUntil{scriptDone  _FUNCTION};
execVM "statsave\client\clientinit.sqf";