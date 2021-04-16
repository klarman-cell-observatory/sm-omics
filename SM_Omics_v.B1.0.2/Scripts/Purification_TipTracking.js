//Script originally written by Agilent
// Modified by Margaret Tyer (mtyer@broadinstitute.org) for use in a customized, standalone protocol
// Modifications break runset functionality, variables must be pre-defined for use. No variables will carry over between runs
// Modifications originally implemented on 10/29/2019
// Original script will not be overwritten. Original script can be found by searching for "tiptracking.js" within the Script folder for NGS Option B

var col = 0;
var used_col = 0;
var mastermix_col;
var need_tips;
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

   //if the number of columns is 5, do 6
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
//Original script retrieved variable values from the ST_temp.txt file created during each runset
//Because this protocol is supposed to be standalone and work outside a runset, temp file path was changed to be
// pre-defined each run, rather than carry over from some previous run
//Fix spri_case so it will call for only one specific case of variables that I define
    
	var temp_file = "C:\\VWorks Workspace\\NGS Option B\\SpatialTranscriptomics_v.B1.0.2\\Scripts\\Purification_values.txt"

    var input_f = file_read(temp_file)

    var parsedfile = input_f.split("\n")

     need_tips = parseInt(parsedfile[0],10)
     col = parseInt(parsedfile[1],10)
     used_col = parseInt(parsedfile[2],10)
     tips_on_loc = parseInt(parsedfile[3],10)
     tips_off_loc = parseInt(parsedfile[4],10)
     spri_case = parseInt(parsedfile[5],10)
	 protocol_testing = parseInt(parsedfile[6],10)
	 tipBox = parseInt(parsedfile[7],10)

print(need_tips + "\n" + col + "\n" + used_col + "\n" + tips_on_loc + "\n" + tips_off_loc + "\n" + spri_case + "\n" + protocol_testing + "\n" + tipBox)
print("Successfully retrieved variables")


//****************************************
//define tip box loading/unloading locations
//tipLocation = ["Cassette3Slot5","Cassette4Slot5","Cassette2Slot2","Cassette2Slot1","Cassette3Slot2","Cassette3Slot1","Cassette4Slot2", "Cassette4Slot1"]
}

print("Successfully opened Purification_TipTracking.js file.")
