*** Settings ***
Documentation     Test Automation exercises part 1
Library           OperatingSystem
Library           QWeb

*** Variables ***
${BROWSER}            chrome
${url}                https://www.telepartikkeli.net/tunnusgeneraattori
${SCREENSHOT_NAME}    ex8_screen_shot.png
*** Test Cases ***
Generate 3 Y-tunnus and verify the number
    Open browser to main page
    Generate henkilö-, Y-,IBAN- and luottokorttinumerotunnus
    Check that tunnus are generated
*** Keywords ***
Open browser to main page
    OpenBrowser    ${url}    ${BROWSER}
    Sleep          2s
    
Generate henkilö-, Y-,IBAN- and luottokorttinumerotunnus
    Click Text    Generoi    anchor=Generoi henkilötunnus
    Click Text    Generoi    anchor=Generoi Y-tunnus    
    Click Text    Generoi    anchor=Generoi IBAN    
    Click Text    Generoi    anchor=Generoi luottokorttinumero  

Check that tunnus are generated
    #LogScreenshot    ${SCREENSHOT_NAME}