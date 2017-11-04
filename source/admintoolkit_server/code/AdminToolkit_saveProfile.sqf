/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */
 
diag_log format["[ADMINTOOLKIT-DEBUG] : Storing %1 buildings...", count AdminToolkit_Buildings];
profileNamespace setVariable [format["ATK_PERSISTENT_%1", 'BUILDINGS'], AdminToolkit_Buildings]; 

saveProfileNamespace;