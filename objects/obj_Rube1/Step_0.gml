///Get the Player's Input
key_right = keyboard_check(vk_right);
key_left = -keyboard_check(vk_left);
key_jump = keyboard_check_pressed(vk_up);

//React to the player's inputs
move = key_left + key_right;
if (key_left = -1) previous_dir = -1;
if (key_right = 1) previous_dir = 1;

//Acceleration
if (hsp < max_hsp) && (hsp > -max_hsp)
{
    hsp += move * movespeed;
}
else if (hsp = max_hsp)
{
    if (key_right)
    {
        hsp = max_hsp;
    }
    else
    {
        hsp -= 1
    }
}
else if (hsp = -max_hsp)
{
    if (key_left)
    {
        hsp = -max_hsp;
    }
    else
    {
        hsp += 1;
    }
}
if (hsp > 0) && (key_left = 0) && (key_right = 0) && (place_meeting(x,y+1,obj_background)) {hsp -= .5}

if (hsp < 0) && (key_left = 0) && (key_right = 0) && (place_meeting(x,y+1,obj_background)) {hsp += .5}

//Gravity
if (vsp < 10) vsp += grav;

if (place_meeting(x,y+1,obj_background))
{
    vsp = key_jump * -jumpspeed
}
//Wall Jumps
if (place_meeting(x+1,y,obj_background)) && (!place_meeting(x-1,y,obj_background))
{
    if (key_jump) && (!place_meeting(x,y+1,obj_background))
    {
        vsp -= 15;
        hsp -= 5;
    }
}

if (place_meeting(x-1,y,obj_background)) && (!place_meeting(x+1,y,obj_background))
{
    if (key_jump) && (!place_meeting(x,y+1,obj_background))
    {
        grav = normal_grav;;
        vsp -= 15;
        hsp += 5;
    }
}
//Wall Slides Left
    if (key_left = -1) && (vsp > 0) && (place_meeting(x-1,y,obj_background)) && (!place_meeting(x,y+1,obj_background))
    {
        if (vsp <= 11) && (vsp > 1.5) vsp -= 1;
        if (vsp <= 11)  && (vsp > 0) grav = .05;
  
    }
    if (key_left = -1 && (place_meeting(x-1,y,obj_background)) && (!place_meeting(x,y+1,obj_background)))
    {
        grav = normal_grav;
    }
    if (key_left = 0)
    {
        grav = normal_grav;
    }
//Wall Slides Right
    if (key_right = 1) && (vsp > 0) && (place_meeting(x+1,y,obj_background)) && (!place_meeting(x,y+1,obj_background))
    {
        if (vsp <= 16) && (vsp > 1.5) vsp -= 1;
        if (vsp < 10)  && (vsp > 0) grav = .05;
  
    }
    if (key_right = 1 && (place_meeting(x+1,y,obj_background)) && (!place_meeting(x,y+1,obj_background)))
    {
        grav = normal_grav;
    }
    if (key_right = 0)
    {
        grav = normal_grav;
    }
//Horizontal Collision
if (place_meeting(x+hsp,y,obj_background))
{
while(!place_meeting(x+sign(hsp),y,obj_background))
{
 x += sign(hsp);
}
hsp = 0;
}
x += hsp;

//Vertical Collision
if (place_meeting(x,y+vsp,obj_background))
{
while(!place_meeting(x,y+sign(vsp),obj_background))
{
 y += sign(vsp);
}
vsp = 0;
}

y += vsp;