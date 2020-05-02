#UseHook
#MaxHotkeysPerInterval 200

CoordMode, Mouse, Screen

global SleepVar := 50

global MouseMove := 0

global Displacement := 1000
global Minimum := 0

CenterMouse()
{
	DllCall("mouse_event", uint, 32769, int, 32768, int, 0, uint, 0, int, 0)
}

StopTurning()
{
	turningLeft := 0
	turningRight := 0
	SendInput {Blind}{a up}{d up}
}

Loop,
{

	global SleepVar
	global MouseMove

	if(MouseMove)
	{
		CenterMouse()
	}

	MouseGetPos, PosX1, PosY1

	Sleep SleepVar

	if(MouseMove)
	{
		MouseGetPos, PosX2, PosY2

		Pos := PosX2 - PosX1

		if(Pos < 0)
		{

			if((Pos*(-1)) < Displacement && (Pos*(-1)) > Minimum)
			{
				turningRight := 0
				turningLeft := 1
				still := 0

				SendInput {Blind}{d up}
				SendInput {Blind}{a DownTemp}
			}
		}
		else
		{
			if(Pos > 0)
			{
				if(Pos < Displacement && Pos > Minimum)
				{
					turningRight := 1
					turningLeft := 0
					still := 0

					SendInput {Blind}{a up}
					SendInput {Blind}{d DownTemp}
				}
			}
			else
			{
				if(!still)
				{
					still := 1
					StopTurning()
				}
			}
		}
	}
}
return

End::ExitApp
return

Insert::
Reload
return

*LCtrl::
SetKeyDelay -1
MouseMove := 0
Send {LCtrl DownTemp}
return

*LCtrl up::
SetKeyDelay -1
Send {LCtrl up}
return

*LAlt::
SetKeyDelay -1
MouseMove := 1
Send {LAlt DownTemp}
return

*LAlt up::
SetKeyDelay -1
Send {LAlt up}
return
