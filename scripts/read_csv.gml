#define read_csv
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
car_instance_id_list=ds_list_create();

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
        var last_id=0;
        for(var i=0;i<string_length(temp_string);i++){
            var char = string_char_at(temp_string,i);
            if char==","{
                //FIXME: all list need to be the same length, errors will happen if cells are missing in the csv.
                if j==1{
                    last_id = real(cell_string);
                    var temp_car =-1;
                    //chack if the car id is already in the list
                    var temp_i = ds_list_find_index(id_compiled_list,real(cell_string));
                    if temp_i>=0{
                        //if it is, add one to the id count
                        ds_list_replace(id_compiled_count_list,temp_i,ds_list_find_value(id_compiled_count_list,temp_i)+1);
                    }else{
                        //make a new car and add its id to the list
                        ds_list_add(id_compiled_list,real(cell_string));
                        ds_list_add(id_compiled_count_list,1);
                        temp_car = instance_create(0,0,car);
                        temp_car.data_id = real(cell_string);
                        ds_list_add(car_instance_id_list,temp_car);
                    }
                    //uncompiled id list
                    ds_list_add(id_list,real(cell_string));
                }
                //find the car for the data to go in.
                var temp_search = ds_list_find_index(id_compiled_list,last_id);
                var temp_car = ds_list_find_value(car_instance_id_list,temp_search);
                //uncompiled data
                if j==3{
                    ds_list_add(lon_list,real(cell_string));//dont need the data in these lists anymore
                    temp_car.data[temp_car.time_count,2] = real(cell_string);//give the data to the car
                }
                if j==4{ds_list_add(lat_list,real(cell_string));temp_car.data[temp_car.time_count,1]=real(cell_string)}
                if j==5{ds_list_add(speed_list,real(cell_string));temp_car.data[temp_car.time_count,4]=real(cell_string)}
                if j==6{ds_list_add(direction_list,real(cell_string));temp_car.data[temp_car.time_count,4]=real(cell_string)}
                if j==7{ds_list_add(passenger_list,real(cell_string));temp_car.data[temp_car.time_count,3]=real(cell_string)}
                if j==9{ds_list_add(time_list,time_list);temp_car.data[temp_car.time_count,0]=get_time(cell_string);temp_car.time_count++;}
                j++;
                cell_string="";
            }else{
                cell_string += char;
            }
        }
        temp_string = file_text_readln(csv);
    }
}

#define get_time
///get_time(time_date_string)
var time_string = argument0;

//   "2010-06-01 00:00:41.077000000"
var j=0;
var sec="";
for(var i=0;i<string_length(time_string);i++){
    var c = string_char_at(time_string,i);
    if j=2{
        if c=" "{break}
        sec+=c;
    }
    if (c=':'){
        j++;   
    }
}
//
return real(sec);