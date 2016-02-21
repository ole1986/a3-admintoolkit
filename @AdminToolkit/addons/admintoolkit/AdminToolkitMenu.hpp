/**
 * AdminToolkit - An arma3 administration helper tool
 * @author ole1986
 */
 
class AdminToolkitMenu {
    idd = 40000;
    objects[] = {};
	//controlsBackground[] = { MyDialogBackground };
	controls[]=
	{
		RscAdminToolkit,
		RscAdminToolkitSearch,
		RscAdminToolkitSearchAction,
		RscAdminToolkitInfo,
		RscAdminToolkitList,
		RscAdminToolkitPlayers,
		RscAdminToolkitVehicles,
		RscAdminToolkitWeapons,
		RscAdminToolkitMod1,
		RscAdminToolkitMod2,
		RscAdminToolkitMod3,
		RscAdminToolkitAction1,
		RscAdminToolkitAction2,
		RscAdminToolkitAction3,
		RscAdminToolkitAction4,
		RscAdminToolkitAction5,
		RscAdminToolkitAction6,
		RscAdminToolkitAction7,
		RscAdminToolkitAction8
	};
	////////////////////////////////////////////////////////
	// GUI EDITOR OUTPUT START (by ole, v1.063, #Rebome)
	////////////////////////////////////////////////////////

	class RscAdminToolkit: RscFrame
	{
		idc = 1800;
		style = 80;

		x = 0.7625 * safezoneW + safezoneX;
		y = 0.00 * safezoneH + safezoneY;
		w = 0.2375 * safezoneW;
		h = 0.940001 * safezoneH;
	};
	class RscAdminToolkitSearch: RscEdit
	{
		idc = 1801;

		x = 0.775034 * safezoneW + safezoneX;
		y = 0.1799 * safezoneH + safezoneY;
		w = 0.1625 * safezoneW;
		h = 0.04 * safezoneH;
		colorBackground[] = {0,0,0,0.5};
        onKeyDown = "if ((_this select 1) == 0x1C or (_this select 1) == 0x9C) then { [1802] call AdminToolkit_buttonEvents };";
	};
	class RscAdminToolkitSearchAction: RscButton
	{
		idc = 1802;
		action = "[1802] call AdminToolkit_buttonEvents";

		text = "Search"; //--- ToDo: Localize;
		x = 0.937456 * safezoneW + safezoneX;
		y = 0.1799 * safezoneH + safezoneY;
		w = 0.05 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class RscAdminToolkitInfo: RscText
	{
		idc = 1803;

		x = 0.775034 * safezoneW + safezoneX;
		y = 0.12006 * safezoneH + safezoneY;
		w = 0.2125 * safezoneW;
		h = 0.04 * safezoneH;
        colorText[] = {1, 0, 0.4, 1};
	};
	class RscAdminToolkitList: RscListBox
	{
		idc = 1500;

		x = 0.775034 * safezoneW + safezoneX;
		y = 0.23996 * safezoneH + safezoneY;
		w = 0.2125 * safezoneW;
		h = 0.48 * safezoneH;
		colorBackground[] = {0,0,0,0.5};
	};
	class RscAdminToolkitPlayers: RscButton
	{
		idc = 1600;
		action = "[1600] call AdminToolkit_buttonEvents";

		text = "Players"; //--- ToDo: Localize;
		x = 0.775034 * safezoneW + safezoneX;
		y = 0.01996 * safezoneH + safezoneY;
		w = 0.0625 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class RscAdminToolkitVehicles: RscButton
	{
		idc = 1601;
		action = "[1601] call AdminToolkit_buttonEvents";

		text = "Vehicles"; //--- ToDo: Localize;
		x = 0.850006 * safezoneW + safezoneX;
		y = 0.01996 * safezoneH + safezoneY;
		w = 0.0625 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class RscAdminToolkitWeapons: RscButton
	{
		idc = 1602;
		action = "[1602] call AdminToolkit_buttonEvents";

		text = "Weapons"; //--- ToDo: Localize;
		x = 0.924978 * safezoneW + safezoneX;
		y = 0.01996 * safezoneH + safezoneY;
		w = 0.0625 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class RscAdminToolkitMod1: RscButton
	{
		idc = 1603;
		action = "[1603] call AdminToolkit_buttonEvents";

		text = "Buildings"; //--- ToDo: Localize;
		x = 0.775034 * safezoneW + safezoneX;
		y = 0.07302 * safezoneH + safezoneY;
		w = 0.0625 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class RscAdminToolkitMod2: RscButton
	{
		idc = 1604;
		action = "[1604] call AdminToolkit_buttonEvents";

		text = "Other"; //--- ToDo: Localize;
		x = 0.850006 * safezoneW + safezoneX;
		y = 0.07302 * safezoneH + safezoneY;
		w = 0.0625 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class RscAdminToolkitMod3: RscButton
	{
		idc = 1605;
		action = "[1605] call AdminToolkit_buttonEvents";

		text = "Items"; //--- ToDo: Localize;
		x = 0.924978 * safezoneW + safezoneX;
		y = 0.07302 * safezoneH + safezoneY;
		w = 0.0625 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class RscAdminToolkitAction1: RscButton
	{
		idc = 1701;
		action = "";

		x = 0.775034 * safezoneW + safezoneX;
		y = 0.76004 * safezoneH + safezoneY;
		w = 0.0625 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class RscAdminToolkitAction2: RscButton
	{
		idc = 1702;
		action = "";

		x = 0.850006 * safezoneW + safezoneX;
		y = 0.76004 * safezoneH + safezoneY;
		w = 0.0625 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class RscAdminToolkitAction3: RscButton
	{
		idc = 1703;
		action = "";

		x = 0.924978 * safezoneW + safezoneX;
		y = 0.76004 * safezoneH + safezoneY;
		w = 0.0625 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class RscAdminToolkitAction4: RscButton
	{
		idc = 1704;
		action = "";

		x = 0.775034 * safezoneW + safezoneX;
		y = 0.8131 * safezoneH + safezoneY;
		w = 0.0625 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class RscAdminToolkitAction5: RscButton
	{
		idc = 1705;
		action = "";

		x = 0.850006 * safezoneW + safezoneX;
		y = 0.8131 * safezoneH + safezoneY;
		w = 0.0625 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class RscAdminToolkitAction6: RscButton
	{
		idc = 1706;
		action = "";

		x = 0.924978 * safezoneW + safezoneX;
		y = 0.8131 * safezoneH + safezoneY;
		w = 0.0625 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class RscAdminToolkitAction7: RscButton
	{
		idc = 1707;
		action = "";

		x = 0.775034 * safezoneW + safezoneX;
		y = 0.87294 * safezoneH + safezoneY;
		w = 0.0875 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class RscAdminToolkitAction8: RscButton
	{
		idc = 1708;
		action = "";

		x = 0.900022 * safezoneW + safezoneX;
		y = 0.87294 * safezoneH + safezoneY;
		w = 0.0875 * safezoneW;
		h = 0.04 * safezoneH;
	};
	////////////////////////////////////////////////////////
	// GUI EDITOR OUTPUT END
	////////////////////////////////////////////////////////
};


