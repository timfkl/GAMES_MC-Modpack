::@if (@X)==(@Y) @end /* Hybrid line begins JS comment
@echo off
setlocal ENABLEDELAYEDEXPANSION
title GAMES Modpack Installer
set installFolder=%APPDATA%\.minecraft
set profileFile=%APPDATA%\.minecraft\launcher_profiles.json
set forgeInstall=forge-1.16.4-35.1.4-installer.jar


if not exist !installFolder!\versions\1.16.4-forge-35.1.4\1.16.4-forge-35.1.4.jar (
	start /W !forgeInstall!
	)
::Makes directories
if exist %installFolder%\versions\1.16.4-forge-35.1.4\1.16.4-forge-35.1.4.jar (
	echo Forge-35.1.4.jar exists
	set modpackFolder=!installFolder!\profiles\GAMES_Modpack1.0
	mkdir !modpackFolder!\mods
	
	copy %cd%\mods\*.* !modpackFolder!\mods\
) ELSE ("echo ERROR: Forge-35.1.4.jar does not exist")

pause
::cscript //E.JScript //nologo "%-f0"
::exit /b 
::*/

::"822b6abc33b96543a0a69f159dfc80ff" : {
      ::"gameDir" : "C:\\Users\\Timothy\\AppData\\Roaming\\.minecraft\\profiles\\GAMES_Modpack1.0",
      ::"icon" : "Cake",
      ::"lastVersionId" : "1.16.4-forge-35.1.4",
      ::"name" : "GAMES_Modpack1.0",
      ::"type" : "custom"
    ::},
