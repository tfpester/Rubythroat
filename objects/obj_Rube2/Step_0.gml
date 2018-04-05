/// @description Insert description here
// You can write your code in this editor

// Get Player Input
var key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
var key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
var key_jump = keyboard_check_pressed((vk_space));

// Calculate movement
var move = key_right - key_left;
_horizontalSpeed = move * _walkSpeed * global.delta;
_verticalSpeed += _gravity * global.delta; // Gravity

// Jump
_grounded = place_meeting(x, y+1, obj_background);

if(_grounded) {
	_doubleJumped = false;	
}
if(key_jump) 
{
	_doubleJumped = false;
	if(_grounded)
		_verticalSpeed = -sqrt(2 * _jumpHeight * _gravity * global.delta);
	else if(!_grounded && !_doubleJumped) 
	{
		_verticalSpeed = -sqrt(2 * _jumpHeight * _gravity * global.delta);
		_doubleJumped = true;
	}
}

// Horizontal collision
if(place_meeting(x+_horizontalSpeed, y, obj_background)) 
{
	while(!place_meeting(x+sign(_horizontalSpeed), y, obj_background))
	{
		x += sign(_horizontalSpeed);
	}
	_horizontalSpeed = 0;
}
x += _horizontalSpeed;

// Vertical collision
if(place_meeting(x, y+_verticalSpeed, obj_background)) 
{
	while(!place_meeting(x, y+sign(_verticalSpeed), obj_background))
	{
		y += sign(_verticalSpeed);
	}
	_verticalSpeed = 0;
}
y += _verticalSpeed;

// Animation
if(!_grounded) 
{
	if(_doubleJumped) {
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

if(sign(_horizontalSpeed) != 0) 
{
	image_xscale = sign(_horizontalSpeed);
}
