#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

#IfWinActive, ahk_exe re2.exe

global ReadyWeapon := 0

UnreadyWeapon()
{
	global ReadyWeapon
		
	ReadyWeapon := 0
	Send {Click up right}
}

global ReadyKnife := 0

UnreadyKnife()
{
	global ReadyKnife
		
	ReadyKnife := 0
	Send {q up}
}

~*NumpadDiv::
SetKeyDelay -1
UnreadyKnife()
global ReadyWeapon
if(!ReadyWeapon)
{	
	ReadyWeapon := 1
	Send {Click DownTemp right}
}
return

~*Numpad9::
SetKeyDelay -1
UnreadyWeapon()
global ReadyKnife
if(!ReadyKnife)
{	
	ReadyKnife := 1
	Send {q DownTemp}
}
return

~*RButton::
UnreadyWeapon()
UnreadyKnife()
return

~*NumpadEnter::
UnreadyWeapon()
UnreadyKnife()
Send {LShift DownTemp}
return

~*NumpadEnter up::
Send {LShift up}
return

*~Home::
UnreadyWeapon()
UnreadyKnife()
Send {Esc DownTemp}
return

*~Home up::
Send {Esc up}
return
