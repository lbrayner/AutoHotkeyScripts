#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

CoordMode, Mouse, Screen

global HealingOff := 0

global ReadyWeapon := 0
global ReadySecondary := 0
global Walk := 0
global Sprint := 0
global AutoFire := 0


UnreadyWeapon()
{
	global ReadyWeapon
		
	ReadyWeapon := 0
	Send {Click up right}
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

*RButton up::
SetKeyDelay -1
UnreadyWeapon()
return



*Numpad7::
SetKeyDelay -1
global ReadyWeapon
numpad7_sleep_var := 50
numpad7_var := true
while(numpad7_var)
{
	Send {Blind}{Numpad7 DownTemp}{f DownTemp}
	Sleep numpad7_sleep_var
	Send {Blind}{Numpad7 up}{f up}
	Sleep numpad7_sleep_var
}
return

*Numpad7 up::
numpad7_var := false
return

*Numpad8::
SetKeyDelay -1
global Sprint
Sprint := 1
Send {Numpad8 DownTemp}
return

*Numpad8 up::
SetKeyDelay -1
global Sprint
Sprint := 0 
Send {Numpad8 up}
return

~*Numpad0::
SetKeyDelay -1
global Sprint
if(!Sprint)
{
	Send {g DownTemp}
}
UnreadyWeapon()
return

*~Numpad0 up::
SetKeyDelay -1
Send {g up}
return

~*Right::
SetKeyDelay -1
global AutoFire
AutoFire := 1
return

~*Down::
SetKeyDelay -1
global AutoFire
AutoFire := 1
return

~*Up::
SetKeyDelay -1
global AutoFire
AutoFire := 0
return

~*WheelUp::
SetKeyDelay -1
global AutoFire
AutoFire := 0
return

~*WheelDown::
SetKeyDelay -1
global AutoFire
AutoFire := 0
return

*LButton::
SetKeyDelay -1
lbutton_sleep_var := 50
global AutoFire
lbutton_var := true
if(AutoFire)
{
	
	while(lbutton_var)
	{
		Send {Blind}{Click DownTemp}
		Sleep lbutton_sleep_var
		Send {Blind}{Click up}
		Sleep lbutton_sleep_var
	}
}
else
{
	Send {Blind}{Click DownTemp}
}
return

*LButton up::
lbutton_var := false
Send {Blind}{Click up}
return

