#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

#IfWinActive, RESIDENT EVIL 5

global next := 0

global ReadyWeapon := 0
global Forwards := 0
global Strafing := 0

UnreadyWeapon()
{
	global ReadyWeapon
		
	ReadyWeapon := 0
	Send {Click up right}
}

UnRun()
{
	Send {Space up}
}

Run()
{
	Send {Space DownTemp}
}

End::ExitApp
return

~*RButton up::
SetKeyDelay -1
UnreadyWeapon()
return

*~NumpadDiv::
SetKeyDelay -1
global ReadyWeapon
if(!ReadyWeapon)
{	
	ReadyWeapon := 1
	UnRun()
	Send {Click DownTemp right}
}
return

~*Numpad8::
SetKeyDelay -1
global Forwards
global Strafing
UnreadyWeapon()
; strafing := GetKeyState("Numpad4",P) | GetKeyState("Numpad6",P)
if(!Strafing)
{
	Run()
}

Forwards := 1
return

~*Numpad8 up::
SetKeyDelay -1
global Forwards
Forwards := 0
UnRun()
return

~*Numpad4::
SetKeyDelay -1
global Strafing
Strafing := 1
UnreadyWeapon()
UnRun()
return

~*Numpad4 up::
SetKeyDelay -1
global Strafing
global Forwards
if(Forwards)
	Run()
Strafing := 0
return

~*Numpad5::
SetKeyDelay -1
UnreadyWeapon()
return


~*Numpad6::
SetKeyDelay -1
global Strafing
Strafing := 1
UnreadyWeapon()
UnRun()
return

~*Numpad6 up::
SetKeyDelay -1
global Strafing
global Forwards
if(Forwards)
	Run()
Strafing := 0
return

~*Numpad0::
SetKeyDelay -1
UnreadyWeapon()
return



*Numpad2::
SetKeyDelay -1
UnreadyWeapon()
Send {Blind}{x DownTemp}{Space DownTemp}
return

*Numpad2 up::
SetKeyDelay -1
Send {Blind}{x up}{Space up}
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

*Numpad7::
SetKeyDelay -1
var := true
sleep_var := 100
while(var)
{	
	Send {Blind}{Numpad7 DownTemp}
	Sleep sleep_var
	Send {Blind}{Numpad7 up}
	Sleep sleep_var
}
return

*Numpad7 up::
var := false
return

*Delete::
SetKeyDelay -1
var := true
sleep_var := 100
while(var)
{	
	Send {Blind}{Delete DownTemp}
	Sleep sleep_var
	Send {Blind}{Delete up}
	Sleep sleep_var
}
return

*Delete up::
var := false
return

*Numpad1::
SetKeyDelay -1
Send {Blind}{Numpad7 DownTemp}{Del DownTemp}
Send {Blind}{Numpad4 DownTemp}{Numpad6 DownTemp}
return

*Numpad1 up::
Send {Blind}{Numpad7 up}{Del up}
Send {Blind}{Numpad4 up}{Numpad6 up}
return

*NumpadDot::
SetKeyDelay -1
var := true
sleep_var := 1
while(var)
{	
	Send {Blind}{Numpad4 DownTemp}
	Sleep sleep_var	
	Send {Blind}{Numpad6 DownTemp}{Numpad4 up}
	Sleep sleep_var
	Send {Blind}{Numpad6 up}
}
return

*NumpadDot up::
var := false
return

;******************************INVENTORY***************************
;******************************INVENTORY***************************
;******************************INVENTORY***************************
;******************************INVENTORY***************************
;******************************INVENTORY***************************
;******************************INVENTORY***************************
;******************************INVENTORY***************************
;******************************INVENTORY***************************
;******************************INVENTORY***************************
;******************************INVENTORY***************************
;******************************INVENTORY***************************
;******************************INVENTORY***************************
;******************************INVENTORY***************************
;******************************INVENTORY***************************

*PgUp::
SetKeyDelay -1

sleep_var := 100
speed := 10

;MouseMove, 0, 0, speed

Send {Blind}{PgDn DownTemp}
Sleep sleep_var
Send {Blind}{PgDn up}{Left DownTemp}
Sleep sleep_var
Send {Blind}{Left up}{z DownTemp}
Sleep sleep_var
Send {Blind}{z up}{Up DownTemp}
Sleep sleep_var
Send {Blind}{Up up}{z DownTemp}
Sleep sleep_var
Send {Blind}{z up}{PgDn DownTemp}
Sleep sleep_var
Send {Blind}{PgDn up}

return

*Insert::
SetKeyDelay -1

sleep_var := 100
speed := 10

;MouseMove, 0, 0, speed

Send {Blind}{PgDn DownTemp}
Sleep sleep_var
Send {Blind}{PgDn up}{z DownTemp}
Sleep sleep_var
Send {Blind}{z up}{Up DownTemp}
Sleep sleep_var
Send {Blind}{Up up}{z DownTemp}
Sleep sleep_var
Send {Blind}{z up}{PgDn DownTemp}
Sleep sleep_var
Send {Blind}{PgDn up}

return

*NumpadMult::
SetKeyDelay -1

sleep_var := 100
speed := 1



Send {Blind}{PgDn DownTemp}
Sleep sleep_var
Send {Blind}{PgDn up}{Right DownTemp}
Sleep sleep_var
Send {Blind}{Right up}{z DownTemp}
Sleep sleep_var
Send {Blind}{z up}{Up DownTemp}
Sleep sleep_var
Send {Blind}{Up up}{z DownTemp}
Sleep sleep_var
Send {Blind}{z up}{PgDn DownTemp}
Sleep sleep_var
Send {Blind}{PgDn up}
return

;******************************DISCARD***************************
;******************************DISCARD***************************
;******************************DISCARD***************************
;******************************DISCARD***************************
;******************************DISCARD***************************
;******************************DISCARD***************************
;******************************DISCARD***************************
;******************************DISCARD***************************

*F6::
SetKeyDelay -1

sleep_var := 100

Send {Blind}{PgDn DownTemp}
Sleep sleep_var
Send {Blind}{PgDn up}{Right DownTemp}
Sleep sleep_var
Send {Blind}{Right up}{Return DownTemp}
Sleep sleep_var
Send {Blind}{Return up}{Up DownTemp}
Sleep sleep_var
Send {Blind}{Up up}{Return DownTemp}
Sleep sleep_var
Send {Blind}{Return up}{Left DownTemp}
Sleep sleep_var
Send {Blind}{Left up}{Return DownTemp}
Sleep sleep_var
Send {Blind}{Return up}{PgDn DownTemp}
Sleep sleep_var
Send {Blind}{PgDn up}

return

*F7::
SetKeyDelay -1

sleep_var := 100

Send {Blind}{PgDn DownTemp}
Sleep sleep_var
Send {Blind}{PgDn up}{Left DownTemp}
Sleep sleep_var
Send {Blind}{Left up}{Down DownTemp}
Sleep sleep_var
Send {Blind}{Down up}{Return DownTemp}
Sleep sleep_var
Send {Blind}{Return up}{Up DownTemp}
Sleep sleep_var
Send {Blind}{Up up}{Return DownTemp}
Sleep sleep_var
Send {Blind}{Return up}{Left DownTemp}
Sleep sleep_var
Send {Blind}{Left up}{Return DownTemp}
Sleep sleep_var
Send {Blind}{Return up}

return

*F8::
SetKeyDelay -1

sleep_var := 100

Send {Blind}{PgDn DownTemp}
Sleep sleep_var
Send {Blind}{PgDn up}{Down DownTemp}
Sleep sleep_var
Send {Blind}{Down up}{Return DownTemp}
Sleep sleep_var
Send {Blind}{Return up}{Up DownTemp}
Sleep sleep_var
Send {Blind}{Up up}{Return DownTemp}
Sleep sleep_var
Send {Blind}{Return up}{Left DownTemp}
Sleep sleep_var
Send {Blind}{Left up}{Return DownTemp}
Sleep sleep_var
Send {Blind}{Return up}{PgDn DownTemp}
Sleep sleep_var
Send {Blind}{PgDn up}

return

*F9::
SetKeyDelay -1

sleep_var := 100

Send {Blind}{PgDn DownTemp}
Sleep sleep_var
Send {Blind}{PgDn up}{Right DownTemp}
Sleep sleep_var
Send {Blind}{Right up}{Down DownTemp}
Sleep sleep_var
Send {Blind}{Down up}{Return DownTemp}
Sleep sleep_var
Send {Blind}{Return up}{Up DownTemp}
Sleep sleep_var
Send {Blind}{Up up}{Return DownTemp}
Sleep sleep_var
Send {Blind}{Return up}{Left DownTemp}
Sleep sleep_var
Send {Blind}{Left up}{Return DownTemp}
Sleep sleep_var
Send {Blind}{Return up}{PgDn DownTemp}
Sleep sleep_var
Send {Blind}{PgDn up}

return

;******************************SWAP-WEAPONS***************************
;******************************SWAP-WEAPONS***************************
;******************************SWAP-WEAPONS***************************
;******************************SWAP-WEAPONS***************************
;******************************SWAP-WEAPONS***************************
;******************************SWAP-WEAPONS***************************
;******************************SWAP-WEAPONS***************************
;******************************SWAP-WEAPONS***************************
;******************************SWAP-WEAPONS***************************
;******************************SWAP-WEAPONS***************************
;******************************SWAP-WEAPONS***************************
;******************************SWAP-WEAPONS***************************
;******************************SWAP-WEAPONS***************************
;******************************SWAP-WEAPONS***************************

*Right::
SetKeyDelay -1
Send {Blind}{1 DownTemp}{Right DownTemp}
return

*Right up::
Send {Blind}{1 up}{Right up}
return



*WheelUp::
SetKeyDelay -1
sleep_var := 100
Send {Blind}{3 DownTemp}
Sleep sleep_var
Send {Blind}{3 up}
return

*WheelDown::
SetKeyDelay -1
sleep_var := 100
Send {Blind}{2 DownTemp}
Sleep sleep_var
Send {Blind}{2 up}
return

