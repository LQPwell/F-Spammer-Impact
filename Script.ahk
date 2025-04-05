#NoEnv
#SingleInstance Force
#IfWinActive ahk_exe GenshinImpact.exe

HoldThreshold := 200     ; 200 ms = 0.20 sec
PressInterval := 50       ; 50 ms

~*F::
    SetTimer, AutoPress, -%HoldThreshold%  ; Запуск таймера с задержкой
    KeyWait, F, T0.50                      ; Корректный таймаут (0.050 сек)
    if (ErrorLevel)                        ; Если клавиша удерживается
        SetTimer, AutoPress, %PressInterval%
return


~*F Up::
    SetTimer, AutoPress, Off
return

AutoPress:
    if GetKeyState("F", "P")
        SendInput {Blind}{F}
    else 
        SetTimer, AutoPress, Off
return

#IfWinActive