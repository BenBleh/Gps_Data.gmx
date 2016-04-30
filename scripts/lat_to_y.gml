#define lat_to_y
///lat_to_y(lat)
var temp_y = (control.r * (argument0 - control.map_center_lat) * pi/180);
temp_y = control.map_offset_y - (temp_y * control.map_scale[control.map_zoom_level]);
return temp_y;

#define lon_to_x
///lat_to_x(lon)
var temp_x = (control.r * (argument0 - control.map_center_lon) * pi/180 * cos(control.map_center_lat));
temp_x = control.map_offset_x + (temp_x * control.map_scale[control.map_zoom_level]);
return temp_x;
