#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

#IfWinActive, ahk_exe  CoJGunslinger.exe

FreeRoam()
{
    Run C:/Users/leona/winbat/accel/cojuarez_free_roam.bat, "", Hide
}

AimDownSights()
{
    Run C:/Users/leona/winbat/accel/cojuarez_aim_down_sights.bat, "", Hide
}

OneEighty(x)
{
    DllCall("mouse_event", uint, 1, int, x, int, 0, uint, 0, int, 0)
}

IsWeaponReady()
{
    if GetKeyState("RButton")
    {
        return 1
    }

    return 0
}

UnreadyWeapon()
{
	global WeaponReady
    if(IsWeaponReady())
    {
        FreeRoam()
        WeaponReady := 0
        Send {Click up right}
    }
}

ReadyWeapon()
{
    if(!IsWeaponReady())
    {
        AimDownSights()
        Send {Click DownTemp right}
    }
}

~*RButton::
SetKeyDelay -1
UnreadyWeapon()
return

~*NumpadDiv::
SetKeyDelay -1
ReadyWeapon()
return

~*Numpad0::Space
return

~*Numpad1::c
return

~*Numpad3::z
return

~*Numpad9::q
return

~*Numpad8::w
return

~*Numpad4::a
return

~*Numpad5::s
return

~*Numpad6::d
return

~*Numpad7::e
return

~*PgUp::r
return

~*PgDn::f
return

*NumpadEnter::LShift
return

~*Insert::Tab
return

~*XButton1::MButton
return

~*Home::Esc
return

~*Numpad2::
global OneEightyAll
OneEighty(4500)
return

