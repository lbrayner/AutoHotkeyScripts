#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

#IfWinActive, ahk_exe  Near Death.exe

global OneEightyAll := 3600

OneEighty(x)
{
	DllCall("mouse_event", uint, 0, int, x, int, 0, uint, 0, int, 0)
}

Home::Esc
return

~*Right::
SetKeyDelay -1
Send {Blind}{1 DownTemp}
return

~*Right up::
SetKeyDelay -1
Send {Blind}{1 up}
return

;*WheelUp::
;SetKeyDelay -1
;sleep_var := 50
;Send {Blind}{2 DownTemp}
;Sleep sleep_var
;Send {Blind}{2 up}
;return
;
;*WheelDown::
;SetKeyDelay -1
;sleep_var := 50
;Send {Blind}{3 DownTemp}
;Sleep sleep_var
;Send {Blind}{3 up}
;return


~*Numpad2::
global OneEightyAll
OneEighty(OneEightyAll)
return

~*NumpadDot::
global Action_var
Action_var := true
action_sleep_var := 50
while(Action_var)
{	
    Send {Blind}{Numpad7 DownTemp}
    Sleep action_sleep_var	
    Send {Blind}{Numpad7 up}
    Sleep action_sleep_var	
}
return

~*NumpadDot up::
global Action_var
Action_var := false
return
