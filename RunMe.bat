 :: from: https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-xp/bb490909(v=technet.10)

@echo off
@setlocal EnableDelayedExpansion

 :: Remove any surrounding quotation marks ("")
set THIS_NO_QUOTES=%~0
echo %%~0: %THIS_NO_QUOTES%

 :: Expand to a fully qualified path name
set THIS_FULL=%~f0
echo %%~f0: %THIS_FULL%

 :: Expand to a drive letter only
set THIS_DRIVE=%~d0
echo %%~d0: %THIS_DRIVE%

 :: Expand to a path only
set THIS_PATH=%~p0
echo %%~p0: %THIS_PATH%

 :: Expand to a file name only
set THIS_NAME=%~n0
echo %%~n0: %THIS_NAME%

 :: Expand to a file extension only
set THIS_EXTENSION=%~x0
echo %%~x0: %THIS_EXTENSION%

 :: Expand path to contain short names only
set THIS_SHORT_PATH=%~s0
echo %%~s0: %THIS_SHORT_PATH%

 :: Expand to the file attributes
set THIS_FILE_ATTRIBUTES=%~a0
echo %%~a0: %THIS_FILE_ATTRIBUTES%

 :: Expand to the date and time of file
set THIS_DATE_AND_TIME=%~t0
echo %%~t0: %THIS_DATE_AND_TIME%

 :: Expand to the size of file
set THIS_FILE_SIZE=%~z0
echo %%~z0: %THIS_FILE_SIZE%

 :: Searche the directories listed in the PATH environment variable and expand to the fully qualified name of the first one found. If the environment variable name is not defined or the file is not found by the search, this modifier expands to the empty string.
set THIS_ON_PATH=%~$PATH:0
if [%THIS_ON_PATH%]==[] (
echo %%~$PATH:0: Not found on PATH
) else (
echo %%~$PATH:0: %THIS_ON_PATH%
)

set THIS_FOLDER=%~dp0
echo %%~dp0: %THIS_FOLDER%

set THIS_NO_DRIVE=%~pnx0
echo %%~pnx0: %THIS_NO_DRIVE%

set THIS_FOLDER_NO_DRIVE=%~p0
echo %%~p0: %THIS_FOLDER_NO_DRIVE%

set THIS_FOLDER_NO_DRIVE_WITH_SLASHES=%THIS_FOLDER_NO_DRIVE:\=/%
set THIS_FOLDER_NO_DRIVE_WITH_SLASHES=%THIS_FOLDER_NO_DRIVE_WITH_SLASHES:~0,-1%
echo %THIS_FOLDER_NO_DRIVE_WITH_SLASHES%

set THIS_DRIVE_LETTER=%THIS_DRIVE:~0,-1%
echo %THIS_DRIVE_LETTER%

set WHAT_I_NEED=%THIS_DRIVE_LETTER%\:%THIS_FOLDER_NO_DRIVE_WITH_SLASHES%
echo %WHAT_I_NEED%

goto end

set var1=true
if "%var1%"=="true" (
  set var2="set_inside_if"
  echo !var2!
)

:end
 :: pause
goto:eof
