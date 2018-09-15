#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

#IfWinActive, ahk_exe bio4.exe

UnreadyWeapon()
{
	global ReadyWeapon
    if(ReadyWeapon)
    {
        ReadyWeapon := 0
        Send {Click up right}
    }
}

StopRunning()
{
	Send {F5 up}
}

StartRunning()
{
	Send {F5 DownTemp}
}

~*Home::
UnreadyWeapon()
Send {Blind}{Esc DownTemp}
return

~*Home up::
Send {Blind}{Esc up}
return

~*Numpad8::
SetKeyDelay -1
UnreadyWeapon()
StartRunning()
Send {w DownTemp}
return

~*Numpad8 up::
SetKeyDelay -1
StopRunning()
Send {w up}
return

~*Numpad4::a
return

~*Numpad5::
UnreadyWeapon()
Send {s DownTemp}
return

~*Numpad5 up::
Send {s up}
return

~*Numpad6::d
return

~*Numpad7::e
return

~*PgDn::
SetKeyDelay -1
UnreadyWeapon()
Send {f DownTemp}
return

~*PgDn up::
SetKeyDelay -1
Send {f up}
return

~*PgUp::r
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

~*RButton up::
SetKeyDelay -1
UnreadyWeapon()
return

~*Numpad0::
StopRunning()
UnreadyWeapon()
Send {Space DownTemp}
return

~*Numpad0 up::
Send {Space up}
return

~*Numpad9::
SetKeyDelay -1
UnreadyWeapon()
num9_var := true
num9_sleep_var := 50
Send {Blind}{q DownTemp}
while(num9_var)
{		
    Send {Blind}{Click DownTemp}
	Sleep num9_sleep_var
	Send {Blind}{Click up}
	Sleep num9_sleep_var
}
return

~*Numpad9 up::
SetKeyDelay -1
num9_var := false
Send {Blind}{q up}
return

~*NumpadMult::
SetKeyDelay -1
var := true
sleep_var := 10
speed := 1
displacement_wiggle := 30
while(var)
{	
	MouseMove, (A_ScreenWidth/2 + displacement_wiggle), A_ScreenHeight/2, speed
	Sleep sleep_var
	MouseMove, A_ScreenWidth/2, (A_ScreenHeight/2  + displacement_wiggle), speed
	Sleep sleep_var
	MouseMove, (A_ScreenWidth/2 - displacement_wiggle), A_ScreenHeight/2, speed
	Sleep sleep_var
	MouseMove, A_ScreenWidth/2, (A_ScreenHeight/2  - displacement_wiggle), speed
	Sleep sleep_var
}
return

~*NumpadMult up::
var := false
return

~*NumpadDot::
SetKeyDelay -1
var := true
sleep_var := 10
while(var)
{	
	Send {Blind}{x DownTemp}{c DownTemp}
	;Send {Blind}{Click down} {Click down right}
	Sleep sleep_var
	;Send {Blind}{Click up} {Click up right}
	Send {Blind}{x up}{c up}
	Sleep sleep_var
}
return

~*NumpadDot up::
var := false
return
