*** Settings ***
Documentation     Test Automation exercises part 1
Library           OperatingSystem
Library           QWeb

*** Variables ***
${BROWSER}    chrome
${url}        https://www.almamedia.fi/
*** Test Cases ***
Check captcha error message
    Open browser to main page
    Navigate to Fakta
    Fill form and check if form is sent
*** Keywords ***
Open browser to main page
    OpenBrowser    ${url}    ${BROWSER}
    Sleep          2s
    Click Text     Hyväksy
Navigate to Fakta
    Click_Text    Mainostajat
    Click Text    Alman Mediat ja Palvelut
    Click Text    Talous- ja ammattilaismediat 
    Click Text    Kauppalehti Fakta
Fill form and check if form is sent
    Type Text      Nimi             Emil
    Type Text      Puhelinnumero    0401234567
    Type Text      Sähköposti       emil.besic@gofore.com
    Type Text      Yritys           Gofore
    Type Text      Viesti           robot test

    Click Text     Lähetä
    Verify Text    Ongelma lomakkeen täytössä. Ole hyvä ja tarkista alla olevat kentät.

    CloseBrowser    

