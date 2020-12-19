@echo off
set installFolder=%APPDATA%\.minecraft
set profileFile=%APPDATA%\.minecraft/launcher_profiles.json
set forgeInstall=forge-1.16.4.35.1.4-installer.jar

::start /W java -jar %forgeInstall%
::Makes directories
if exist %installFolder%\versions\1.16.4-forge.35.1.0 (
	mkdir %installFolder%\profiles\GAMES_Modpack1.0
	echo True
)
echo False
pause