/**
 * AdminHelper - An arma3 administration helper tool
 * @author ole1986
 * @version 0.1
 */
 
class AdminHelperMenu {
    idd = 40000;
    objects[] = {};
	//controlsBackground[] = { MyDialogBackground };
	controls[]=
    {
        RscAdminHelper,
        RscAdminHelperPlayers,
        RscAdminHelperVehicles,
        RscAdminHelperInfo,
        RscAdminHelperList,
        RscAdminHelperWeapons,
        RscAdminHelperAction1,
        RscAdminHelperAction4,
        RscAdminHelperAction2,
        RscAdminHelperAction3,
        RscAdminHelperAction5,
        RscAdminHelperAction6
    };
    
    ////////////////////////////////////////////////////////
    // GUI EDITOR OUTPUT START (by ole, v1.063, #Temumy)
    ////////////////////////////////////////////////////////

    class RscAdminHelper: RscFrame
    {
        idc = 1800;
        style = ST_BACKGROUND;
        x = 0.768125 * safezoneW + safezoneX;
        y = 0.00 * safezoneH + safezoneY;
        w = 0.24 * safezoneW;
        h = 0.88 * safezoneH;
    };
    class RscAdminHelperInfo: RscText {
        idc = 1801;
        x = 0.773281 * safezoneW + safezoneX;
        y = 0.050 * safezoneH + safezoneY;
        w = 0.216563 * safezoneW;
        h = 0.033 * safezoneH;
        colorBackground[] = {0, 0, 0, 0};
    }
    
    class RscAdminHelperList: RscListbox
    {
        idc = 1500;
        x = 0.773281 * safezoneW + safezoneX;
        y = 0.082 * safezoneH + safezoneY;
        w = 0.216563 * safezoneW;
        h = 0.682 * safezoneH;
    };
    class RscAdminHelperPlayers: RscButton
    {
        idc = 1600;
        text = "Players"; //--- ToDo: Localize;
        x = 0.773281 * safezoneW + safezoneX;
        y = 0.015 * safezoneH + safezoneY;
        w = 0.0567187 * safezoneW;
        h = 0.033 * safezoneH;
        action = "call adminhelper_fetchPlayers";
    };
    class RscAdminHelperVehicles: RscButton
    {
        idc = 1601;
        text = "Vehicles"; //--- ToDo: Localize;
        x = 0.855781 * safezoneW + safezoneX;
        y = 0.015 * safezoneH + safezoneY;
        w = 0.0567187 * safezoneW;
        h = 0.033 * safezoneH;
        action = "call adminhelper_fetchVehicles";
    };
    class RscAdminHelperWeapons: RscButton
    {
        idc = 1602;
        text = "Weapons"; //--- ToDo: Localize;
        x = 0.933125 * safezoneW + safezoneX;
        y = 0.015 * safezoneH + safezoneY;
        w = 0.0567187 * safezoneW;
        h = 0.033 * safezoneH;
        action = "hint 'Not yet implemented';";
    };
    class RscAdminHelperAction1: RscButton
    {
        idc = 1701;
        text = ""; //--- ToDo: Localize;
        x = 0.773281 * safezoneW + safezoneX;
        y = 0.786 * safezoneH + safezoneY;
        w = 0.0567187 * safezoneW;
        h = 0.033 * safezoneH;
        action = "";
    };
    class RscAdminHelperAction2: RscButton
    {
        idc = 1702;
        text = ""; //--- ToDo: Localize;
        x = 0.855781 * safezoneW + safezoneX;
        y = 0.786 * safezoneH + safezoneY;
        w = 0.0567187 * safezoneW;
        h = 0.033 * safezoneH;
        action = "";
    };
    class RscAdminHelperAction3: RscButton
    {
        idc = 1703;
        text = ""; //--- ToDo: Localize;
        x = 0.933125 * safezoneW + safezoneX;
        y = 0.786 * safezoneH + safezoneY;
        w = 0.0567187 * safezoneW;
        h = 0.033 * safezoneH;
        action = "";
    };
    class RscAdminHelperAction4: RscButton
    {
        idc = 1704;
        text = ""; //--- ToDo: Localize;
        x = 0.773281 * safezoneW + safezoneX;
        y = 0.841 * safezoneH + safezoneY;
        w = 0.0567187 * safezoneW;
        h = 0.033 * safezoneH;
        action = "";
    };
    class RscAdminHelperAction5: RscButton
    {
        idc = 1705;
        text = ""; //--- ToDo: Localize;
        x = 0.855781 * safezoneW + safezoneX;
        y = 0.841 * safezoneH + safezoneY;
        w = 0.0567187 * safezoneW;
        h = 0.033 * safezoneH;
        action = "";
    };
    class RscAdminHelperAction6: RscButton
    {
        idc = 1706;
        text = ""; //--- ToDo: Localize;
        x = 0.933125 * safezoneW + safezoneX;
        y = 0.841 * safezoneH + safezoneY;
        w = 0.0567187 * safezoneW;
        h = 0.033 * safezoneH;
        action = "";
    };
    ////////////////////////////////////////////////////////
    // GUI EDITOR OUTPUT END
    ////////////////////////////////////////////////////////
};


