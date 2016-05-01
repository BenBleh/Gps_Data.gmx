///ds_grid_get_safe(grid,x,y,value)
var _grid = argument0;
var _dx = round(argument1);
var _dy = round(argument2);

//
var _width = ds_grid_width(_grid);
var _height = ds_grid_height(_grid);

//
if _dx>=0 && _dy>=0 && _dx<_width && _dy<_height{
    return ds_grid_get(_grid,_dx,_dy);
}else{
    return -1;
}
