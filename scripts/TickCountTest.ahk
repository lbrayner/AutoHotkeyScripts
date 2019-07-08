#UseHook
#MaxHotkeysPerInterval 200  ;example from Help file

PgDn::

Down:=A_TickCount

Keywait PgDn

Duration:=(A_TickCount-Down)

If (Duration>300)
  MsgBox You held "Joy1" for more than 300ms
else
  MsgBox You held "Joy1" for less than 300ms

Return
