#Include <Date.au3>
Opt("TrayMenuMode",1)
Opt("TrayOnEventMode",1)

TraySetClick(16)
$exititem = TrayCreateItem("Exit")
TrayItemSetOnEvent(-1,"_ExitScript")

$x = 1
while 1
    sleep(1000) ; 1000 millisec = 1s
	$t = _NowTime(4) ; Zeile entfernen wenn keine Abschaltung um/ab 18:00
    if $x = 540 Then ; $x = 60 ist 1 Minute, 540 = 9 Minuten
	    $m = MouseGetPos()
        MouseMove($m[0], $m[1]+1) ; +1 = bewegt Cursor 1 Pixel
        MouseMove($m[0], $m[1])
        $x = 0
    endif
    $x = $x+1
    if $t > "18:00" or $t = "18:00" then _ExitScript() ; Zeile entfernen wenn keine Abschaltung um/ab 18:00
WEnd

func _ExitScript()
    Exit
EndFunc
