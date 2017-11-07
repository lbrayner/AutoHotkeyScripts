#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

#IfWinActive, ahk_exe  DoubleDragon.exe

Home::Esc
return

Numpad8::Up
return
Numpad5::Down
return
Numpad4::Left
return
Numpad6::Right
return

Numpad1::c
return
Numpad7::e
return
Numpad0::Space
return

PgDn::f
return

d::Space
return

*s::
SetKeyDelay -1
s_sleep_var := 50
s_var := true
while(s_var)
{
	Send {Blind}{s DownTemp}
	Sleep s_sleep_var
	Send {Blind}{s up}
	Sleep s_sleep_var
}
return

*s up::
s_var := false
return

*a::
SetKeyDelay -1
a_sleep_var := 50
a_var := true
while(a_var)
{
	Send {Blind}{a DownTemp}
	Sleep a_sleep_var
	Send {Blind}{a up}
	Sleep a_sleep_var
}
return

*a up::
a_var := false
return
