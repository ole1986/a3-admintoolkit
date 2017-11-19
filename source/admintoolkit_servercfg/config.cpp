/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */
 
class CfgPatches {
    class admintoolkit_servercfg {
        requiredVersion = 0.1;
        requiredAddons[]= {};
        units[] = {};
        weapons[] = {};
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
		 * allowed commands for moderators (customize it if neccessary)
		 */
        ModeratorCmds[] = { "login", /* Login as moderator  - required */
                            "message", /* send single messages to a player */
                            "messageall", /* send global messages */
                            "messageperm", /* Permanent message to all */
                            "kickplayer", /* kick a player */
                            "banplayer", /* kick and ban a player */
                            "getplayers", /* get player list - required for player actions */
                            "tp2player", /* teleport me to a players position */
                            "tpplayer", /* teleport the player to my position */
                            "tp2pos", /* teleport to any location at the map (using ALT + LMB whem map is opened) */
                            "getvehicle", /* get me a vehicle */
                            "givevehicle", /* give a vehicle to a selected player */
                            "getweapon", /* get me a weapon */
                            "getammo", /* get me ammo */
                            "getitem", /* get me any other item */
                            "spawn", /* span vehicles */
                            "buildpers", /* build a persistent object */
                            "build", /* build a temp object */
                            "buildremove", /* remove tempory/pers. objects */
                            "buildpersistent", /* save the persistent buildings - neccessary?! */
                            "buildinfopersistent", /* get some info */
                            "buildabort", /* abourt the building process - should always be in that list when building is allowed */
                            "clearpersistent", /* Cleanup all persistent buildings */
                            "savepersistent", /* ??? */
                            "specplayer",  /* allow spectating other players */
                            "godmodeon", /* allow godmode */
                            "godmodeoff" /* allow disable its godmode once enabled - huh?! */
                            };
        /**
         * Used for server commands achieved from extensions
         */
        ModeratorExtCmds[] = {  "exile_getvehicle",
                                "exile_repvehicle",
                                "exile_destvehicle", 
                                "exile_delvehicle",
                                "exile_getheal", 
                                "exile_kill", 
                                "exile_getmoney",
                                "exile_getscore"};
    };
};
