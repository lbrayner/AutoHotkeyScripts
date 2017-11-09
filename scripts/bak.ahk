#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

CoordMode, Mouse, Screen

global ReadyGadget := 0

global Crouch := 0
global Gas := 0

UnReadyGadget()
{
	global ReadyGadget
		
	ReadyGadget := 0
	Send {Click up right}
}

global Boost := 0

UnBoost()
{
	global Boost
		
	Boost := 0
	Send {F7 up}
}

UnCrouch()
{
	global Crouch
	
	Crouch := 0
	Send {NumpadEnter up}
}




End::ExitApp
return

*~Return::
UnCrouch()
UnReadyGadget()
UnBoost()
return

*NumpadDiv::
SetKeyDelay -1
global ReadyGadget
if(!ReadyGadget)
{	
	ReadyGadget := 1
	Send {Click DownTemp right}
}
return


*Delete::
SetKeyDelay -1
sleep_var := 100
Send {Blind}{Return DownTemp}
Sleep sleep_var
Send {Blind}{Click DownTemp right}
Sleep sleep_var
Send {Blind}{Return up}{Click up right}
return

*NumpadAdd::
global Boost
Boost := 1
Send {Blind}{F7 DownTemp}
return

*Numpad1::
global Crouch
Crouch := 1
Send {Blind}{NumpadEnter DownTemp}
return

;******************************NO-INTERCEPTION********************
;******************************NO-INTERCEPTION********************
;******************************NO-INTERCEPTION********************
;******************************NO-INTERCEPTION********************
;******************************NO-INTERCEPTION********************
;******************************NO-INTERCEPTION********************
;******************************NO-INTERCEPTION********************
;******************************NO-INTERCEPTION********************
;******************************NO-INTERCEPTION********************
;******************************NO-INTERCEPTION********************
;******************************NO-INTERCEPTION********************
;******************************NO-INTERCEPTION********************
;******************************NO-INTERCEPTION********************
;******************************NO-INTERCEPTION********************
;******************************NO-INTERCEPTION********************
;******************************NO-INTERCEPTION********************

~*RButton up::
SetKeyDelay -1
UnReadyGadget()
UnCrouch()
return

~*Numpad9::
SetKeyDelay -1
UnReadyGadget()
UnCrouch()
return

~*LCtrl::
UnReadyGadget()
UnCrouch()
return

~*LCtrl up::
UnBoost()
return

~*Numpad7::
UnReadyGadget()
UnCrouch()
return

~*Numpad0::
UnCrouch()
return

;******************************QTE***************************
;******************************QTE***************************
;******************************QTE***************************
;******************************QTE***************************
;******************************QTE***************************
;******************************QTE***************************
;******************************QTE***************************
;******************************QTE***************************
;******************************QTE***************************
;******************************QTE***************************
;******************************QTE***************************
;******************************QTE***************************
;******************************QTE***************************
;******************************QTE***************************

*NumpadSub::
SetKeyDelay -1
var := true
sleep_var := 1
while(var)
{		
	Send {Blind}{w DownTemp}{Click DownTemp}
	Sleep sleep_var
	Send {Blind}{w up}{Click up}
	Sleep sleep_var
}
return

*NumpadSub up::
SetKeyDelay -1
var := false
return

*NumpadDot::
SetKeyDelay -1
var := true
sleep_var := 50
while(var)
{	
	Send {Blind}{Space DownTemp}
	Sleep sleep_var
	Send {Blind}{Space up}
	Sleep sleep_var
}
return

*NumpadDot up::
SetKeyDelay -1
var := false
return

;******************************REBINDINGS********************
;******************************REBINDINGS********************
;******************************REBINDINGS********************
;******************************REBINDINGS********************
;******************************REBINDINGS********************
;******************************REBINDINGS********************
;******************************REBINDINGS********************
;******************************REBINDINGS********************
;******************************REBINDINGS********************
;******************************REBINDINGS********************
;******************************REBINDINGS********************
;******************************REBINDINGS********************
;******************************REBINDINGS********************
;******************************REBINDINGS********************
;******************************REBINDINGS********************
;******************************REBINDINGS********************

Home::Tab
return

