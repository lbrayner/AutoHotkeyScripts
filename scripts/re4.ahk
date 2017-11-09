#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file


CoordMode, Mouse, Screen

global SleepVar := 100

global Displacement := 1000
global Minimum := 0

global ReadyWeapon := 0
global ReadyKnife := 0

CenterMouse()
{
	DllCall("mouse_event", uint, 32769, int, 32768, int, 32768, uint, 0, int, 0)
	;MouseMove, A_ScreenWidth/2, A_ScreenHeight/2, 10
	;MouseMove, 10, 10, 10
	
}

StopTurning()
{
	turningLeft := 0
	turningRight := 0
	SendInput {Blind}{Numpad4 up}{Numpad6 up}
}

UnreadyWeapon()
{
	global ReadyWeapon
	
	if(ReadyWeapon)
	{
		Send {Click up right}
		ReadyWeapon := 0
		Sleep Sleep_var
	}
}

UnreadyKnife()
{
	global ReadyKnife
	
	if(ReadyKnife)
	{
		Send {k up}{Numpad8 up}
		ReadyKnife := 0
		Sleep Sleep_var
	}
}

;******************************MOUSE-TURNING*****************
;******************************MOUSE-TURNING*****************
;******************************MOUSE-TURNING*****************
;******************************MOUSE-TURNING*****************
;******************************MOUSE-TURNING*****************
;******************************MOUSE-TURNING*****************
;******************************MOUSE-TURNING*****************
;******************************MOUSE-TURNING*****************
;******************************MOUSE-TURNING*****************
;******************************MOUSE-TURNING*****************
;******************************MOUSE-TURNING*****************
;******************************MOUSE-TURNING*****************
;******************************MOUSE-TURNING*****************
;******************************MOUSE-TURNING*****************


Loop, 
{	
		
	if(mousemove)	
	{		
		;CenterMouseX(PosY1)
		CenterMouse()
	}
	
	MouseGetPos, PosX1, PosY1
	
	Sleep SleepVar
	
	if(mousemove && !ReadyWeapon && !ReadyKnife)
	{				
		MouseGetPos, PosX2, PosY2
		
		Pos := PosX2 - PosX1
		
		if(Pos < 0)
		{
			if((Pos*(-1)) < Displacement && (Pos*(-1)) > Minimum)
			{
				turningRight := 0
				turningLeft := 1 
				still := 0
				
				SendInput {Blind}{Numpad6 up}
				SendInput {Blind}{Numpad4 DownTemp}				

			}
		}
		else
		{
			if(Pos > 0)
			{
				if(Pos < Displacement && Pos > Minimum)
				{
					turningRight := 1
					turningLeft := 0
					still := 0
					
					SendInput {Blind}{Numpad4 up}				
					SendInput {Blind}{Numpad6 DownTemp}
				}
			}
			else
			{
				if(!still)
				{
					still := 1
					StopTurning()
				}
			}
		}
	}
}
return

~*Home::Esc

~*NumpadSub::
SetKeyDelay -1
sub_var := true
sub_sleep_sub_var := 100
while(sub_var)
{	
	Send {Blind}{Esc DownTemp}
	Sleep sub_sleep_sub_var
	Send {Blind}{Esc up}
	Sleep sub_sleep_sub_var
}
return

~*NumpadSub up::
sub_var := false
return

;~*F10::
;Suspend On
;return
;
;~*F11::
;Suspend Off
;return

Numpad2::Numpad7

F11::ExitApp
return

;~*RCtrl:: 
;mousemove := true
;return
;
;~*RAlt:: 
;mousemove := false
;return


~*NumpadEnter::
walking := not walking
return

*Numpad7::
SetKeyDelay -1
numpad7_var := true
sleep_var := 100
UnreadyWeapon()
UnreadyKnife()
while(numpad7_var)
{	
	Send {Blind}{Numpad7 DownTemp}
	Sleep sleep_var
	Send {Blind}{Numpad7 up}
	Sleep sleep_var
}
return

*Numpad7 up::
numpad7_var := false
return

~*PgDn::
SetKeyDelay -1
UnreadyWeapon()
UnreadyKnife()
return


*~NumpadDiv::
SetKeyDelay -1
global ReadyWeapon
UnreadyKnife()
if(!ReadyWeapon)
{	
	ReadyWeapon := 1
	Send {Click DownTemp right}
}
return

~*RButton::
SetKeyDelay -1
UnreadyWeapon()
UnreadyKnife()
return

~*Numpad9::
SetKeyDelay -1
global ReadyKnife
UnreadyWeapon()
if(!ReadyKnife)
{
	;Send {Blind}{Numpad9 DownTemp}{Numpad8 DownTemp}
	ReadyKnife := true
	Send {Blind}{k DownTemp}{Numpad8 DownTemp}
}
return

~*Numpad8::
SetKeyDelay -1
UnreadyWeapon()
UnreadyKnife()
if(!walking)
{
	Send {Blind}{Space DownTemp}
}
return

~*Numpad8 up::
SetKeyDelay -1
Send {Blind}{Space up}
return

~*Numpad5::
SetKeyDelay -1
UnreadyWeapon()
UnreadyKnife()
return

~*Numpad4::
SetKeyDelay -1
UnreadyWeapon()
UnreadyKnife()
return

~*Numpad6::
SetKeyDelay -1
UnreadyWeapon()
UnreadyKnife()
return

~*Numpad0::
SetKeyDelay -1
UnreadyWeapon()
UnreadyKnife()
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

~*Numpad1::
SetKeyDelay -1
global ReadyWeapon
if(!ReadyWeapon)
{
	Send {Blind}{Click down} {Click down right}
}
else
{
	Send {Blind}{Click down}
}
Send {Blind}{x DownTemp}{c DownTemp}
return

~*Numpad1 up::
SetKeyDelay -1
global ReadyWeapon
if(!ReadyWeapon)
{
	Send {Blind}{Click up} {Click up right}
}
else
{
	Send {Blind}{Click up}
}
Send {Blind}{x up}{c up}
return

~*Numpad3::
SetKeyDelay -1
global ReadyWeapon
if(!ReadyWeapon)
{
	Send {Blind}{Click down} {Click down right}
}
else
{
	Send {Blind}{Click down}
}
return

~*Numpad3 up::
SetKeyDelay -1
global ReadyWeapon
if(!ReadyWeapon)
{
	Send {Blind}{Click up} {Click up right}
}
else
{
	Send {Blind}{Click up}
}
return

~*MButton::
SetKeyDelay -1
Send {Blind}{Click down} {Click down right}
Send {Blind}{x DownTemp}{c DownTemp}
return

~*MButton up::
SetKeyDelay -1
Send {Blind}{Click up} {Click up right}
Send {Blind}{x up}{c up}
return

~*F5::
SetKeyDelay -1
Send {Blind}{Click down} {Click down right}
return

~*F5 up::
SetKeyDelay -1
Send {Blind}{Click up} {Click up right}
return

~*F6::
SetKeyDelay -1
Send {Blind}{x DownTemp} {c DownTemp}
return

~*F6 up::
SetKeyDelay -1
Send {Blind}{x up} {c up}
return

~*NumpadMult::
SetKeyDelay -1
var := true
sleep_var := 1
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
sleep_var := 1
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
