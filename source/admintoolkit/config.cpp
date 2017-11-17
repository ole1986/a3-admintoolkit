/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */
 
class CfgPatches
{
	class admintoolkit
	{
		requiredVersion=0.1;
		requiredAddons[]={};
		units[]={};
		weapons[]={};
		magazines[]={};
		ammo[]={};
	};
};

#include <defines.hpp>
#include <AdminToolkitMenu.hpp>

class CfgFunctions
{
	class AdminToolkit
	{
		class Bootstrap
		{
			file="x\admintoolkit\bootstrap";
			class preInit
			{
				preInit=1;
			};
			class postInit
			{
				postInit=1;
			};
		};
	};
};