*** Settings ***
Documentation     Test Automation exercises part 1
Library           OperatingSystem
Library           QWeb

*** Variables ***
${BROWSER}            chrome
${url}                https://www.ytj.fi/
${SCREENSHOT_NAME}    ex3_screen_shot.png
*** Test Cases ***
Go to yrityshaku and input nothing
    Open browser to main page
    Navigate to yrityshaku
    Screenshot error
*** Keywords ***
Open browser to main page
    OpenBrowser    ${url}    ${BROWSER}
    Sleep          2s
    
Navigate to yrityshaku
    Click Item       /index/yrityshaku.html    anchor=Y-tunnus
    Click Text       Siirry yrityshakuun
    Close Window
Screenshot error 
    Click Item       Hae
    Sleep            2s
    LogScreenshot    ${SCREENSHOT_NAME}
    #Close alert     ACCEPT