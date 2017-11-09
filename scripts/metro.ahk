#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

CoordMode, Mouse, Screen

global ReadyWeapon := 0
global Running := 0
global AutoFire := 0
global Modifier := 0
global Jump := 0

CenterMouse()
{
	DllCall("mouse_event", uint, 32769, int, 32768, int, 32768, uint, 0, int, 0)
	;MouseMove, A_ScreenWidth/2, A_ScreenHeight/2, 10
	;MouseMove, 10, 10, 10
	
}

UnreadyWeapon()
{
	global ReadyWeapon
		
	ReadyWeapon := 0
	Send {Click up right}
}

global Crouch := 0

StopRunning()
{
	global Running
	Running := 0
	Send {F5 up}
}

StopCrouching()
{
	global Crouch
	
	Crouch := 0
	Send {c up}
}

End::ExitApp
return

*~Esc::
UnreadyWeapon()
StopCrouching()
return

*~NumpadAdd::
global Modifier
Modifier := 1
return

*~NumpadAdd up::
global Modifier
Modifier := 0
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

~*Numpad1::
SetKeyDelay -1
global Crouch
if(!Crouch)
{	
	Crouch := 1
	Send {c DownTemp}
}
return

~*RButton up::
SetKeyDelay -1
UnreadyWeapon()
return

*~Numpad8::
SetKeyDelay -1
global Jump
Jump := 1
return

*~Numpad8 up::
SetKeyDelay -1
global Jump
Jump := 0
StopRunning()
return

*~NumpadEnter::
SetKeyDelay -1
global Running
Running := 1
UnreadyWeapon()
StopCrouching()
Send {F5 DownTemp}
return



*~Numpad0::
StopCrouching()
UnreadyWeapon()
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

*WheelUp::
SetKeyDelay -1
global AutoFire
wheelup_sleep_var := 50
AutoFire := 0
Send {F3 DownTemp}
Sleep wheelup_sleep_var
Send {F3 up}
return

*WheelDown::
SetKeyDelay -1
global AutoFire
wheeldown_sleep_var := 50
AutoFire := 0
Send {F4 DownTemp}
Sleep wheeldown_sleep_var
Send {F4 up}
return

*LButton::
SetKeyDelay -1
lbutton_sleep_var := 50
global AutoFire
global Modifier
lbutton_var := true
; key = Click
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



*~Numpad7::
SetKeyDelay -1
global ReadyWeapon
global Running
; numpad7_sleep_var := 50
; numpad7_var := true
key = e
if(ReadyWeapon or Running)
{
	key = m
}
Send {Blind}{%key% DownTemp}
return

*~Numpad7 up::
global ReadyWeapon
global Running
; numpad7_var := false
key = e
if(ReadyWeapon or Running)
{
	key = m
}
Send {Blind}{%key% up}
return

; *MButton::
; SetKeyDelay -1
; mbutton_sleep_var := 50
; mbutton_var := true
; while(mbutton_var)
; {
	; Send {Blind}{Click DownTemp middle}
	; Sleep mbutton_sleep_var
	; Send {Blind}{Click up middle}
	; Sleep mbutton_sleep_var
; }
; return

; *MButton up::
; mbutton_var := false
; return

*~Numpad9::
speed := 15
CenterMouse()
MouseMove, (A_ScreenWidth/2 + A_ScreenWidth/60), A_ScreenHeight/2, speed
return

*NumpadDot::
SetKeyDelay -1
global ReadyWeapon
numpaddot_sleep_var := 50
numpaddot_var := true
while(numpaddot_var)
{
	Send {Blind}{e DownTemp}
	Sleep numpaddot_sleep_var
	Send {Blind}{e up}
	Sleep numpaddot_sleep_var
}
return

*NumpadDot up::
numpaddot_var := false
return