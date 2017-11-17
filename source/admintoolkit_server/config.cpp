/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */
 
class CfgPatches {
    class admintoolkit_server {
        requiredVersion = 0.1;
        requiredAddons[]= {
			"admintoolkit_servercfg"
		};
        units[] = {};
        weapons[] = {};
    };
};
class CfgFunctions {
    class AdminToolkit {
        class main {
            file="x\admintoolkit_server\bootstrap";
            class preInit { 
                preInit = 1;
            };
            class postInit {
                postInit = 1;
            };
        };
    };
};
