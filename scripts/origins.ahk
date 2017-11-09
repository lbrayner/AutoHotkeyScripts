#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

CoordMode, Mouse, Screen

global ReadyGadget := 0
global ReadySecondary := 0
global Crouch := 0
global Sprint := 0

UnReadyGadget()
{
	global ReadyGadget
		
	ReadyGadget := 0
	Send {Click up right}
}

UnreadySecondary()
{
	global ReadySecondary
		
	ReadySecondary := 0
	Send {NumpadMult up}
}

UnCrouch()
{
	global Crouch
	
	Crouch := 0
	Send {Return up}
}


End::ExitApp
return

NumpadDiv::
SetKeyDelay -1
global ReadyWeapon
if(!ReadyWeapon)
{	
	ReadyWeapon := 1
	Send {Click DownTemp right}
}
return

*RButton::
SetKeyDelay -1
Send {Click DownTemp right}
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

*NumpadMult::
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

*NumpadMult up::
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

*Numpad8::
SetKeyDelay -1
Send {Blind}{w DownTemp}
return

*Numpad8 up::
SetKeyDelay -1
Send {Blind}{w up}
return

*Numpad4::
SetKeyDelay -1
Send {Blind}{a DownTemp}
return

*Numpad4 up::
SetKeyDelay -1
Send {Blind}{a up}
return

*Numpad5::
SetKeyDelay -1
Send {Blind}{s DownTemp}
return

*Numpad5 up::
SetKeyDelay -1
Send {Blind}{s up}
return

*Numpad6::
SetKeyDelay -1
Send {Blind}{d DownTemp}
return

*Numpad6 up::
SetKeyDelay -1
Send {Blind}{d up}
return


