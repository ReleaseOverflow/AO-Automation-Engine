﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Persistent
#Include, AhkIni.toolkit

GLOBAL IniKeyErrorElevate := "NULL READ ERROR @ RunWithAdmin KEY - SECTION: ENGINE"
GLOBAL IniKeyErrorTAB := "NULL READ ERROR @ TabSpeedDefault KEY - SECTION: VELOCITY"
GLOBAL IniKeyErrorE := "NULL READ ERROR @ ESpeedDefault KEY - SECTION: VELOCITY"
GLOBAL IniKeyErrorR := "NULL READ ERROR @ RSpeedDefault KEY - SECTION: VELOCITY"
GLOBAL IniKeyErrorF := "NULL READ ERROR @ FSpeedDefault KEY - SECTION: VELOCITY"
GLOBAL IniKeyErrorG := "NULL READ ERROR @ GSpeedDefault KEY - SECTION: VELOCITY"
GLOBAL IniKeyErrorJ := "NULL READ ERROR @ JSpeedDefault KEY - SECTION: VELOCITY"
GLOBAL IniKeyErrorK := "NULL READ ERROR @ KSpeedDefault KEY - SECTION: VELOCITY"
GLOBAL IniKeyErrorL := "NULL READ ERROR @ LSpeedDefault KEY - SECTION: VELOCITY"
GLOBAL IniKeyErrorV := "NULL READ ERROR @ VSpeedDefault KEY - SECTION: VELOCITY"
GLOBAL IniKeyErrorB := "NULL READ ERROR @ BSpeedDefault KEY - SECTION: VELOCITY"
GLOBAL IniKeyErrorN := "NULL READ ERROR @ NSpeedDefault KEY - SECTION: VELOCITY"
GLOBAL IniKeyErrorM := "NULL READ ERROR @ MSpeedDefault KEY - SECTION: VELOCITY"
GLOBAL IniKeyErrorF7 := "NULL READ ERROR @ F7SpeedDefault KEY - SECTION: VELOCITY"


    if FileExist("looper_core.ini")
    {
    ; DebugConfigExist()
    Sleep, 50
    }
    Else {
    MsgBox, 48, Looper App, The looper_core.ini file doesn't exist.

Ini := new AhkIni(".\looper_core.ini")	;will create new ini if nothing exists
			Msgbox, 64, Looper App, Configuration File Is Now Being Constructed With Hardcoded Defaults.
Sleep, 500
ini.write("ENGINE", "AO_OldEngine_InstallPath", "Replace_Me", "`n`    Example: `n` C:\Program Files (x86)\Funcom\Anarchy Online `n` `n` `n`")
ini.write("ENGINE", "RunWithAdmin", "0", "`n`    Toggle Running With Administrator `n` `n`", "                   ENGINE OPTIONS (Configure these) `n`")
ini.write("CLIENT", "RaidLeader", "Johnxcrat", "`n`    Current character that sends tabs `n`    (CASE SENSITIVE) `n` `n` `n`", "                   CLIENT OPTIONS (Configure these) `n` `n`")
ini.write("VELOCITY", "F7SpeedDefault", "8100", "`n`    F7 Key LoopRate Default Speed `n` `n`")
ini.write("VELOCITY", "MSpeedDefault", "8000", "`n`    M Key LoopRate Default Speed `n` `n`")
ini.write("VELOCITY", "NSpeedDefault", "7900", "`n`    N Key LoopRate Default Speed `n` `n`")
ini.write("VELOCITY", "BSpeedDefault", "7800", "`n`    B Key LoopRate Default Speed `n` `n`")
ini.write("VELOCITY", "VSpeedDefault", "7700", "`n`    V Key LoopRate Default Speed `n` `n`")
ini.write("VELOCITY", "LSpeedDefault", "7600", "`n`    L Key LoopRate Default Speed `n` `n`")
ini.write("VELOCITY", "KSpeedDefault", "7500", "`n`    K Key LoopRate Default Speed `n` `n`")
ini.write("VELOCITY", "JSpeedDefault", "7400", "`n`    J Key LoopRate Default Speed `n` `n`")
ini.write("VELOCITY", "GSpeedDefault", "7300", "`n`    G Key LoopRate Default Speed `n` `n`")
ini.write("VELOCITY", "FSpeedDefault", "7200", "`n`    F Key LoopRate Default Speed `n` `n`")
ini.write("VELOCITY", "RSpeedDefault", "7100", "`n`    R Key LoopRate Default Speed `n` `n`")
ini.write("VELOCITY", "ESpeedDefault", "7000", "`n`    E Key LoopRate Default Speed `n` `n`")
ini.write("VELOCITY", "TabSpeedDefault", "5000", "`n`    Tab Key LoopRate Default Speed (RaidLeader) `n` `n` `n`", "                   DEFAULT KEY LOOPING SPEEDS (MILISECONDS)`n` `n`")
ini.Save()
Sleep, 500
Reload
        Return
    }

    if FileExist("gui\bg.png")
    {
        Sleep, 10
    }
    Else {
    MsgBox, 48, Looper App, Could locate one or more GUI Image files. Rebuilding...
    Progress, b w200, Rebuilding GUI images..., Automation Engine, Automation GUI Rebuild Progress
    FileCreateDir, %A_ScriptDir%\gui
    Sleep, 500
    FileInstall, E:\test4.png, %A_ScriptDir%\gui\bg.png, 0
    Progress, 14 ; Set the position of the bar to 14%.
    Sleep, 500
    }

    if FileExist("gui\ribbon.png")
    {
        Sleep, 10
    }
    Else {
    ; MsgBox, 48, Looper App, Could locate one or more GUI Image files. Rebuilding...
    FileCreateDir, %A_ScriptDir%\gui
    Sleep, 500
    FileInstall, E:\ribbon.png, %A_ScriptDir%\gui\ribbon.png, 0
    Progress, 28 ; Set the position of the bar to 28%.
    Sleep, 500
    }

    if FileExist("gui\loop_active.png")
    {
        Sleep, 10
    }
    Else {
    FileCreateDir, %A_ScriptDir%\gui
    Sleep, 500
    FileInstall, E:\loop_active.png, %A_ScriptDir%\gui\loop_active.png, 0
    Progress, 42 ; Set the position of the bar to 42%.
    Sleep, 500
    }

        if FileExist("gui\loop_inactive.png")
    {
        Sleep, 10
    }
    Else {
    FileCreateDir, %A_ScriptDir%\gui
    Sleep, 500
    FileInstall, E:\loop_inactive.png, %A_ScriptDir%\gui\loop_inactive.png, 0
    Progress, 56 ; Set the position of the bar to 56%.
    Sleep, 500
    }

        if FileExist("gui\header.png")
    {
        Sleep, 10
    }
    Else {
    FileCreateDir, %A_ScriptDir%\gui
    Sleep, 500
    FileInstall, E:\header.png, %A_ScriptDir%\gui\header.png, 0
    Progress, 70 ; Set the position of the bar to 70%.
    Sleep, 500
    }

        if FileExist("gui\oldclient_nosteam.png")
    {
        Sleep, 10
    }
    Else {
    FileCreateDir, %A_ScriptDir%\gui
    Sleep, 500
    FileInstall, E:\oldclient_nosteam.png, %A_ScriptDir%\gui\oldclient_nosteam.png, 0
    Progress, 84 ; Set the position of the bar to 84%.
    Sleep, 500
    }

        if FileExist("gui\oldclient_steam.png")
    {
        Sleep, 10
    }
    Else {
    FileCreateDir, %A_ScriptDir%\gui
    Sleep, 500
    FileInstall, E:\oldclient_steam.png, %A_ScriptDir%\gui\oldclient_steam.png, 0
    Progress, 98 ; Set the position of the bar to 98%.
    Sleep, 500
    }
    Progress, Off


IniRead, ICvarElevate, looper_core.ini, ENGINE, RunWithAdmin, %IniKeyErrorElevate%
If ICvarElevate = 1
{
;                         {[
;;           ELEVATE TO ADMIN UAC PROMPT BELOW
; If the script is not elevated, relaunch as administrator and kill current instance:
 
full_command_line := DllCall("GetCommandLine", "str")
 
if not (A_IsAdmin or RegExMatch(full_command_line, " /restart(?!\S)"))
{
    try ; leads to having the script re-launching itself as administrator
    {
        if A_IsCompiled
            Run *RunAs "%A_ScriptFullPath%" /restart
        else
            Run *RunAs "%A_AhkPath%" /restart "%A_ScriptFullPath%"
    }
    ExitApp
}
;
;                          ]}
}



IniRead, TabVelocity, looper_core.ini, VELOCITY, TabSpeedDefault, %IniKeyErrorTAB%
IniRead, EVelocity, looper_core.ini, VELOCITY, ESpeedDefault, %IniKeyErrorE%
IniRead, RVelocity, looper_core.ini, VELOCITY, RSpeedDefault, %IniKeyErrorR%
IniRead, FVelocity, looper_core.ini, VELOCITY, FSpeedDefault, %IniKeyErrorF%
IniRead, GVelocity, looper_core.ini, VELOCITY, GSpeedDefault, %IniKeyErrorG%
IniRead, JVelocity, looper_core.ini, VELOCITY, JSpeedDefault, %IniKeyErrorJ%
IniRead, KVelocity, looper_core.ini, VELOCITY, KSpeedDefault, %IniKeyErrorK%
IniRead, LVelocity, looper_core.ini, VELOCITY, LSpeedDefault, %IniKeyErrorL%
IniRead, VVelocity, looper_core.ini, VELOCITY, VSpeedDefault, %IniKeyErrorV%
IniRead, BVelocity, looper_core.ini, VELOCITY, BSpeedDefault, %IniKeyErrorB%
IniRead, NVelocity, looper_core.ini, VELOCITY, NSpeedDefault, %IniKeyErrorN%
IniRead, MVelocity, looper_core.ini, VELOCITY, MSpeedDefault, %IniKeyErrorM%
IniRead, F7Velocity, looper_core.ini, VELOCITY, F7SpeedDefault, %IniKeyErrorF7%


; <COMPILER: v1.1.26.01>
WinGet, aoid, List, Anarchy Online
; Gui +LastFound +ToolWindow  ; +ToolWindow avoids a taskbar button and an alt-tab menu item.
; Gui +LastFound +AlwaysOnTop -Caption +ToolWindow  ; +ToolWindow avoids a taskbar button and an alt-tab menu item.
Gui, Add, Picture, x0 y0 , %A_ScriptDir%\gui\bg.png
; Gui, Add, Text,, Looper
; Gui, Add, Text,, Press 'Home' to turn Loop on, Press 'End' to turn Loop off.
; Gui, Add, Text,, Sometimes u must press delete, insert, delete, insert when
; Gui, Add, Text,, restarting loop.
; Gui, Add, Text,, Check box to enable LoopKey
Gui, Add, Checkbox, x5 y128 w43 h13 gTabToggle vMyTabToggle checked0, TAB
Gui, Add, Edit, x2 y149 w80 h20 vTabSpeed, %TabVelocity%   
Gui, Add, Text, x23 y173 vStatic1, 0:0:00  ;;  TAB time format
; Gui, Add, Edit, vTabSpeed, TEST
Gui, Add, Checkbox, x102 y129 w30 h20 gEToggle vMyEToggle checked0, E
Gui, Add, Edit, x102 y149 w80 h20 vESpeed, %EVelocity%
Gui, Add, Text, x123 y173 vStatic2, 0:0:00 ;;  E time format
; Gui, Add, Checkbox, y300 gRToggle vMyRToggle checked0 x+5, R
Gui, Add, Checkbox, x202 y129 w30 h20 gRToggle vMyRToggle checked0, R
Gui, Add, Edit, x202 y149 w80 h20 vRSpeed, %RVelocity%
Gui, Add, Text, x223 y173 vStatic3, 0:0:00 ;;  R time format
; Gui, Add, Checkbox, gFToggle vMyFToggle checked0 x+5, F
Gui, Add, Checkbox, x302 y129 w30 h20 gFToggle vMyFToggle checked0, F
Gui, Add, Edit, x302 y149 w80 h20 vFSpeed, %FVelocity%
; Gui, Add, Text, x223 y173 vStatic4, 0:0:00F
Gui, Add, Text, x323 y173 vStatic5, 0:0:00  ;;  F time format
; Gui, Add, Checkbox, gGToggle vMyGToggle checked0 x+5, G
Gui, Add, Checkbox, x102 y189 w30 h20 gGToggle vMyGToggle checked0, G
Gui, Add, Edit, x102 y209 w80 h20 vGSpeed, %GVelocity%
Gui, Add, Text, x123 y233 vStatic6, 0:0:00
; Gui, Add, Checkbox, gJToggle vMyJToggle checked0 x+5, J
Gui, Add, Checkbox, x202 y189 w30 h20 gJToggle vMyJToggle checked0, J
Gui, Add, Edit, x202 y209 w80 h20 vJSpeed, %JVelocity%
Gui, Add, Text, x223 y233 vStatic7, 0:0:00  ;;  J time format
; Gui, Add, Checkbox, gKToggle vMyKToggle checked0 x10, K
Gui, Add, Checkbox, x302 y189 w30 h20 gKToggle vMyKToggle checked0, K
Gui, Add, Edit, x302 y209 w80 h20 vKSpeed, %KVelocity%
Gui, Add, Text, x323 y233 vStatic8, 0:0:00  ;;  K time format
; Gui, Add, Checkbox, gLToggle vMyLToggle checked0 x+5, L
Gui, Add, Checkbox, x102 y249 w30 h20 gLToggle vMyLToggle checked0, L
Gui, Add, Edit, x102 y269 w80 h20 vLSpeed, %LVelocity%
Gui, Add, Text, x123 y293 vStatic9, 0:0:00 ;;  L time format
; Gui, Add, Checkbox, gVToggle vMyVToggle checked0 x+5, V
Gui, Add, Checkbox, x202 y249 w30 h20 gVToggle vMyVToggle checked0, V
Gui, Add, Edit, x202 y269 w80 h20 vVSpeed, %VVelocity%
Gui, Add, Text, x223 y293 vStatic10, 0:0:00  ;;  V time format
; Gui, Add, Checkbox, gBToggle vMyBToggle checked0 x+5, B
Gui, Add, Checkbox, x302 y249 w30 h20 gBToggle vMyBToggle checked0, B
Gui, Add, Edit, x302 y269 w80 h20 vBSpeed, %BVelocity%
Gui, Add, Text, x323 y293 vStatic11, 0:0:00  ;;  B time format
; Gui, Add, Checkbox, gNToggle vMyNToggle checked0 x+5, N
Gui, Add, Checkbox, x102 y309 w30 h20 gNToggle vMyNToggle checked0, N
Gui, Add, Edit, x102 y329 w80 h20 vNSpeed, %NVelocity%
Gui, Add, Text, x123 y352 vStatic12, 0:0:00  ;;  N time format
; Gui, Add, Checkbox, gMToggle vMyMToggle checked0 x+5, M
Gui, Add, Checkbox, x202 y309 w30 h20 gMToggle vMyMToggle checked0, M
Gui, Add, Edit, x202 y329 w80 h20 vMSpeed, %MVelocity%
Gui, Add, Text, x223 y352 vStatic13, 0:0:00  ;;  M time format
; Gui, Add, Checkbox, gf7Toggle vMyf7Toggle checked0 x+5, F7
Gui, Add, Checkbox, x302 y309 w30 h20 gf7Toggle vMyf7Toggle checked0, F7
Gui, Add, Edit, x302 y329 w80 h20 vF7Speed, %F7Velocity%
Gui, Add, Text, x323 y352 vStatic14, 0:0:00  ;;  F7 time format
; Gui, Add, DropDownList, x10 vSpeed, 1 second||3 seconds|5 seconds|10 seconds
; Gui, Add, DropDownList, x11 y356 vSpeed, 1 second||3 seconds|5 seconds|10 seconds
; Gui, Add, Button, g1 x10, On
Gui, Add, Button, x9 y349 gManualMSCalculator, Convert MS
Gui, Add, Button, x11 y382 g1, On
; Gui, Add, Button, g2 X+10, Off
Gui, Add, Button, x47 y382 g2, Off
Gui, Add, Picture, x21 y420 +BackgroundTrans vActive, %A_ScriptDir%\gui\loop_active.png
Gui, Add, Picture, x21 y420 +BackgroundTrans vInactive, %A_ScriptDir%\gui\loop_inactive.png
Gui, Add, Text, x15 y406 +BackgroundTrans, Loop State
Gui, Show, w404 h464, Automation Engine
Gui, Submit, NoHide
Return
home::
1:
;;//////////////////////////////////////////////////////////////////////////
Gui, Submit, NoHide
Sleep, 250
; GuiControlGet, TabSpeed
Res1 := TimeFormatHMS(TabSpeed)
GuiControl, Text, Static1, %Res1%
Res2 := TimeFormatHMS(ESpeed, h, m, s)
GuiControl, Text, Static2, %Res2%
Res3 := TimeFormatHMS(RSpeed, h, m, s)
GuiControl, Text, Static3, %Res3%
Res4 := TimeFormatHMS(FSpeed)
GuiControl, Text, Static5, %Res4%
Res5 := TimeFormatHMS(GSpeed)
GuiControl, Text, Static6, %Res5%
Res6 := TimeFormatHMS(JSpeed)
GuiControl, Text, Static7, %Res6%
Res7 := TimeFormatHMS(KSpeed)
GuiControl, Text, Static8, %Res7%
Res8 := TimeFormatHMS(LSpeed)
GuiControl, Text, Static9, %Res8%
Res9 := TimeFormatHMS(VSpeed)
GuiControl, Text, Static10, %Res9%
Res10 := TimeFormatHMS(BSpeed)
GuiControl, Text, Static11, %Res10%
Res11 := TimeFormatHMS(NSpeed)
GuiControl, Text, Static12, %Res11%
Res12 := TimeFormatHMS(MSpeed)
GuiControl, Text, Static13, %Res12%
Res13 := TimeFormatHMS(F7Speed)
GuiControl, Text, Static14, %Res13%
GuiControl Hide, Inactive
GuiControl Show, Active
;;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
; guicontrolget, Speed
; if(Speed = "1 second")
; {
; loopspeed = 1000
; }
; if(Speed = "3 seconds")
; {
; loopspeed = 3000
; }
; if(Speed = "5 seconds")
; {
; loopspeed = 5000
; }
; if(Speed = "10 seconds")
; {
; loopspeed = 10000
; }
; $stop := 0
Loop,
{
Loop %aoid%
{
GLOBAL element := aoid%A_Index%
if(tabloop = 1)
{
; sleep 250
SetTimer, TimerEventTAB, %TabSpeed%
; sleep 250
}
if(MyEToggle = 1)
{
SetTimer, TimerEventE, %ESpeed%
}
if(MyRToggle = 1)
{
SetTimer, TimerEventR, %RSpeed% 
}
if(floop = 1)
{
SetTimer, TimerEventF, %FSpeed%
}
if(gloop = 1)
{
SetTimer, TimerEventG, %GSpeed%
}
if(jloop = 1)
{
SetTimer, TimerEventJ, %JSpeed%
}
if(kloop = 1)
{
SetTimer, TimerEventK, %KSpeed%
}
if(lloop = 1)
{
SetTimer, TimerEventL, %LSpeed%
}
if(vloop = 1)
{
SetTimer, TimerEventV, %VSpeed%
}
if(bloop = 1)
{
SetTimer, TimerEventB, %BSpeed%
}
if(nloop = 1)
{
SetTimer, TimerEventN, %NSpeed%
}
if(mloop = 1)
{
SetTimer, TimerEventM, %MSpeed%
}
if(f7loop = 1)
{
SetTimer, TimerEventF7, %F7Speed%
}
}
; Sleep loopspeed
; if ($stop)
; {
; return
; }
Break
}
Return
end::
; tabloop = 0
; eloop = 0
; rloop = 0
; floop = 0
; gloop = 0
; jloop = 0
; kloop = 0
; lloop = 0
; vloop = 0
; nloop = 0
; mloop = 0
; f7loop = 0
2:
$stop := 1
SetTimer, TimerEventTAB, Off
SetTimer, TimerEventE, Off
SetTimer, TimerEventR, Off
SetTimer, TimerEventF, Off
SetTimer, TimerEventG, Off
SetTimer, TimerEventJ, Off
SetTimer, TimerEventK, Off
SetTimer, TimerEventL, Off
SetTimer, TimerEventV, Off
SetTimer, TimerEventB, Off
SetTimer, TimerEventN, Off
SetTimer, TimerEventM, Off
SetTimer, TimerEventF7, Off
GuiControl Hide, Active
GuiControl Show, Inactive
return

TabToggle:
GuiControlGet, MyTabToggle
if(MyTabToggle = 0)
{
tabloop = 0
SetTimer, TimerEventTAB, Off
}
if(MyTabToggle = 1)
{
tabloop = 1
; SetTimer, TimerEventTAB, Off
}
; return
EToggle:
GuiControlGet, MyEToggle
if(MyEToggle = 0)
{
eloop = 0
SetTimer, TimerEventE, Off
}
if(MyEToggle = 1)
{
eloop = 1
; SetTimer, TimerEventE, Off
}
; return
RToggle:
GuiControlGet, MyRToggle
if(MyRToggle = 0)
{
rloop = 0
SetTimer, TimerEventR, Off
}
if(MyRToggle = 1)
{
rloop = 1
; SetTimer, TimerEventR, Off
}
; return
FToggle:
GuiControlGet, MyFToggle
if(MyFToggle = 0)
{
floop = 0
SetTimer, TimerEventF, Off
}
if(MyFToggle = 1)
{
floop = 1
; SetTimer, TimerEventF, Off
}
; return
GToggle:
GuiControlGet, MyGToggle
if(MyGToggle = 0)
{
gloop = 0
SetTimer, TimerEventG, Off
}
if(MyGToggle = 1)
{
gloop = 1
; SetTimer, TimerEventG, Off
}
; return
JToggle:
GuiControlGet, MyJToggle
if(MyJToggle = 0)
{
jloop = 0
SetTimer, TimerEventJ, Off
}
if(MyJToggle = 1)
{
jloop = 1
; SetTimer, TimerEventJ, Off
}
; return
KToggle:
GuiControlGet, MyKToggle
if(MyKToggle = 0)
{
kloop = 0
SetTimer, TimerEventK, Off
}
if(MyKToggle = 1)
{
kloop = 1
; SetTimer, TimerEventK, Off
}
; return
LToggle:
GuiControlGet, MyLToggle
if(MyLToggle = 0)
{
lloop = 0
SetTimer, TimerEventL, Off
}
if(MyLToggle = 1)
{
lloop = 1
; SetTimer, TimerEventL, Off
}
; return
VToggle:
GuiControlGet, MyVToggle
if(MyVToggle = 0)
{
vloop = 0
SetTimer, TimerEventV, Off
}
if(MyVToggle = 1)
{
vloop = 1
; SetTimer, TimerEventV, Off
}
; return
BToggle:
GuiControlGet, MyBToggle
if(MyBToggle = 0)
{
bloop = 0
SetTimer, TimerEventB, Off
}
if(MyBToggle = 1)
{
bloop = 1
; SetTimer, TimerEventB, Off
}
; return
NToggle:
GuiControlGet, MyNToggle
if(MyNToggle = 0)
{
nloop = 0
SetTimer, TimerEventN, Off
}
if(MyNToggle = 1)
{
nloop = 1
; SetTimer, TimerEventN, Off
}
; return
MToggle:
GuiControlGet, MyMToggle
if(MyMToggle = 0)
{
mloop = 0
SetTimer, TimerEventM, Off
}
if(MyMToggle = 1)
{
mloop = 1
; SetTimer, TimerEventM, Off
}
; return
f7Toggle:
GuiControlGet, Myf7Toggle
if(Myf7Toggle = 0)
{
f7loop = 0
SetTimer, TimerEventF7, Off
}
if(Myf7Toggle = 1)
{
f7loop = 1
; SetTimer, TimerEventF7, Off
}
return




TimerEventTAB:
; Loop,
; {
; Loop %aoid%
; {
; GLOBAL element := aoid%A_Index%
; if(tabloop = 1)
; {
IniRead, ClientIniRaidLeader, looper_core.ini, CLIENT, RaidLeader, INI KEY READ ERROR @ [CLIENT] - RaidLeader | The value is attempting to return null.
sleep 10
; ControlSend,ahk_parent, {tab}, ahk_id %element%
ControlSend,ahk_parent, {tab}, Anarchy Online - %ClientIniRaidLeader%
; sleep 10
; }
; }
; Break
; }
sleep 100
Return
;;------------------------------------------------------------------;;

TimerEventE:
ControlSend,ahk_parent, {e}, ahk_id %aoid1%
ControlSend,ahk_parent, {e}, ahk_id %aoid2%
ControlSend,ahk_parent, {e}, ahk_id %aoid3%
ControlSend,ahk_parent, {e}, ahk_id %aoid4%
ControlSend,ahk_parent, {e}, ahk_id %aoid5%
ControlSend,ahk_parent, {e}, ahk_id %aoid6%
Return
;;------------------------------------------------------------------;;

TimerEventR:
ControlSend,ahk_parent, {r}, ahk_id %aoid1%
ControlSend,ahk_parent, {r}, ahk_id %aoid2%
ControlSend,ahk_parent, {r}, ahk_id %aoid3%
ControlSend,ahk_parent, {r}, ahk_id %aoid4%
ControlSend,ahk_parent, {r}, ahk_id %aoid5%
ControlSend,ahk_parent, {r}, ahk_id %aoid6%
Return
;;------------------------------------------------------------------;;

TimerEventF:
ControlSend,ahk_parent, {f}, ahk_id %aoid1%
ControlSend,ahk_parent, {f}, ahk_id %aoid2%
ControlSend,ahk_parent, {f}, ahk_id %aoid3%
ControlSend,ahk_parent, {f}, ahk_id %aoid4%
ControlSend,ahk_parent, {f}, ahk_id %aoid5%
ControlSend,ahk_parent, {f}, ahk_id %aoid6%
Return
;;------------------------------------------------------------------;;

TimerEventG:
ControlSend,ahk_parent, {g}, ahk_id %aoid1%
ControlSend,ahk_parent, {g}, ahk_id %aoid2%
ControlSend,ahk_parent, {g}, ahk_id %aoid3%
ControlSend,ahk_parent, {g}, ahk_id %aoid4%
ControlSend,ahk_parent, {g}, ahk_id %aoid5%
ControlSend,ahk_parent, {g}, ahk_id %aoid6%
Return
;;------------------------------------------------------------------;;

TimerEventJ:
ControlSend,ahk_parent, {j}, ahk_id %aoid1%
ControlSend,ahk_parent, {j}, ahk_id %aoid2%
ControlSend,ahk_parent, {j}, ahk_id %aoid3%
ControlSend,ahk_parent, {j}, ahk_id %aoid4%
ControlSend,ahk_parent, {j}, ahk_id %aoid5%
ControlSend,ahk_parent, {j}, ahk_id %aoid6%
Return
;;------------------------------------------------------------------;;

TimerEventK:
ControlSend,ahk_parent, {k}, ahk_id %aoid1%
ControlSend,ahk_parent, {k}, ahk_id %aoid2%
ControlSend,ahk_parent, {k}, ahk_id %aoid3%
ControlSend,ahk_parent, {k}, ahk_id %aoid4%
ControlSend,ahk_parent, {k}, ahk_id %aoid5%
ControlSend,ahk_parent, {k}, ahk_id %aoid6%
Return
;;------------------------------------------------------------------;;

TimerEventL:
ControlSend,ahk_parent, {l}, ahk_id %aoid1%
ControlSend,ahk_parent, {l}, ahk_id %aoid2%
ControlSend,ahk_parent, {l}, ahk_id %aoid3%
ControlSend,ahk_parent, {l}, ahk_id %aoid4%
ControlSend,ahk_parent, {l}, ahk_id %aoid5%
ControlSend,ahk_parent, {l}, ahk_id %aoid6%
Return
;;------------------------------------------------------------------;;

TimerEventV:
ControlSend,ahk_parent, {v}, ahk_id %aoid1%
ControlSend,ahk_parent, {v}, ahk_id %aoid2%
ControlSend,ahk_parent, {v}, ahk_id %aoid3%
ControlSend,ahk_parent, {v}, ahk_id %aoid4%
ControlSend,ahk_parent, {v}, ahk_id %aoid5%
ControlSend,ahk_parent, {v}, ahk_id %aoid6%
Return
;;------------------------------------------------------------------;;

TimerEventB:
ControlSend,ahk_parent, {b}, ahk_id %aoid1%
ControlSend,ahk_parent, {b}, ahk_id %aoid2%
ControlSend,ahk_parent, {b}, ahk_id %aoid3%
ControlSend,ahk_parent, {b}, ahk_id %aoid4%
ControlSend,ahk_parent, {b}, ahk_id %aoid5%
ControlSend,ahk_parent, {b}, ahk_id %aoid6%
Return
;;------------------------------------------------------------------;;

TimerEventN:
ControlSend,ahk_parent, {n}, ahk_id %aoid1%
ControlSend,ahk_parent, {n}, ahk_id %aoid2%
ControlSend,ahk_parent, {n}, ahk_id %aoid3%
ControlSend,ahk_parent, {n}, ahk_id %aoid4%
ControlSend,ahk_parent, {n}, ahk_id %aoid5%
ControlSend,ahk_parent, {n}, ahk_id %aoid6%
Return
;;------------------------------------------------------------------;;

TimerEventM:
ControlSend,ahk_parent, {m}, ahk_id %aoid1%
ControlSend,ahk_parent, {m}, ahk_id %aoid2%
ControlSend,ahk_parent, {m}, ahk_id %aoid3%
ControlSend,ahk_parent, {m}, ahk_id %aoid4%
ControlSend,ahk_parent, {m}, ahk_id %aoid5%
ControlSend,ahk_parent, {m}, ahk_id %aoid6%
Return
;;------------------------------------------------------------------;;

TimerEventF7:
ControlSend,ahk_parent, {f7}, ahk_id %aoid1%
ControlSend,ahk_parent, {f7}, ahk_id %aoid2%
ControlSend,ahk_parent, {f7}, ahk_id %aoid3%
ControlSend,ahk_parent, {f7}, ahk_id %aoid4%
ControlSend,ahk_parent, {f7}, ahk_id %aoid5%
ControlSend,ahk_parent, {f7}, ahk_id %aoid6%
Return
;;------------------------------------------------------------------;;


ManualMSCalculator:
Gui, Submit, NoHide
Sleep, 250
Res1 := TimeFormatHMS(TabSpeed)
GuiControl, Text, Static1, %Res1%
Res2 := TimeFormatHMS(ESpeed, h, m, s)
GuiControl, Text, Static2, %Res2%
Res3 := TimeFormatHMS(RSpeed, h, m, s)
GuiControl, Text, Static3, %Res3%
Res4 := TimeFormatHMS(FSpeed)
GuiControl, Text, Static5, %Res4%
Res5 := TimeFormatHMS(GSpeed)
GuiControl, Text, Static6, %Res5%
Res6 := TimeFormatHMS(JSpeed)
GuiControl, Text, Static7, %Res6%
Res7 := TimeFormatHMS(KSpeed)
GuiControl, Text, Static8, %Res7%
Res8 := TimeFormatHMS(LSpeed)
GuiControl, Text, Static9, %Res8%
Res9 := TimeFormatHMS(VSpeed)
GuiControl, Text, Static10, %Res9%
Res10 := TimeFormatHMS(BSpeed)
GuiControl, Text, Static11, %Res10%
Res11 := TimeFormatHMS(NSpeed)
GuiControl, Text, Static12, %Res11%
Res12 := TimeFormatHMS(MSpeed)
GuiControl, Text, Static13, %Res12%
Res13 := TimeFormatHMS(F7Speed)
GuiControl, Text, Static14, %Res13%
Return






TimeFormatHMS(milli, ByRef hours=0, ByRef mins=0, ByRef secs=0, secPercision=0)
{
  Gui, Submit, NoHide
  SetFormat, FLOAT, 0.%secPercision%
  milli /= 1000.0
  secs := mod(milli, 60)
  SetFormat, FLOAT, 0.0
  milli //= 60
  mins := mod(milli, 60)
  hours := milli //60
  return hours . ":" . mins . ":" . secs
}

GuiClose:
ExitApp

 


