*** Settings ***
Documentation     Test Automation exercises part 1
Library           OperatingSystem
Library           QWeb

*** Variables ***
${BROWSER}            chrome
${url}                https://testipalvelu.apro.tunnistus.fi/
${SCREENSHOT_NAME}    ex9_screen_shot.png
*** Test Cases ***
Go to yrityshaku and input nothing
    Open browser to main page
    Navigate to testipalvelu
    Log in and take screenshot of info
*** Keywords ***
Open browser to main page
    OpenBrowser    ${url}    ${BROWSER}
    Sleep          2s
    
Navigate to testipalvelu
    Click Text       Tunnistaudu    
    Click Text       Testitunnistaja
    Click Text       Käytä oletusta
Log in and take screenshot of info
    Click Text       Tunnistaudu           anchor=Keskeytä
    Click Text       Jatka palveluun
    LogScreenshot    ${SCREENSHOT_NAME}
    Click Text       Kirjaudu ulos