#Include <Date.au3>
Opt("TrayMenuMode",1)
Opt("TrayOnEventMode",1)

TraySetClick(16) ; 16 = Releasing secondary mouse button
$exititem = TrayCreateItem("Exit")
TrayItemSetOnEvent(-1,"_ExitScript")

$x = 1
While 1
    Sleep(60000) ; 60000 = 60s = 1 min
	If $x = $CmdLine[1] Then ; start executable with parameter x like mousemove64.exe 10,
		                     ; MouseMove will run every sleep x parameter,
							 ; 1 min x 10 = 10 min
	    $m = MouseGetPos()
        MouseMove($m[0], $m[1]+10) ; +10 = move Cursor 10 Pixel
        MouseMove($m[0], $m[1])
        $x = 0
    Endif
    $x = $x+1
WEnd

Func _ExitScript()
    Exit
EndFunc

