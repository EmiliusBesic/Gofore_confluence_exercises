*** Settings ***
Documentation     Test Automation exercises part 1
Library           OperatingSystem
Library           QWeb
Library           String
*** Variables ***
${BROWSER}            chrome
${url}                https://www.telepartikkeli.net/tunnusgeneraattori
${amount}             3
*** Test Cases ***
Generate 3 Y-tunnus and verify the number
    Open browser to main page
    Generate 3 Y-tunnus
*** Keywords ***
Open browser to main page
    OpenBrowser    ${url}    ${BROWSER}
    Sleep          2s
    
Generate 3 Y-tunnus
    Type Text     3          ${amount}                          anchor=Generoi Y-tunnus 
    Click Text    Generoi    anchor=Generoi Y-tunnus     
    ${string}    Get Text      //*[@id\="results"]
    ${list}      Split String      ${string}     separator=-   max_split=${${amount}-${1}}
    ${length_int}    Get Length    ${list}
    ${length_str}     Convert To String    ${length_int}
    Should Be Equal    ${length_str}      ${amount}  
