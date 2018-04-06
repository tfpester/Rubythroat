/// @description Insert description here
// You can write your code in this editor

_horizontalSpeed = 0;
_verticalSpeed = 0;
_gravity = 20;

_groundSpeed = 10;			// Pixels per walking
_groundSpeedSoftCap = 150;	// Speed up until you can walk to
_groundSpeedHardCap = 1000; // Max speed on ground ever
_groundFriction = 10;		// Loss in speed while on ground past soft cap

_airSpeed = 120;			
_airSpeedSoftCap = 150;
_airSpeedHardCap = 1000;
_airSpeedFriction = 50;

_flightHorizontalBoostInital = 50;
_flightHorizontalBoostPassive = 1;
_flightVerticalBoostInital = 10;
_flightVerticalBoostPassive = 0.1;

_jumpHeight = 50;

_flightTime = 5.2;
_flightActivateCost = 0.2;

_flying = false;
_grounded = false;

_facingRight = true;