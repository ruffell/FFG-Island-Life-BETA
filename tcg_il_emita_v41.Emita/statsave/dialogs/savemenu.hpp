
//LOADING=============================
class RscloadingButton
{
	access = 0;
	type = 1;
	text = "";
	colorText[] = {0.8784,0.8471,0.651,1};
	colorDisabled[] = {0.4,0.4,0.4,1};
	colorBackground[] = {1,0.537,0,0.5};
	colorBackgroundDisabled[] = {0.95,0.95,0.95,1};
	colorBackgroundActive[] = {1,0.537,0,1};
	colorFocused[] = {0.4,0.6,0.3,1};
	colorShadow[] = {0.023529,0,0.0313725,1};
	colorBorder[] = {0.023529,0,0.0313725,1};
	soundEnter[] = {"\ca\ui\data\sound\onover",0.09,1};
	soundPush[] = {"\ca\ui\data\sound\new1",0,0};
	soundClick[] = {"\ca\ui\data\sound\onclick",0.07,1};
	soundEscape[] = {"\ca\ui\data\sound\onescape",0.09,1};
	style = 2;
	x = 0;
	y = 0;
	w = 0.095589;
	h = 0.039216;
	shadow = 2;
	font = "Zeppelin32";
	sizeEx = 0.03921;
	offsetX = 0.003;
	offsetY = 0.003;
	offsetPressedX = 0.002;
	offsetPressedY = 0.002;
	borderSize = 0;
};


class RscloadingStructuredText
{
	access = 0;
	type = 13;
	idc = -1;
	style = 0;
	colorText[] = {1,1,1,1};
	class Attributes
	{
		font = "Zeppelin32";
		color = "#e0d8a6";
		align = "center";
		shadow = 1;
	};
	x = 0;
	y = 0;
	h = 0.035;
	w = 0.1;
	text = "";
	size = 0.03921;
	shadow = 2;
};


class RscloadingText
{
	type = 0;
	idc = -1;
	x = 0;
	y = 0;
	h = 0.037;
	w = 0.3;
	style = 0x100; 
	font = Zeppelin32;
	SizeEx = 0.03921;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0, 0, 0, 0};
	linespacing = 1;
};
class RscloadingPicture
{
	access=0;
	type=0;
	idc=-1;
	style=48;
	colorBackground[]={0,0,0,0};
	colorText[]={1,1,1,1};
	font="TahomaB";
	sizeEx=0;
	lineSpacing=0;
	text="";
};

class RscloadingLoadingText : RscloadingText
{
	style = 2;
	x = 0.323532;
	y = 0.666672;
	w = 0.352944;
	h = 0.039216;
	sizeEx = 0.03921;
	colorText[] = {1,1,1,1.0};
};
class RscloadingProgress
{
	x = 0.344;
	y = 0.619;
	w = 0.313726;
	h = 0.0261438;
	texture = "statsave\dialogs\loadbar2.paa";
	colorFrame[] = {0,0,0,0};
	colorBar[] = {1,1,1,1};
};
class RscloadingProgressNotFreeze
{
	idc = -1;
	type = 45;
	style = 0;
	x = 0.022059;
	y = 0.911772;
	w = 0.029412;
	h = 0.039216;
	texture = "#(argb,8,8,3)color(0,0,0,0)";
};
class loading_loadingScreen
	{ 
			idd = -1;
			duration = 10e10;
			fadein = 0;
			fadeout = 0;
			name = "loading screen";
			class controlsBackground
			{
				class blackBG : RscloadingText
				{
					x = safezoneX;
					y = safezoneY;
					w = safezoneW;
					h = safezoneH;
					text = "";
					colorText[] = {0,0,0,0};
					colorBackground[] = {0,0,0,1};
				};
				class nicePic : RscloadingPicture
				{
					style = 48 + 0x800; // ST_PICTURE + ST_KEEP_ASPECT_RATIO
					x = safezoneX + safezoneW/2 - 0.25;
					y = safezoneY + safezoneH/2 - 0.2;
					w = 0.5;
					h = 0.4;
					text = "statsave\dialogs\loading2.paa";
				};
			};
			class controls
			{
				class Title1 : RscloadingLoadingText
				{
				//	text = "$STR_LOADING"; // "Loading" text in the middle of the screen
				text = ""; // "Loading" text in the middle of the screen
				};
				class CA_Progress : RscloadingProgress // progress bar, has to have idc 104
				{
					idc = 104;
					type = 8; // CT_PROGRESS
					style = 0; // ST_SINGLE
					texture = "statsave\dialogs\loadbar2.paa";
				};
				class CA_Progress2 : RscloadingProgressNotFreeze // progress bar that will go reverse
				{
					idc = 103;
				};
				class Name2: RscloadingText // the text 
				{
					idc = 101;
				//	x = 0.323532;
				//	y = 0.766672;
					x = 0;
					y = 0;
					w = 0.9;
					h = 0.04902;
					text = "";
					sizeEx = 0.05;
					colorText[] = {1,1,1,1.0};
				};
			};
};
//LOADING=====================

//SAVE MENU=============================

class RscNiceButton {
	type = 16;
	idc = -1;
	style = 0;
	default = 0;
	x = 0.0 + 0.01;
	y = 0.0 + 0.15;
	w = 0.183825;
	h = 0.104575;
	color[] = {0.95, 0.95, 0.95, 1};
	color2[] = {1, 1, 1, 0.4};
	colorBackground[] = {1, 1, 1, 1};
	colorbackground2[] = {1, 1, 1, 0.4};
	colorDisabled[] = {1, 1, 1, 0.25};
	periodFocus = 1.2;
	periodOver = 0.8;
	animTextureNormal = "\ca\ui\data\ui_button_normal_ca.paa";
	animTextureDisabled = "\ca\ui\data\ui_button_disabled_ca.paa";
	animTextureOver = "\ca\ui\data\ui_button_over_ca.paa";
	animTextureFocused = "\ca\ui\data\ui_button_focus_ca.paa";
	animTexturePressed = "\ca\ui\data\ui_button_down_ca.paa";
	animTextureDefault = "\ca\ui\data\ui_button_default_ca.paa";
	textureNoShortcut = "";
	period = 0.4;
	font = "Zeppelin32";
	size = 0.03521;
	sizeEx = 0.03521;
	text = "";
	soundEnter[] = {"\ca\ui\data\sound\mouse2", 0.09, 1};
	soundPush[] = {"\ca\ui\data\sound\new1", 0.09, 1};
	soundClick[] = {"\ca\ui\data\sound\mouse3", 0.07, 1};
	soundEscape[] = {"\ca\ui\data\sound\mouse1", 0.09, 1};
	action = "";
	
	class HitZone {
		left = 0.004;
		top = 0.029;
		right = 0.004;
		bottom = 0.029;
	};
	
	class ShortcutPos {
		left = 0.004;
		top = 0.026;
		w = 0.0392157;
		h = 0.0522876;
	};
	
	class TextPos {
		left = 0.05;
		top = 0.034;
		right = 0.005;
		bottom = 0.005;
	};
	
	class Attributes {
		font = "Zeppelin32";
		color = "#E5E5E5";
		align = "left";
		shadow = "true";
	};
	
	class AttributesImage {
		font = "Zeppelin32";
		color = "#E5E5E5";
		align = "left";
	};
};

class RscLabel {
	idc = -1;
	type = VSoft;
	style = 0;
	text = "";
	font = "Zeppelin32";
	sizeEx = 0.02621;
	colorBackground[] = {0, 0, 0, 0};
	colorText[] = {1, 1, 1, 1};
	x = 0.0 + 0.4;
	y = 0.0 + 0.08;
	w = 0.4;
	h = 0.03;
};
class RscGroupBox2 {
	type = VSoft;
	idc = -1;
	style = 112;
	text = "";
	colorBackground[] = {1, 1, 1, 0.6};
	colorText[] = {0, 0, 0, 0};
	font = "BitStream";
	sizeEx = 0.02;
};

//


class savemenusd {
	idd = 70001;
	movingEnable = 1;
	
	class controlsBackground {
		class Drag : RscGroupBox2 {
			x = 0.174243;
			y = 0.328282;
			w = 0.605052;
			h = 0.541079;
			colorbackground[] = {0, 0, 0, 0.8};
			colortext[] = {0, 0, 0, 0};
			moving = 1;
		};
		
		class SubBackground1 : RscGroupBox2 {
			x = 0.174243;
			y = 0.328282;
			w = 0.603052;
			h = 0.538079;
			style = 128;
			text = "Save-O-Matic 3000";
			colorBackground[] = {0.709, 0.972, 0.384, 0.2};
		};
	};
	
	class objects {};
	
	class controls {
class RscListbox_1500: RscListbox
{
	idc = 153433;
	text = "Choose car";
	x = 0.193182;
	y = 0.363636;
	w = 0.288131;
	h = 0.480471;
};	
		class updatestats : RscNiceButton {
		idc = 153040;
		x = 0.507576;
		y = 0.745791;
		w = 0.236364;
		h = 0.0882154;
		text = "Update Stats";
		action = "[lbData [153433, lbCurSel 153433],lbText [153433, lbCurSel 153433]] spawn final_update; closeDialog 0;";
		};
	};
};
