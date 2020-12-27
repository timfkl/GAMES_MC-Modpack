@echo off

setlocal enableextensions enabledelayedexpansion

echo Defining Variables

:: Define Source
set source=%APPDATA%\.minecraft

:: Define Modpack destination
set packPath=%source%\profiles\GAMES_Modpack1.0
set "packPath=%packPath:\=\\%"

:: Define Launcher file
set input=%source%\launcher_profiles.json

:: Define/Create Temp file
set tempfile=%source%\%random%-%random%.json
copy /y nul "%tempfile%"

:: -----------------------------------------------

echo Checking for GAMES_Modpack1.0...

:: Check if Profile Made with GAMES_ModPack1.0 name
>nul find "GAMES_Modpack1.0" "%input%" && (
	echo GAMES_Modpack1.0 found.
	goto Abort
) || (
	echo GAMES_Modpack1.0 not found.
)

:: -----------------------------------------------

echo Copying first half of profiles...

:: Copy every line up to profiles to temp
set line=1
for /f "delims=" %%1 in ('type "%input%"') do (
	set /a line+=1
	if !line!==22 (
		echo Complete.
		goto Add_Profile
	) else (
		echo %%1>>"%tempfile%"
	)
)

:Add_Profile

echo Inserting GAMES_Modpack1.0 profile...

:: Insert GAMES_Modpack1.0 info
echo    "822b6abc33b96543a0a69f159dfc80ff" : {>>"%tempfile%"
echo      "gameDir" : "%packPath%",>>"%tempfile%"
echo      "icon" : "Cake",>>"%tempfile%"
echo      "lastUsed" : "2020-12-26T19:15:04.214Z",>>"%tempfile%"
echo      "lastVersionId" : "1.16.4-forge-35.1.4",>>"%tempfile%"
echo      "name" : "GAMES_Modpack1.0",>>"%tempfile%"
echo      "type" : "custom">>"%tempfile%"
echo    },>>"%tempfile%"

echo Complete.

:: Add End to end of original file (as to be able to find the end)
echo End>>"%input%"

echo Copying final half of profiles...

:: Copy remaining lines. NOTE: Can't seem to copy the picture for the Forge Profile.
set line=0
for /f "delims=" %%1 in ('type "%input%"') do (
	set /a line+=1
	if !line! gtr 20 (
		if %%1==End (
			echo Complete.
			goto Finish
		) else (
			echo %%1>>"%tempfile%"
		)
	)
)

:: -----------------------------------------------

:Finish

echo Deleting original launcher_profiles.json...

del "%input%"

echo Complete.

echo Renaming temporary file...

ren "%tempfile%" launcher_profiles.json

echo Complete.

goto End

:Abort

echo Deleteing temporary file...

del "%tempfile%"

echo Complete.

:End

pause


 
