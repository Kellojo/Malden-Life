#include "..\..\script_macros.hpp"
/*
    File: fn_eat.sqf
    Author: Kellojo

    Description:
    Main function for edible and drinkable items.
*/


if ([false,_item,1] call life_fnc_handleInv) then {
	
	if (!(M_CONFIG(getNumber,"VirtualItems",_item,"edible") isEqualTo -1)) then {	
		_val = M_CONFIG(getNumber,"VirtualItems",_item,"edible");
		_sum = life_hunger + _val;
		switch (true) do {
			case (_val < 0 && _sum < 1): {life_hunger = 5;}; //This adds the ability to set the entry edible to a negative value and decrease the hunger without death
			case (_sum > 100): {life_hunger = 100;};
			default {life_hunger = _sum;};
		};
	};
	
	if (!(M_CONFIG(getNumber,"VirtualItems",_item,"drinkable") isEqualTo -1)) then {
		_val = M_CONFIG(getNumber,"VirtualItems",_item,"drinkable");
		_sum = life_thirst + _val;
		switch (true) do {
			case (_val < 0 && _sum < 1): {life_thirst = 5;}; //This adds the ability to set the entry drinkable to a negative value and decrease the thirst without death
			case (_sum > 100): {life_thirst = 100;};
			default {life_thirst = _sum;};
		};
	};
};


