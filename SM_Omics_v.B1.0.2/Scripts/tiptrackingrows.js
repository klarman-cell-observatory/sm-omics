var row = 0;
var used_row = 0;
var need_tips;
var tip_box_to_Spawn;
var tips_on_row = 9;
var tips_off_row = 9;
var spare_tip_rows = 0;


function trackNewRows(row_num){

   row = row + row_num;
   print("The number of rows taken from the new tip box is " + row + " rows.")

   return row;

}
//********************************************
function trackUsedRows(used_row_num){
   
   used_row = used_row + used_row_num;
   print("The number of rows placed in the used tip box is " + used_row + " rows.")
  
   return used_col;
}
//********************************************
// functions written for head_mode hardcoded to 3 rows -> max rows = 6 instead of 8
function isFull(){
  if(used_row == 6){
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
  if(row == 6){
     print(plate.name + " " + plate.instance + " " + "Tip box empty.")
     //col = 0;
     return 1;
     }else
     {print(plate.name + " " + plate.instance + " " + "Tip box is not empty.")
      return 0;
     }
}

  
print("Successfully opened tiptracking.js file.")