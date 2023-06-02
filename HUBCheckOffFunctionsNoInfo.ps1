function Out-AudioTest {
    Write-Host "Testing audio"

    $voice = New-Object -ComObject Sapi.spvoice
    $voice.rate = 0
    $voice.speak("Testing Audio")
}

function Set-BitlockerOn{

    Write-Host "Turning on Bitlocker"
   
    Manage-bde -On c:
}

function Open-SoftwareCentre {

    C:\Windows\CCM\ClientUX\scclient.exe
}

function Get-GPupdate {
    Write-Host "`n`n`nGetting ready to GPupdate. This may take several minutes to run. `n`n`n"
   
    gpupdate /force

    Write-Host "`n`n`nGPupdated`n`n`n"
}



function Install-Laps {
    
    Write-Host "`n`n`nDownloading LAPs`n`n`n"
    
    try {
    New-PSDrive "Z" -PSProvider "FileSystem" -Root "\\FILE LOCATION"
    ***File Location***
    }
    
    catch {
    Write-Host "An error occured"
    }
}

function Wait-TwoSeconds {
    Start-Sleep -Seconds 2
}

function Get-MainMenu {
    Write-Host " Hello, please use the number keys to select an option below:

    1. Test Audio
    2. Turn on Bitlocker
    3. Open Software centre (You have to look at office installation yourself :) )
    4. GPupdate
    5. Open LAPS installer. 
    6. Run all the above (Recommended after re-image.)
    7. Exit Script

    "

    $selectedOption = Read-Host "Please enter the number to select an option above. "

    if ($selectedOption -eq "1"){
        Out-AudioTest
        Wait-TwoSeconds
        Get-MainMenu
    }
    elseif ($selectedOption -eq "2"){
        Set-BitlockerOn
        Wait-TwoSeconds
        Get-MainMenu
    }
    elseif ($selectedOption -eq "3"){
        Open-SoftwareCentre
        Get-MainMenu
    }
    elseif ($selectedOption-eq "4"){
        Get-GPupdate
        Get-MainMenu
    }
    elseif ($selectedOption-eq "5"){
        Install-Laps
        Get-MainMenu
    }
    elseif ($selectedOption-eq "6"){
        Out-AudioTest
        Set-BitlockerOn
        Open-SoftwareCentre
        Install-Laps
        Get-GPupdate
        Get-MainMenu
    }
    elseif ($selectedOption-eq "7"){
        exit
    }
    else {
        Write-Host "Please type a number 1-7."
        Get-MainMenu
    }
}

    Get-MainMenu
