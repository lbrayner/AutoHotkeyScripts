#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

#IfWinActive, ahk_exe  ROTTR.exe

global ReadyWeapon := 0
global Walk := 0
global Sprint := 0

global OneEightyAll := 3900

Turn(x)
{
	DllCall("mouse_event", uint, 0, int, x, int, 0, uint, 0, int, 0)
}

UnreadyWeapon()
{
	global ReadyWeapon
		
	ReadyWeapon := 0
	Send {Click up right}
}

StopWalking()
{
	global Walk
	
	Walk := 0
	Send {x up}
}

~*NumpadDiv::
SetKeyDelay -1
global ReadyWeapon
if(!ReadyWeapon)
{	
	ReadyWeapon := 1
	Send {Click DownTemp right}
}
return

~*RButton::
StopWalking()
return

~*RButton up::
UnreadyWeapon()
return

~*Numpad1::
SetKeyDelay -1
var := true
sleep_var := 100
StopWalking()
UnreadyWeapon()
while(var)
{	
	Send {Blind}{c DownTemp}
	Sleep sleep_var	
	Send {Blind}{c up}
	Sleep sleep_var	
}
return

~*Numpad1 up::
var := false
return

~*NumpadMult::
SetKeyDelay -1
global Walk
if(!Walk)
{	
	Walk := 1
	Send {x DownTemp}
}
return

~*Numpad8::
SetKeyDelay -1
global Sprint
Sprint := 1
return

~*Numpad8 up::
SetKeyDelay -1
global Sprint
Sprint := 0 
return


~*Numpad0::
SetKeyDelay -1
UnreadyWeapon()
StopWalking()
return

~*Delete::
SetKeyDelay -1
global ReadyWeapon
sleep_var := 50
var := true
while(var)
{
	Send {Blind}{f DownTemp}
	Sleep sleep_var
	Send {Blind}{f up}
	Sleep sleep_var
}
return

~*Delete up::
var := false
return

*~Insert::
StopWalking()
UnreadyWeapon()
return

*Home::Esc
return

*~SC07E::
Send {e DownTemp}
return

*~SC07E up::
Send {e up}
return

*NumpadDot::
SetKeyDelay -1
var := true
sleep_var := 100
while(var)
{	
	Send {Blind}{Numpad4 DownTemp}
	Sleep sleep_var	
	Send {Blind}{Numpad4 up}{Numpad6 DownTemp}
	Sleep sleep_var	
	Send {Blind}{Numpad6 up}
}
return

*NumpadDot up::
var := false
return

~*NumpadEnter::
UnreadyWeapon()
StopWalking()
return


*Numpad7::
SetKeyDelay -1
global ReadyWeapon
sleep_var := 50
var := true
if(ReadyWeapon)
{
	while(var)
	{
		Send {Blind}{Click DownTemp}
		Sleep sleep_var
		Send {Blind}{Click up}
		Sleep sleep_var
	}
}
else
{
	while(var)
	{
		Send {Blind}{e DownTemp}
		Sleep sleep_var
		Send {Blind}{e up}
		Sleep sleep_var
	}
}
return

*Numpad7 up::
var := false
return

Pause::Escape


*~Numpad2::
global OneEightyAll
Turn(OneEightyAll)
return
