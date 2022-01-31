*** Settings ***
Documentation     Test Automation exercises part 2
Library           OperatingSystem
Library           QWeb

*** Variables ***
${BROWSER}    chrome
${url}        https://www.is.fi
*** Test Cases ***
Go to iltasanomat and get the most recent time
    Open browser to main page
    Navigate to Iltasanomat

*** Keywords ***
Open browser to main page
    OpenBrowser    ${url}    ${BROWSER}
    Sleep          2s
    Click Text     OK
Navigate to Iltasanomat
    Click Text        Tuoreimmat
    ${time}           Get Text       //*[@id\="__next"]/div[2]/div[3]/div[1]/div[2]/main/section[2]/section/div[1]/article/a/section/div/div[2]/div[2]/time
    Log To Console    ${time}
    