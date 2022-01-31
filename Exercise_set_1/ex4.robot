*** Settings ***
Documentation     Test Automation exercises part 1
Library           OperatingSystem
Library           QWeb

*** Variables ***
${BROWSER}    chrome
${url}        https://www.ytj.fi/
*** Test Cases ***
Download Lei file and verify it
    Open browser to main page
    Navigate to Lei-file download
    Change date values and search
    Download file
*** Keywords ***
Open browser to main page
    OpenBrowser    ${url}    ${BROWSER}
    Sleep          2s
Navigate to Lei-file download
    Click Item       /index/lei-tunnus.html    anchor=hinnat
    Click Text       Lataa LEI-tiedostoja
    Close Window
Change date values and search
    Drop Down    1       2       anchor=Kuukausi
    Drop Down    2022    2021    anchor=Vuosi
    Click Text   Hae
    Use Table    Päivämäärä
Download file
    ExpectFileDownload
    #Click Cell   r3c3    
    Click Text    lataa     anchor=28.02.2021 21:54:03
    VerifyFileDownload      timeout=20s  
    