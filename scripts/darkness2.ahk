#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

global ReadyWeapon := 0
global AutoFire := 0

UnreadyWeapon()
{
	global ReadyWeapon
		
	ReadyWeapon := 0
	Send {Click up right}
}

End::ExitApp
return

Pause::Escape

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

*RButton up::
SetKeyDelay -1
UnreadyWeapon()
return

*Right::
SetKeyDelay -1
global AutoFire
AutoFire := 1
Send {Right DownTemp}
return

*Right up::
SetKeyDelay -1
Send {Right up}
return

*Left::
SetKeyDelay -1
global AutoFire
AutoFire := 0
Send {Left DownTemp}
return

*Left up::
SetKeyDelay -1
Send {Left up}
return

*WheelUp::
SetKeyDelay -1
global AutoFire
AutoFire := 0
return

*WheelDown::
SetKeyDelay -1
global AutoFire
AutoFire := 0
return

*LButton::
SetKeyDelay -1
sleep_var := 150
global AutoFire
if(AutoFire)
{
	var := true
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
	Send {Blind}{Click DownTemp}
}
return

*LButton up::
var := false
Send {Blind}{Click up}
return

*MButton::
SetKeyDelay -1
sleep_var := 150
var := true
while(var)
{
	Send {Blind}{Click DownTemp middle}
	Sleep sleep_var
	Send {Blind}{Click up middle}
	Sleep sleep_var
}
return

*MButton up::
var := false
return

*Numpad7::
SetKeyDelay -1
sleep_var := 50
var := true
while(var)
{
	Send {Blind}{Numpad7 DownTemp}
	Sleep sleep_var
	Send {Blind}{Numpad7 up}
	Sleep sleep_var
}
return

*Numpad7 up::
SetKeyDelay -1
var := false
return

*Numpad0::
SetKeyDelay -1
Send {Numpad0 DownTemp}
UnreadyWeapon()
return

*Numpad0 up::
SetKeyDelay -1
Send {Numpad0 up}
return

*Backspace::
SetKeyDelay -1
global AutoFire
AutoFire := 1
return

*Return::
SetKeyDelay -1
Send {1 DownTemp}{Return DownTemp}
return



*Return up::
SetKeyDelay -1
Send {1 up}{Return up}
return