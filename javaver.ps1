# This script changes the java version of the OS by changing JAVA_HOME.
# Therefore this assumes that the java binary folder in the PATH 
# environment variable is reliant on JAVA_HOME, i.e. %JAVA_HOME%\bin

param (
    [Int]$versionNumber
)

switch ($versionNumber) {
    8 {  
        $v8 = "C:\Dev\java\1.8.0_202"
        $Env:JAVA_HOME = $v8
        Write-Host "JAVA_HOME set to $($v8)" -ForegroundColor Green
        break;
    }
    11 {
        $v11 = "C:\Dev\java\11.0.1"
        $Env:JAVA_HOME = $v11
        Write-Host "JAVA_HOME set to $($v11)" -ForegroundColor Green
        break;
    }
    Default {
        Write-Host "Unrecognized Java version number." -ForegroundColor Red
    }
}