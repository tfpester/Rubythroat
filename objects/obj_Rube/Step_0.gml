/// @description Insert description here
// You can write your code in this editor

// Get Player Input
key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
key_jump = keyboard_check_pressed((vk_space));

// Calculate movement
var move = key_right - key_left;
hsp += move * walksp * 0.1;
vsp += grv; // Gravity

// Jump
grounded = place_meeting(x, y+1, obj_background);

if(grounded) {
	doubleJumped = false;	
}
if(key_jump) 
{
	doubleJumped = false;
	if(grounded)
		vsp = -3;
	else if(!grounded && !doubleJumped) 
	{
		vsp = -3;
		doubleJumped = true;
	}
}

// Horizontal collision
if(place_meeting(x+hsp, y, obj_background)) 
{
	while(!place_meeting(x+sign(hsp), y, obj_background))
	{
		x += sign(hsp);
	}
	hsp = 0;
}
x += hsp;

// Vertical collision
if(place_meeting(x, y+vsp, obj_background)) 
{
	while(!place_meeting(x, y+sign(vsp), obj_background))
	{
		y += sign(vsp);
	}
	vsp = 0;
}
y += vsp;

// Animation
if(!grounded) 
{
	if(doubleJumped) {
		sprite_index =  spr_RubeFly;
	}
	else {
		if(sign(vsp) > 0)
			sprite_index = spr_RubeJump;
		else
			sprite_index = spr_RubeFall;
	}
}
else 
{
	if(hsp == 0)
	{
		sprite_index = spr_RubeIdle;
	}
	else
	{
		sprite_index = spr_RubeRun;	
	}
}

if(sign(hsp) != 0) 
{
	image_xscale = sign(hsp);
}
