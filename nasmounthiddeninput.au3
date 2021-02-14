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

; Userauthentication

$UserName = InputBox("Berechtigung","Benutzername?", "", "", 200, 120, 40, 40)
	If $UserName ="" then
	Exit
EndIf
$Password = InputBox("Berechtigung", "Passwort?", "", "*", 200, 120, 40, 40)
	If $Password ="" then
	Exit
EndIf

; Convert IP to Name

$nas = "192.168.0.50"
$var = _TCPIpToName($nas, 0)

If $var Then

; Mount network drive

DriveMapAdd("H:", "\\" & $var & "\MeinTest$", 0, $UserName, $Password)

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
