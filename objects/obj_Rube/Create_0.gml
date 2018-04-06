/// @description Insert description here
// You can write your code in this editor

_horizontalSpeed = 0;
_verticalSpeed = 0;
_gravity = 15;

_groundSpeed = 30;			// Pixels per walking
_groundSpeedSoftCap = 100;	// Speed up until you can walk to
_groundSpeedHardCap = 1000; // Max speed on ground ever
_groundFriction = 40;		// Loss in speed while on ground past soft cap

_airSpeed = 5;			
_airSpeedSoftCap = 140;
_airSpeedHardCap = 1000;
_airSpeedFriction = 0;

_flightHorizontalBoostInital = 30;
_flightHorizontalBoostPassive = 1;
_flightVerticalBoostInital = 3;
_flightVerticalBoostPassive = 14;

_jumpHeight = 50;

_flightTime = 7.0;
_flightActivateCost = 2.0;
_flightMeter = 1.0;


_flying = false;
_grounded = false;

_facingRight = true;