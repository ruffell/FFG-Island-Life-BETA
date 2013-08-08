//HUD
#define ST_LEFT_HUD 0x00
#define FontM 			"Zeppelin32"
#define CT_STATIC 		0
//=====================================================================================
class w_RscText {

	idc = -1;
	type = CT_STATIC;
	style = ST_LEFT_HUD;
	colorBackground[] = { 1 , 1 , 1 , 0 };
	colorText[] = { 1 , 1 , 1 , 1 };
	font = FontM;
	sizeEx = 0.025;
	h = 0.25;
	text = "";
};