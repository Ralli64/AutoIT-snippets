#include <WinNet.au3>
#include <MsgBoxConstants.au3>
#include <TrayConstants.au3>
#include <Inet.au3>

; Unmount all existing network drives

$var = DriveGetDrive ( "NETWORK" )

If Not @error Then
	For $i = 1 to $var[0]
		DriveMapDel($var[$i])
	Next
EndIf

sleep(1000)

TCPStartup()

; Convert IP to Name

$var = _TCPIpToName($nas, 0)

If $var Then

; Mount network drive

DriveMapAdd("H:", "\\" & $var & "\MeinTest$", 0)

	If Not @error then
		TrayTip("", "Drive H: is ready.", 20)
		Sleep(10000)
	EndIf
Else
	Msgbox(0+16,"Warning!","Drive H: not avaiable!")
EndIf

TCPShutdown()

Exit

; End of script
