#UseHook
#MaxHotkeysPerInterval 200  

CoordMode, Mouse, Screen

global SleepVar := 50

global MouseMove := 0
global Walking := 0
global Displacement := 1000
global Minimum := 0

global ReadyWeapon := 0

; VOID WINAPI mouse_event(
  ; _In_ DWORD     dwFlags,
  ; _In_ DWORD     dx,
  ; _In_ DWORD     dy,
  ; _In_ DWORD     dwData,
  ; _In_ ULONG_PTR dwExtraInfo
; );


CenterMouse()
{
	DllCall("mouse_event", uint, 32769, int, 32768, int, 65536, uint, 0, int, 0)
	
	; DllCall("mouse_event", uint, 0, uint, 32768, uint, 32768, uint, 0, uint, 0)
	
	
	
}

StopTurning()
{
	turningLeft := 0
	turningRight := 0
	SendInput {Blind}{Numpad4 up}{Numpad6 up}
}

StopWalking()
{
	global Walking
	
	if(Walking)
		Walking := false
}

Release()
{
	global ReadyWeapon
	
	if(ReadyWeapon)
	{
		; Send {Blind}{x up}
		Send {Blind}{Click up right}
		ReadyWeapon := 0
	}
}

Loop, 
{	
		
	global SleepVar
	global MouseMove
		
	if(MouseMove)	
	{			
		CenterMouse()
	}
	
	MouseGetPos, PosX1, PosY1
	
	Sleep SleepVar
	
	if(MouseMove)
	{	
		MouseGetPos, PosX2, PosY2
		
		Pos := PosX2 - PosX1
		
		if(Pos < 0)
		{
			
			if((Pos*(-1)) < Displacement && (Pos*(-1))  Minimu)
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

End::ExitApp
return

Home::Escape

~*PgDn::
SetKeyDelay -1
Release()
StopWalking()
Send {Blind}{Escape Downtemp}
return

~*PgDn up::
SetKeyDelay -1
Send {Blind}{Escape up}
return

*Numpad0::
SetKeyDelay -1
sleep_var := 50
Release()
Send {Blind}{Numpad5 Downtemp}
Sleep sleep_var
Send {Blind}{Numpad0 Downtemp}
Sleep sleep_var
Send {Blind}{Numpad0 up}{Numpad5 up}
return

; *Numpad0 up::
; SetKeyDelay -1
; Send {Blind}{Numpad0 up}
; return

*Numpad7::
Release()
StopWalking()
SetKeyDelay -1
Send {Blind}{Numpad7 Downtemp}{Return DownTemp}
return

*Numpad7 up::
SetKeyDelay -1
Send {Blind}{Numpad7 up}{Return up}
return

~*NumpadDiv::
global ReadyWeapon
if(!ReadyWeapon)
{
	ReadyWeapon := 1
	; Send {Blind}{x DownTemp}
	Send {Blind}{Click DownTemp right}
}
return


~*RButton up::
SetKeyDelay -1
Release()
StopWalking()
return

; *LButton::
; SetKeyDelay -1
; Send {Blind}{c Downtemp}
; return

; *LButton up::
; SetKeyDelay -1
; Send {Blind}{c up}
; return

~*Numpad2::
SetKeyDelay -1
global Walking
Walking := true
return



*Numpad8::
SetKeyDelay -1
global Walking
global ReadyWeapon
if (!Walking && !ReadyWeapon)
	Send {Blind}{Space DownTemp}{Numpad8 DownTemp}
else
	Send {Blind}{Numpad8 DownTemp}	
return

*Numpad8 up::
Send {Blind}{Space up}{Numpad8 up}
return

*NumpadMult::
SetKeyDelay -1
var := true
sleep_var := 50
while(var)
{
	Send {Blind}{Numpad8 DownTemp}{c DownTemp}
	Sleep sleep_var
	Send {Blind}{Numpad4 DownTemp}{Numpad8 up}{c up}
	Sleep sleep_var
	Send {Numpad5 DownTemp}{Numpad4 up}{c DownTemp}
	Sleep sleep_var
	Send {Blind}{Numpad6 DownTemp}{Numpad5 up}{c up}
	Sleep sleep_var
	Send {Blind}{Numpad6 up}
	Sleep sleep_var
}
return

*NumpadMult up::
var := false
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

*RCtrl:: 
SetKeyDelay -1
MouseMove := 0
Send {LCtrl DownTemp}
return

*RCtrl up:: 
SetKeyDelay -1
Send {LCtrl up}
return

*RAlt:: 
SetKeyDelay -1
MouseMove := 1
Send {LAlt DownTemp}
return

*RAlt up:: 
SetKeyDelay -1
Send {LAlt up}
return
