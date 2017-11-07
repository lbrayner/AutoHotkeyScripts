#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

#IfWinActive, ahk_exe  MirrorsEdgeCatalyst.exe

global Walk := 0

UnWalk()
{
	global Walk
		
	Walk := 0
	Send {Numpad3 up}
}

End::ExitApp
return

~*NumpadDiv::
SetKeyDelay -1
global Walk
if(!Walk)
{	
	Walk := 1
	Send {Numpad3 DownTemp}
}
return

~*RButton::
SetKeyDelay -1
UnWalk()
return

*~Numpad0::
SetKeyDelay -1
UnWalk()
return

*~PgDn::
SetKeyDelay -1
UnWalk()
return
