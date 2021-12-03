#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Persistent
#Include, .\_assembly\includes\IniLibrary.toolkit
#SingleInstance, Force




GLOBAL EngineTitle := "AUTOMATION ENGINE"
GLOBAL EngineVersion := "4.00.964C"
GLOBAL EngineBuild := "BUILD 2358193"
GLOBAL EngineString := "[" . EngineTitle . A_Space . "-" . A_Space . "v." . EngineVersion . A_Space . EngineBuild . A_Space . "]"
; GLOBAL EngineString := "[" . EngineTitle . A_Space . "-" . A_Space . "v." . EngineVersion . A_Space . "(" . EngineBuild . ")" . A_Space . "]"


GLOBAL EngineError0x0 := "Missing Files"
GLOBAL EngineError0x1 := "Missing Info"
GLOBAL EngineInfo0x0 := "Reconstruction"



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
GLOBAL IniKeyErrorAOIDlist := "NULL READ ERROR @ AutoUpdateAOIDlist KEY - SECTION: ENGINE"


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; GENERATE UNIQUE MACHINE ID CODE FOR THE BUG REPORTER TO IDENTIFY THE MACHINE SUBMITTING THE BUG ;;;;;
Random, ID_int0x00, 1, 9
Random, ID_int0x01, 1, 9
Random, ID_int0x02, 1, 9
Random, ID_int0x03, 1, 9
Random, ID_int0x04, 1, 9
Random, ID_int0x05, 10, 99
ID_char0x01 := RandomCapsLetter()
ID_char0x02 := RandomCapsLetter()
ID_char0x03 := RandomCapsLetter()
GenerateEngineID := ID_char0x01 . ID_char0x02 . ID_char0x03 . ID_int0x00 . ID_int0x01 . ID_int0x02 . ID_int0x03 . ID_int0x04 . ID_int0x05

    if FileExist("ID\machine_id.txt")
    {
        Sleep, 10
    }
    Else {
    FileCreateDir, %A_ScriptDir%\ID
    Sleep, 500
    FileAppend,
    (
    %GenerateEngineID%
    ), %A_ScriptDir%\ID\machine_id.txt
    Sleep, 500
    }

    if FileExist("ID\engine_version")
    {
        Sleep, 10
    }
    Else {
    FileCreateDir, %A_ScriptDir%\ID
    Sleep, 500
    FileAppend,
    (
    %EngineVersion%
    ), %A_ScriptDir%\ID\engine_version
    Sleep, 200
    }

    if FileExist("ID\engine_build")
    {
        Sleep, 10
    }
    Else {
    FileCreateDir, %A_ScriptDir%\ID
    Sleep, 500
    FileAppend,
    (
    %EngineBuild%
    ), %A_ScriptDir%\ID\engine_build
    Sleep, 200
    }


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



    if FileExist("looper_core.ini")
    {
    ; DebugConfigExist()
    Sleep, 50
    }
    Else {
    MsgBox, 48, %EngineTitle% - %EngineError0x0%, The looper_core.ini file doesn't exist.
    

Ini := new AhkIni(".\looper_core.ini")	;will create new ini if nothing exists
			Msgbox, 64, %EngineTitle% - %EngineInfo0x0%, Configuration File Is Now Being Constructed With Hardcoded Defaults.
Sleep, 500
ini.write("ENGINE", "AutoUpdateAOIDlist", "0", "`n`    Automatically Update AO Window List `n` `n` `n` `n` `n`")
ini.write("ENGINE", "AOIA_InstallPath", "Replace_Me", "`n`    Example: `n` D:\Program Files (x86)\AO Item Assistant+ `n` `n` `n`")
ini.write("ENGINE", "AO_OldEngine_InstallPath", "Replace_Me", "`n`    Example: `n` C:\Program Files (x86)\Funcom\Anarchy Online `n` `n` `n`")
ini.write("ENGINE", "PromptCtrlKeyLocked", "1", "`n`    Toggle Notification when CTRL Key is locked and an attempt is made to press `n` `n` `n`")
ini.write("ENGINE", "RunWithAdmin", "0", "`n`    Toggle Running With Administrator `n` `n`", "                   ENGINE OPTIONS (Configure these) `n`")
ini.write("CLIENT", "RaidLeader", "Raidleader", "`n`    Current character that sends tabs `n`    (CASE SENSITIVE) `n` `n` `n` `n` `n`", "                   CLIENT OPTIONS (Configure these) `n` `n`")
ini.write("SOUND", "QuickLaunch_AOIA", "1", "`n`    Plays Sound when Quick Launching AOIA `n` `n` `n` `n` `n`")
ini.write("SOUND", "QuickLaunch_AOoldEngineSteam", "1", "`n`    Plays Sound when Quick Launching AO STEAM `n` `n` `n`")
ini.write("SOUND", "QuickLaunch_AOoldEngine", "1", "`n`    Plays Sound when Quick Launching AO `n` `n` `n`")
ini.write("SOUND", "LoopEnd", "1", "`n`    Plays Sound on loop end `n` `n` `n`")
ini.write("SOUND", "LoopStart", "1", "`n`    Plays Sound on loop start `n` `n` `n`", "                   SOUND OPTIONS (Configure these) `n` `n`")
ini.write("HOTKEY", "AutoEngineStopKey", "END", "`n`    Hotkey to Stop Automation Engine Logic `n` `n` `n`")
ini.write("HOTKEY", "AutoEngineStartKey", "HOME", "`n`    Hotkey to Launch Automation Engine Logic `n` `n` `n`", "                   HOTKEY OPTIONS (Configure These) `n` AutoHotkey Keylist: `n` https://www.autohotkey.com/docs/KeyList.htm `n` `n` Example: `n` If I wanted to set the Engine's Start Button `n` to CTRL+HOME, I would change the following below line: `n` AutoEngineStartKey = ^HOME `n` `n` For a complete key list, see the link above. `n` `n`")
ini.write("VELOCITY", "F7SpeedDefault", "8100", "`n`    F7 Key LoopRate Default Speed `n` `n` `n` `n` `n`")
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
ini.write("VELOCITY", "TabSpeedDefault", "5000", "`n`    Tab Key LoopRate Default Speed (RaidLeader) `n` `n` `n`", "                   DEFAULT KEY LOOPING SPEEDS (MILLISECONDS)`n` `n`")
ini.write("DEBUG", "AutoAOIDUpdateMsg", "0", "`n`    Output TrayBallon Message On Each Loop `n` `n` `n`", "                   FOR DEVELOPER TESTING (CAN SAFELY IGNORE)`n` `n`")
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
    MsgBox, 48, %EngineTitle% - %EngineError0x0% ( %EngineInfo0x0% ), Could locate one or more GUI Image files. Rebuilding...
    Progress, b w200, Rebuilding GUI images..., Automation Engine, Automation GUI Rebuild Progress
    FileCreateDir, %A_ScriptDir%\gui
    Sleep, 500
    FileInstall, _assembly\gui\bg.png, %A_ScriptDir%\gui\bg.png, 0
    Progress, 10 ; Set the position of the bar to 14%.
    Sleep, 500
    }

    if FileExist("gui\about.exe")
    {
        Sleep, 10
    }
    Else {
    ; MsgBox, 48, %EngineTitle% - %EngineError0x0% ( %EngineInfo0x0% ), Could locate one or more GUI About Files. Rebuilding...
    ; Progress, b w200, Rebuilding GUI images..., Automation Engine, Automation GUI Rebuild Progress
    FileCreateDir, %A_ScriptDir%\gui
    Sleep, 500
    FileInstall, _assembly\_about\about.exe, %A_ScriptDir%\gui\about.exe, 0
    FileInstall, _assembly\_about\ab_x.png, %A_ScriptDir%\gui\ab_x.png, 0
    FileInstall, _assembly\_about\about_bg.png, %A_ScriptDir%\gui\about_bg.png, 0
    FileInstall, _assembly\_about\about_bar.png, %A_ScriptDir%\gui\about_bar.png, 0
    Progress, 10 ; Set the position of the bar to 14%.
    Sleep, 500
    }

    if FileExist("gui\AOIA.png")
    {
        Sleep, 10
    }
    Else {
    ; MsgBox, 48, Looper App, Could locate one or more GUI Image files. Rebuilding...
    Progress, b w200, Rebuilding GUI images..., Automation Engine, Automation GUI Rebuild Progress
    FileCreateDir, %A_ScriptDir%\gui
    Sleep, 500
    FileInstall, _assembly\gui\AOIA.png, %A_ScriptDir%\gui\AOIA.png, 0
    Progress, 14 ; Set the position of the bar to 14%.
    Sleep, 500
    }

    if FileExist("gui\ribbon.png")
    {
        Sleep, 10
    }
    Else {
    ; MsgBox, 48, Looper App, Could locate one or more GUI Image files. Rebuilding...
    Progress, b w200, Rebuilding GUI images..., Automation Engine, Automation GUI Rebuild Progress
    FileCreateDir, %A_ScriptDir%\gui
    Sleep, 500
    FileInstall, _assembly\gui\ribbon.png, %A_ScriptDir%\gui\ribbon.png, 0
    Progress, 28 ; Set the position of the bar to 28%.
    Sleep, 500
    }

    if FileExist("gui\loop_active.png")
    {
        Sleep, 10
    }
    Else {
    Progress, b w200, Rebuilding GUI images..., Automation Engine, Automation GUI Rebuild Progress
    FileCreateDir, %A_ScriptDir%\gui
    Sleep, 500
    FileInstall, _assembly\gui\loop_active.png, %A_ScriptDir%\gui\loop_active.png, 0
    Progress, 42 ; Set the position of the bar to 42%.
    Sleep, 500
    }

        if FileExist("gui\loop_inactive.png")
    {
        Sleep, 10
    }
    Else {
    Progress, b w200, Rebuilding GUI images..., Automation Engine, Automation GUI Rebuild Progress
    FileCreateDir, %A_ScriptDir%\gui
    Sleep, 500
    FileInstall, _assembly\gui\loop_inactive.png, %A_ScriptDir%\gui\loop_inactive.png, 0
    Progress, 56 ; Set the position of the bar to 56%.
    Sleep, 500
    }

        if FileExist("gui\header.png")
    {
        Sleep, 10
    }
    Else {
    Progress, b w200, Rebuilding GUI images..., Automation Engine, Automation GUI Rebuild Progress
    FileCreateDir, %A_ScriptDir%\gui
    Sleep, 500
    FileInstall, _assembly\gui\header.png, %A_ScriptDir%\gui\header.png, 0
    Progress, 70 ; Set the position of the bar to 70%.
    Sleep, 500
    }

        if FileExist("gui\oldclient_nosteam.png")
    {
        Sleep, 10
    }
    Else {
    Progress, b w200, Rebuilding GUI images..., Automation Engine, Automation GUI Rebuild Progress
    FileCreateDir, %A_ScriptDir%\gui
    Sleep, 500
    FileInstall, _assembly\gui\oldclient_nosteam.png, %A_ScriptDir%\gui\oldclient_nosteam.png, 0
    Progress, 84 ; Set the position of the bar to 84%.
    Sleep, 500
    }

        if FileExist("gui\oldclient_steam.png")
    {
        Sleep, 10
    }
    Else {
    Progress, b w200, Rebuilding GUI images..., Automation Engine, Automation GUI Rebuild Progress
    FileCreateDir, %A_ScriptDir%\gui
    Sleep, 500
    FileInstall, _assembly\gui\oldclient_steam.png, %A_ScriptDir%\gui\oldclient_steam.png, 0
    Progress, 90 ; Set the position of the bar to 98%.
    Sleep, 500
    }

        if FileExist("gui\bug.png")
    {
        Sleep, 10
    }
    Else {
    Progress, b w200, Rebuilding GUI images..., Automation Engine, Automation GUI Rebuild Progress
    FileCreateDir, %A_ScriptDir%\gui
    Sleep, 500
    FileInstall, _assembly\gui\bug.png, %A_ScriptDir%\gui\bug.png, 0
    Progress, 98 ; Set the position of the bar to 98%.
    Sleep, 500
    }

        if FileExist("gui\report_a_bug.png")
    {
        Sleep, 10
    }
    Else {
    Progress, b w200, Rebuilding GUI images..., Automation Engine, Automation GUI Rebuild Progress
    FileCreateDir, %A_ScriptDir%\gui
    Sleep, 500
    FileInstall, _assembly\gui\report_a_bug.png, %A_ScriptDir%\gui\report_a_bug.png, 0
    Progress, 98 ; Set the position of the bar to 98%.
    Sleep, 500
    }

        if FileExist("gui\help_alt.png")
    {
        Sleep, 10
    }
    Else {
    Progress, b w200, Rebuilding GUI images..., Automation Engine, Automation GUI Rebuild Progress
    FileCreateDir, %A_ScriptDir%\gui
    Sleep, 500
    FileInstall, _assembly\gui\help_alt.png, %A_ScriptDir%\gui\help_alt.png, 0
    Progress, 98 ; Set the position of the bar to 98%.
    Sleep, 500
    }

        if FileExist("gui\about.png")
    {
        Sleep, 10
    }
    Else {
    Progress, b w200, Rebuilding GUI images..., Automation Engine, Automation GUI Rebuild Progress
    FileCreateDir, %A_ScriptDir%\gui
    Sleep, 500
    FileInstall, _assembly\gui\about.png, %A_ScriptDir%\gui\about.png, 0
    Progress, 98 ; Set the position of the bar to 98%.
    Sleep, 500
    }


        Progress, Off


    ;     if FileExist("bug_report\bug_reporter.exe")
    ; {
    ;     Sleep, 10
    ; }
    ; Else {
    ; Progress, b w200, Rebuilding Bug Reporter Files..., Automation Engine, Automation BR Rebuild Progress
    ; FileCreateDir, %A_ScriptDir%\bug_report
    ; Sleep, 500
    ; FileInstall, _assembly\BugReporter\bug_reporter.exe, %A_ScriptDir%\bug_report\bug_reporter.exe, 0
    ; Progress, 98 ; Set the position of the bar to 98%.
    ; Sleep, 500
    ; }


    ;     if FileExist("bug_report\report.exe")
    ; {
    ;     Sleep, 10
    ; }
    ; Else {
    ; Progress, b w200, Rebuilding Bug Reporter Files..., Automation Engine, Automation BR Rebuild Progress
    ; FileCreateDir, %A_ScriptDir%\bug_report
    ; Sleep, 500
    ; FileInstall, _assembly\BugReporter\report.exe, %A_ScriptDir%\bug_report\report.exe, 0
    ; Progress, 98 ; Set the position of the bar to 98%.
    ; Sleep, 500
    ; }

    ; Sleep, 150
    ; Progress, Off


    ; report_a_bug.png


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


;;; Engine ON HOTKEY
; IniRead, ICvarLaunchKey, looper_core.ini, HOTKEY, AutoEngineStartKey, %IniKeyErrorElevate%
IniRead, ICvarLaunchKey, looper_core.ini, HOTKEY, AutoEngineStartKey, HOME
GLOBAL EngineStartInput := ICvarLaunchKey
Hotkey, %EngineStartInput%, 1


;;; Engine OFF HOTKEY
; IniRead, ICvarStopKey, looper_core.ini, HOTKEY, AutoEngineStopKey, %IniKeyErrorElevate%
IniRead, ICvarStopKey, looper_core.ini, HOTKEY, AutoEngineStopKey, END
GLOBAL EngineStopInput := ICvarStopKey
Hotkey, %EngineStopInput%, 2





Menu, Tray, NoStandard 
Menu, Tray, DeleteAll 
Menu, Tray, Add, Show Gui, restore
Menu, Tray, Default, Show Gui
Menu, Tray, Add, Exit, GuiClose
Menu, Tray, Click, 1



; <COMPILER: v1.1.26.01>
WinGet, aoid, List, Anarchy Online
; Gui +LastFound +ToolWindow  ; +ToolWindow avoids a taskbar button and an alt-tab menu item.
; Gui +LastFound +AlwaysOnTop -Caption +ToolWindow  ; +ToolWindow avoids a taskbar button and an alt-tab menu item.
Gui, Add, Picture, x0 y0 w404 h464, %A_ScriptDir%\gui\bg.png
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
IniRead, DoAOIDUpdate, looper_core.ini, ENGINE, AutoUpdateAOIDlist, %IniKeyErrorAOIDlist%
If(DoAOIDUpdate = 1)
{
    GLOBAL AOIAUpdaterState := "checked1"
}
If(DoAOIDUpdate = 0)
{
    GLOBAL AOIAUpdaterState := "checked0"
}
; Gui, Add, Checkbox, x80 y409 w30 h20 gToggleIDupdater vToggleIDupdate checked0, ;Toggle Auto IDlist Update
Gui, Add, Checkbox, x80 y430 w30 h20 gToggleIDupdater vToggleIDupdate %AOIAUpdaterState%, ;Toggle Auto IDlist Update
Gui, Add, Text, x78 y449 +BackgroundTrans, AUTO UPDATE AOIDs
Gui, Add, Button, x110 y426 h19 gManualAOIDUpdate, UPDATE AOIDs
IniRead, RaidLeadCurrent, looper_core.ini, CLIENT, RaidLeader, NULL @ RaidLeader
Gui, Add, Text, x92 y369 +BackgroundTrans, RAID
Gui, Add, Text, x90 y384 +BackgroundTrans, LEAD:
Gui, Add, Edit, x124 y380 w70 h20 vRaidLead, %RaidLeadCurrent%
Gui, Add, Button, x83 y403 h19 gUpdateRaidLead, SAVE RAIDLEADER
; Gui, Add, Checkbox, x80 y409 w30 h20 gToggleIDupdater vToggleIDupdate checked1, ;Toggle Auto IDlist Update
Gui, Add, Button, x9 y327 gSaveCurrentVelToDefaults, Save Speeds
Gui, Add, Button, x9 y353 gManualMSCalculator, Calculate MS
Gui, Add, Button, x11 y382 g1, On
; Gui, Add, Button, g2 X+10, Off
Gui, Add, Button, x47 y382 g2, Off

Gui, Add, Text, x9 y193 +BackgroundTrans, QUICK LAUNCH
Gui, Add, Picture, x64 y210 gAOIA, %A_ScriptDir%\gui\AOIA.png
Gui, Add, Picture, x6 y210 gOldClientNoSteam, %A_ScriptDir%\gui\oldclient_nosteam.png
Gui, Add, Picture, x6 y269 gOldClientSteam, %A_ScriptDir%\gui\oldclient_steam.png

Gui, Add, Picture, x21 y420 +BackgroundTrans vActive, %A_ScriptDir%\gui\loop_active.png
Gui, Add, Picture, x21 y420 +BackgroundTrans vInactive, %A_ScriptDir%\gui\loop_inactive.png
Gui, Add, Picture, x345 y80 +BackgroundTrans gBugReporter, %A_ScriptDir%\gui\report_a_bug.png
Gui, Add, Text, x317 y112 +BackgroundTrans, REPORT A BUG 
Gui, Add, Picture, x289 y80 +BackgroundTrans gHelpBtn, %A_ScriptDir%\gui\help_alt.png
Gui, Add, Picture, x250 y80 +BackgroundTrans gAboutBtn, %A_ScriptDir%\gui\about.png
Gui, Add, Text, x15 y406 +BackgroundTrans, Loop State
Gui, Show, w404 h464, Automation Engine
Gui, Submit, NoHide
If(ToggleIDupdate = 1)
{
SetTimer, RefreshAOIDlist, 3500
}
If(ToggleIDupdate = 0)
{
SetTimer, RefreshAOIDlist, Off
}



; Gui, show, w200 h200
; return

restore:
  gui, show
return

GuiSize:
  if A_EventInfo = 1
    Gui, hide
  return





Return
home::
1:
;;//////////////////////////////////////////////////////////////////////////
SOUNDloopstart()
; Hotkey, LCtrl, CTRLOff, On  ; Disables the CTRL key during TAB send
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
SOUNDloopend()
; Hotkey, LCtrl, CTRLOff, Off  ; Re-enables the CTRL key during TAB send
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
; Hotkey, LCtrl, CTRLOff, On  ; Disables the CTRL key during TAB send
; Loop,
; {
; Loop %aoid%
; {
; GLOBAL element := aoid%A_Index%
; if(tabloop = 1)
; {
IniRead, ClientIniRaidLeader, looper_core.ini, CLIENT, RaidLeader, INI KEY READ ERROR @ [CLIENT] - RaidLeader | The value is attempting to return null.
; sleep 10
; ControlSend,ahk_parent, {tab}, ahk_id %element%
ControlSend,ahk_parent, {tab}, Anarchy Online - %ClientIniRaidLeader%
; sleep 10
; }
; }
; Break
; }
; sleep 100
; Hotkey, LCtrl, CTRLOff, Off  ; Re-enables the CTRL key during TAB send
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


SaveCurrentVelToDefaults:
Gui, Submit, NoHide
IniWrite, %TabSpeed%, looper_core.ini, VELOCITY, TabSpeedDefault
IniWrite, %ESpeed%, looper_core.ini, VELOCITY, ESpeedDefault
IniWrite, %RSpeed%, looper_core.ini, VELOCITY, RSpeedDefault
IniWrite, %FSpeed%, looper_core.ini, VELOCITY, FSpeedDefault
IniWrite, %GSpeed%, looper_core.ini, VELOCITY, GSpeedDefault
IniWrite, %JSpeed%, looper_core.ini, VELOCITY, JSpeedDefault
IniWrite, %KSpeed%, looper_core.ini, VELOCITY, KSpeedDefault
IniWrite, %LSpeed%, looper_core.ini, VELOCITY, LSpeedDefault
IniWrite, %VSpeed%, looper_core.ini, VELOCITY, VSpeedDefault
IniWrite, %BSpeed%, looper_core.ini, VELOCITY, BSpeedDefault
IniWrite, %NSpeed%, looper_core.ini, VELOCITY, NSpeedDefault
IniWrite, %MSpeed%, looper_core.ini, VELOCITY, MSpeedDefault
IniWrite, %F7Speed%, looper_core.ini, VELOCITY, F7SpeedDefault
Return




AOIA:
IniRead, CurAOIAInstallPath, looper_core.ini, ENGINE, AOIA_InstallPath,  INI KEY READ ERROR @ [ENGINE] - AOIA_InstallPath | The value is attempting to return null.
        if (CurAOIAInstallPath = "Replace_Me")
    {
        Sleep, 10
        MsgBox, 4, %EngineTitle% - %EngineError0x1%, You must first enter your Anarchy Online Item Assistant Install directory.  `n` `n`                                   Would you like to do this now?
        IfMsgBox, Yes
        {
            InputBox, AOIADirInput, %EngineTitle% - QuickLaunch AOIA,         Please enter your AOIA install directory `n` `n` EXAMPLE: `n`     D:\Program Files (x86)\AO Item Assistant+, , 400, 180
            if ErrorLevel
            {
            ; MsgBox, 48, , CANCEL was pressed.
            Return
            }
            else if(AOIADirInput = "")
            {
                MsgBox, 48, %EngineTitle% - %EngineError0x1%, This Field Cannot Be Blank. You must enter your Anarchy Online Item Assistant Install directory.  `n`
                Return
            }
            else if(AOIADirInput = " ")
            {
                MsgBox, 48, %EngineTitle% - %EngineError0x1%, This Field Cannot Be Blank. You must enter your Anarchy Online Item Assistant Install directory.  `n`
                Return
            }
            else,
            {
            IniWrite, %A_Space%%AOIADirInput%, looper_core.ini, ENGINE, AOIA_InstallPath
            FileDelete, aoia.lnk
            Sleep, 100
            IniRead, CurAOIAInstallPath, looper_core.ini, ENGINE, AOIA_InstallPath,  INI KEY READ ERROR @ [ENGINE] - AOIA_InstallPath | The value is attempting to return null.
            Sleep, 200
            FileCreateShortcut, %CurAOIAInstallPath%\ItemAssistant.exe, aoia.lnk, %CurAOIAInstallPath%, , Runs Anarchy Online Item Assistant (AutoGenerated)
            Sleep, 350
            SOUNDquicklaunchAOIA()
            Run, aoia.lnk
            ; AOIAifExist()
            }
        }
        IfMsgBox, No
        {
            Sleep, 50
            Return
        }
    }
    Else {
    SOUNDquicklaunchAOIA()
    FileDelete, aoia.lnk
    Sleep, 50
    IniRead, CurAOIAInstallPath, looper_core.ini, ENGINE, AOIA_InstallPath,  INI KEY READ ERROR @ [ENGINE] - AOIA_InstallPath | The value is attempting to return null.
    Sleep, 200
    FileCreateShortcut, %CurAOIAInstallPath%\ItemAssistant.exe, aoia.lnk, %CurAOIAInstallPath%, , Runs Anarchy Online Item Assistant (AutoGenerated)
    Sleep, 350
    ; AOIAifExist()
    Run, aoia.lnk
    }
Return

; AOIAifExist()
; {
;     if FileExist("aoia.lnk")
;     {
;         Sleep, 10
;         Run, aoia.lnk
;     }
;     Else {
;         Sleep, 10
;     }
;     Return
; }




OldClientNoSteam:
IniRead, CurOldEngineInstallPath, looper_core.ini, ENGINE, AO_OldEngine_InstallPath,  INI KEY READ ERROR @ [ENGINE] - AO_OldEngine_InstallPath | The value is attempting to return null.
        if (CurOldEngineInstallPath = "Replace_Me")
    {
        Sleep, 10
        MsgBox, 4, %EngineTitle% - %EngineError0x1%, You must first enter your Anarchy Online Old Engine Install directory.  `n` `n`                                Would you like to do this now?
        IfMsgBox, Yes
        {
            InputBox, AOoldEngineInput, %EngineTitle% - QuickLaunch AO,         Please enter your AO Old Engine install directory `n` `n` EXAMPLE: `n`     C:\Program Files (x86)\Funcom\Anarchy Online, , 400, 180
            if ErrorLevel
            {
            ; MsgBox, 48, , CANCEL was pressed.
            Return
            }
            else if(AOoldEngineInput = "")
            {
                MsgBox, 48, %EngineTitle% - %EngineError0x1%, This Field Cannot Be Blank. You must enter your Anarchy Online Old Engine Install directory.  `n`
                Return
            }
            else if(AOoldEngineInput = " ")
            {
                MsgBox, 48, %EngineTitle% - %EngineError0x1%, This Field Cannot Be Blank. You must enter your Anarchy Online Old Engine Install directory.  `n`
                Return
            }
            else,
            {
            IniWrite, %A_Space%%AOoldEngineInput%, looper_core.ini, ENGINE, AO_OldEngine_InstallPath
            FileDelete, ao_oldengine_nosteam.lnk
            Sleep, 100
            IniRead, CurAOInstallPath, looper_core.ini, ENGINE, AO_OldEngine_InstallPath,  INI KEY READ ERROR @ [ENGINE] - AO_OldEngine_InstallPath | The value is attempting to return null.
            Sleep, 200
            FileCreateShortcut, %CurAOInstallPath%\AnarchyOnline.exe, ao_oldengine_nosteam.lnk, %CurAOInstallPath%, , Runs Anarchy Online Old Engine (AutoGenerated)
            Sleep, 350
            SOUNDquicklaunchAO()
            Run, ao_oldengine_nosteam.lnk
            ; AOIAifExist()
            }
        }
        IfMsgBox, No
        {
            Sleep, 50
            Return
        }
    }
    Else {
    SOUNDquicklaunchAO()
    FileDelete, ao_oldengine_nosteam.lnk
    Sleep, 50
    IniRead, CurOldEngineInstallPath, looper_core.ini, ENGINE, AO_OldEngine_InstallPath,  INI KEY READ ERROR @ [ENGINE] - AO_OldEngine_InstallPath | The value is attempting to return null.
    Sleep, 200
    FileCreateShortcut, %CurOldEngineInstallPath%\Anarchy.exe, ao_oldengine_nosteam.lnk, %CurOldEngineInstallPath%, , Runs Anarchy Online Old Client without Steam (AutoGenerated)
    Sleep, 350
    Run, ao_oldengine_nosteam.lnk
    }
Return


OldClientSteam:
SOUNDquicklaunchAOSTEAM()
Run, "steam://run/396280/"
Return


 

RefreshAOIDlist:
WinGet, aoid, List, Anarchy Online
IniRead, AOIDUpdateDebug, looper_core.ini, DEBUG, AutoAOIDUpdateMsg, %IniKeyErrorAOIDlist%
If(AOIDUpdateDebug = 1)
{
TrayTip , AUTOMATION ENGINE, AOID LIST AUTO UPDATED, 2,
}
Return



ManualAOIDUpdate:
WinGet, aoid, List, Anarchy Online
IniRead, AOIDUpdateDebug, looper_core.ini, DEBUG, AutoAOIDUpdateMsg, %IniKeyErrorAOIDlist%
; If(AOIDUpdateDebug = 1)
; {
TrayTip , AUTOMATION ENGINE, AOID LIST MANUALLY UPDATED, 2,
; }
Return


UpdateRaidLead:
Gui, Submit, NoHide
Sleep, 5
IniWrite, %A_Space%%RaidLead%, looper_core.ini, CLIENT, RaidLeader
Return



BugReporter:
; Run, ".\bug_report\bug_reporter.exe"
MsgBox, 64, %EngineString%, `nThe Bug Reporter is currently deprecated as of now,`n    please contact me directly for issue resolution. `n`n         Feel free to check this in future versions. 
Return

HelpBtn:
Run, "https://github.com/ReleaseOverflow/AO-Automation-Engine/wiki"
Return

AboutBtn:
Run, %A_ScriptDir%\gui\about.exe
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


RandomCapsLetter()
{

	Random, OutputVar , 65, 90 ;Ascii codes for A-Z

	Return Chr(OutputVar) ;Turn from number to char & return

}

RandomLowerLetter()
{

	Random, OutputVar , 97, 122 ;Ascii codes for a-z

	Return Chr(OutputVar) ;Turn from number to char & return

}





;;////////////////////////////////////SOUND FUNCTIONS\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\;;
SOUNDquicklaunchAO()
{
    IniRead, SNDquicklaunchAO, looper_core.ini, SOUND, QuickLaunch_AOoldEngine, Default
    if(SNDquicklaunchAO = 1)
    {
    SoundBeep
    Return
    }
}


SOUNDquicklaunchAOSTEAM()
{
    IniRead, SNDquicklaunchAOSTEAM, looper_core.ini, SOUND, QuickLaunch_AOoldEngineSteam, Default
    if(SNDquicklaunchAOSTEAM = 1)
    {
    SoundBeep
    Return
    }
}


SOUNDquicklaunchAOIA()
{
    IniRead, SNDquicklaunchAOIA, looper_core.ini, SOUND, QuickLaunch_AOIA, Default
    if(SNDquicklaunchAOIA = 1)
    {
    SoundBeep
    Return
    }
}




SOUNDloopstart()
{
    IniRead, SNDloopstart, looper_core.ini, SOUND, LoopStart, Default
    if(SNDloopstart = 1)
    {
    SoundBeep
    Return
    }
}

SOUNDloopend()
{
    IniRead, SNDloopend, looper_core.ini, SOUND, LoopEnd, Default
    if(SNDloopend = 1)
    {
    SoundBeep
    Return
    }
}
;;////////////////////////////////////SOUND FUNCTIONS\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\;;



ToggleIDupdater:
Gui, Submit, NoHide
If(ToggleIDupdate = 1)
{
SetTimer, RefreshAOIDlist, 3500
}
If(ToggleIDupdate = 0)
{
SetTimer, RefreshAOIDlist, Off
}
Return



; CTRLOff:
; IniRead, NotifyCtrlLocked, looper_core.ini, ENGINE, PromptCtrlKeyLocked, 1
; If(NotifyCtrlLocked = 1)
; {
; ToolTip, [AUTOMATION ENGINE]:`n{CTRL Locked While Loop Sequence Active}
; SetTimer, RemoveToolTip, -2000
; }
; return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; MODIFIER KEY DISABLER ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; FRIDAY, DECEMBER 3RD, 2021  --  Simply pause all current threads while a modifier key is depressed!
;;;;
;; CTRL
~Ctrl::
PAUSE, On
Return
~Ctrl UP::
PAUSE, Off
Return
;;;;
;; ALT
~Alt::
PAUSE, On
Return
~Alt UP::
PAUSE, Off
Return
;;;;
;; SHIFT
~Shift::
PAUSE, On
Return
~Shift UP::
PAUSE, Off
Return
;;;;
;; TAB
; ~Tab::
; PAUSE, On
; Return
; ~Tab UP::
; PAUSE, Off
; Return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




RemoveToolTip:
ToolTip
return



GuiClose:
ExitApp

 



