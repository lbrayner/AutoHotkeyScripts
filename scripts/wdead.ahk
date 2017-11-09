#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

#IfWinActive, Telltale Games

Numpad4::a
return

Numpad5::s
return

Numpad6::d
return

Numpad8::w
return

Numpad9::q
return

PgDn::f
return

PgUp::r
return

~*Numpad7::
Send {Click DownTemp}{e DownTemp}
return

~*Numpad7 up::
Send {Click up}{e up}
return

Insert::Esc
return

Home::Esc
return

~*NumpadDot::
SetKeyDelay -1
var := true
sleep_var := 1
while(var)
{	
	Send {Blind}{e DownTemp}{q DownTemp}
	Sleep sleep_var	
	Send {Blind}{e up}{q up}
	Sleep sleep_var	
}
return

~*NumpadDot up::
var := false
return
