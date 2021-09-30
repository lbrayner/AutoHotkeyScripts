#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

#SingleInstance force

#IfWinActive, ahk_exe SniperElite3.exe

global ReadyWeapon := 0

UnreadyWeapon()
{
	global ReadyWeapon

	ReadyWeapon := 0
	Send {LCtrl up}
}

~*NumpadDiv::
SetKeyDelay -1
global ReadyWeapon
if(!ReadyWeapon)
{
	ReadyWeapon := 1
	Send {LCtrl DownTemp}
}
return

~*RButton::
UnreadyWeapon()
return

*~Home::
UnreadyWeapon()
Send {Esc DownTemp}
return

*~Home up::
Send {Esc up}
return

~*Numpad4::
SetKeyDelay -1
Send {Blind}{a DownTemp}
return

~*Numpad4 up::
SetKeyDelay -1
Send {Blind}{a up}
return

~*Numpad5::
SetKeyDelay -1
Send {s DownTemp}
return

~*Numpad5 up::
SetKeyDelay -1
Send {s up}
return

~*Numpad6::d
return

~*Numpad8::w
return

~*Numpad0::
SetKeyDelay -1
Send {Space DownTemp}
return

~*Numpad0 up::
SetKeyDelay -1
Send {Space up}
return

~*Numpad1::c
return

~*Numpad3::z
return

~*Numpad9::q
return

~*Numpad7::
SetKeyDelay -1
Send {e DownTemp}
return

~*Numpad7 up::
SetKeyDelay -1
Send {e up}
return

*PgDn::
SetKeyDelay -1
Send {f DownTemp}
return

*PgDn up::
SetKeyDelay -1
Send {f up}
return

~*PgUp::
SetKeyDelay -1
Send {r DownTemp}
return

~*PgUp up::
SetKeyDelay -1
Send {r up}
return
