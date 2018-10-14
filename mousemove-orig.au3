#Include <Date.au3>
Opt("TrayMenuMode",1)
Opt("TrayOnEventMode",1)

TraySetClick(16)
$exititem = TrayCreateItem("Exit")
TrayItemSetOnEvent(-1,"_ExitScript")

$x = 1
while 1
    $y = 60000				; Multiplikator -> 1000 = 1s, 10000 = 10s, 60000 = 1min
    $t = _NowTime(4) 			; Zeile entfernen wenn keine Abschaltung um/ab 18:00
    if $x = 1 Then 			; $x = 1 ist 1 Minute, 9 = 9 Minuten
	$m = MouseGetPos()
        MouseMove($m[0], $m[1]+1) 	; +1 = bewegt Cursor 1 Pixel
        MouseMove($m[0], $m[1])
	sleep($y*$x)			; Pausiert $y * $x (60000ms = 1 min) * 1 = 1min
        $x = 0
    endif
    $x = $x+1
    if $t > "18:00" or $t = "18:00" then _ExitScript() ; Zeile entfernen wenn keine Abschaltung um/ab 18:00
WEnd

func _ExitScript()
    Exit
EndFunc
