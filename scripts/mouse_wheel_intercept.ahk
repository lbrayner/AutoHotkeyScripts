#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file
#include Lib\AutoHotInterception.ahk

;; interception code START

AHI := new AutoHotInterception()
mouseID := AHI.GetMouseId(0x093A, 0x2521) ; ELECOM USB Mouse

AHI.SubscribeMouseButton(mouseID, 5, true, Func("MouseWheelEvent"))

MouseWheelEvent(state)
{
    SetKeyDelay -1

    if WinActive("ahk_exe re2.exe")
    {
        mouse_wheel_var := 100
        if(state == 1)
        {
            Send {Up DownTemp}
            Sleep mouse_wheel_var
            Send {Up up}
            return
        }
        Send {Down DownTemp}
        Sleep mouse_wheel_var
        Send {Down up}

        return
    }

    if WinActive("ahk_exe TEW2.exe")
    {
        mouse_wheel_var := 100
        if(state == 1)
        {
            Send {2 DownTemp}
            Sleep mouse_wheel_var
            Send {2 up}
            return
        }
        Send {3 DownTemp}
        Sleep mouse_wheel_var
        Send {3 up}

        return
    }

    if(state == 1)
    {
        Send {WheelUp 1}
        return
    }
    Send {WheelDown 1}

}

;; interception code END

#IfWinActive, ahk_exe  abc.exe

XButton2::a
return
