	_vcl = _this select 1;
    _sel = _this select 2;
    INV_VehicleArray = INV_VehicleArray - [_vcl];
	player groupChat localize "STRS_inv_items_weggeworfen";