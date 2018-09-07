#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

#IfWinActive, ahk_exe bio4.exe

Joy4::
joy4_var := true
joy4_sleep_var := 50
while(joy4_var)
{		
	Send {Blind}{Joy4 DownTemp}
	Sleep joy4_sleep_var
	Send {Blind}{Joy4 up}
	Sleep joy4_sleep_var
}
return

Joy4 up::
joy4_var := false
return

~*Home::
Send {Blind}{Esc DownTemp}
return

~*Home up::
Send {Blind}{Esc up}
return

