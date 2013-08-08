/*
	@file Version: 1.0
	@file Name: hud.hpp
	@file Author: [404] Deadbeat
	@file Created: 11/09/2012 04:23
	@file Args:
*/
#define hud_status_idc 3600
class WastelandHud {
	idd = -1;
    fadeout=0;
    fadein=0;
	duration = 20;
	name= "WastelandHud";
	onLoad = "uiNamespace setVariable ['WastelandHud', _this select 0]";
	
	class controlsBackground {
		class WastelandHud_Status:w_RscText
		{
			idc = hud_status_idc;
			type = CT_STRUCTURED_TEXT;
			size = 0.040;
			x = safeZoneX + (safeZoneW * (1 - (0.16 / SafeZoneW)));
                        y = safeZoneY + (safeZoneH * (1 - (0.20 / SafeZoneH)));
			w = 0.14; h = 0.20;
			colorText[] = {1,1,1,1};
			lineSpacing = 3;
			colorBackground[] = {0,0,0,0};
			text = "100 <img size='0.8' image='FFGFunctions\hud\health.paa'/><br/>100 <img size='0.8' image='FFGFunctions\hud\food.paa'/><br/>100 <img size='0.8' image='\CA\misc\data\icons\picture_money_CA.paa'/>";
			shadow = 2;
			class Attributes {
				align = "right";
			};
		};
	};
};