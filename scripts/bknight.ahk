#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

#IfWinActive, ahk_exe  BatmanAK.exe

CoordMode, Mouse, Screen

global MouseMoveXAll := 190

MoveCursor(x,y)
{
    DllCall("SetCursorPos", int, x, int, y)
}

MouseMoveX(x)
{
	MouseMove x,0,2, R
}

CenterMouse()
{
    MoveCursor(A_ScreenWidth/2,A_ScreenHeight/2)
}

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

~*Home::
SetKeyDelay -1
UnCrouch()
Send {Blind}{Esc DownTemp}
return

~*Home up::
SetKeyDelay -1
Send {Blind}{Esc up}
return

*Numpad2::
global MouseMoveXAll
CenterMouse()
if(var)
{
    MouseMoveX(MouseMoveXAll)
}
else
{
    MouseMoveX(-MouseMoveXAll)
}
var := !var
return

~*NumpadAdd::
global Boost
Boost := 1
Send {Blind}{F7 DownTemp}
return

*~Return::
UnCrouch()
UnReadyGadget()
UnBoost()
return

~*NumpadDiv::
SetKeyDelay -1
global ReadyGadget
if(!ReadyGadget)
{	
	ReadyGadget := 1
	Send {Click DownTemp right}
}
return

~*Numpad1::
global Crouch
global ReadyGadget
if(Crouch || ReadyGadget)
{
    one_sleep_var = 50
    Send {Blind}{MButton DownTemp}
    Sleep one_sleep_var
    Send {Blind}{MButton up}
    return
}
Crouch := 1
Send {Blind}{NumpadEnter DownTemp}
return

~*Numpad8::
SetKeyDelay -1
Send {Blind}{w DownTemp}
return

~*Numpad8 up::
SetKeyDelay -1
Send {Blind}{w up}
return

Insert::Tab
return

~*XButton1::
SetKeyDelay -1
UnCrouch()
sleep_var := 100
Send {Blind}{Return DownTemp}
Sleep sleep_var
Send {Blind}{Click DownTemp right}
Sleep sleep_var
Send {Blind}{Return up}{Click up right}
return

~*F9::
SetKeyDelay -1
f9_var := true
f9_sleep_var := 1
while(f9_var)
{		
	MouseMoveX(-50)
	Sleep f9_sleep_var
}
return

~*F9 up::
SetKeyDelay -1
f9_var := false
MoveCursor(A_ScreenWidth,A_ScreenHeight)
return

~*F10::
SetKeyDelay -1
f10_var := true
f10_sleep_var := 1
while(f10_var)
{		
	MouseMoveX(50)
	Sleep f10_sleep_var
}
return

~*F10 up::
SetKeyDelay -1
f10_var := false
MoveCursor(0,0)
return

F3::RButton
return

F4::LButton
return

~*F5::
SetKeyDelay -1
f5_sleep_var := 10
Send {Blind}{WheelDown}
Sleep f5_sleep_var
return

~*F6::
SetKeyDelay -1
f6_sleep_var := 10
Send {Blind}{WheelUp}
Sleep f6_sleep_var
return

;******************************QTE***************************

~*NumpadSub::
SetKeyDelay -1
sub_var := true
sub_sleep_var := 1
while(sub_var)
{		
	Send {Blind}{w DownTemp}{Click DownTemp}
	Sleep sub_sleep_var
	Send {Blind}{w up}{Click up}
	Sleep sub_sleep_var
}
return

~*NumpadSub up::
SetKeyDelay -1
sub_var := false
return

~*NumpadDot::
SetKeyDelay -1
dot_var := true
dot_sleep_var := 50
while(dot_var)
{	
	Send {Blind}{Space DownTemp}
	Sleep dot_sleep_var
	Send {Blind}{Space up}
	Sleep dot_sleep_var
}
return

~*NumpadDot up::
SetKeyDelay -1
dot_var := false
return

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

~*PgDn::
global Crouch
if(Crouch)
{
    UnCrouch()
}
return

~*=::
SetKeyDelay -1
UnCrouch()
return

;~*= up::
;SetKeyDelay -1
;Send {Blind}{Esc up}
;return
