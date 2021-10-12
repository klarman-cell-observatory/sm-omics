var col = 0;
var used_col = 0;
var mastermix_col;
var need_tips;
var Nunc;
var tip_box_to_Spawn;
var columns_samples;
var head_mode;
var tips_on_loc = 13;
var tips_off_loc = 13;
var Collection;
var DNA_plate;
var spri_case;


function trackNew(col_num){

   col = col + col_num;
   print("The number of columns taken from the new tip box is " + col + " columns.")

   return col;

}
//********************************************
function trackUsed(used_num){
   
   used_col = used_col + used_num;
   print("The number of columns placed in the used tip box is " + used_col + " columns.")
  
   return used_col;
}
//********************************************
function isFull(){
  if(used_col == 12){
    print(plate.name + " " + plate.instance + " " + "Used tip box is full.")
    //used_col = 0;
    return 1;
    }else
    {print(plate.name + " " + plate.instance + " " + "Used tip box is not full.")
    return 0;
    }
}   
//********************************************

function isEmpty(){
  if(col == 12){
     print(plate.name + " " + plate.instance + " " + "Tip box empty.")
     //col = 0;
     return 1;
     }else
     {print(plate.name + " " + plate.instance + " " + "Tip box is not empty.")
      return 0;
     }
}

//********************************************
function getNumColumns(samples){
   columns_samples = Math.ceil((parseInt(samples)/8))
   
   //if the number of columns if 5, do 6
   if(columns_samples == 5){
   columns_samples = 6
   }

   //if the number of columns is greater than 6, do 12
   if(columns_samples > 6){
   columns_samples = 12
   }
   print("The number of columns of samples is " + columns_samples + "\n")
   
}
//*********************************************
function setHeadForRun(columns_samples){

   head_mode = "3,3,8," + columns_samples
  
   print("The head mode configuration is " + head_mode + "\n")

}
//*********************************************
function getprotocolvariables(){

    var temp_file = "C:\\VWorks Workspace\\NGS Option B\\SpatialTranscriptomics_v.B1.0.2\\Scripts\\ST_temp.txt"

    var input_f = file_read(temp_file)

    var parsedfile = input_f.split("\n")

     need_tips = parseInt(parsedfile[0],10)
     col = parseInt(parsedfile[1],10)
     used_col = parseInt(parsedfile[2],10)
     Nunc_location = parsedfile[3].toString()
     head_mode = parsedfile[4].toString()
     columns_samples = parseInt(parsedfile[5],10)
     tips_on_loc = parseInt(parsedfile[6],10)
     tips_off_loc = parseInt(parsedfile[7],10)
     spri_case = parseInt(parsedfile[8],10)
	 protocol_testing = parseInt(parsedfile[9],10)
	tipBox = parseInt(parsedfile[10],10)

print(need_tips + "\n" + col + "\n" + used_col + "\n" + Nunc_location + "\n" + head_mode + "\n" + columns_samples + "\n" + tips_on_loc + "\n" + tips_off_loc + "\n" + spri_case + "\n" + protocol_testing + "\n" + tipBox)
print("Successfully retrieved variables from previous protocol")


//****************************************
//define tip box loading/unloading locations
tipLocation = ["Cassette3Slot5","Cassette4Slot5","Cassette2Slot2","Cassette2Slot1","Cassette3Slot2","Cassette3Slot1","Cassette4Slot2", "Cassette4Slot1"]
}
  
print("Successfully opened tiptracking.js file.")