#UseHook
#MaxHotkeysPerInterval 200

#IfWinActive, ahk_exe bhd.exe

CoordMode, Mouse, Screen

global SleepVar := 50

global On := true
global Walking := false

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
    if WinActive("ahk_exe bhd.exe")
    {
        global SleepVar
        global On

        if(On)
        {
            CenterMouse()
        }

        MouseGetPos, PosX1, PosY1

        Sleep SleepVar

        if(On)
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
}
return

End::ExitApp
return

Insert::
Reload
return

*LCtrl::
SetKeyDelay -1
On := false
Send {LCtrl DownTemp}
return

*LCtrl up::
SetKeyDelay -1
Send {LCtrl up}
return

*LAlt::
SetKeyDelay -1
global On
global Walking
Walking := false
On := true
Send {LAlt DownTemp}
return

*LAlt up::
SetKeyDelay -1
Send {LAlt up}
return

; run by default

StopWalking()
{
	global Walking

	if(Walking)
		Walking := false
}

*z::
SetKeyDelay -1
global Walking
Walking := true
return

~*LShift::
StopWalking()
return

~*w::
SetKeyDelay -1
global On
if(!On)
    return
global Walking
if (!Walking)
	Send {Blind}{LShift DownTemp}
return

~*w up::
global On
if(!On)
    return
Send {Blind}{LShift up}
return
