; =====================================
;     Program: Rapid Clicker
;      Author: Michael Rouse
;        Date: 9/2014
; Description: Creates a GUI which enables the user to rapidly start auto-clicking.
;			   This program has shortcut keys:
;			   ALT + s to start and stop clicking
;			   ALT + q  to exit the program
; =====================================

#include <GUIConstantsEx.au3>
HotKeySet("!s", "SwitchClicking_Delay") ; ALT + s to start
HotKeySet("!q", "ExitProgram")    ; ALT + q to exit
AutoItSetOption("GUIOnEventMode", 1)

Global $Clicking = False
GLobal $Main_GUI, $Clicking_Lbl, $OnOff_Btn
Const $RED = 0xFF0000, $GREEN = 0x006600

Main() ; Show Main GUI


; Main Loop
While 1
   If $Clicking Then MouseClick("left")

   Sleep(100)
WEnd



Func Main()
   $Main_GUI = GUICreate("Rapid Clicker", 200, 100)
   GUISetFont(15, Default, Default, "Segoe UI")
   GUISetOnEvent($GUI_EVENT_CLOSE, "ExitProgram")
   $Clicking_Lbl = GUICtrlCreateLabel("Off", 0, 10, 200, 35, 0x01)
   GUICtrlSetFont(-1, 20)
   GUICtrlSetColor(-1, $RED)
   $OnOff_Btn = GUICtrlCreateButton("Start", (200-100)/2, 55, 100, 35)
   GUICtrlSetOnEvent(-1, "SwitchClicking_Delay")

   GUISetState();
EndFunc

; Start or stop clicking
Func SwitchClicking()
   $Clicking = Not $Clicking
   If ($Clicking) Then
	  GUICtrlSetData($Clicking_Lbl, "On")
	  GUICtrlSetColor($Clicking_Lbl, $GREEN)
	  GUICtrlSetData($OnOff_Btn, "Stop")
   Else
	  GUICtrlSetData($Clicking_Lbl, "Off")
	  GUICtrlSetColor($Clicking_Lbl, $RED)
	  GUICtrlSetData($OnOff_Btn, "Start")
   EndIf
EndFunc

; Delay Before Starting
Func SwitchClicking_Delay()
   $i = 3
   GUICtrlSetColor($Clicking_Lbl, 0x000000)
   While $i > 0
	  GUICtrlSetData($Clicking_Lbl, $i & "...")
	  Sleep(1000)
	  $i = $i - 1
   WEnd
   SwitchClicking()
EndFunc


Func ExitProgram()
   Exit
EndFunc
