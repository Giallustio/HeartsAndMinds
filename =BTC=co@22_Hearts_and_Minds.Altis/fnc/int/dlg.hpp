class btc_dlg_interaction
{
	idd = -1;
	movingEnable = 1;
	onLoad = "uiNamespace setVariable [""btc_dlg_interaction"", _this select 0];";
	objects[] = {};
	class controlsBackground 
	{

	};
	class controls 
	{
		class btc_dlg_background : btc_dlg_RscText 
		{
			idc = -1;
			x = 0.55 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.145 * safezoneW;
			h = 0.1815 * safezoneH;//1565
			colorBackground[] = {0, 0, 0, 0.7};
			text = "";
		};
		class btc_dlg_name : btc_dlg_RscText 
		{
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.55 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.145 * safezoneW;//w = 0.105 * safezoneW;
			h = 0.0325 * safezoneH;
			text = "Interaction";
		};
		class btc_dlg_action_1 : btc_dlg_button 
		{
			idc = 9991;
			text = "Action 1"; 
			action = "";
			x = 0.55 * safezoneW + safezoneX;
			y = 0.5365 * safezoneH + safezoneY;
			w = 0.145 * safezoneW;
			default = true;
		};
		class btc_dlg_action_2 : btc_dlg_button 
		{
			idc = 9992;
			text = "Action 2"; 
			action = "";
			x = 0.55 * safezoneW + safezoneX;
			y = 0.5615 * safezoneH + safezoneY;
			w = 0.145 * safezoneW;
			default = true;
		};
		class btc_dlg_action_3 : btc_dlg_button 
		{
			idc = 9993;
			text = "Action 3"; 
			action = "";
			x = 0.55 * safezoneW + safezoneX;
			y = 0.5865 * safezoneH + safezoneY;
			w = 0.145 * safezoneW;
			default = true;
		};
		class btc_dlg_action_4 : btc_dlg_button 
		{
			idc = 9994;
			text = "Action 4"; 
			action = "";
			x = 0.55 * safezoneW + safezoneX;
			y = 0.6115 * safezoneH + safezoneY;
			w = 0.145 * safezoneW;
			default = true;
		};
		class btc_dlg_action_5 : btc_dlg_button 
		{
			idc = 9995;
			text = "Action 5"; 
			action = "";
			x = 0.55 * safezoneW + safezoneX;
			y = 0.6365 * safezoneH + safezoneY;
			w = 0.145 * safezoneW;
			default = true;
		};
		class btc_dlg_action_6 : btc_dlg_button 
		{
			idc = 9996;
			text = "Action 6"; 
			action = "";
			x = 0.55 * safezoneW + safezoneX;
			y = 0.6615 * safezoneH + safezoneY;
			w = 0.145 * safezoneW;
			default = true;
		};
		/*
		class btc_dlg_action_6 : btc_dlg_button 
		{
			idc = 9996;
			text = "Action 6"; 
			action = "";
			x = 0.55 * safezoneW + safezoneX;
			y = 0.6730 * safezoneH + safezoneY;
			w = 0.145 * safezoneW;
			default = true;
		};*/
	};
};
class btc_dlg_progressBar 
{
	idd = -1;
	movingEnable = false;
	onLoad = "uiNamespace setVariable ['btc_dlg_ctrlProgressBar', (_this select 0) displayCtrl 1]; uiNamespace setVariable ['btc_dlg_title', (_this select 0) displayCtrl 2];";
	objects[] = {};

	class controlsBackground 
	{
		class btc_background 
		{
			idc = -1;
			moving = 0;
			font = "TahomaB";
			text = "";
			sizeEx = 0;
			lineSpacing = 0;
			access = 0;
			type = 0;
			style = 0;
			size = 1;
			colorBackground[] = {0, 0, 0, 0.01};
			colorText[] = {0, 0, 0, 0};
			x = "safezoneX";
			y = "safezoneY";
			w = "safezoneW";
			h = "safezoneH";
		};

		class btc_progressBar
		{
			idc = 1;
			moving = 0;
			text = "";
			font = "PuristaMedium";
			sizeEx = "1 / 40 / (getResolution select 5)";// * safezoneX / safezoneXAbs";
			lineSpacing = 0;
			access = 0;
			type = 0;
			style = 2;
			size = 1;
			colorBackground[] = {1, 0.647, 0, 0.5};
			colorText[] = {1,1,1,1};
			x = "safezoneX + 0.1 * safezoneW";
			y = "safezoneY + 0.1 * safezoneH";
			w = "0.0 * safezoneW";
			h = "0.01 * safezoneH";
		};

		class btc_titleBar : btc_progressBar 
		{
			idc = 2;
			//type = 13;
			//size = 1;
			colorBackground[] = {0, 0, 0, 0};
			x = "safezoneX + 0.1 * safezoneW";
			y = "safezoneY + 0.05 * safezoneH";
			w = "0.8 * safezoneW";
			h = "0.05 * safezoneH";
		};
	};
};