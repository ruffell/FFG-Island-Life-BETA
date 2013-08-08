_array = _this select 3;
_art   = _array select 0;
_geld  = 'geld' call INV_GetItemAmount;_zusatzString = "";
if ((count _array)>1) then 
{
	_zusatzString = _array select 1;
};
//====
_type = typeof vehicle player;
_type1 = ["police_bell206","MH6J_EP1","OH58g","UH1H_TK_GUE_EP1","MH60S","HH65C","ibr_as350_civ","tcg_taurus_pb_2","tcg_taurus_uc","tcg_taurus","tcg_taurus_wopb","tcg_taurus_shpb","tcg_taurus_sh","il_charger_pd","ilpd_charger_black","ilpd_charger_white","jailbus","il_bearcat","patrol","patrol_pb","patrol_np","patrol_slick","sheriff","whiteuc","blackuc","whited","greyd","whited","blackd","tcg_suburban_uc_black","tcg_suburban_uc_grey","tcg_suburban_uc_white","ilpd_beat_f101","ilpd_beat_f101_sh","ilpd_scu_black","ilpd_scu_white","ilpd_unmarked_scu","ilpd_unmarked_sandstone","ilpd_unmarked_maroon","ilpd_unmarked_darkblue","ilpd_unmarked_black","ilpd_unmarked_grey","ilpd_unmarked_white","ilpd_slick_b40_npb","ilpd_slick_f220_npb","ilpd_slick_b40_PBG","ilpd_slick_f220_PBG","ilpd_Traffic_black","ilpd_Traffic_white","tcg_suburban_patrol","tcg_suburban_sheriff","suburban_pd_k9","suburban_pd","suburban_pd_sheriff","suburban_pd_stealth","suburban_pd_black","ilpd_scu_darkblue","ilpd_scu_grey","ilpd_scu_maroon","ilpd_scu_sandstone","ilpd_Traffic_sandstone","ilpd_Traffic_maroon","ilpd_Traffic_grey","ilpd_Traffic_darkblue","il_fordcv_taxi","tahoe_pd","tahoe_sh","tahoe_uc_black","tahoe_uc_grey","tahoe_uc_1_grey","tahoe_uc_1_blue","tahoe_uc_1_green","ilpd_slick_b40_pb","ilpd_traffic_t101","pd_cvpi_hub","pd_cvpi","tahoe_uc_maroon","tahoe_uc_white","tahoe_uc_1_maroon","tahoe_uc_1_white","tahoe_uc_1_black","ilf350swat","il_f350sheriff"];
	if (player == vehicle player) then
	{player groupchat "You need to be in a police car or at the precinct";}
	else 
	{
		if (_type in _type1) then
		{
			if (!(createDialog "CopMenu")) exitWith {hint "Dialog Error!";};
		}
		else {player groupchat "Your car is not equipped with a police computer";};
	};