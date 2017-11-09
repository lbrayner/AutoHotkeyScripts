#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

#IfWinActive, ahk_exe  MirrorsEdgeCatalyst.exe

CoordMode, Mouse, Screen

~*NumpadSub::
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

~*NumpadSub up::
esc_var := false
return

~*PgDn::
SetKeyDelay -1
Send {f DownTemp}
return

~*PgDn up::
SetKeyDelay -1
Send {f up}
return

~*Numpad7::
SetKeyDelay -1
Send {e DownTemp}
return

~*Numpad7 up::
SetKeyDelay -1
Send {e up}
return

~*Numpad1::
SetKeyDelay -1
Send {Click DownTemp right}
return

~*Numpad1 up::
SetKeyDelay -1
Send {Click up right}
return

~*PgUp::
SetKeyDelay -1
Send {r DownTemp}
return

~*PgUp up::
SetKeyDelay -1
Send {r up}
return

~*Insert::
SetKeyDelay -1
Send {Tab DownTemp}
return

~*Insert up::
SetKeyDelay -1
Send {Tab up}
return

Home::Esc
