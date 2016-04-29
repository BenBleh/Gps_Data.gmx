///read_csv(file.csv)
var fname = argument0;
//create the list to hold that data
lat_list = ds_list_create();
lon_list = ds_list_create();
time_list = ds_list_create();
id_list = ds_list_create();
speed_list = ds_list_create();
direction_list = ds_list_create();
passenger_list = ds_list_create();

id_compiled_list = ds_list_create();
id_compiled_count_list = ds_list_create();

//
if file_exists(fname){
    csv = file_text_open_read(fname);
    var temp_string = file_text_readln(csv);
    var k=0;
    var test=0;
    while(temp_string!="" && string_length(temp_string)>1){
        test++;
        if test=340{
            test++;
            test--;
        }
        var j=0;
        var cell_string="";
        for(var i=0;i<string_length(temp_string);i++){
            var char = string_char_at(temp_string,i);
            if char==","{
                //FIXME: all list need to be the same length, errors will happen if cells are missing in the csv.
                if j==1{
                    var temp_i = ds_list_find_index(id_compiled_list,real(cell_string));
                    if temp_i>=0{
                        ds_list_replace(id_compiled_count_list,temp_i,ds_list_find_value(id_compiled_count_list,temp_i)+1);
                    }else{
                        ds_list_add(id_compiled_list,real(cell_string));
                        ds_list_add(id_compiled_count_list,1);
                    }
                    ds_list_add(id_list,real(cell_string));
                }
                if j==3{ds_list_add(lon_list,real(cell_string));}
                if j==4{ds_list_add(lat_list,real(cell_string));}
                if j==5{ds_list_add(speed_list,real(cell_string));}
                if j==6{ds_list_add(direction_list,real(cell_string));}
                if j==7{ds_list_add(passenger_list,real(cell_string));}
                if j==9{ds_list_add(time_list,time_list);}
                j++;
                cell_string="";
            }else{
                cell_string += char;
            }
        }
        temp_string = file_text_readln(csv);
    }
}
