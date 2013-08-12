formattedDateTime = "Arma2Net.Unmanaged" callExtension "DateTime ['now', '[yyyy,MM,dd,HH,mm]']";
_time_array = call compile formattedDateTime;
_time_array = call compile _time_array;
setdate _time_array;