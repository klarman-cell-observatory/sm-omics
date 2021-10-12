// Run a batch file located on the root of drive C: to display a file.
// Batch file is created new each time.
// File must be assiciated with a suitable program to display it.

// create batch file to display popup file
// if pdf view in Acrobat reader, for others just use image viewer
// replace Acrobat.exe with AcroRd32.exe if newer version installed

popfile = new File()
popfile.Open("c:\\popup.bat","w")
filetype = popup_file.split(".")[1]
if(filetype=="pdf"||filetype=="PDF")
	{
	popfile.Write("@ECHO OFF\nCD %1\nSTART AcroRd32.exe %2\nEXIT\n")
	}
else
	{
	popfile.Write("@ECHO OFF\nCD %1\n%2\nEXIT\n")
	}
popfile.Close()

// run batch file with the popup_file supplied by the button script

dir = 'C:\\"VWorks Workspace"\\"NGS Option B"\\"SpatialTranscriptomics_v.B1.0.2"\\"Forms"\\"Supporting Files"'



program = 'C:\\popup.bat'



command = program +' '+dir+' "'+popup_file+'"'


run(command,1)

// delete the batch file

popfile.Delete("c:\\popup.bat")


