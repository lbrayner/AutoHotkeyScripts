#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

global Sprint := 0
global Crouch := 0

StopCrouching()
{
	global Crouch
	
	Crouch := 0
	Send {c up}
}

End::ExitApp
return

*~NumpadEnter::
global Crouch
Crouch := 1
Send {c DownTemp}
return

*~Numpad8::
SetKeyDelay -1
global Sprint
Sprint := 1
return

*~Numpad8 up::
SetKeyDelay -1
global Sprint
Sprint := 0 
return

*~Numpad0::
SetKeyDelay -1
global Sprint
if(!Sprint)
{
	StopCrouching()
	Send {w DownTemp}{Space DownTemp}
}

return

*~Numpad0 up::
SetKeyDelay -1
Send {w up}{Space up}
return



*~Numpad7::
SetKeyDelay -1
StopCrouching()
Send {k DownTemp}
return

*~Numpad7 up::
SetKeyDelay -1
Send {k up}
return



*~LButton::
SetKeyDelay -1
StopCrouching()
return

Numpad2::Space