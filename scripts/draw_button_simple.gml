#define draw_button_simple
///draw_button_simple(x1,y1,x2,y2,text,c_color)
var x1 = argument0;
var y1 = argument1;
var x2 = argument2;
var y2 = argument3;
var button_text = argument4;
var color = argument5;
var temp_color = draw_get_colour();
var temp_alpha = draw_get_alpha();
//
var hover = false;
//if device_mouse_x(0)>x1 && device_mouse_x(0)<x2 && device_mouse_y(0)>y1 && device_mouse_y(0)<y2{
if mouse_x>x1 && mouse_x<x2 && mouse_y>y1 && mouse_y<y2{
    hover = true;
}
var pressed = false;
if hover{
    if mouse_check_button(mb_left){
        pressed = true;
    }
}

//
if hover{
    draw_set_alpha(0.8);
}else{
    draw_set_alpha(0.6);
}
//draw_button(x1,y1,x2,y2,!pressed);
if pressed{
    draw_set_color(c_black)
}else{
    draw_set_color(c_gray)
}
draw_rectangle(x1,y1,x2,y2,0);
if hover{
    draw_set_color(color);
    draw_rectangle(x1,y1,x2,y2,1);
}
draw_set_halign(fa_center);
draw_set_valign(fa_center);
if temp_color==c_white{
    draw_set_color(c_white);
}else{
    draw_set_color(c_black);
}
draw_set_alpha(temp_alpha)
draw_text(x1+(x2-x1)*0.5+1+2*pressed,y1+(y2-y1)*0.5+1+2*pressed,button_text);
if temp_color==c_white{
    draw_set_color(c_black);
}else{
    draw_set_color(c_white);
}
draw_text(x1+(x2-x1)*0.5+2*pressed,y1+(y2-y1)*0.5+2*pressed,button_text);

draw_set_color(temp_color);
//
draw_set_valign(fa_top);
draw_set_halign(fa_left);
if hover && mouse_check_button_released(mb_left){
    return 1;
}
return 0;

#define draw_button_ext
///draw_button_ext(x,y,sprite_index,text,sub_sprite_index,sub_image_index,sub_image_offset,sub_image_scale)
// note: the button_sprite and the sub sprite should be centered
// note: the button sprite should have 4 images (button,button_hover,button_press,button_glass_overlay)
return draw_button_ext_rel(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,mouse_x,mouse_y);


#define draw_button_ext_rel
///draw_button_ext_rel(x,y,sprite_index,text,sub_sprite_index,sub_image_index,sub_image_offset,sub_image_scale,mouse_x,mouse_y)
// note: the button_sprite and the sub sprite should be centered
// note: the button sprite should have 4 images (button,button_hover,button_press,button_glass_overlay)
var dx = argument0;
var dy = argument1;
var button_sprite = argument2;
var button_text = argument3;
var sub_sprite = argument4;
var sub_index = argument5;
var sub_image_offset = argument6;
var sub_image_scale = argument7;
var temp_color = draw_get_colour();
var temp_alpha = draw_get_alpha();
//
var x1 = dx-sprite_get_width(button_sprite)*0.5 + sprite_get_bbox_left(button_sprite);
var y1 = dy-sprite_get_height(button_sprite)*0.5 + sprite_get_bbox_top(button_sprite);
var x2 = dx-sprite_get_width(button_sprite)*0.5 + sprite_get_bbox_right(button_sprite);
var y2 = dy-sprite_get_height(button_sprite)*0.5 + sprite_get_bbox_bottom(button_sprite);
var mx = argument8;
var my = argument9;
//
var hover = false;
if mx>x1 && mx<x2 && my>y1 && my<y2{
    hover = true;
}
var pressed = false;
if hover{
    if mouse_check_button(mb_left) && !control.menu_scrolled{
        pressed = true;
    }
}

//button
draw_sprite(button_sprite,hover+pressed,dx,dy);
//sub image
if sub_sprite{
    draw_sprite_ext(sub_sprite,sub_index,dx+sub_image_offset,dy,sub_image_scale,sub_image_scale,0,-1,1);
}
//text
if button_text!=""{
    draw_set_halign(fa_center);
    draw_set_valign(fa_center);
    if temp_color==c_white{
        draw_set_color(c_black);
    }else{
        draw_set_color(c_white);
    }
    draw_text(x1+(x2-x1)*0.5+1+2*pressed,y1+(y2-y1)*0.5+1+2*pressed,button_text);
    draw_set_color(temp_color);
    draw_text(x1+(x2-x1)*0.5+2*pressed,y1+(y2-y1)*0.5+2*pressed,button_text);
}
//glass
draw_sprite(button_sprite,3,dx,dy);
//
if hover && mouse_check_button_released(mb_left) && !control.menu_scrolled{
    return 1;
}
return 0;


#define draw_button_simple_rel
///draw_button_simple_rel(x1,y1,x2,y2,text,c_color,mouse_x,mouse_y)
var x1 = argument0;
var y1 = argument1;
var x2 = argument2;
var y2 = argument3;
var button_text = argument4;
var color = argument5;
var x_mouse = argument6;
var y_mouse = argument7;
var temp_color = draw_get_colour();
var temp_alpha = draw_get_alpha();
//
var hover = false;
if x_mouse>x1 && x_mouse<x2 && y_mouse>y1 && y_mouse<y2{
    hover = true;
}
var pressed = false;
if hover{
    if mouse_check_button(mb_left) && !control.menu_scrolled{
        pressed = true;
    }
}

//
if hover{
    draw_set_alpha(0.8);
}else{
    draw_set_alpha(0.6);
}
//draw_button(x1,y1,x2,y2,!pressed);
if pressed{
    draw_set_color(c_black)
}else{
    draw_set_color(c_gray)
}
draw_rectangle(x1,y1,x2,y2,0);
if hover{
    draw_set_color(color);
    draw_rectangle(x1,y1,x2,y2,1);
}
draw_set_halign(fa_center);
draw_set_valign(fa_center);
if temp_color==c_white{
    draw_set_color(c_white);
}else{
    draw_set_color(c_black);
}
draw_set_alpha(temp_alpha)
draw_text(x1+(x2-x1)*0.5+1+2*pressed,y1+(y2-y1)*0.5+1+2*pressed,button_text);
if temp_color==c_white{
    draw_set_color(c_black);
}else{
    draw_set_color(c_white);
}
draw_text(x1+(x2-x1)*0.5+2*pressed,y1+(y2-y1)*0.5+2*pressed,button_text);

draw_set_color(temp_color);
//
if hover && mouse_check_button_released(mb_left) && !control.menu_scrolled{
    return 1;
}
return 0;