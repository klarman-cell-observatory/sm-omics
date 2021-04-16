<?xml version='1.0' encoding='ASCII' ?>
<Velocity11 file='Protocol_Data' md5sum='594c1b77766cce4a7222596febf64be9' version='2.0' >
	<File_Info AllowSimultaneousRun='0' AutoExportGanttChart='0' AutoLoadRacks='When the main protocol starts' AutoUnloadRacks='0' AutomaticallyLoadFormFile='0' Barcodes_Directory='' ClearInventory='0' DeleteHitpickFiles='1' Description='' Device_File='C:\VWorks Workspace\NGS Option B\SpatialTranscriptomics_v.B1.0.2\Device Files\BravoMiniPHBenchCel2R_round_magnet.dev' Display_User_Task_Descriptions='1' DynamicAssignPlateStorageLoad='0' FinishScript='' Form_File='C:\VWorks Workspace\NGS Option B\SpatialTranscriptomics_v.B1.0.2\Forms\SpatialTranscriptomics_v.B1.0.2.VWForm' HandlePlatesInInstance='1' ImportInventory='0' InventoryFile='' Notes='' PipettePlatesInInstanceOrder='0' Protocol_Alias='' StartScript='open( &apos;C:/VWorks Workspace/NGS Option B/SpatialTranscriptomics_v.B1.0.2/Scripts/tiptracking.js&apos;);
open( &apos;C:/VWorks Workspace/NGS Option B/SpatialTranscriptomics_v.B1.0.2/Scripts/file_operations.js&apos;);
' Use_Global_JS_Context='1' />
	<Processes >
		<Startup_Processes >
			<Process >
				<Minimized >0</Minimized>
				<Task Name='BuiltIn::User Message' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Task_Skipped >0</Task_Skipped>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='4' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='if(!protocol_testing &amp;&amp; !skip_long_inc){
   task.skip()
}' />
					<Parameters >
						<Parameter Category='' Name='Title' Value='' />
						<Parameter Category='' Name='Body' Value='WARNING: A checkbox under TESTING ONLY has been selected. This will reduce incubation times, mix cycles, and temperature settings. If this is desired, click Continue, otherwise, click pause, uncheck the box, and then click Continue.' />
						<Parameter Category='' Name='Only show the first time' Value='' />
						<Parameter Category='' Name='Display dialog box' Value='1' />
						<Parameter Category='' Name='Pause process' Value='1' />
						<Parameter Category='' Name='Email' Value='0' />
						<Parameter Category='' Name='Twitter message' Value='0' />
						<Parameter Category='Scripting variable data entry' Name='User data entry into variable' Value='0' />
						<Parameter Category='Scripting variable data entry' Name='Variable name' Value='' />
						<Parameter Category='Task Description' Name='Task number' Value='1' />
						<Parameter Category='Task Description' Name='Task description' Value='User Message' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
				</Task>
				<Task Name='Bravo::Set temperature - Position' >
					<Devices >
						<Device Device_Name='Bravo - 1' Location_Name='1' />
					</Devices>
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Task_Skipped >0</Task_Skipped>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='2' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='if(protocol_testing){task.skip()}
//targeting 16C' />
					<Parameters >
						<Parameter Category='' Name='Location' Value='4' />
						<Parameter Category='' Name='Turn off temperature' Value='0' />
						<Parameter Category='' Name='Temperature' Value='4' />
						<Parameter Category='' Name='Wait' Value='0' />
						<Parameter Category='' Name='Temperature Tolerance' Value='2' />
						<Parameter Category='' Name='Timeout' Value='10' />
						<Parameter Category='' Name='Allow concurrent operation' Value='0' />
						<Parameter Category='Task Description' Name='Task number' Value='2' />
						<Parameter Category='Task Description' Name='Task description' Value='Set temperature - Position (Bravo)' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
				</Task>
				<Task Name='Bravo::Set temperature - Position' >
					<Devices >
						<Device Device_Name='Bravo - 1' Location_Name='1' />
					</Devices>
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Task_Skipped >0</Task_Skipped>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='3' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='if(protocol_testing){task.skip()}' />
					<Parameters >
						<Parameter Category='' Name='Location' Value='6' />
						<Parameter Category='' Name='Turn off temperature' Value='0' />
						<Parameter Category='' Name='Temperature' Value='4' />
						<Parameter Category='' Name='Wait' Value='1' />
						<Parameter Category='' Name='Temperature Tolerance' Value='1' />
						<Parameter Category='' Name='Timeout' Value='20' />
						<Parameter Category='' Name='Allow concurrent operation' Value='0' />
						<Parameter Category='Task Description' Name='Task number' Value='3' />
						<Parameter Category='Task Description' Name='Task description' Value='Set temperature - Position at Location 6' />
						<Parameter Category='Task Description' Name='Use default task description' Value='0' />
					</Parameters>
				</Task>
				<Task Name='Bravo::Set temperature - Position' >
					<Devices >
						<Device Device_Name='Bravo - 1' Location_Name='1' />
					</Devices>
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Task_Skipped >0</Task_Skipped>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='185' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='' />
					<Parameters >
						<Parameter Category='' Name='Location' Value='4' />
						<Parameter Category='' Name='Turn off temperature' Value='0' />
						<Parameter Category='' Name='Temperature' Value='4' />
						<Parameter Category='' Name='Wait' Value='1' />
						<Parameter Category='' Name='Temperature Tolerance' Value='1' />
						<Parameter Category='' Name='Timeout' Value='20' />
						<Parameter Category='' Name='Allow concurrent operation' Value='0' />
						<Parameter Category='Task Description' Name='Task number' Value='4' />
						<Parameter Category='Task Description' Name='Task description' Value='Set temperature - Position (Bravo)' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
				</Task>
				<Task Name='BuiltIn::User Message' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Task_Skipped >0</Task_Skipped>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='66' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='' />
					<Parameters >
						<Parameter Category='' Name='Title' Value='' />
						<Parameter Category='' Name='Body' Value='CPACs have reached temperature
Please place plates on Bravo deck' />
						<Parameter Category='' Name='Only show the first time' Value='' />
						<Parameter Category='' Name='Display dialog box' Value='1' />
						<Parameter Category='' Name='Pause process' Value='1' />
						<Parameter Category='' Name='Email' Value='0' />
						<Parameter Category='' Name='Twitter message' Value='0' />
						<Parameter Category='Scripting variable data entry' Name='User data entry into variable' Value='0' />
						<Parameter Category='Scripting variable data entry' Name='Variable name' Value='' />
						<Parameter Category='Task Description' Name='Task number' Value='5' />
						<Parameter Category='Task Description' Name='Task description' Value='User Message' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
				</Task>
				<Task Name='BuiltIn::Configure Labware' >
					<Devices >
						<Device Device_Name='Bravo - 1' Location_Name='' />
					</Devices>
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Task_Skipped >0</Task_Skipped>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings />
					<TaskScript Name='TaskScript' Value='//sets head_mode var based on column number
//only used in spri steps
setHeadForRun(columns_samples)

//used for special tip tracking in purification protocol 
section = &quot;1A&quot;' />
					<Parameters >
						<Parameter Category='' Name='Device to use' Value='Bravo - 1' />
						<Parameter Category='' Name='Display confirmation' Value='' />
						<Parameter Category='' Name='1' Value='96 Costar 3961 PP 2ml assay block' />
						<Parameter Category='' Name='2' Value='' />
						<Parameter Category='' Name='3' Value='' />
						<Parameter Category='' Name='4' Value='' />
						<Parameter Category='' Name='5' Value='' />
						<Parameter Category='' Name='6' Value='' />
						<Parameter Category='' Name='7' Value='' />
						<Parameter Category='' Name='8' Value='' />
						<Parameter Category='' Name='9' Value='' />
						<Parameter Category='Task Description' Name='Task number' Value='6' />
						<Parameter Category='Task Description' Name='Task description' Value='Configure Labware' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
				</Task>
				<Plate_Parameters >
					<Parameter Name='Plate name' Value='startup process - 1' />
				</Plate_Parameters>
				<Quarantine_After_Process >0</Quarantine_After_Process>
			</Process>
		</Startup_Processes>
		<Main_Processes >
			<Process >
				<Minimized >0</Minimized>
				<Task Name='BuiltIn::Place Plate' >
					<Devices >
						<Device Device_Name='Bravo - 1' Location_Name='4' />
					</Devices>
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Task_Skipped >0</Task_Skipped>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings />
					<TaskScript Name='TaskScript' Value='' />
					<Parameters >
						<Parameter Category='Task Description' Name='Task number' Value='1' />
						<Parameter Category='Task Description' Name='Task description' Value='Place Plate' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
						<Parameter Category='' Name='Device to use' Value='Bravo - 1' />
						<Parameter Category='' Name='Location to use' Value='4' />
					</Parameters>
				</Task>
				<Task Name='BuiltIn::Spawn Process' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Task_Skipped >0</Task_Skipped>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings />
					<TaskScript Name='TaskScript' Value='' />
					<Parameters >
						<Parameter Category='' Name='Process to spawn' Value='tips1' />
						<Parameter Category='' Name='Spawn as subroutine' Value='' />
						<Parameter Category='' Name='Spawn parameter' Value='' />
					</Parameters>
				</Task>
				<Task Name='BuiltIn::Spawn Process' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Task_Skipped >0</Task_Skipped>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings />
					<TaskScript Name='TaskScript' Value='' />
					<Parameters >
						<Parameter Category='' Name='Process to spawn' Value='MasterMix Plate' />
						<Parameter Category='' Name='Spawn as subroutine' Value='' />
						<Parameter Category='' Name='Spawn parameter' Value='' />
					</Parameters>
				</Task>
				<Task Name='Bravo::SubProcess' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Task_Skipped >0</Task_Skipped>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings />
					<TaskScript Name='TaskScript' Value='' />
					<Parameters >
						<Parameter Category='' Name='Sub-process name' Value='RNase H addition' />
						<Parameter Category='Static labware configuration' Name='Display confirmation' Value='Don&apos;t display' />
						<Parameter Category='Static labware configuration' Name='1' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='2' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='3' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='4' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='5' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='6' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='7' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='8' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='9' Value='&lt;use default&gt;' />
					</Parameters>
					<Parameters >
						<Parameter Centrifuge='0' Name='SubProcess_Name' Pipettor='1' Value='RNase H addition' />
					</Parameters>
				</Task>
				<Task Name='BuiltIn::Incubate' >
					<Devices >
						<Device Device_Name='Bravo - 1' Location_Name='4' />
					</Devices>
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Task_Skipped >0</Task_Skipped>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings />
					<TaskScript Name='TaskScript' Value='if(protocol_testing || skip_long_inc){
task.Incubationtime = 10
}
update_status(&quot;2 hour incubation at 16C&quot;)' />
					<Parameters >
						<Parameter Category='Task Description' Name='Task number' Value='5' />
						<Parameter Category='Task Description' Name='Task description' Value='Incubate' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
						<Parameter Category='' Name='Incubation time' Value='7200' />
						<Parameter Category='' Name='Use relative timing' Value='0' />
						<Parameter Category='' Name='Allow plates to incubate at locations with BCRs' Value='0' />
					</Parameters>
				</Task>
				<Task Name='BuiltIn::Signal' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Task_Skipped >0</Task_Skipped>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings />
					<TaskScript Name='TaskScript' Value='' />
					<Waitfors_To_Signal >
						<Waitfor Name='Waitfor2hrIncubationFinish' />
					</Waitfors_To_Signal>
				</Task>
				<Task Name='BuiltIn::Wait For' Waitfor='WaitforReagentPlateMove' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Task_Skipped >0</Task_Skipped>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings />
					<TaskScript Name='TaskScript' Value='' />
				</Task>
				<Task Name='BuiltIn::Place Plate' >
					<Devices >
						<Device Device_Name='Bravo - 1' Location_Name='6' />
					</Devices>
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Task_Skipped >0</Task_Skipped>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings />
					<TaskScript Name='TaskScript' Value='' />
					<Parameters >
						<Parameter Category='Task Description' Name='Task number' Value='8' />
						<Parameter Category='Task Description' Name='Task description' Value='Place Plate' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
						<Parameter Category='' Name='Device to use' Value='Bravo - 1' />
						<Parameter Category='' Name='Location to use' Value='6' />
					</Parameters>
				</Task>
				<Plate_Parameters >
					<Parameter Name='Plate name' Value='Reaction Plate' />
					<Parameter Name='Plate type' Value='96 Eppendorf Twin.tec PCR' />
					<Parameter Name='Simultaneous plates' Value='1' />
					<Parameter Name='Plates have lids' Value='0' />
					<Parameter Name='Plates enter the system sealed' Value='0' />
					<Parameter Name='Use single instance of plate' Value='0' />
					<Parameter Name='Automatically update labware' Value='0' />
					<Parameter Name='Enable timed release' Value='0' />
					<Parameter Name='Release time' Value='30' />
					<Parameter Name='Auto managed counterweight' Value='0' />
					<Parameter Name='Barcode filename' Value='No Selection' />
					<Parameter Name='Has header' Value='' />
					<Parameter Name='Barcode or header South' Value='No Selection' />
					<Parameter Name='Barcode or header West' Value='No Selection' />
					<Parameter Name='Barcode or header North' Value='No Selection' />
					<Parameter Name='Barcode or header East' Value='No Selection' />
				</Plate_Parameters>
				<Quarantine_After_Process >0</Quarantine_After_Process>
			</Process>
			<Process >
				<Minimized >0</Minimized>
				<Task Name='BuiltIn::Place Plate' >
					<Devices >
						<Device Device_Name='Bravo - 1' Location_Name='6' />
					</Devices>
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Task_Skipped >0</Task_Skipped>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings />
					<TaskScript Name='TaskScript' Value='' />
					<Parameters >
						<Parameter Category='Task Description' Name='Task number' Value='1' />
						<Parameter Category='Task Description' Name='Task description' Value='Place Plate' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
						<Parameter Category='' Name='Device to use' Value='Bravo - 1' />
						<Parameter Category='' Name='Location to use' Value='6' />
					</Parameters>
				</Task>
				<Task Name='Bravo::SubProcess' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Task_Skipped >0</Task_Skipped>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings />
					<TaskScript Name='TaskScript' Value='' />
					<Parameters >
						<Parameter Category='' Name='Sub-process name' Value='RNase H addition' />
						<Parameter Category='Static labware configuration' Name='Display confirmation' Value='Don&apos;t display' />
						<Parameter Category='Static labware configuration' Name='1' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='2' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='3' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='4' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='5' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='6' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='7' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='8' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='9' Value='&lt;use default&gt;' />
					</Parameters>
					<Parameters >
						<Parameter Centrifuge='0' Name='SubProcess_Name' Pipettor='1' Value='RNase H addition' />
					</Parameters>
				</Task>
				<Task Name='BuiltIn::Wait For' Waitfor='Waitfor2hrIncubationFinish' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Task_Skipped >0</Task_Skipped>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings />
					<TaskScript Name='TaskScript' Value='' />
				</Task>
				<Task Name='BuiltIn::Place Plate' >
					<Devices >
						<Device Device_Name='Bravo - 1' Location_Name='5' />
					</Devices>
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Task_Skipped >0</Task_Skipped>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings />
					<TaskScript Name='TaskScript' Value='' />
					<Parameters >
						<Parameter Category='Task Description' Name='Task number' Value='4' />
						<Parameter Category='Task Description' Name='Task description' Value='Place Plate' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
						<Parameter Category='' Name='Device to use' Value='Bravo - 1' />
						<Parameter Category='' Name='Location to use' Value='5' />
					</Parameters>
				</Task>
				<Task Name='BuiltIn::Signal' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Task_Skipped >0</Task_Skipped>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings />
					<TaskScript Name='TaskScript' Value='' />
					<Waitfors_To_Signal >
						<Waitfor Name='WaitforReagentPlateMove' />
					</Waitfors_To_Signal>
				</Task>
				<Plate_Parameters >
					<Parameter Name='Plate name' Value='MasterMix Plate' />
					<Parameter Name='Plate type' Value='96 Eppendorf Twin.tec PCR' />
					<Parameter Name='Simultaneous plates' Value='1' />
					<Parameter Name='Plates have lids' Value='0' />
					<Parameter Name='Plates enter the system sealed' Value='0' />
					<Parameter Name='Use single instance of plate' Value='0' />
					<Parameter Name='Automatically update labware' Value='0' />
					<Parameter Name='Enable timed release' Value='0' />
					<Parameter Name='Release time' Value='30' />
					<Parameter Name='Auto managed counterweight' Value='0' />
					<Parameter Name='Barcode filename' Value='No Selection' />
					<Parameter Name='Has header' Value='' />
					<Parameter Name='Barcode or header South' Value='No Selection' />
					<Parameter Name='Barcode or header West' Value='No Selection' />
					<Parameter Name='Barcode or header North' Value='No Selection' />
					<Parameter Name='Barcode or header East' Value='No Selection' />
				</Plate_Parameters>
				<Quarantine_After_Process >0</Quarantine_After_Process>
			</Process>
			<Process >
				<Minimized >0</Minimized>
				<Task Name='BuiltIn::Place Plate' >
					<Devices >
						<Device Device_Name='Bravo - 1' Location_Name='2' />
					</Devices>
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Task_Skipped >0</Task_Skipped>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings />
					<TaskScript Name='TaskScript' Value='' />
					<Parameters >
						<Parameter Category='Task Description' Name='Task number' Value='1' />
						<Parameter Category='Task Description' Name='Task description' Value='Place Plate' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
						<Parameter Category='' Name='Device to use' Value='Bravo - 1' />
						<Parameter Category='' Name='Location to use' Value='2' />
					</Parameters>
				</Task>
				<Task Name='Bravo::SubProcess' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Task_Skipped >0</Task_Skipped>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings />
					<TaskScript Name='TaskScript' Value='' />
					<Parameters >
						<Parameter Category='' Name='Sub-process name' Value='RNase H addition' />
						<Parameter Category='Static labware configuration' Name='Display confirmation' Value='Don&apos;t display' />
						<Parameter Category='Static labware configuration' Name='1' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='2' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='3' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='4' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='5' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='6' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='7' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='8' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='9' Value='&lt;use default&gt;' />
					</Parameters>
					<Parameters >
						<Parameter Centrifuge='0' Name='SubProcess_Name' Pipettor='1' Value='RNase H addition' />
					</Parameters>
				</Task>
				<Task Name='BuiltIn::Place Plate' >
					<Devices >
						<Device Device_Name='Bravo - 1' Location_Name='2' />
					</Devices>
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Task_Skipped >0</Task_Skipped>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings />
					<TaskScript Name='TaskScript' Value='if(!isEmpty()){
need_tips = 0
  }else
   {task.skip();
    }' />
					<Parameters >
						<Parameter Category='Task Description' Name='Task number' Value='3' />
						<Parameter Category='Task Description' Name='Task description' Value='Place Plate' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
						<Parameter Category='' Name='Device to use' Value='Bravo - 1' />
						<Parameter Category='' Name='Location to use' Value='2' />
					</Parameters>
				</Task>
				<Task Name='BuiltIn::Place Plate' >
					<Devices >
						<Device Device_Name='Bravo - 1' Location_Name='8' />
					</Devices>
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Task_Skipped >0</Task_Skipped>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings />
					<TaskScript Name='TaskScript' Value='if(isEmpty()){
print(&quot;Moving empty tip box to position 8 for next protocol&quot;)
need_tips = 1
tipBox++
  }else
   {task.skip();
    }' />
					<Parameters >
						<Parameter Category='Task Description' Name='Task number' Value='4' />
						<Parameter Category='Task Description' Name='Task description' Value='Place Plate' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
						<Parameter Category='' Name='Device to use' Value='Bravo - 1' />
						<Parameter Category='' Name='Location to use' Value='8' />
					</Parameters>
				</Task>
				<Plate_Parameters >
					<Parameter Name='Plate name' Value='tips1' />
					<Parameter Name='Plate type' Value='96 V11 LT180 Tip Box 19477.002 FILTERED' />
					<Parameter Name='Simultaneous plates' Value='1' />
					<Parameter Name='Plates have lids' Value='0' />
					<Parameter Name='Plates enter the system sealed' Value='0' />
					<Parameter Name='Use single instance of plate' Value='0' />
					<Parameter Name='Automatically update labware' Value='0' />
					<Parameter Name='Enable timed release' Value='0' />
					<Parameter Name='Release time' Value='30' />
					<Parameter Name='Auto managed counterweight' Value='0' />
					<Parameter Name='Barcode filename' Value='No Selection' />
					<Parameter Name='Has header' Value='' />
					<Parameter Name='Barcode or header South' Value='No Selection' />
					<Parameter Name='Barcode or header West' Value='No Selection' />
					<Parameter Name='Barcode or header North' Value='No Selection' />
					<Parameter Name='Barcode or header East' Value='No Selection' />
				</Plate_Parameters>
				<Quarantine_After_Process >0</Quarantine_After_Process>
			</Process>
			<Process >
				<Minimized >0</Minimized>
				<Task Name='BuiltIn::Place Plate' >
					<Devices >
						<Device Device_Name='Bravo - 1' Location_Name='8' />
					</Devices>
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Task_Skipped >0</Task_Skipped>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings />
					<TaskScript Name='TaskScript' Value='' />
					<Parameters >
						<Parameter Category='Task Description' Name='Task number' Value='1' />
						<Parameter Category='Task Description' Name='Task description' Value='Place Plate' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
						<Parameter Category='' Name='Device to use' Value='Bravo - 1' />
						<Parameter Category='' Name='Location to use' Value='8' />
					</Parameters>
				</Task>
				<Task Name='Bravo::SubProcess' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Task_Skipped >0</Task_Skipped>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings />
					<TaskScript Name='TaskScript' Value='' />
					<Parameters >
						<Parameter Category='' Name='Sub-process name' Value='RNase H addition' />
						<Parameter Category='Static labware configuration' Name='Display confirmation' Value='Don&apos;t display' />
						<Parameter Category='Static labware configuration' Name='1' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='2' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='3' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='4' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='5' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='6' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='7' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='8' Value='&lt;use default&gt;' />
						<Parameter Category='Static labware configuration' Name='9' Value='&lt;use default&gt;' />
					</Parameters>
					<Parameters >
						<Parameter Centrifuge='0' Name='SubProcess_Name' Pipettor='1' Value='RNase H addition' />
					</Parameters>
				</Task>
				<Task Name='BuiltIn::Place Plate' >
					<Devices >
						<Device Device_Name='Bravo - 1' Location_Name='8' />
					</Devices>
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Task_Skipped >0</Task_Skipped>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings />
					<TaskScript Name='TaskScript' Value='if(!isFull()){
  print(&quot;Used tip box is not full so keeping at position 8.&quot;);
  }else
   {task.skip();
    }

' />
					<Parameters >
						<Parameter Category='Task Description' Name='Task number' Value='3' />
						<Parameter Category='Task Description' Name='Task description' Value='Place Plate' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
						<Parameter Category='' Name='Device to use' Value='Bravo - 1' />
						<Parameter Category='' Name='Location to use' Value='8' />
					</Parameters>
				</Task>
				<Task Name='BuiltIn::Upstack' >
					<Devices >
						<Device Device_Name='BenchCel - 1' Location_Name='Stacker 2' />
					</Devices>
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Task_Skipped >0</Task_Skipped>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='0' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='if(isFull()){
  print(&quot;Used tip box is full so upstacking to stacker 2&quot;);
  }else
   {task.skip();
    }

' />
					<Parameters >
						<Parameter Category='Task Description' Name='Task number' Value='4' />
						<Parameter Category='Task Description' Name='Task description' Value='Upstack' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
				</Task>
				<Plate_Parameters >
					<Parameter Name='Plate name' Value='emptytips1' />
					<Parameter Name='Plate type' Value='96 V11 LT180 Tip Box 19477.002 FILTERED' />
					<Parameter Name='Simultaneous plates' Value='1' />
					<Parameter Name='Plates have lids' Value='0' />
					<Parameter Name='Plates enter the system sealed' Value='0' />
					<Parameter Name='Use single instance of plate' Value='0' />
					<Parameter Name='Automatically update labware' Value='0' />
					<Parameter Name='Enable timed release' Value='0' />
					<Parameter Name='Release time' Value='30' />
					<Parameter Name='Auto managed counterweight' Value='0' />
					<Parameter Name='Barcode filename' Value='No Selection' />
					<Parameter Name='Has header' Value='' />
					<Parameter Name='Barcode or header South' Value='No Selection' />
					<Parameter Name='Barcode or header West' Value='No Selection' />
					<Parameter Name='Barcode or header North' Value='No Selection' />
					<Parameter Name='Barcode or header East' Value='No Selection' />
				</Plate_Parameters>
				<Quarantine_After_Process >0</Quarantine_After_Process>
			</Process>
			<Pipette_Process Name='RNase H addition' >
				<Minimized >0</Minimized>
				<Task Name='Bravo::secondary::Set Head Mode' Task_Type='512' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Task_Skipped >0</Task_Skipped>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='0' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='update_status(&quot;Adding RNA Digestion Mix to RNA:cDNA hybrid&quot;)

col = 0
used_col = 0
tips_on_loc = 13
tips_off_loc = 13
tipBox = 1' />
					<Parameters >
						<Parameter Category='' Name='Head mode' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;9132ba130c10b728fbff387cb5cb659a&apos; version=&apos;1.0&apos; &gt;
	&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;1&apos; RowCount=&apos;8&apos; SubsetConfig=&apos;3&apos; SubsetType=&apos;1&apos; TipType=&apos;0&apos; /&gt;
&lt;/Velocity11&gt;' />
						<Parameter Category='Task Description' Name='Task number' Value='1' />
						<Parameter Category='Task Description' Name='Task description' Value='Set Head Mode (Bravo)' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
					<PipetteHead AssayMap='0' Disposable='1' HasTips='1' MaxRange='251' MinRange='-41' Name='96LT, 200 킠 Series III' >
						<PipetteHeadMode Channels='0' ColumnCount='1' RowCount='8' SubsetConfig='3' SubsetType='1' TipType='0' />
					</PipetteHead>
				</Task>
				<Task Name='BuiltIn::Group Begin' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Task_Skipped >0</Task_Skipped>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings />
					<TaskScript Name='TaskScript' Value='' />
					<Parameters >
						<Parameter Category='Task Description' Name='Task number' Value='2' />
						<Parameter Category='Task Description' Name='Task description' Value='Group Begin' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
				</Task>
				<Task Name='BuiltIn::Loop' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Task_Skipped >0</Task_Skipped>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings />
					<TaskScript Name='TaskScript' Value='' />
					<Parameters >
						<Parameter Category='' Name='Number of times to loop' TaskParameterScript='=columns_samples' Value='1' />
						<Parameter Category='' Name='Change tips every N times, N = ' Value='1' />
					</Parameters>
					<Variables >
						<Variable fIncrement='1' iFreqValue='0' strFrequency='Every time' strInitialValue='1' strVariableName='dispCol' />
					</Variables>
				</Task>
				<Task Name='Bravo::secondary::Tips On' Task_Type='16' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Task_Skipped >0</Task_Skipped>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='29' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='tips_on_loc = tips_on_loc - 1
task.Wellselection = [[ 1 , tips_on_loc ]]

print(&quot;Pressing tips on at &quot; + task.Wellselection)' />
					<Parameters >
						<Parameter Category='' Name='Location, plate' Value='tips1' />
						<Parameter Category='' Name='Location, location' Value='&lt;auto-select&gt;' />
						<Parameter Category='Properties' Name='Allow automatic tracking of tip usage' Value='0' />
						<Parameter Category='Properties' Name='Well selection' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;571d88309c341aec2fae4c5651a37a25&apos; version=&apos;1.0&apos; &gt;
	&lt;WellSelection CanBe16QuadrantPattern=&apos;0&apos; CanBeLinked=&apos;0&apos; CanBeQuadrantPattern=&apos;0&apos; IsLinked=&apos;0&apos; IsQuadrantPattern=&apos;0&apos; OnlyOneSelection=&apos;1&apos; OverwriteHeadMode=&apos;0&apos; QuadrantPattern=&apos;0&apos; StartingQuadrant=&apos;1&apos; &gt;
		&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;1&apos; RowCount=&apos;8&apos; SubsetConfig=&apos;3&apos; SubsetType=&apos;1&apos; TipType=&apos;0&apos; /&gt;
		&lt;Wells &gt;
			&lt;Well Column=&apos;0&apos; Row=&apos;0&apos; /&gt;
		&lt;/Wells&gt;
	&lt;/WellSelection&gt;
&lt;/Velocity11&gt;' />
						<Parameter Category='Task Description' Name='Task number' Value='4' />
						<Parameter Category='Task Description' Name='Task description' Value='Tips On (Bravo)' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
					<PipetteHead AssayMap='0' Disposable='1' HasTips='1' MaxRange='251' MinRange='-41' Name='96LT, 200 킠 Series III' >
						<PipetteHeadMode Channels='0' ColumnCount='1' RowCount='8' SubsetConfig='3' SubsetType='1' TipType='0' />
					</PipetteHead>
				</Task>
				<Task Name='BuiltIn::JavaScript' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Task_Skipped >0</Task_Skipped>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='0' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='trackNew(1)' />
					<Parameters >
						<Parameter Category='Task Description' Name='Task number' Value='5' />
						<Parameter Category='Task Description' Name='Task description' Value='JavaScript' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
				</Task>
				<Task Name='Bravo::secondary::Aspirate' Task_Type='1' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Task_Skipped >0</Task_Skipped>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='11' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='' />
					<Parameters >
						<Parameter Category='' Name='Location, plate' Value='MasterMix Plate' />
						<Parameter Category='' Name='Location, location' Value='&lt;auto-select&gt;' />
						<Parameter Category='Volume' Name='Volume' Value='5' />
						<Parameter Category='Volume' Name='Pre-aspirate volume' Value='3' />
						<Parameter Category='Volume' Name='Post-aspirate volume' Value='0' />
						<Parameter Category='Properties' Name='Liquid class' Value='96 disposable tip 5ul Mastermix' />
						<Parameter Category='Properties' Name='Distance from well bottom' Value='0.5' />
						<Parameter Category='Properties' Name='Dynamic tip extension' Value='0' />
						<Parameter Category='Tip Touch' Name='Perform tip touch' Value='0' />
						<Parameter Category='Tip Touch' Name='Which sides to use for tip touch' Value='None' />
						<Parameter Category='Tip Touch' Name='Tip touch retract distance' Value='0' />
						<Parameter Category='Tip Touch' Name='Tip touch horizontal offset' Value='0' />
						<Parameter Category='Properties' Name='Well selection' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;6543b50eca2ed8c0ec774d51e47a8e12&apos; version=&apos;1.0&apos; &gt;
	&lt;WellSelection CanBe16QuadrantPattern=&apos;0&apos; CanBeLinked=&apos;0&apos; CanBeQuadrantPattern=&apos;0&apos; IsLinked=&apos;0&apos; IsQuadrantPattern=&apos;0&apos; OnlyOneSelection=&apos;0&apos; OverwriteHeadMode=&apos;0&apos; QuadrantPattern=&apos;0&apos; StartingQuadrant=&apos;1&apos; &gt;
		&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;1&apos; RowCount=&apos;8&apos; SubsetConfig=&apos;3&apos; SubsetType=&apos;1&apos; TipType=&apos;0&apos; /&gt;
		&lt;Wells &gt;
			&lt;Well Column=&apos;0&apos; Row=&apos;0&apos; /&gt;
		&lt;/Wells&gt;
	&lt;/WellSelection&gt;
&lt;/Velocity11&gt;' />
						<Parameter Category='Properties' Name='Pipette technique' Value='' />
						<Parameter Category='Task Description' Name='Task number' Value='6' />
						<Parameter Category='Task Description' Name='Task description' Value='Aspirate (Bravo)' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
					<PipetteHead AssayMap='0' Disposable='1' HasTips='1' MaxRange='251' MinRange='-41' Name='96LT, 200 킠 Series III' >
						<PipetteHeadMode Channels='0' ColumnCount='1' RowCount='8' SubsetConfig='3' SubsetType='1' TipType='0' />
					</PipetteHead>
				</Task>
				<Task Name='Bravo::secondary::Dispense' Task_Type='2' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Task_Skipped >0</Task_Skipped>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='10' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='task.Wellselection = [[1,dispCol]]' />
					<Parameters >
						<Parameter Category='' Name='Location, plate' Value='Reaction Plate' />
						<Parameter Category='' Name='Location, location' Value='&lt;auto-select&gt;' />
						<Parameter Category='Volume' Name='Empty tips' Value='0' />
						<Parameter Category='Volume' Name='Volume' Value='5' />
						<Parameter Category='Volume' Name='Blowout volume' Value='0' />
						<Parameter Category='Properties' Name='Liquid class' Value='96 disposable tip 5ul Mastermix' />
						<Parameter Category='Properties' Name='Distance from well bottom' Value='2' />
						<Parameter Category='Properties' Name='Dynamic tip retraction' Value='0' />
						<Parameter Category='Tip Touch' Name='Perform tip touch' Value='0' />
						<Parameter Category='Tip Touch' Name='Which sides to use for tip touch' Value='None' />
						<Parameter Category='Tip Touch' Name='Tip touch retract distance' Value='0' />
						<Parameter Category='Tip Touch' Name='Tip touch horizontal offset' Value='0' />
						<Parameter Category='Properties' Name='Well selection' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;6543b50eca2ed8c0ec774d51e47a8e12&apos; version=&apos;1.0&apos; &gt;
	&lt;WellSelection CanBe16QuadrantPattern=&apos;0&apos; CanBeLinked=&apos;0&apos; CanBeQuadrantPattern=&apos;0&apos; IsLinked=&apos;0&apos; IsQuadrantPattern=&apos;0&apos; OnlyOneSelection=&apos;0&apos; OverwriteHeadMode=&apos;0&apos; QuadrantPattern=&apos;0&apos; StartingQuadrant=&apos;1&apos; &gt;
		&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;1&apos; RowCount=&apos;8&apos; SubsetConfig=&apos;3&apos; SubsetType=&apos;1&apos; TipType=&apos;0&apos; /&gt;
		&lt;Wells &gt;
			&lt;Well Column=&apos;0&apos; Row=&apos;0&apos; /&gt;
		&lt;/Wells&gt;
	&lt;/WellSelection&gt;
&lt;/Velocity11&gt;' />
						<Parameter Category='Properties' Name='Pipette technique' Value='' />
						<Parameter Category='Task Description' Name='Task number' Value='7' />
						<Parameter Category='Task Description' Name='Task description' Value='Dispense (Bravo)' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
					<PipetteHead AssayMap='0' Disposable='1' HasTips='1' MaxRange='251' MinRange='-41' Name='96LT, 200 킠 Series III' >
						<PipetteHeadMode Channels='0' ColumnCount='1' RowCount='8' SubsetConfig='3' SubsetType='1' TipType='0' />
					</PipetteHead>
				</Task>
				<Task Name='Bravo::secondary::Mix [Dual Height]' Task_Type='4096' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Task_Skipped >0</Task_Skipped>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='31' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='task.Wellselection = [[1,dispCol]]

if(protocol_testing){
task.Mixcycles = 1
}' />
					<Parameters >
						<Parameter Category='' Name='Location, plate' Value='Reaction Plate' />
						<Parameter Category='' Name='Location, location' Value='&lt;auto-select&gt;' />
						<Parameter Category='Volume' Name='Volume' Value='60' />
						<Parameter Category='Volume' Name='Pre-aspirate volume' Value='0' />
						<Parameter Category='Volume' Name='Blowout volume' Value='0' />
						<Parameter Category='Properties' Name='Liquid class' Value='96 disposable tip 50 - 180ul aq' />
						<Parameter Category='Properties' Name='Mix cycles' Value='3' />
						<Parameter Category='Properties' Name='Dynamic tip extension' Value='0' />
						<Parameter Category='Distance From Well Bottom' Name='Aspirate distance' Value='2' />
						<Parameter Category='Distance From Well Bottom' Name='Dispense at different distance' Value='1' />
						<Parameter Category='Distance From Well Bottom' Name='Dispense distance' Value='5' />
						<Parameter Category='Tip Touch' Name='Perform tip touch' Value='0' />
						<Parameter Category='Tip Touch' Name='Which sides to use for tip touch' Value='None' />
						<Parameter Category='Tip Touch' Name='Tip touch retract distance' Value='0' />
						<Parameter Category='Tip Touch' Name='Tip touch horizontal offset' Value='0' />
						<Parameter Category='Properties' Name='Well selection' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;6543b50eca2ed8c0ec774d51e47a8e12&apos; version=&apos;1.0&apos; &gt;
	&lt;WellSelection CanBe16QuadrantPattern=&apos;0&apos; CanBeLinked=&apos;0&apos; CanBeQuadrantPattern=&apos;0&apos; IsLinked=&apos;0&apos; IsQuadrantPattern=&apos;0&apos; OnlyOneSelection=&apos;0&apos; OverwriteHeadMode=&apos;0&apos; QuadrantPattern=&apos;0&apos; StartingQuadrant=&apos;1&apos; &gt;
		&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;1&apos; RowCount=&apos;8&apos; SubsetConfig=&apos;3&apos; SubsetType=&apos;1&apos; TipType=&apos;0&apos; /&gt;
		&lt;Wells &gt;
			&lt;Well Column=&apos;0&apos; Row=&apos;0&apos; /&gt;
		&lt;/Wells&gt;
	&lt;/WellSelection&gt;
&lt;/Velocity11&gt;' />
						<Parameter Category='Properties' Name='Pipette technique' Value='' />
						<Parameter Category='Task Description' Name='Task number' Value='8' />
						<Parameter Category='Task Description' Name='Task description' Value='Mix (Bravo)' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
					<PipetteHead AssayMap='0' Disposable='1' HasTips='1' MaxRange='251' MinRange='-41' Name='96LT, 200 킠 Series III' >
						<PipetteHeadMode Channels='0' ColumnCount='1' RowCount='8' SubsetConfig='3' SubsetType='1' TipType='0' />
					</PipetteHead>
				</Task>
				<Task Name='Bravo::secondary::Dispense' Task_Type='2' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Task_Skipped >0</Task_Skipped>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='6' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='task.Wellselection = [[1,dispCol]]' />
					<Parameters >
						<Parameter Category='' Name='Location, plate' Value='Reaction Plate' />
						<Parameter Category='' Name='Location, location' Value='&lt;auto-select&gt;' />
						<Parameter Category='Volume' Name='Empty tips' Value='1' />
						<Parameter Category='Volume' Name='Volume' Value='10' />
						<Parameter Category='Volume' Name='Blowout volume' Value='0' />
						<Parameter Category='Properties' Name='Liquid class' Value='fast dispense then long wait' />
						<Parameter Category='Properties' Name='Distance from well bottom' Value='10' />
						<Parameter Category='Properties' Name='Dynamic tip retraction' Value='0' />
						<Parameter Category='Tip Touch' Name='Perform tip touch' Value='1' />
						<Parameter Category='Tip Touch' Name='Which sides to use for tip touch' Value='None' />
						<Parameter Category='Tip Touch' Name='Tip touch retract distance' Value='-8' />
						<Parameter Category='Tip Touch' Name='Tip touch horizontal offset' Value='0' />
						<Parameter Category='Properties' Name='Well selection' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;6543b50eca2ed8c0ec774d51e47a8e12&apos; version=&apos;1.0&apos; &gt;
	&lt;WellSelection CanBe16QuadrantPattern=&apos;0&apos; CanBeLinked=&apos;0&apos; CanBeQuadrantPattern=&apos;0&apos; IsLinked=&apos;0&apos; IsQuadrantPattern=&apos;0&apos; OnlyOneSelection=&apos;0&apos; OverwriteHeadMode=&apos;0&apos; QuadrantPattern=&apos;0&apos; StartingQuadrant=&apos;1&apos; &gt;
		&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;1&apos; RowCount=&apos;8&apos; SubsetConfig=&apos;3&apos; SubsetType=&apos;1&apos; TipType=&apos;0&apos; /&gt;
		&lt;Wells &gt;
			&lt;Well Column=&apos;0&apos; Row=&apos;0&apos; /&gt;
		&lt;/Wells&gt;
	&lt;/WellSelection&gt;
&lt;/Velocity11&gt;' />
						<Parameter Category='Properties' Name='Pipette technique' Value='' />
						<Parameter Category='Task Description' Name='Task number' Value='9' />
						<Parameter Category='Task Description' Name='Task description' Value='Dispense (Bravo)' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
					<PipetteHead AssayMap='0' Disposable='1' HasTips='1' MaxRange='251' MinRange='-41' Name='96LT, 200 킠 Series III' >
						<PipetteHeadMode Channels='0' ColumnCount='1' RowCount='8' SubsetConfig='3' SubsetType='1' TipType='0' />
					</PipetteHead>
				</Task>
				<Task Name='Bravo::secondary::Tips Off' Task_Type='32' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Task_Skipped >0</Task_Skipped>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='8' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='tips_off_loc = tips_off_loc - 1
task.Wellselection = [[ 1 , tips_off_loc ]]
print(&quot;Taking tips off at &quot; + task.Wellselection)
' />
					<Parameters >
						<Parameter Category='' Name='Location, plate' Value='emptytips1' />
						<Parameter Category='' Name='Location, location' Value='&lt;auto-select&gt;' />
						<Parameter Category='Properties' Name='Allow automatic tracking of tip usage' Value='0' />
						<Parameter Category='Properties' Name='Mark tips as used' Value='1' />
						<Parameter Category='Properties' Name='Well selection' Value='&lt;?xml version=&apos;1.0&apos; encoding=&apos;ASCII&apos; ?&gt;
&lt;Velocity11 file=&apos;MetaData&apos; md5sum=&apos;571d88309c341aec2fae4c5651a37a25&apos; version=&apos;1.0&apos; &gt;
	&lt;WellSelection CanBe16QuadrantPattern=&apos;0&apos; CanBeLinked=&apos;0&apos; CanBeQuadrantPattern=&apos;0&apos; IsLinked=&apos;0&apos; IsQuadrantPattern=&apos;0&apos; OnlyOneSelection=&apos;1&apos; OverwriteHeadMode=&apos;0&apos; QuadrantPattern=&apos;0&apos; StartingQuadrant=&apos;1&apos; &gt;
		&lt;PipetteHeadMode Channels=&apos;0&apos; ColumnCount=&apos;1&apos; RowCount=&apos;8&apos; SubsetConfig=&apos;3&apos; SubsetType=&apos;1&apos; TipType=&apos;0&apos; /&gt;
		&lt;Wells &gt;
			&lt;Well Column=&apos;0&apos; Row=&apos;0&apos; /&gt;
		&lt;/Wells&gt;
	&lt;/WellSelection&gt;
&lt;/Velocity11&gt;' />
						<Parameter Category='Task Description' Name='Task number' Value='10' />
						<Parameter Category='Task Description' Name='Task description' Value='Tips Off (Bravo)' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
					<PipetteHead AssayMap='0' Disposable='1' HasTips='1' MaxRange='251' MinRange='-41' Name='96LT, 200 킠 Series III' >
						<PipetteHeadMode Channels='0' ColumnCount='1' RowCount='8' SubsetConfig='3' SubsetType='1' TipType='0' />
					</PipetteHead>
				</Task>
				<Task Name='BuiltIn::JavaScript' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Task_Skipped >0</Task_Skipped>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='0' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='trackUsed(1)' />
					<Parameters >
						<Parameter Category='Task Description' Name='Task number' Value='11' />
						<Parameter Category='Task Description' Name='Task description' Value='JavaScript' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
				</Task>
				<Task Name='BuiltIn::Loop End' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Task_Skipped >0</Task_Skipped>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings />
					<TaskScript Name='TaskScript' Value='' />
				</Task>
				<Task Name='Bravo::secondary::Set temperature - Position' Task_Type='1024' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Task_Skipped >0</Task_Skipped>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='19' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='if(protocol_testing){task.skip()}' />
					<Parameters >
						<Parameter Category='' Name='Location' Value='4' />
						<Parameter Category='' Name='Turn off temperature' Value='0' />
						<Parameter Category='' Name='Temperature' Value='15' />
						<Parameter Category='' Name='Wait' Value='1' />
						<Parameter Category='' Name='Temperature Tolerance' Value='0' />
						<Parameter Category='' Name='Timeout' Value='60' />
						<Parameter Category='' Name='Allow concurrent operation' Value='0' />
						<Parameter Category='Task Description' Name='Task number' Value='13' />
						<Parameter Category='Task Description' Name='Task description' Value='Set temperature - Position (Bravo)' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
					<PipetteHead AssayMap='0' Disposable='1' HasTips='1' MaxRange='251' MinRange='-41' Name='96LT, 200 킠 Series III' >
						<PipetteHeadMode Channels='0' ColumnCount='1' RowCount='8' SubsetConfig='3' SubsetType='1' TipType='0' />
					</PipetteHead>
				</Task>
				<Task Name='BuiltIn::Group End' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Task_Skipped >0</Task_Skipped>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings />
					<TaskScript Name='TaskScript' Value='' />
					<Parameters >
						<Parameter Category='Task Description' Name='Task number' Value='14' />
						<Parameter Category='Task Description' Name='Task description' Value='Group End' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
				</Task>
				<Devices >
					<Device Device_Name='Bravo - 1' Location_Name='Default Location' />
				</Devices>
				<Parameters >
					<Parameter Name='Display confirmation' Value='Don&apos;t display' />
					<Parameter Name='1' Value='&lt;use default&gt;' />
					<Parameter Name='2' Value='&lt;use default&gt;' />
					<Parameter Name='3' Value='&lt;use default&gt;' />
					<Parameter Name='4' Value='&lt;use default&gt;' />
					<Parameter Name='5' Value='&lt;use default&gt;' />
					<Parameter Name='6' Value='&lt;use default&gt;' />
					<Parameter Name='7' Value='&lt;use default&gt;' />
					<Parameter Name='8' Value='&lt;use default&gt;' />
					<Parameter Name='9' Value='&lt;use default&gt;' />
				</Parameters>
				<Dependencies />
			</Pipette_Process>
		</Main_Processes>
		<Cleanup_Processes >
			<Process >
				<Minimized >0</Minimized>
				<Task Name='BuiltIn::JavaScript' >
					<Enable_Backup >0</Enable_Backup>
					<Task_Disabled >0</Task_Disabled>
					<Task_Skipped >0</Task_Skipped>
					<Has_Breakpoint >0</Has_Breakpoint>
					<Advanced_Settings >
						<Setting Name='Estimated time' Value='0' />
					</Advanced_Settings>
					<TaskScript Name='TaskScript' Value='//overwrite ST_temp.txt with new variables 
//for use in the next protocol
//need_tips
//col
//used_col
//Nunc plate to use, etc.
Nunc_location = &quot;NA&quot;
spri_case = &quot;NA&quot;
Collection_location = &quot;NA&quot;
Destination_location= &quot;NA&quot;

var update_temp_file = (need_tips + &quot;\n&quot; + col + &quot;\n&quot; + used_col + &quot;\n&quot; + Nunc_location + &quot;\n&quot; + head_mode + &quot;\n&quot; + columns_samples + &quot;\n&quot; + tips_on_loc + &quot;\n&quot; + tips_off_loc + &quot;\n&quot; + spri_case + &quot;\n&quot; + protocol_testing + &quot;\n&quot; + tipBox + &quot;\n&quot; + Collection_location + &quot;\n&quot; + Destination_location)
file_overwrite(&quot;C:\\VWorks Workspace\\NGS Option B\\SpatialTranscriptomics_v.B1.0.2\\Scripts\\ST_temp.txt&quot; , update_temp_file)
' />
					<Parameters >
						<Parameter Category='Task Description' Name='Task number' Value='1' />
						<Parameter Category='Task Description' Name='Task description' Value='JavaScript' />
						<Parameter Category='Task Description' Name='Use default task description' Value='1' />
					</Parameters>
				</Task>
				<Plate_Parameters >
					<Parameter Name='Plate name' Value='cleanup process - 1' />
				</Plate_Parameters>
				<Quarantine_After_Process >0</Quarantine_After_Process>
			</Process>
		</Cleanup_Processes>
	</Processes>
</Velocity11>