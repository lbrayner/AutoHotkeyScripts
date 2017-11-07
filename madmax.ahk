#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

global ReadyWeapon := 0
global Jump := 0

global Sprint := 0

global Boost := 0

UnBoost()
{
	global Boost
		
	Boost := 0
	Send {F7 up}
}

UnSprint()
{
	global Sprint
	Sprint := 0
	Send {F5 up}
}

UnreadyWeapon()
{
	global ReadyWeapon
		
	ReadyWeapon := 0
	Send {Click up right}
}

End::ExitApp
return

*~Return::
UnreadyWeapon()
return

~*NumpadDiv::
SetKeyDelay -1
global ReadyWeapon
if(!ReadyWeapon)
{	
	ReadyWeapon := 1
	Send {Click DownTemp right}
}
return

*~RButton::
Send {F4 DownTemp}{Numpad9 DownTemp}
return

*~RButton up::
Send {F4 up}{Numpad9 up}
UnreadyWeapon()
return

*~Numpad8::
SetKeyDelay -1
global Jump
global Sprint
Jump := 1
return

*~Numpad8 up::
SetKeyDelay -1
global Jump
Jump := 0 
UnSprint()
return

*~Numpad5::
UnreadyWeapon()
return

*Numpad0::
SetKeyDelay -1
global Jump
if(Jump)
{
	Send {Numpad0 DownTemp}
}
else
{
	Send {Space DownTemp}
}
UnreadyWeapon()
return

*Numpad0 up::
SetKeyDelay -1
Send {Space up}{Numpad0 up}
return

*~NumpadSub::
SetKeyDelay -1
numpadsub_var := true
numpadsub_sleep_var := 1
while(numpadsub_var)
{		
	Send {Blind}{Numpad8 DownTemp}{Click DownTemp}{F4 DownTemp}
	Sleep numpadsub_sleep_var
	Send {Blind}{Numpad8 up}{Click up}{F4 up}
	Sleep numpadsub_sleep_var
}
return

*~NumpadSub up::
SetKeyDelay -1
numpadsub_var := false
return

*~NumpadEnter::
global Sprint
Sprint := 1
UnreadyWeapon()
Send {F5 DownTemp}
; UnreadyWeapon()
return

; *NumpadAdd::
; global Boost
; Boost := 1
; Send {Blind}{F7 DownTemp}
; return

~*PgUp::
UnreadyWeapon()
Send {r DownTemp}
return

~*PgUp up::
Send {r up}
return

~*PgDn::
Send {f DownTemp}
return

~*PgDn up::
Send {f up}
return

~*LCtrl::
UnreadyWeapon()
return

; ~*LCtrl up::
; UnBoost()
; return

*~Delete::
Send {c DownTemp}
return

*~Delete up::
Send {c up}
return

*~Numpad7::
Send {e DownTemp}
return

*~Numpad7 up::
Send {e up}
return

*~Numpad4::
Send {u DownTemp}
return

*~Numpad4 up::
Send {u up}
return

*~Numpad6::
Send {i DownTemp}
return

*~Numpad6 up::
Send {i up}
return

*~Numpad9::
Send {q DownTemp}
return

*~Numpad9 up::
Send {q up}
return

*~SC056::
Send {z DownTemp}
return

*~SC056 up::
Send {z up}
return

*NumpadDot::
SetKeyDelay -1
global ReadyWeapon
numpaddot_sleep_var := 50
numpaddot_var := true
while(numpaddot_var)
{
	Send {Blind}{Numpad7 DownTemp}
	Sleep numpaddot_sleep_var
	Send {Blind}{Numpad7 up}
	Sleep numpaddot_sleep_var
}
return

*NumpadDot up::
numpaddot_var := false
return