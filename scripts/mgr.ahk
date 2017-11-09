#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

CoordMode, Mouse, Screen

global Displacement := 1000
global Minimum := 0
global SleepVar := 50

global LookingRight := 0
global LookingLeft := 0 
global LookingUp := 0
global LookingDown := 0 
global Still := 0

global ReadySecondary := 0
global Walk := 0
global BladeMode := 0

global NinjaRunning := 0

UnreadySecondary()
{
	global ReadySecondary
		
	ReadySecondary := 0
	Send {NumpadMult up}
}

Un_BladeMode()
{
	global BladeMode
		
	BladeMode := 0
	Send {Alt up}
}

StopWalking()
{
	global Walk
	
	Walk := 0
	Send {NumpadEnter up}
}

CenterMouse()
{
	DllCall("mouse_event", uint, 32769, int, 32768, int, 32768, uint, 0, int, 0)
}

StopLooking()
{
	global LookingRight
	global LookingLeft
	global LookingUp
	global LookingDown
	global Still
	
	Still := 1

	LookingLeft := 0
	LookingRight := 0
	LookingUp := 0
	LookingDown := 0
	SendInput {Blind}{Numpad4 up}{Numpad6 up}{Numpad8 up}{Numpad5 up}
}

LookRight(posX)
{
	global Displacement
	global Minimum

	global LookingRight
	global LookingLeft
	global Still
	
	

	if(posX < Displacement AND posX > Minimum)
	{
	
	;	msgBox %posX%
		LookingRight := 1
		LookingLeft := 0
		Still := 0
		
		SendInput {Blind}{Numpad4 up}				
		SendInput {Blind}{Numpad6 DownTemp}
	}
}

LookLeft(posX)
{
	
	global Displacement
	global Minimum
	
	global LookingRight
	global LookingLeft
	global Still

	
	
	if((posX*(-1)) < Displacement AND (posX*(-1)) > Minimum)	
	{
	;	msgBox %posX%
	
		LookingRight := 0
		LookingLeft := 1 
		Still := 0
		
		SendInput {Blind}{Numpad6 up}
		SendInput {Blind}{Numpad4 DownTemp}				
	}
}

LookDown(posY)
{
	global Displacement
	global Minimum

	global LookingUp
	global LookingDown
	global Still
	
	

	if(posY < Displacement AND posY > Minimum)
	{
	
	;	msgBox %posX%
		LookingDown := 1
		LookingUp := 0
		Still := 0
		
		SendInput {Blind}{Numpad8 up}				
		SendInput {Blind}{Numpad5 DownTemp}
	}
}

LookUp(posY)
{
	
	global Displacement
	global Minimum
	
	global LookingUp
	global LookingDown
	global Still

	
	
	if((posY*(-1)) < Displacement AND (posY*(-1)) > Minimum)	
	{
		;msgBox %posY%
	
		LookingDown := 0
		LookingUp := 1 
		Still := 0
		
		SendInput {Blind}{Numpad5 up}
		SendInput {Blind}{Numpad8 DownTemp}				
	}
}

/*
Loop, 
{	
		
	global SleepVar
	global BladeMode
	
	global LookingRight
	global LookingLeft
	global LookingUp
	global LookingDown
	global Still
		
	if(BladeMode)	
	{			
		CenterMouse()
	}
	
	MouseGetPos, posX1, posY1
	
	Sleep SleepVar
	
	if(BladeMode)
	 {	
		MouseGetPos, posX2, posY2
		
		posY1 := posY1 - A_ScreenHeight/2
		posY2 := posY2 - A_ScreenHeight/2	
		
		posX := posX2 - posX1
		posY := posY2 - posY1
		
		
		
		
		if(posX < 0 AND posY < 0)
		{
			
			LookLeft(posX)
			LookUp(posY)
			
		}
		else
		{
			if(posX > 0 AND posY < 0)
			{
				LookRight(posX)
				LookUp(posY)
			}
			else
			{
				if(posX < 0 AND posY > 0)
				{
					;msgBox "here"
					LookLeft(posX)
					LookDown(posY)
					
				}
				else
				{
					if(posX > 0 AND posY > 0)
					{
					;	msgBox here
						LookRight(posX)
						LookDown(posY)
					}
					else
					{
						if(!Still)
						{

							StopLooking()
						}
					}
				}
			}
		}
		
	}
	 
}
return 
*/

End::ExitApp
return

NumpadDiv::
SetKeyDelay -1
global BladeMode
if(!BladeMode)
{	
	BladeMode := 1
	Send {Alt DownTemp}
}
return



NumpadMult::
SetKeyDelay -1
global ReadySecondary
if(!ReadySecondary)
{	
	ReadySecondary := 1
	Send {NumpadMult DownTemp}
}
return

NumpadEnter::
SetKeyDelay -1
global Walk
if(!Walk)
{	
	Walk := 1
	Send {NumpadEnter DownTemp}
}
return

*LButton::
SetKeyDelay -1
sleep_var := 150
var := true
while(var)
{
	Send {Blind}{Click DownTemp}
	Sleep sleep_var
	Send {Blind}{Click up}
	Sleep sleep_var
}
return

*LButton up::
var := false
return

*RButton::
SetKeyDelay -1
global BladeMode
sleep_var := 150
var := true
if(!BladeMode)
{
	while(var)
	{
		Send {Blind}{Click DownTemp right}
		Sleep sleep_var
		Send {Blind}{Click up right}
		Sleep sleep_var
	}
}
return

*RButton up::
Un_BladeMode()
UnreadySecondary()
StopWalking()
var := false
return


*Numpad0::
SetKeyDelay -1
global NinjaRunning
NinjaRunning := 1
Un_BladeMode()
UnreadySecondary()
StopWalking()
Send {Numpad0 DownTemp}
return

*Numpad0 up::
SetKeyDelay -1
global NinjaRunning
NinjaRunning := 0
Send {Numpad0 up}
return

*PgDn::
SetKeyDelay -1
sleep_var := 150
var := true
while(var)
{
	Send {Blind}{PgDn DownTemp}
	Sleep sleep_var
	Send {Blind}{PgDn up}
	Sleep sleep_var
}
return

*PgDn up::
var := false
return

*LShift::
SetKeyDelay -1
Send {Shift DownTemp}{Delete DownTemp}
return

*LShift up::
SetKeyDelay -1
Send {Shift up}{Delete up}
return

*WheelUp::
SetKeyDelay -1
sleep_var := 100
Sleep sleep_var/2
Send {Blind}{Numpad3 DownTemp}
Sleep sleep_var
Send {Blind}{Numpad3 up}
return

*WheelDown::
SetKeyDelay -1
sleep_var := 100
Sleep sleep_var/2
Send {Blind}{Numpad2 DownTemp}
Sleep sleep_var
Send {Blind}{Numpad2 up}
return

*NumpadDot::
SetKeyDelay -1
var := true
sleep_var := 50
while(var)
{
	Send {Blind}{Numpad8 DownTemp}
	Sleep sleep_var
	Send {Blind}{Numpad6 DownTemp}{Numpad8 up}
	Sleep sleep_var
	Send {Numpad5 DownTemp}{Numpad6 up}
	Sleep sleep_var
	Send {Blind}{Numpad4 DownTemp}{Numpad5 up}
	Sleep sleep_var
	Send {Blind}{Numpad4 up}
}
return

*NumpadDot up::
var := false
return

*w::
SetKeyDelay -1
global NinjaRunning
if(NinjaRunning)
{
	Send {Blind}{Numpad8 DownTemp}
}
else
{
	Send {Blind}{w DownTemp}
}
return

*w up::
SetKeyDelay -1
Send {Blind}{w up}{Numpad8 up}
return

*a::
SetKeyDelay -1
global NinjaRunning
if(NinjaRunning)
{
	Send {Blind}{Numpad4 DownTemp}
}
else
{
	Send {Blind}{a DownTemp}
}
return

*a up::
SetKeyDelay -1
Send {Blind}{a up}{Numpad4 up}
return

*s::
SetKeyDelay -1
global NinjaRunning
if(NinjaRunning)
{
	Send {Blind}{Numpad5 DownTemp}
}
else
{
	Send {Blind}{s DownTemp}
}
return

*s up::
SetKeyDelay -1
Send {Blind}{s up}{Numpad5 up}
return

*d::
SetKeyDelay -1
global NinjaRunning
if(NinjaRunning)
{
	Send {Blind}{Numpad6 DownTemp}
}
else
{
	Send {Blind}{d DownTemp}
}
return

*d up::
SetKeyDelay -1
Send {Blind}{d up}{Numpad6 up}
return

Pause::Escape
