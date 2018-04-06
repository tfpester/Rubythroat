/// @description Insert description here
// You can write your code in this editor

// Get Player Input
var key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
var key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
var key_jump = keyboard_check_pressed((vk_space));

// Calculate movement
var move = key_right - key_left;

if(_grounded) {
	if(move != 0) {
		// Add speed
		_horizontalSpeed += move * _groundSpeed * global.delta;
		// Softcap it here so speed is not faster than softcap
		_horizontalSpeed = clamp(_horizontalSpeed, -_groundSpeedSoftCap * global.delta, _groundSpeedSoftCap * global.delta);
	}
	
	// Add friction relative to anlogue movement
	var frictionToAdd = 1 - abs(move);
	if(_horizontalSpeed > 0) {
		_horizontalSpeed -= frictionToAdd * _groundFriction * global.delta;
		_horizontalSpeed = max(_horizontalSpeed, 0);
	}
	else {
		_horizontalSpeed += frictionToAdd * _groundFriction * global.delta;
		_horizontalSpeed = min(_horizontalSpeed, 0);
	}	
	
	// Softcap speed
	if(_horizontalSpeed > _groundSpeedSoftCap) {
		_horizontalSpeed = max(_horizontalSpeed - (_groundFriction * global.delta), _groundSpeedSoftCap * global.delta); 
	}
	else if(_horizontalSpeed < -_groundSpeedSoftCap) {
		_horizontalSpeed = min(_horizontalSpeed + (_groundFriction * global.delta), -_groundSpeedSoftCap * global.delta);
	}

	// Hardcap speed
	_horizontalSpeed = clamp(_horizontalSpeed, -_groundSpeedHardCap * global.delta, _groundSpeedHardCap * global.delta);
}


// Vertical movement
_verticalSpeed += _gravity * global.delta; // Gravity

// Jump
_grounded = place_meeting(x, y+1, obj_wall);

if(_grounded) {
	_flying = false;	
}
if(key_jump) 
{
	_flying = false;
	if(_grounded)
		_verticalSpeed = -sqrt(2 * _jumpHeight * _gravity * global.delta);
	else if(!_grounded && !_flying) 
	{
		_verticalSpeed = -sqrt(2 * _jumpHeight * _gravity * global.delta);
		_flying = true;
	}
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
			sprite_index = spr_RubeJump;
		else
			sprite_index = spr_RubeFall;
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
