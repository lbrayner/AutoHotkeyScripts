#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file
#SingleInstance force

#IfWinActive, ahk_exe SniperElite3.exe

global ReadyWeapon := 0

UnreadyWeapon()
{
	global ReadyWeapon

	ReadyWeapon := 0
	Send {b up}
}

~*NumpadDiv::
SetKeyDelay -1
global ReadyWeapon
if(!ReadyWeapon)
{
	ReadyWeapon := 1
	Send {b DownTemp}
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

~*WheelUp::
Send {1 DownTemp}
Send {1 up}
return

~*WheelDown::
Send {2 DownTemp}
Send {2 up}
return

~*Numpad0::
SetKeyDelay -1
UnreadyWeapon()
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
UnreadyWeapon()
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

~*NumpadEnter::
UnreadyWeapon()
Send {LCtrl DownTemp}
return

~*NumpadEnter up::
Send {LCtrl up}
return

; Movement
; Movement
; Movement

~*Numpad8::w
return
~*Numpad4::a
return
~*Numpad5::s
return
~*Numpad6::d
return
