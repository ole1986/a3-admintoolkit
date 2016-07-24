class AdminToolkitMenu {
    idd = 40000;
    objects[] = {};

	controls[]=
	{
		RscAdminToolkitTitle,
		RscAdminToolkitMainMenu,
		RscAdminToolkitInfo,
		RscAdminToolkitSearch,
		RscAdminToolkitSearchAction,
		RscAdminToolkitList,
		RscAdminToolkitActionMenu,
		RscAdminToolkitActionLabel,
		RscAdminToolkitParam,
		RscAdminToolkitParamLabel,
		RscAdminToolkitExecute,
		RscAdminToolkitRepeat
	};
	////////////////////////////////////////////////////////
	// GUI EDITOR OUTPUT START (by ole, v1.063, #Norana)
	////////////////////////////////////////////////////////

	class RscAdminToolkitTitle: RscStructuredText
	{
		idc = 1900;

		text = "# RscAdminToolkitTitle #"; //--- ToDo: Localize;
		x = 0.775 * safezoneW + safezoneX;
		y = 0.02 * safezoneH + safezoneY;
		w = 0.2125 * safezoneW;
		h = 0.02 * safezoneH;
		colorText[] = {0.8,0.15,0.3,1};
		colorBackground[] = {-1,-1,-1,0};
	};
	class RscAdminToolkitMainMenu: RscCombo
	{
		idc = 1910;

		x = 0.775 * safezoneW + safezoneX;
		y = 0.06 * safezoneH + safezoneY;
		w = 0.2125 * safezoneW;
		h = 0.04 * safezoneH;
		colorText[] = {0.8,0.15,0.3,1};
		colorBackground[] = {0,0,0,0.7};
	};
	class RscAdminToolkitInfo: RscStructuredText
	{
		idc = 1920;

		text = "# RscAdminToolkitInfo #"; //--- ToDo: Localize;
		x = 0.775 * safezoneW + safezoneX;
		y = 0.12 * safezoneH + safezoneY;
		w = 0.2125 * safezoneW;
		h = 0.02 * safezoneH;
		colorBackground[] = {-1,-1,-1,0};
	};
	class RscAdminToolkitSearch: RscEdit
	{
		idc = 1930;
		onKeyDown = "if ((_this select 1) == 0x1C or (_this select 1) == 0x9C) then { call AdminToolkit_menuEvents };";

		x = 0.775 * safezoneW + safezoneX;
		y = 0.16 * safezoneH + safezoneY;
		w = 0.1625 * safezoneW;
		h = 0.04 * safezoneH;
		colorBackground[] = {0,0,0,0.7};
	};
	class RscAdminToolkitSearchAction: RscButton
	{
		idc = 1940;
		action = "call AdminToolkit_menuEvents";

		text = "Search"; //--- ToDo: Localize;
		x = 0.9375 * safezoneW + safezoneX;
		y = 0.16 * safezoneH + safezoneY;
		w = 0.05 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class RscAdminToolkitList: RscListBox
	{
		idc = 1950;

		x = 0.775 * safezoneW + safezoneX;
		y = 0.2 * safezoneH + safezoneY;
		w = 0.2125 * safezoneW;
		h = 0.38 * safezoneH;
		colorBackground[] = {0,0,0,0.7};
	};
	class RscAdminToolkitActionMenu: RscCombo
	{
		idc = 1960;

		x = 0.775 * safezoneW + safezoneX;
		y = 0.66 * safezoneH + safezoneY;
		w = 0.2125 * safezoneW;
		h = 0.04 * safezoneH;
		colorBackground[] = {0,0,0,0.7};
	};
	class RscAdminToolkitActionLabel: RscStructuredText
	{
		idc = 1970;

		text = "# RscAdminToolkitActionLabel #"; //--- ToDo: Localize;
		x = 0.775 * safezoneW + safezoneX;
		y = 0.6 * safezoneH + safezoneY;
		w = 0.2125 * safezoneW;
		h = 0.04 * safezoneH;
		colorBackground[] = {-1,-1,-1,0};
	};
	class RscAdminToolkitParam: RscEdit
	{
		idc = 1980;
		onKeyDown = "";

		x = 0.775 * safezoneW + safezoneX;
		y = 0.76 * safezoneH + safezoneY;
		w = 0.2125 * safezoneW;
		h = 0.04 * safezoneH;
		colorBackground[] = {0,0,0,0.7};
	};
	class RscAdminToolkitParamLabel: RscStructuredText
	{
		idc = 1990;

		text = "# RscAdminToolkitParamLabel #"; //--- ToDo: Localize;
		x = 0.775 * safezoneW + safezoneX;
		y = 0.72 * safezoneH + safezoneY;
		w = 0.2125 * safezoneW;
		h = 0.02 * safezoneH;
		colorBackground[] = {-1,-1,-1,0};
	};
	class RscAdminToolkitExecute: RscButton
	{
		idc = 1995;
		action = "call AdminToolkit_actionEvents";

		text = "Run action"; //--- ToDo: Localize;
		x = 0.8875 * safezoneW + safezoneX;
		y = 0.82 * safezoneH + safezoneY;
		w = 0.1 * safezoneW;
		h = 0.04 * safezoneH;
		colorBackground[] = {0,0,0,0.7};
	};
	class RscAdminToolkitRepeat: RscButton
	{
		idc = 1996;
		action = "systemChat 'Not yet implemented'";

		text = "Repeat last action"; //--- ToDo: Localize;
		x = 0.775 * safezoneW + safezoneX;
		y = 0.82 * safezoneH + safezoneY;
		w = 0.1 * safezoneW;
		h = 0.04 * safezoneH;
		colorBackground[] = {0,0,0,0.7};
	};
	////////////////////////////////////////////////////////
	// GUI EDITOR OUTPUT END
	////////////////////////////////////////////////////////
};