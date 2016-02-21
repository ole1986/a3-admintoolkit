/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */
 
class CfgPatches {
    class AdminToolkit {
        requiredVersion = 0.1;
        requiredAddons[]= {};
        units[] = {};
        weapons[] = {};
    };
};
class CfgFunctions {
    class AdminToolkit {
        class main {
            file="admintoolkit_server\bootstrap";
            class preInit { 
                preInit = 1;
            };
            class postInit {
                postInit = 1;
            };
        };
    };
};

class CfgSettings
{
    class AdminToolkit {
		/**
		 * Server command password required to execute kick, ban, etc...
		 */
		ServerCommandPassword = "";
        /**
         * list of allowed admins using its player UID (default: me)
         */
        AdminList[] = {"76561198037325738"};
        /**
         * list of admins with restricted access only
         */
        ModeratorList[] = {};
        /**
		 * allowed commands for moderators (default: teleport to a player, get a vehicle, get player list, spectate a player)
		 */
        ModeratorCmds[] = {"tp2player", "getvehicle", "kickplayer", "playersCallback", "specplayer", "specstop"};
    };
};
