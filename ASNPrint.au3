#cs ----------------------------------------------------------------------------

 Author:         Jouni Pyhäjärvi

#ce ----------------------------------------------------------------------------

#include <File.au3>

;temporary txt file for printing
$temp_filename = "asnweather.txt"


; Script Start - Add your code below here
;Run("E:\ASNext_P3D\ASNext.exe")
;WinWaitActive("Active Sky Next for Prepar3D | Command Center","Welcome to Active Sky Next!")
WinActivate("Active Sky Next for Prepar3D | Command Center","Welcome to Active Sky Next!")
ControlClick("Active Sky Next for Prepar3D | Command Center","Welcome to Active Sky Next!","[CLASS:WindowsForms10.Window.8.app.0.141b42a_r10_ad1; INSTANCE:3]","left",1,393,20)
WinWaitActive("Active Sky Next for Prepar3D | Command Center","Add Top of Climb / Top of Descent Waypoints to Flight Plan")
ControlClick("Active Sky Next for Prepar3D | Command Center","Welcome to Active Sky Next!","[CLASS:WindowsForms10.Window.8.app.0.141b42a_r10_ad1; INSTANCE:6]","left",1,35,13)
WinWaitActive("Load FlightPlan")
Send("EFHK Helsinki Vantaa - EFRO Rovaniemi.pln")
Send("{ENTER}")
WinWaitActive("Active Sky Next for Prepar3D | Command Center","Welcome to Active Sky Next!")
ControlClick("Active Sky Next for Prepar3D | Command Center","Welcome to Active Sky Next!","[CLASS:WindowsForms10.Window.8.app.0.141b42a_r10_ad1; INSTANCE:3]","left",1,489,20)
WinWaitActive("Active Sky Next for Prepar3D | Command Center","Concise weather briefing:")

$weather_text = ControlGetText ( "Active Sky Next for Prepar3D | Command Center","Welcome to Active Sky Next!", "[CLASS:WindowsForms10.EDIT.app.0.141b42a_r10_ad1; INSTANCE:1]" )

$split = StringSplit ( $weather_text, ":" )
$split2 = StringSplit ( $split[3], "() " )

$print = "Average Winds:" & @TAB & $split2[2] & @CRLF & "T/C Temp:" & @TAB & $split2[4]

;msgbox(1, "Weight info", $print )

FileDelete($temp_filename)

$file = FileOpen($temp_filename, 1)
FileWriteLine($file, $print  )
$file_close = FileClose($file)

_FilePrint($temp_filename)
