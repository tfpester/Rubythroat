/// @description Insert description here
// You can write your code in this editor

// Get Player Input
var key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
var key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
var key_jump = keyboard_check_pressed(vk_space);
var key_fall = keyboard_check_pressed(ord("S"));
// Calculate movement
var move = key_right - key_left;

if(_grounded) {
	_horizontalSpeed = RubeHorizontalMovement(_horizontalSpeed, move, _groundSpeed, _groundSpeedSoftCap, _groundSpeedHardCap, _groundFriction);
}
else { // Airborne
	_horizontalSpeed = RubeHorizontalMovement(_horizontalSpeed, move, _airSpeed, _airSpeedSoftCap, _airSpeedHardCap, _airSpeedFriction);
}


// Vertical movement
_verticalSpeed += _gravity * global.deltaSq; // Gravity

// Jump
_grounded = place_meeting(x, y+1, obj_wall);

if(_grounded) {
	_flying = false;
	_flightMeter = 1.0;
}

if(_flying) {
	_flightMeter -= global.delta / _flightTime;
	_verticalSpeed -= _flightVerticalBoostPassive *  global.deltaSq;
	
	if(_flightMeter <= 0.0) {
		_flightMeter = 0.0;
		_flying = false;
	}
}

if(key_jump) 
{
	if(_grounded) {
		_verticalSpeed = -sqrt(2 * _jumpHeight * _gravity * global.deltaSq);
	}
	else if(!_grounded &&  _flightMeter > 0.0) 
	{
		//_verticalSpeed = -sqrt(2 * _flightVerticalBoostInital * _gravity * global.deltaSq);
		_verticalSpeed = -sqrt(2 * _flightVerticalBoostInital * (_gravity - _flightVerticalBoostPassive) * global.deltaSq);
		_horizontalSpeed += move * _flightHorizontalBoostInital * global.delta;
		_flying = true;
		
		_flightMeter -= _flightActivateCost / _flightTime;
	}
}

if(key_fall) {
	_flying = false;	
}

// Horizontal collision
if(place_meeting(x+_horizontalSpeed, y, obj_wall)) 
{
	while(!place_meeting(x+sign(_horizontalSpeed), y, obj_wall))
	{
		x += sign(_horizontalSpeed);
	}
	_horizontalSpeed = 0;
}
x += _horizontalSpeed;

// Vertical collision
if(place_meeting(x, y+_verticalSpeed, obj_wall)) 
{
	while(!place_meeting(x, y+sign(_verticalSpeed), obj_wall))
	{
		y += sign(_verticalSpeed);
	}
	_verticalSpeed = 0;
}
y += _verticalSpeed;

// Animation
if(!_grounded) 
{
	if(_flying) {
		sprite_index =  spr_RubeFly;
	}
	else {
		if(sign(_verticalSpeed) > 0)
			sprite_index = spr_RubeFall;
		else
			sprite_index = spr_RubeJump;
	}
}
else 
{
	if(_horizontalSpeed == 0)
	{
		sprite_index = spr_RubeIdle;
	}
	else
	{
		sprite_index = spr_RubeRun;	
	}
}



// Flip
if(_facingRight &&  _horizontalSpeed < 0) 
{
	_facingRight = false;
	x--;
	image_xscale = -1;
}
else if (!_facingRight &&  _horizontalSpeed > 0)
{
	_facingRight = true;
	x++;
	image_xscale = 1;
}
