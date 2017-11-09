#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

CoordMode, Mouse, Screen

global HealingOff := 0

global ReadyWeapon := 0
global ReadySecondary := 0
global Walk := 0
global Sprint := 0


UnreadyWeapon()
{
	global ReadyWeapon
		
	ReadyWeapon := 0
	Send {Click up right}
}

UnreadySecondary()
{
	global ReadySecondary
		
	ReadySecondary := 0
	Send {F7 up}
}

StopWalking()
{
	global Walk
	
	Walk := 0
	Send {Return up}
}

End::ExitApp
return

~*Escape::
UnreadySecondary()
UnreadyWeapon()
StopWalking()
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
UnreadySecondary()
StopWalking()
return

NumpadEnter::
SetKeyDelay -1
global Walk
if(!Walk)
{	
	Walk := 1
	Send {Return DownTemp}
}
return

NumpadMult::
SetKeyDelay -1
global ReadySecondary
if(!ReadySecondary)
{	
	ReadySecondary := 1
	Send {F7 DownTemp}
}
return

*NumpadAdd::
SetKeyDelay -1
global HealingOff
if(!HealingOff)
{
	heal_sleep_var := 3000
	Send {Blind}{NumpadAdd DownTemp}
	Sleep heal_sleep_var
	Send {Blind}{NumpadAdd up}
}

return

*PgDn::
SetKeyDelay -1
Send {t DownTemp}
return

*PgDn up::
SetKeyDelay -1
Send {t up}
return

*Numpad7::
SetKeyDelay -1
sleep_var := 50
var := true
while(var)
{
	Send {Blind}{Numpad7 DownTemp}{g DownTemp}
	Sleep sleep_var
	Send {Blind}{Numpad7 up}{g up}
	Sleep sleep_var
}
return

*Numpad7 up::
SetKeyDelay -1
var := false
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

*Numpad0::
SetKeyDelay -1
global Sprint
if(Sprint)
{
	Send {Numpad0 DownTemp}
}
else
{
	Send {Numpad0 DownTemp}{Space DownTemp}
}
UnreadyWeapon()
UnreadySecondary()
StopWalking()
return

*Numpad0 up::
SetKeyDelay -1
Send {Numpad0 up}{Space up}
return

*Numpad2::
SetKeyDelay -1
sleep_var := 50
UnreadyWeapon()
UnreadySecondary()
StopWalking()
Sleep sleep_var
Send {Numpad2 DownTemp}
return

*Numpad2 up::
SetKeyDelay -1
Send {Numpad2 up}
return

*MButton::
SetKeyDelay -1
global ReadyWeapon
if(ReadyWeapon)
{
	Send {Blind}{z DownTemp}
}
else
{
	Send {Blind}{3 DownTemp}
}
return

*MButton up::
SetKeyDelay -1
global ReadyWeapon
if(ReadyWeapon)
{
	Send {Blind}{z up}
}
else
{
	Send {Blind}{3 up}
}
return

*NumpadDot::
SetKeyDelay -1
var := true
sleep_var := 50
speed := 1
displacement_wiggle := 100
while(var)
{	
	MouseMove, (A_ScreenWidth/2 + displacement_wiggle), A_ScreenHeight/2, speed
	Sleep sleep_var

	MouseMove, (A_ScreenWidth/2 - displacement_wiggle), A_ScreenHeight/2, speed
	Sleep sleep_var

}
return

*NumpadDot up::
var := false
return

~*F12:: 
SetKeyDelay -1
global HealingOff
HealingOff := 1
return


~*F11:: 
SetKeyDelay -1
global HealingOff
HealingOff := 0

return


Pause::Escape