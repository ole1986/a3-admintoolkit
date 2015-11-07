/**
 * AdminHelper - An arma3 administration helper tool
 * @author ole1986
 * @version 0.1
 */
 
class CfgPatches {
    class AdminHelper {
        requiredVersion = 0.1;
        requiredAddons[]= {};
        units[] = {};
        weapons[] = {};
    };
};
class CfgFunctions {
    class AdminHelper {
        class main {
            file="adminhelper\bootstrap";
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
    class AdminHelper {
        /**
         * list of allowed admins using its player UID
         */
        AdminList[] = {"76561198037325738", "76561198088277918"};
        /**
         * list of admins with restricted access only
         */
        ModeratorList[] = {"MODERATORSUID"};
        
        ModeratorCmds[] = {"tp2player", "getvehicle"};
    }
};
