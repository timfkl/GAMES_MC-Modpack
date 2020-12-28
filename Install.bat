@echo off
echo Loading setup...
setlocal ENABLEDELAYEDEXPANSION
title GAMES Modpack Installer
set installFolder=%appdata%\.minecraft
set profileFile=%appdata%\.minecraft\launcher_profiles.json
set forgeInstall=forge-1.16.4-35.1.4-installer.jar
set modpackFolder=%installFolder%\profiles\GAMES_Modpack1.0

echo Checking for Forge...
if not exist "%installFolder%\versions\1.16.4-forge-35.1.4\1.16.4-forge-35.1.4.jar" (
	start /W %forgeInstall%
	)

::Makes directories
if exist "%installFolder%\versions\1.16.4-forge-35.1.4\1.16.4-forge-35.1.4.jar" (
	
	echo Forge-35.1.4.jar exists
	mkdir "%modpackFolder%\mods"
	
	echo Installing Mods...
	echo n | copy /-y "%cd%\mods" "%modpackFolder%\mods"
) ELSE ("echo ERROR: Forge-35.1.4.jar does not exist")
CALL AddModpackProfile.bat
pause

