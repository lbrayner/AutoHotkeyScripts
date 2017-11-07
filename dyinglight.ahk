#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

CoordMode, Mouse, Screen

CenterMouse()
{
	DllCall("mouse_event", uint, 32769, int, 32768, int, 32768, uint, 0, int, 0)
}

global ReadyWeapon := 0

UnreadyWeapon()
{
	global ReadyWeapon
		
	ReadyWeapon := 0
	Send {Click up right}
}

End::ExitApp
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

~*LButton::
SetKeyDelay -1
global ReadyWeapon
if(!ReadyWeapon)
{
	Send {f DownTemp}
}
return

~*LButton up::
Send {f up}
return

*~NumpadEnter::
UnreadyWeapon()
return

*~Numpad0::
UnreadyWeapon()
return

*WheelUp::
SetKeyDelay -1
global AutoFire
wheelup_sleep_var := 50
AutoFire := 0
Send {F7 DownTemp}
Sleep wheelup_sleep_var
Send {F7 up}
return

*WheelDown::
SetKeyDelay -1
global AutoFire
wheeldown_sleep_var := 50
AutoFire := 0
Send {F8 DownTemp}
Sleep wheeldown_sleep_var
Send {F8 up}
return

*~8::

CenterMouse()

return

*~9::
speed := 15
;CenterMouse()
MouseMove, (A_ScreenWidth/2 + A_ScreenWidth/60), A_ScreenHeight/2, speed
return

*~7::
speed := 15
constant_displacement := 5
;CenterMouse()
MouseGetPos, posX1, posY1
MouseMove, posX1 + constant_displacement, posY1, speed
return

*~0::
speed := 5
MouseMove, 1, 1 , 10, R ;moves the mouse in a box
return