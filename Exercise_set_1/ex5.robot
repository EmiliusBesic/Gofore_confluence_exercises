*** Settings ***
Documentation     Test Automation exercises part 1
Library           OperatingSystem
Library           QWeb

*** Variables ***
${BROWSER}            chrome
${url}                https://www.ytj.fi/
${Yritys}             Arttia Oy
${Lei}                743700B4PQT0OS765781
${Y-tunnus}           2762421-9
${SCREENSHOT_NAME}    ex5_screen_shot.png
*** Test Cases ***
Take a screenshot of company info
    Open browser to main page
    Navigate to yrityshaku
    Input info and take a screenshot
*** Keywords ***
Open browser to main page
    OpenBrowser    ${url}    ${BROWSER}
    Sleep    2s

Navigate to yrityshaku
    Click Item       /index/yrityshaku.html    anchor=Y-tunnus
    Click Text       Siirry yrityshakuun
    Close Window
Input info and take a screenshot
    Type Text        Yrityksen nimi    ${Yritys}
    Type Text        Y-tunnus          ${Y-tunnus}
    Type Text        LEI-tunnus        ${Lei}
    Click Item       Hae
    #Use Table        Y-tunnus          anchor=Hakutulokset
    #Click Cell       r2c1
    Click Item       HakuTulos__ctl1_HyperLink1
    LogScreenshot    ${SCREENSHOT_NAME}