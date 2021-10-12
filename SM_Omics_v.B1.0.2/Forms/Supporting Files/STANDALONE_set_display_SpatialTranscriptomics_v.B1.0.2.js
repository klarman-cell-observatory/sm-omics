//set protocol directory
var protocol_directory = "C:/VWorks Workspace/NGS Option B/SpatialTranscriptomics_v.B1.0.2/Protocol Files/"

function set_initial_state(functionProtocolName, function_columns_samples){
switch(functionProtocolName){
	// **************************************Next**************************************
    // ************************************Protocol************************************
	case "Part0_ProPlate_withTissueRemoval1_SpatialTranscriptomics_v.B1.0.2.rst":{
        formCass1Slot1 = "Wash Buffer 3 in Reservoir"
        formCass1Slot2 = "Wash Buffer 2 in Eppendorf"
        formCass1Slot3 = "Wash Buffer 1 in Eppendorf"
        formCass1Slot4 = ""
        formCass1Slot5 = "Mineral Oil in Eppendorf"
        formCass2Slot1 = "Empty Tip Box"
        formCass2Slot2 = "Empty Tip Box"
        formCass2Slot3 = ""
        formCass2Slot4 = ""
        formCass2Slot5 = "Tissue Removal in Eppendorf"
        formCass3Slot1 = ""
        formCass3Slot2 = "Empty Eppendorf on Short Res for Final collection"
        formCass3Slot3 = ""
        formCass3Slot4 = ""
        formCass3Slot5 = ""
        formCass4Slot1 = ""
        formCass4Slot2 = ""
        formCass4Slot3 = ""
        formCass4Slot4 = ""
        formCass4Slot5 = ""
        formBravoPos1  = "Empty Tip Box"
        formBravoPos2  = "New Tip Box"
        formBravoPos3  = ""
        formBravoPos4  = "cDNA Synth/Probe Release Plate (Prompted)"
        formBravoPos5  = "Pre/Permeabilization Plate"
        formBravoPos6  = "ProPlate in Holder"
        formBravoPos7  = "Waste Plate (NO MAG)"
        formBravoPos8  = ""
        formBravoPos9  = ""
		formBravo4Temp = "4C"
		formBravo6Temp = "37C"
		formBravo9Temp = ""

		formStacker1 = "6 Tip Boxes"
		formStacker2 = "Empty"
        }break;
	// **************************************Next**************************************
    // ************************************Protocol************************************
	case "Part0_ProPlate_withoutTissueRemoval1_SpatialTranscriptomics_v.B1.0.2.rst":{
        formCass1Slot1 = "Wash Buffer 3 in Reservoir"
        formCass1Slot2 = "Wash Buffer 2 in Eppendorf"
        formCass1Slot3 = "Wash Buffer 1 in Eppendorf"
        formCass1Slot4 = ""
        formCass1Slot5 = "Mineral Oil in Eppendorf"
        formCass2Slot1 = "Empty Tip Box"
        formCass2Slot2 = "Empty Tip Box"
        formCass2Slot3 = ""
        formCass2Slot4 = ""
        formCass2Slot5 = "Tissue Removal 2 in Eppendorf"
        formCass3Slot1 = ""
        formCass3Slot2 = "Empty Eppendorf on Short Res for Final collection"
        formCass3Slot3 = ""
        formCass3Slot4 = ""
        formCass3Slot5 = ""
        formCass4Slot1 = ""
        formCass4Slot2 = ""
        formCass4Slot3 = ""
        formCass4Slot4 = ""
        formCass4Slot5 = ""
        formBravoPos1  = "Empty Tip Box"
        formBravoPos2  = "New Tip Box"
        formBravoPos3  = ""
        formBravoPos4  = "cDNA Synth/Probe Release Plate (prompted)"
        formBravoPos5  = "Pre/Permeabilization Plate"
        formBravoPos6  = "ProPlate in Holder"
        formBravoPos7  = "Waste Plate (NO MAG)"
        formBravoPos8  = ""
        formBravoPos9  = ""
		formBravo4Temp = "4C"
		formBravo6Temp = "37C"
		formBravo9Temp = ""

		formStacker1 = "5 Tip Boxes"
		formStacker2 = "Empty"
        }break;
	// **************************************Next**************************************
    // ************************************Protocol************************************
    case "Part1_SpatialTranscriptomics_v.B1.0.2.rst":{
        formCass1Slot1 = "Ethanol Reservoir";
        formCass1Slot2 = "Water Reservoir";
        formCass1Slot3 = "";
        formCass1Slot4 = "";
        formCass1Slot5 = "Eppendorf with 100 uL beads";
        formCass2Slot3 = "New PCR plate";
        formCass2Slot4 = "";
        formCass2Slot5 = "Eppendorf with 81 uL beads";

        formCass3Slot3 = "";
        formCass3Slot4 = "New PCR plate for final sample collection";
        if(columns_samples == 12){
				formCass2Slot1 = "New Tip Box";
				formCass2Slot2 = "New Tip Box";
				formCass3Slot1 = "New Tip Box";
				formCass3Slot2 = "New Tip Box";
				formCass4Slot2 = "";
				formCass3Slot5 = "New Tip Box";
				formCass4Slot5 = "New Tip Box";
					}
		else{
				formCass2Slot1 = "";
				formCass2Slot2 = "";
				formCass3Slot1 = "";
				formCass3Slot2 = "";
				formCass4Slot2 = "";
				formCass3Slot5 = "";
				formCass4Slot5 = "";
						}
				formCass4Slot1 = "";
        formCass4Slot3 = "";
        formCass4Slot4 = "";
				formBravoPos1 = "Deepwell Waste Plate";
        formBravoPos2  = "New Tip Box";
        formBravoPos3  = "";
				formBravoPos4 = "Pre-set to 15C, prompted for 70 uL cDNA:RNA in PCR Plate";
        formBravoPos5  = "";
				formBravoPos6 = "Pre-set to 4C, prompted for Reagent Plate";
        formBravoPos7  = "";
        formBravoPos8  = "Empty Tip Box";
        formBravoPos9  = "";
				formBravo4Temp = "";
				formBravo6Temp = "";
				formBravo9Temp = "0C";
       //Cases below refer to the number of columns selected on form
        print("Number of Columns selected is "+function_columns_samples)
        switch (function_columns_samples){
            case 1:
                formStacker1 = "1 Tip Box"
                formStacker2 = "Empty"
                print("Case: 1 Columns")
                break;
            case 2:
                formStacker1 = "3 Tip Boxes"
                formStacker2 = "Empty"
                print("Case: 2 Columns")
                break;
            case 3:
                formStacker1 = "4 Tip Boxes"
                formStacker2 = "Empty"
                print("Case: 3 Columns")
                break;
            case 4:
                formStacker1 = "6 Tip Boxes"
                formStacker2 = "Empty"
                print("Case: 4 Columns")
                break;
            case 6:
                formStacker1 = "9 Tip Boxes"
                formStacker2 = "Empty"
                print("Case: 6 Columns")
                break;
            case 12:
                formStacker1 = "11 Tip Boxes"
                formStacker2 = "Empty"
                print("Case: 12 Columns")
                break;
            default:
                formStacker1 = "Enter Column Number"
                formStacker2 = "Enter Column Number"
                break;
        }break
    		}
    // **************************************Next**************************************
    // ************************************Protocol************************************
    case "Part2_SpatialTranscriptomics_v.B1.0.2.rst":{
        formCass1Slot1 = "Ethanol Reservoir";
        formCass1Slot2 = "Water Reservoir";
        formCass1Slot3 = "New PCR plate";
        formCass1Slot4 = "";
        formCass1Slot5 = "Eppendorf with 54 uL beads";
        formCass2Slot3 = "";
        formCass2Slot4 = "New PCR plate for final sample collection";
        formCass2Slot5 = "Eppendorf with 54 uL beads";

        formCass3Slot3 = "";
        formCass3Slot4 = "";
						if(columns_samples == 12){
								formCass2Slot1 = "New Tip Box";
        				formCass2Slot2 = "New Tip Box";
        				formCass3Slot1 = "New Tip Box";
        				formCass3Slot2 = "New Tip Box";
        				formCass4Slot2 = "New Tip Box";
        				formCass4Slot1 = "New Tip Box";
								formCass3Slot5 = "New Tip Box";
        				formCass4Slot5 = "New Tip Box";
									}
						else{
							formCass2Slot1 = "";
        			formCass2Slot2 = "";
        			formCass3Slot1 = "";
        			formCass3Slot2 = "";
        			formCass4Slot2 = "";
        			formCass4Slot1 = "";
							formCass3Slot5 = "";
        			formCass4Slot5 = "";
								}

				formCass4Slot3 = "";
        formCass4Slot4 = "";

				formBravoPos1 = "Deepwell Waste Plate"
        formBravoPos2  = "New Tip Box";
        formBravoPos3  = "";
				formBravoPos4 = "Pre-set to 4C, prompted for Reagent Plate";
        formBravoPos5  = "";
				formBravoPos6 = "Pre-set to 4C, prompted for 10.5 uL denatured aRNA and adapters in PCR Plate";
        formBravoPos7  = "";
        formBravoPos8  = "Empty Tip Box";
        formBravoPos9  = "";
				formBravo4Temp = ""
				formBravo6Temp = ""
				formBravo9Temp = "0C"

        print("Number of Columns selected is "+function_columns_samples)
        switch (function_columns_samples){
            case 1:
                formStacker1 = "1 Tip Box"
                formStacker2 = "Empty"
                print("Case: 1 Columns")
                break;
            case 2:
                formStacker1 = "3 Tip Boxes"
                formStacker2 = "Empty"
                print("Case: 2 Columns")
                break;
            case 3:
                formStacker1 = "5 Tip Boxes"
                formStacker2 = "Empty"
                print("Case: 3 Columns")
                break;
            case 4:
                formStacker1 = "7 Tip Boxes"
                formStacker2 = "Empty"
                print("Case: 4 Columns")
                break;
            case 6:
                formStacker1 = "10 Tip Boxes"
                formStacker2 = "Empty"
                print("Case: 6 Columns")
                break;
            case 12:
                formStacker1 = "11 Tip Boxes"
                formStacker2 = "Empty"
                print("Case: 12 Columns")
                break;
            default:
                formStacker1 = "Enter Column Number"
                formStacker2 = "Enter Column Number"
                break;
        }break
    }
	// **************************************Next**************************************
	// ************************************Protocol************************************
	case "Purification_C.pro":{
	        formCass1Slot1 = "Ethanol Reservoir";
	        formCass1Slot2 = "";
	        formCass1Slot3 = "";
	        formCass1Slot4 = "96 Well Eppendorf Reaction Plate";
	        formCass1Slot5 = "";
			formCass2Slot1 = "Elution Buffer Reservoir";
			formCass2Slot2 = "";
			formCass2Slot3 = "";
			formCass2Slot4 = "";
			formCass2Slot5 = "96 Well Eppendorf Collection Plate";
			formCass3Slot1 = "";
			formCass3Slot2 = "";
			formCass3Slot3 = "";
			formCass3Slot4 = "";
			formCass3Slot5 = "";
			formCass4Slot1 = "";
			formCass4Slot2 = "";
			formCass4Slot3 = "";
			formCass4Slot4 = "";
			formCass4Slot5 = "";

			formBravoPos1 = "Deepwell Waste Plate"
			formBravoPos2  = "New Tip Box";
			formBravoPos3  = "";
			formBravoPos4 = "Pre-set to 4C";
			formBravoPos5  = "Beads/AMPure XP Plate";
			formBravoPos6 = "Pre-set to 4C, prompted for Collection plate";
			formBravoPos7  = "";
			formBravoPos8  = "Empty Tip Box";
			formBravoPos9  = "";
				formBravo4Temp = "4C"
				formBravo6Temp = "4C"
				formBravo9Temp = ""

	        print("Number of Columns selected is "+function_columns_samples)
	        switch (function_columns_samples){
	            case 1:
	                formStacker1 = "1 Tip Box"
	                formStacker2 = "Empty"
	                print("Case: 1 Columns")
	                break;
	            case 2:
	                formStacker1 = "3 Tip Boxes"
	                formStacker2 = "Empty"
	                print("Case: 2 Columns")
	                break;
	            case 3:
	                formStacker1 = "5 Tip Boxes"
	                formStacker2 = "Empty"
	                print("Case: 3 Columns")
	                break;
	            case 4:
	                formStacker1 = "7 Tip Boxes"
	                formStacker2 = "Empty"
	                print("Case: 4 Columns")
	                break;
	            case 6:
	                formStacker1 = "10 Tip Boxes"
	                formStacker2 = "Empty"
	                print("Case: 6 Columns")
	                break;
	            case 12:
	                formStacker1 = "11 Tip Boxes"
	                formStacker2 = "Empty"
	                print("Case: 12 Columns")
	                break;
	            default:
	                formStacker1 = "Enter Column Number"
	                formStacker2 = "Enter Column Number"
	                break;
	        }break
	    }

	// **************************************Next**************************************
    // ************************************Protocol************************************
	case "Empty":{
        formCass1Slot1 = ""
        formCass1Slot2 = ""
        formCass1Slot3 = ""
        formCass1Slot4 = ""
        formCass1Slot5 = ""
        formCass2Slot1 = ""
        formCass2Slot2 = ""
        formCass2Slot3 = ""
        formCass2Slot4 = ""
        formCass2Slot5 = ""
        formCass3Slot1 = ""
        formCass3Slot2 = ""
        formCass3Slot3 = ""
        formCass3Slot4 = ""
        formCass3Slot5 = ""
        formCass4Slot1 = ""
        formCass4Slot2 = ""
        formCass4Slot3 = ""
        formCass4Slot4 = ""
        formCass4Slot5 = ""
        formBravoPos1  = ""
        formBravoPos2  = ""
        formBravoPos3  = ""
        formBravoPos4  = ""
        formBravoPos5  = ""
        formBravoPos6  = ""
        formBravoPos7  = ""
        formBravoPos8  = ""
        formBravoPos9  = ""
		formBravo4Temp = ""
		formBravo6Temp = ""
		formBravo9Temp = ""

        print("Number of Columns selected is "+function_columns_samples)
        switch (function_columns_samples){
            case 1:
                formStacker1 = ""
                formStacker2 = ""
                print("Case: 1 Columns")
                break;
            case 2:
                formStacker1 = ""
                formStacker2 = ""
                print("Case: 2 Columns")
                break;
            case 3:
                formStacker1 = ""
                formStacker2 = ""
                print("Case: 3 Columns")
                break;
            case 4:
                formStacker1 = ""
                formStacker2 = ""
                print("Case: 4 Columns")
                break;
            case 6:
                formStacker1 = ""
                formStacker2 = ""
                print("Case: 6 Columns")
                break;
            case 12:
                formStacker1 = ""
                formStacker2 = ""
                print("Case: 12 Columns")
                break;
            default:
                formStacker1 = "Enter Column Number"
                formStacker2 = "Enter Column Number"
                break;
        }break;
    }
    // **************************************Next**************************************
    // ************************************Protocol************************************
    default:{
        formCass1Slot1 = ""
        formCass1Slot2 = ""
        formCass1Slot3 = ""
        formCass1Slot4 = ""
        formCass1Slot5 = ""
        formCass2Slot1 = ""
        formCass2Slot2 = ""
        formCass2Slot3 = ""
        formCass2Slot4 = ""
        formCass2Slot5 = ""
        formCass3Slot1 = ""
        formCass3Slot2 = ""
        formCass3Slot3 = ""
        formCass3Slot4 = ""
        formCass3Slot5 = ""
        formCass4Slot1 = ""
        formCass4Slot2 = ""
        formCass4Slot3 = ""
        formCass4Slot4 = ""
        formCass4Slot5 = ""
        formBravoPos1  = ""
        formBravoPos2  = ""
        formBravoPos3  = ""
        formBravoPos4  = ""
        formBravoPos5  = ""
        formBravoPos6  = ""
        formBravoPos7  = ""
        formBravoPos8  = ""
        formBravoPos9  = ""
				formBravo4Temp = ""
				formBravo6Temp = ""
				formBravo9Temp = ""

        print("Number of Columns selected is "+function_columns_samples)
        switch (function_columns_samples){
            case 1:
                formStacker1 = ""
                formStacker2 = ""
                print("Case: 1 Columns")
                break;
            case 2:
                formStacker1 = ""
                formStacker2 = ""
                print("Case: 2 Columns")
                break;
            case 3:
                formStacker1 = ""
                formStacker2 = ""
                print("Case: 3 Columns")
                break;
            case 4:
                formStacker1 = ""
                formStacker2 = ""
                print("Case: 4 Columns")
                break;
            case 6:
                formStacker1 = ""
                formStacker2 = ""
                print("Case: 6 Columns")
                break;
            case 12:
                formStacker1 = ""
                formStacker2 = ""
                print("Case: 12 Columns")
                break;
            default:
                formStacker1 = "Enter Column Number"
                formStacker2 = "Enter Column Number"
                break;
        }break;
    }
}

}

//clean up form
if(protocol_selected=="none"){
	form_protocol_selected=""
}
else {
	form_protocol_selected = protocol_directory+protocol_selected
}
