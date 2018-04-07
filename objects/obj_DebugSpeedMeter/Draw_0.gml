var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
var cw = camera_get_view_width(view_camera[0]);

draw_set_colour(c_white);
draw_set_font(fnt_Debug);
draw_text(cx + (cw / 2), cy + 25, string(round(obj_Rube._horizontalSpeed / global.delta)));
