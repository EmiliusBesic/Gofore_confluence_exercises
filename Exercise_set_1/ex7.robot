*** Settings ***
Documentation     Test Automation exercises part 1
Library           OperatingSystem
Library           QWeb
Library           String
*** Variables ***
${BROWSER}            chrome
${url}                https://www.telepartikkeli.net/tunnusgeneraattori
${clicks}             100
${SCREENSHOT_NAME}    ex7_screen_shot.png
*** Test Cases ***
Generate 100 Y-tunnus and verify the number
    Open browser to main page
    Generate 100 Y-tunnus
*** Keywords ***
Open browser to main page
    OpenBrowser    ${url}    ${BROWSER}
    Sleep          2s
    
Generate 100 Y-tunnus
    FOR    ${i}    IN RANGE     ${clicks}
        Click Text    Generoi    anchor=Generoi Y-tunnus 
    END

    ${string}    Get Text      //*[@id\="results"]
    ${list}      Split String      ${string}     separator=-   max_split=${${clicks}-${1}}
    ${length_int}    Get Length    ${list}
    ${length_str}     Convert To String    ${length_int}
    Should Be Equal    ${length_str}      ${clicks}  
    LogScreenshot    ${SCREENSHOT_NAME}