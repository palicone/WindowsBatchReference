 :: from: https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-xp/bb490909(v=technet.10)

@echo off
@setlocal EnableDelayedExpansion

  :: Example output under echo commands when run from and also as current dir:
  :: C:\WindowsBatchReference\RunMe.bat

 :: Remove any surrounding quotation marks ("")
set THIS_NO_QUOTES=%~0
echo %THIS_NO_QUOTES%
  :: RunMe.bat
  
 :: Expand to a fully qualified path name
set THIS_FULL=%~f0
echo %THIS_FULL%
  :: C:\WindowsBatchReference\RunMe.bat
  
 :: Expand to a drive letter (with ':') only
set THIS_DRIVE=%~d0
echo %THIS_DRIVE%
  :: C:

 :: Expand to a path only
set THIS_PATH=%~p0
echo %THIS_PATH%
  :: \WindowsBatchReference\

 :: Expand to a file name only
set THIS_NAME=%~n0
echo %THIS_NAME%
  :: RunMe

 :: Expand to a file extension only
set THIS_EXTENSION=%~x0
echo %THIS_EXTENSION%
  :: .bat

 :: Expand path to contain short names only
set THIS_SHORT_PATH=%~s0
echo %THIS_SHORT_PATH%
  :: C:\WINDOW~1\RunMe.bat

 :: Expand to the file attributes
set THIS_FILE_ATTRIBUTES=%~a0
echo %THIS_FILE_ATTRIBUTES%
  :: --a--------

 :: Expand to the date and time of file
set THIS_DATE_AND_TIME=%~t0
echo %THIS_DATE_AND_TIME%
  :: 07-Sep-21 11:32
  :: *in your date format

 :: Expand to the size of file
set THIS_FILE_SIZE=%~z0
echo %THIS_FILE_SIZE%
  :: 3086
  :: *e.g.

 :: Searche the directories listed in the PATH environment variable and expand to the fully qualified name of the first one found. If the environment variable name is not defined or the file is not found by the search, this modifier expands to the empty string.
set THIS_ON_PATH=%~$PATH:0
if [%THIS_ON_PATH%]==[] (
echo Not found on PATH
) else (
echo %THIS_ON_PATH%
)
  :: C:\WindowsBatchReference\RunMe.bat
  :: *if found on path

set THIS_FOLDER=%~dp0
echo %THIS_FOLDER%
  :: C:\WindowsBatchReference\

set THIS_NO_DRIVE=%~pnx0
echo %THIS_NO_DRIVE%
  :: \WindowsBatchReference\RunMe.bat

set THIS_FOLDER_NO_DRIVE=%~p0
echo %THIS_FOLDER_NO_DRIVE%
  :: \WindowsBatchReference\

set THIS_FOLDER_NO_DRIVE_WITH_SLASHES=%THIS_FOLDER_NO_DRIVE:\=/%
set THIS_FOLDER_NO_DRIVE_WITH_SLASHES=%THIS_FOLDER_NO_DRIVE_WITH_SLASHES:~0,-1%
echo %THIS_FOLDER_NO_DRIVE_WITH_SLASHES%
  :: /WindowsBatchReference
  
set THIS_DRIVE_LETTER=%THIS_DRIVE:~0,-1%
echo %THIS_DRIVE_LETTER%
  :: C

set WHAT_I_NEED=%THIS_DRIVE_LETTER%\:%THIS_FOLDER_NO_DRIVE_WITH_SLASHES%
echo %WHAT_I_NEED%
  :: C\:/WindowsBatchReference

set THIS_WITH_SLASHES=
call :backslasesToSlashes %THIS_FULL% THIS_WITH_SLASHES
echo %THIS_WITH_SLASHES%
  :: C:/WindowsBatchReference/RunMe.bat
  
goto end

set var1=true
if "%var1%"=="true" (
  set var2="set_inside_if"
  echo !var2!
)

:end
 :: pause
goto:eof

:emptyFolder
  set FOLDER_TO_EMPTY=%~1
  IF EXIST %FOLDER_TO_EMPTY% (
    FOR /D %%p IN ("%FOLDER_TO_EMPTY%\*.*") DO (
      rmdir "%%p" /S /Q
    )
    del %FOLDER_TO_EMPTY%\* /F /Q
  )
  goto:EOF

:backslasesToSlashes
  set _INPUT=%1 
  set %2=%_INPUT:\=/%
  goto:eof
