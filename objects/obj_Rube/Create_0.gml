/// @description Insert description here
// You can write your code in this editor

_x = x;
_y = y;

_horizontalSpeed = 0;
_verticalSpeed = 0;

_gravity = 500;

_groundSpeed = 450;			// Pixels per walking
_groundSpeedSoftCap = 100;	// Speed up until you can walk to
_groundSpeedHardCap = 1000; // Max speed on ground ever
_groundFriction = 600;		// Loss in speed while on ground past soft cap

_airSpeed = 350;			
_airSpeedSoftCap = 110;
_airSpeedHardCap = 1000;
_airSpeedFriction = 10;

_flightHorizontalBoostInital = 40;
_flightHorizontalBoostPassive = 1;
_flightVerticalBoostInital = 55;
_flightVerticalBoostPassive = 490;

_jumpHeight = 50;

_flightTime = 15.0;
_flightActivateCost = 1.5;
_flightMeter = 1.0;

_flying = false;
_grounded = false;
_shieldOn = false;

_objShield = noone;

_facingRight = true;