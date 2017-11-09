#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

#IfWinActive, ahk_exe  Life is Strange - Before the Storm.exe

CoordMode, Mouse, Screen

global OneEightyAll := 9000

OneEighty(x)
{
	DllCall("mouse_event", uint, 1, int, x, int, 0, uint, 0, int, 0)
}

~*Home::Esc
return

~*Numpad2::
global OneEightyAll
OneEighty(OneEightyAll)
return

~*PgDn::
Send {Blind}{Click DownTemp}
return

~*PgDn up::
Send {Blind}{Click up}
return

~*NumpadEnter::
Send {Blind}{LCtrl DownTemp}
return

~*NumpadEnter up::
Send {Blind}{LCtrl up}
return

~*Numpad0::Space
return
