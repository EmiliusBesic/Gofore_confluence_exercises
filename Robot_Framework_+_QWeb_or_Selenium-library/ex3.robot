*** Settings ***
Documentation     Test Automation exercises part 2
Library           OperatingSystem
Library           QWeb
Library           DateTime
Library           String
Library           Collections
*** Variables ***
${BROWSER}    chrome
${url}        https://www.hus.fi
${BASE_IMAGE_PATH}          ${CURDIR}${/}images
*** Test Cases ***

Compare saved Hus-logo to real one
    Open browser to main page
    Verify Logo

*** Keywords ***
Open browser to main page
    OpenBrowser    ${url}    ${BROWSER}
    Sleep          2s
Verify Logo
    VerifyIcon    neuro
 