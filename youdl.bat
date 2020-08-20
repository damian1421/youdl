@echo off
title Descargar video de Youtube/Youtube Music con youtube-dl
color 3
:inicio
cls & echo. & echo.
set /p link=Escribir el link del video (Youtube/ Youtube Music): 

:elegir-formato
	cls & echo.
	echo Elegir una opcion:
	echo 1 = Descarga el video en MP4
	echo 2 = Descarga solo el audio en MP3
	echo 3 = Playlist: Descarga solo la cancion actual
	echo 4 = Playlist: Descarga la playlist completa
	set /p formato=
	if [%formato%] == [1] call :video & goto :fin
	if [%formato%] == [2] call :mp3 & goto :fin
	if [%formato%] == [3] call :no-playlist & goto :fin
	if [%formato%] == [4] call :si-playlist & goto :fin
	goto :elegir-formato
	
:video
youtube-dl.exe %link% -i --recode-video mp4
goto :eof

:mp3
youtube-dl.exe -i --extract-audio --audio-format mp3 --audio-quality 0 %link%
goto :eof

:no-playlist
youtube-dl.exe %link% -i --no-playlist -i --extract-audio --audio-format mp3 --audio-quality 0
goto :eof

:si-playlist
youtube-dl.exe %link% -i --yes-playlist -i --extract-audio --audio-format mp3 --audio-quality 0
goto :eof

:fin
timeout 10
pause
cls & echo. & echo.
goto :inicio
