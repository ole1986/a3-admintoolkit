class AdminToolkitMenu {
    idd = 40000;
    objects[] = {};

	controls[]=
	{
		RscAdminToolkitTitle,
		RscAdminToolkitMainMenu,
		RscAdminToolkitActionLabel,
		RscAdminToolkitEditAction,
		RscAdminToolkitSearchAction,
		RscAdminToolkitActionList,
		RscAdminToolkitDetailLabel,
		RscAdminToolkitEditDetail,
		RscAdminToolkitSearchDetail,
		RscAdminToolkitDetailList,
		RscAdminToolkitParamLabel,
		RscAdminToolkitParam,
		RscAdminToolkitQuick1,
		RscAdminToolkitQuick2,
		RscAdminToolkitQuick3,
		RscAdminToolkitQuick4,
		RscAdminToolkitRun,
		RscAdminToolkitRepeat
	};
	////////////////////////////////////////////////////////
	// GUI EDITOR OUTPUT START (by ole, v1.063, #Hosyba)
	////////////////////////////////////////////////////////
	
	class RscAdminToolkitTitle: RscStructuredText
	{
		idc = 1900;
	
		text = "# RscAdminToolkitTitle #"; //--- ToDo: Localize;
		x = 0.300062 * safezoneW + safezoneX;
		y = 0.236 * safezoneH + safezoneY;
		w = 0.15 * safezoneW;
		h = 0.02 * safezoneH;
		colorText[] = {0.8,0.15,0.3,1};
		colorBackground[] = {-1,-1,-1,0};
	};
	class RscAdminToolkitMainMenu: RscListBox
	{
		idc = 1901;
	
		x = 0.300041 * safezoneW + safezoneX;
		y = 0.28 * safezoneH + safezoneY;
		w = 0.15 * safezoneW;
		h = 0.0799999 * safezoneH;
		colorText[] = {0.8,0.15,0.3,1};
		colorBackground[] = {0,0,0,0.7};
	};
	class RscAdminToolkitActionLabel: RscStructuredText
	{
		idc = 1902;
	
		text = "# RscAdminToolkitActionLabel #"; //--- ToDo: Localize;
		x = 0.3 * safezoneW + safezoneX;
		y = 0.38 * safezoneH + safezoneY;
		w = 0.15 * safezoneW;
		h = 0.04 * safezoneH;
		colorBackground[] = {-1,-1,-1,0};
	};
	class RscAdminToolkitEditAction: RscEdit
	{
		idc = 1903;
	
		x = 0.300041 * safezoneW + safezoneX;
		y = 0.43994 * safezoneH + safezoneY;
		w = 0.1 * safezoneW;
		h = 0.04 * safezoneH;
		colorBackground[] = {0,0,0,0.7};
	};
	class RscAdminToolkitSearchAction: RscButton
	{
		idc = 1904;
		action = "call AdminToolkit_loadActions";
	
		text = "Search"; //--- ToDo: Localize;
		x = 0.399969 * safezoneW + safezoneX;
		y = 0.43994 * safezoneH + safezoneY;
		w = 0.05 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class RscAdminToolkitActionList: RscListBox
	{
		idc = 1905;
		rowHeight = 0.08;
	
		x = 0.300041 * safezoneW + safezoneX;
		y = 0.47998 * safezoneH + safezoneY;
		w = 0.15 * safezoneW;
		h = 0.280001 * safezoneH;
		colorBackground[] = {0,0,0,0.7};
	};
	class RscAdminToolkitDetailLabel: RscStructuredText
	{
		idc = 1906;
	
		text = "# RscAdminToolkitDetailLabel #"; //--- ToDo: Localize;
		x = 0.4625 * safezoneW + safezoneX;
		y = 0.38 * safezoneH + safezoneY;
		w = 0.15 * safezoneW;
		h = 0.04 * safezoneH;
		colorBackground[] = {-1,-1,-1,0};
	};
	class RscAdminToolkitEditDetail: RscEdit
	{
		idc = 1907;
	
		x = 0.462462 * safezoneW + safezoneX;
		y = 0.43994 * safezoneH + safezoneY;
		w = 0.1 * safezoneW;
		h = 0.04 * safezoneH;
		colorBackground[] = {0,0,0,0.7};
	};
	class RscAdminToolkitSearchDetail: RscButton
	{
		idc = 1908;
		action = "call AdminToolkit_loadDetails";
	
		text = "Search"; //--- ToDo: Localize;
		x = 0.562494 * safezoneW + safezoneX;
		y = 0.43994 * safezoneH + safezoneY;
		w = 0.05 * safezoneW;
		h = 0.04 * safezoneH;
	};
	class RscAdminToolkitDetailList: RscListBox
	{
		idc = 1909;
		rowHeight = 0.08;

		x = 0.462462 * safezoneW + safezoneX;
		y = 0.47998 * safezoneH + safezoneY;
		w = 0.15 * safezoneW;
		h = 0.280001 * safezoneH;
		colorBackground[] = {0,0,0,0.7};
	};
	class RscAdminToolkitParamLabel: RscStructuredText
	{
		idc = 1910;
	
		text = "# RscAdminToolkitParamLabel #"; //--- ToDo: Localize;
		x = 0.4625 * safezoneW + safezoneX;
		y = 0.236 * safezoneH + safezoneY;
		w = 0.15 * safezoneW;
		h = 0.04 * safezoneH;
		colorBackground[] = {-1,-1,-1,0};
	};
	class RscAdminToolkitParam: RscEdit
	{
		idc = 1911;
		onKeyDown = "";
	
		x = 0.4625 * safezoneW + safezoneX;
		y = 0.28 * safezoneH + safezoneY;
		w = 0.15 * safezoneW;
		h = 0.04 * safezoneH;
		colorBackground[] = {0,0,0,0.7};
	};
	class RscAdminToolkitQuick1: RscButton
	{
		idc = 1912;
		action = "systemChat 'Not yet implemented'";
	
		text = "QUICK 1"; //--- ToDo: Localize;
		x = 0.625 * safezoneW + safezoneX;
		y = 0.44 * safezoneH + safezoneY;
		w = 0.075 * safezoneW;
		h = 0.04 * safezoneH;
		colorBackground[] = {0,0,0,0.8};
	};
	class RscAdminToolkitQuick2: RscButton
	{
		idc = 1913;
		action = "systemChat 'Not yet implemented'";
	
		text = "QUICK 2"; //--- ToDo: Localize;
		x = 0.625 * safezoneW + safezoneX;
		y = 0.502 * safezoneH + safezoneY;
		w = 0.075 * safezoneW;
		h = 0.04 * safezoneH;
		colorBackground[] = {0,0,0,0.8};
	};
	class RscAdminToolkitQuick3: RscButton
	{
		idc = 1914;
		action = "systemChat 'Not yet implemented'";
	
		text = "QUICK 3"; //--- ToDo: Localize;
		x = 0.625 * safezoneW + safezoneX;
		y = 0.56 * safezoneH + safezoneY;
		w = 0.075 * safezoneW;
		h = 0.04 * safezoneH;
		colorBackground[] = {0,0,0,0.8};
	};
	class RscAdminToolkitQuick4: RscButton
	{
		idc = 1915;
		action = "systemChat 'Not yet implemented'";
	
		text = "QUICK 4"; //--- ToDo: Localize;
		x = 0.625 * safezoneW + safezoneX;
		y = 0.62 * safezoneH + safezoneY;
		w = 0.075 * safezoneW;
		h = 0.04 * safezoneH;
		colorBackground[] = {0,0,0,0.8};
	};
	class RscAdminToolkitRun: RscButton
	{
		idc = 1916;
		action = "";
	
		text = "Run action"; //--- ToDo: Localize;
		x = 0.625 * safezoneW + safezoneX;
		y = 0.28 * safezoneH + safezoneY;
		w = 0.075 * safezoneW;
		h = 0.04 * safezoneH;
		colorBackground[] = {0,0,0,0.8};
	};
	class RscAdminToolkitRepeat: RscButton
	{
		idc = 1917;
		action = "AdminToolkit_LastAction call AdminToolkit_doAction;";
	
		text = "Repeat action (F5)"; //--- ToDo: Localize;
		x = 0.625 * safezoneW + safezoneX;
		y = 0.34 * safezoneH + safezoneY;
		w = 0.075 * safezoneW;
		h = 0.04 * safezoneH;
		colorBackground[] = {0,0,0,0.8};
	};
	////////////////////////////////////////////////////////
	// GUI EDITOR OUTPUT END
	////////////////////////////////////////////////////////	
};