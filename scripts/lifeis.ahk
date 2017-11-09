#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file


CoordMode, Mouse, Screen

UnSprint()
{
	global Sprint
	Sprint := 0
	Send {F5 up}
}

~*PgDn::
SetKeyDelay -1
esc_var := true
esc_sleep_esc_var := 100
while(esc_var)
{	
	Send {Blind}{Esc DownTemp}
	Sleep esc_sleep_esc_var
	Send {Blind}{Esc up}
	Sleep esc_sleep_esc_var
}
return

~*PgDn up::
esc_var := false
return

F11::ExitApp
return

*~Numpad8 up::
SetKeyDelay -1
UnSprint()
return

*~NumpadEnter::
global Sprint
Sprint := 1
Send {F5 DownTemp}
return
