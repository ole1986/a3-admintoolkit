/**
 * AdminToolkit - An arma3 administration helper tool
 * @author ole1986
 * @version 0.2
 */
 
class AdminToolkitMenu {
    idd = 40000;
    objects[] = {};
	//controlsBackground[] = { MyDialogBackground };
	controls[]=
    {
        RscAdminToolkit,
        RscAdminToolkitPlayers,
        RscAdminToolkitVehicles,
        RscAdminToolkitInfo,
        RscAdminToolkitList,
        RscAdminToolkitWeapons,
        RscAdminToolkitAction1,
        RscAdminToolkitAction4,
        RscAdminToolkitAction2,
        RscAdminToolkitAction3,
        RscAdminToolkitAction5,
        RscAdminToolkitAction6
    };
    
    ////////////////////////////////////////////////////////
    // GUI EDITOR OUTPUT START (by ole, v1.063, #Temumy)
    ////////////////////////////////////////////////////////

    class RscAdminToolkit: RscFrame
    {
        idc = 1800;
        style = ST_BACKGROUND;
        x = 0.768125 * safezoneW + safezoneX;
        y = 0.00 * safezoneH + safezoneY;
        w = 0.24 * safezoneW;
        h = 0.88 * safezoneH;
    };
    class RscAdminToolkitInfo: RscText {
        idc = 1801;
        x = 0.773281 * safezoneW + safezoneX;
        y = 0.050 * safezoneH + safezoneY;
        w = 0.216563 * safezoneW;
        h = 0.033 * safezoneH;
        colorBackground[] = {0, 0, 0, 0};
    }
    
    class RscAdminToolkitList: RscListbox
    {
        idc = 1500;
        x = 0.773281 * safezoneW + safezoneX;
        y = 0.082 * safezoneH + safezoneY;
        w = 0.216563 * safezoneW;
        h = 0.682 * safezoneH;
    };
    class RscAdminToolkitPlayers: RscButton
    {
        idc = 1600;
        text = "Players"; //--- ToDo: Localize;
        x = 0.773281 * safezoneW + safezoneX;
        y = 0.015 * safezoneH + safezoneY;
        w = 0.0567187 * safezoneW;
        h = 0.033 * safezoneH;
        action = "_this call AdminToolkit_buttonEvent";
    };
    class RscAdminToolkitVehicles: RscButton
    {
        idc = 1601;
        text = "Vehicles"; //--- ToDo: Localize;
        x = 0.855781 * safezoneW + safezoneX;
        y = 0.015 * safezoneH + safezoneY;
        w = 0.0567187 * safezoneW;
        h = 0.033 * safezoneH;
        action = "_this call AdminToolkit_buttonEvent";
    };
    class RscAdminToolkitWeapons: RscButton
    {
        idc = 1602;
        text = "Weapons"; //--- ToDo: Localize;
        x = 0.933125 * safezoneW + safezoneX;
        y = 0.015 * safezoneH + safezoneY;
        w = 0.0567187 * safezoneW;
        h = 0.033 * safezoneH;
        action = "_this call AdminToolkit_buttonEvent";
    };
    class RscAdminToolkitAction1: RscButton
    {
        idc = 1701;
        text = ""; //--- ToDo: Localize;
        x = 0.773281 * safezoneW + safezoneX;
        y = 0.786 * safezoneH + safezoneY;
        w = 0.0567187 * safezoneW;
        h = 0.033 * safezoneH;
        action = "";
    };
    class RscAdminToolkitAction2: RscButton
    {
        idc = 1702;
        text = ""; //--- ToDo: Localize;
        x = 0.855781 * safezoneW + safezoneX;
        y = 0.786 * safezoneH + safezoneY;
        w = 0.0567187 * safezoneW;
        h = 0.033 * safezoneH;
        action = "";
    };
    class RscAdminToolkitAction3: RscButton
    {
        idc = 1703;
        text = ""; //--- ToDo: Localize;
        x = 0.933125 * safezoneW + safezoneX;
        y = 0.786 * safezoneH + safezoneY;
        w = 0.0567187 * safezoneW;
        h = 0.033 * safezoneH;
        action = "";
    };
    class RscAdminToolkitAction4: RscButton
    {
        idc = 1704;
        text = ""; //--- ToDo: Localize;
        x = 0.773281 * safezoneW + safezoneX;
        y = 0.841 * safezoneH + safezoneY;
        w = 0.0567187 * safezoneW;
        h = 0.033 * safezoneH;
        action = "";
    };
    class RscAdminToolkitAction5: RscButton
    {
        idc = 1705;
        text = ""; //--- ToDo: Localize;
        x = 0.855781 * safezoneW + safezoneX;
        y = 0.841 * safezoneH + safezoneY;
        w = 0.0567187 * safezoneW;
        h = 0.033 * safezoneH;
        action = "";
    };
    class RscAdminToolkitAction6: RscButton
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


