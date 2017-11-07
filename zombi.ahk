#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

global ReadyWeapon := 0
global ReadyScanner := 0
global AutoFire := 0

UnreadyWeapon()
{
	global ReadyWeapon
		
	ReadyWeapon := 0
	Send {Click up right}
}

UnreadyScanner()
{
	global ReadyScanner
		
	ReadyScanner := 0
	Send {Numpad1 up}
}

End::ExitApp
return

~*NumpadDiv::
SetKeyDelay -1
global ReadyWeapon
UnreadyScanner()
if(!ReadyWeapon)
{	
	ReadyWeapon := 1
	Send {Click DownTemp right}
}
return

*Numpad1::
SetKeyDelay -1
global ReadyScanner
UnreadyWeapon()
if(!ReadyScanner)
{	
	ReadyScanner := 1
	Send {Numpad1 DownTemp}
}
return

~*RButton up::
SetKeyDelay -1
UnreadyWeapon()
return

*~Numpad0::
SetKeyDelay -1
UnreadyWeapon()
UnreadyScanner()
return

*~PgDn::
SetKeyDelay -1
UnreadyWeapon()
UnreadyScanner()
return

*~Numpad9::
SetKeyDelay -1
UnreadyScanner()
return


~*Numpad8::
UnreadyScanner()
return

~*Numpad5::
UnreadyScanner()
return

~*Numpad6::
UnreadyScanner()
return

~*Numpad4::
UnreadyScanner()
return

*Numpad7::
SetKeyDelay -1
global ReadyWeapon
numpad7_sleep_var := 50
numpad7_var := true
while(numpad7_var)
{
	Send {Blind}{Numpad7 DownTemp}
	Sleep numpad7_sleep_var
	Send {Blind}{Numpad7 up}
	Sleep numpad7_sleep_var
}
return

*Numpad7 up::
numpad7_var := false
return