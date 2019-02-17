#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

#IfWinActive, ahk_exe Yakuza0.exe

UnFocus()
{
    SetKeyDelay -1
	global Focus
    if(Focus)
    {
        Focus := 0
        Send {f up}
    }
}

~*PgDn::
SetKeyDelay -1
global Focus
if(!Focus)
{	
	Focus := 1
	Send {f DownTemp}
}
return

*~Home::
SetKeyDelay -1
Send {Esc DownTemp}
UnFocus()
return

*~Home up::
SetKeyDelay -1
Send {Esc up}
return

~*Numpad4::a
return

~*Numpad5::s
return

~*Numpad6::d
return

~*Numpad8::w
return

~*Numpad0::Space
return

~*Numpad1::c
return

~*Numpad9::q
return

~*Numpad7::
SetKeyDelay -1
Send {e DownTemp}
UnFocus()
return

~*Numpad7 up::
SetKeyDelay -1
Send {e up}
return
