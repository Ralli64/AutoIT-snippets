#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=IconExtract\icons\mouse_118854.ico
#AutoIt3Wrapper_Outfile=mousemove-p32.exe
#AutoIt3Wrapper_Outfile_x64=mousemove-p64.exe
#AutoIt3Wrapper_UseUpx=y
#AutoIt3Wrapper_Compile_Both=y
#AutoIt3Wrapper_Res_Description=Bewegt Mauszeiger 1 Pixel alle x Minuten.
#AutoIt3Wrapper_Res_Fileversion=10.0.0.4
#AutoIt3Wrapper_Res_Fileversion_AutoIncrement=y
#AutoIt3Wrapper_Res_LegalCopyright=® BassFishFox@Gmail.com
#AutoIt3Wrapper_Res_Language=1031
#AutoIt3Wrapper_Res_Field=ProductVersion|10
#AutoIt3Wrapper_Res_Field=ProductName|MauzZeigerBeweger
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
;----------------------------------------------------------------------
; AutoIt Version: 3.0
; Author: BassFishFox@gmail.com
;----------------------------------------------------------------------
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

