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
		RscAdminToolkitExecute
	};
	////////////////////////////////////////////////////////
	// GUI EDITOR OUTPUT START (by ole, v1.063, #Mevizo)
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
		idc = 1400;
		x = 0.775 * safezoneW + safezoneX;
		y = 0.06 * safezoneH + safezoneY;
		w = 0.2125 * safezoneW;
		h = 0.04 * safezoneH;
		colorBackground[] = {0,0,0,0.7};
		colorText[] = {0.8,0.15,0.3,1};
	};
	class RscAdminToolkitInfo: RscStructuredText
	{
		idc = 1901;

		text = "# RscAdminToolkitInfo #"; //--- ToDo: Localize;
		x = 0.775 * safezoneW + safezoneX;
		y = 0.12 * safezoneH + safezoneY;
		w = 0.2125 * safezoneW;
		h = 0.02 * safezoneH;
		colorBackground[] = {-1,-1,-1,0};
	};
	class RscAdminToolkitSearch: RscEdit
	{
		idc = 1801;
		onKeyDown = "if ((_this select 1) == 0x1C or (_this select 1) == 0x9C) then { call AdminToolkit_menuEvents };";

		x = 0.775 * safezoneW + safezoneX;
		y = 0.16 * safezoneH + safezoneY;
		w = 0.1625 * safezoneW;
		h = 0.04 * safezoneH;
		colorBackground[] = {0,0,0,0.7};
	};
	class RscAdminToolkitSearchAction: RscButton
	{
		idc = 1802;
		action = "call AdminToolkit_menuEvents";

		text = "Search"; //--- ToDo: Localize;
		x = 0.9375 * safezoneW + safezoneX;
		y = 0.16 * safezoneH + safezoneY;
		w = 0.05 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class RscAdminToolkitList: RscListBox
	{
		idc = 1500;

		x = 0.775 * safezoneW + safezoneX;
		y = 0.2 * safezoneH + safezoneY;
		w = 0.2125 * safezoneW;
		h = 0.44 * safezoneH;
		colorBackground[] = {0,0,0,0.7};
	};
	class RscAdminToolkitActionMenu: RscCombo
	{
		idc = 2101;
		x = 0.775 * safezoneW + safezoneX;
		y = 0.72 * safezoneH + safezoneY;
		w = 0.2125 * safezoneW;
		h = 0.04 * safezoneH;
		colorBackground[] = {0,0,0,0.7};
	};
	class RscAdminToolkitActionLabel: RscStructuredText
	{
		idc = 1803;

		text = "# RscAdminToolkitActionLabel #"; //--- ToDo: Localize;
		x = 0.775 * safezoneW + safezoneX;
		y = 0.66 * safezoneH + safezoneY;
		w = 0.2125 * safezoneW;
		h = 0.04 * safezoneH;
		colorBackground[] = {-1,-1,-1,0};
	};
	class RscAdminToolkitParam: RscEdit
	{
		idc = 1801;
		onKeyDown = "";

		x = 0.775 * safezoneW + safezoneX;
		y = 0.82 * safezoneH + safezoneY;
		w = 0.2125 * safezoneW;
		h = 0.04 * safezoneH;
		colorBackground[] = {0,0,0,0.7};
	};
	class RscAdminToolkitParamLabel: RscStructuredText
	{
		idc = 1803;

		text = "# RscAdminToolkitParamLabel #"; //--- ToDo: Localize;
		x = 0.775 * safezoneW + safezoneX;
		y = 0.78 * safezoneH + safezoneY;
		w = 0.2125 * safezoneW;
		h = 0.02 * safezoneH;
		colorBackground[] = {-1,-1,-1,0};
	};
	class RscAdminToolkitExecute: RscButton
	{
		idc = 1802;
		action = "call AdminToolkit_actionEvents";

		text = "Execute"; //--- ToDo: Localize;
		x = 0.775 * safezoneW + safezoneX;
		y = 0.88 * safezoneH + safezoneY;
		w = 0.2125 * safezoneW;
		h = 0.06 * safezoneH;
		colorBackground[] = {0,0,0,0.7};
	};
	////////////////////////////////////////////////////////
	// GUI EDITOR OUTPUT END
	////////////////////////////////////////////////////////
};