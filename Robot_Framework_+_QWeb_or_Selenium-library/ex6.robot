*** Settings ***
Documentation     Test Automation exercises part 2
Library           OperatingSystem
Library           QWeb
Library           DateTime
Library           String
Library           Collections
*** Variables ***
${BROWSER}             chrome
${url}                 https://www.hus.fi
*** Test Cases ***

Download cetificate-pdf and check content and remove the file
    Open browser to main page
    Navigate to certificate
    Download Pdf

*** Keywords ***
Open browser to main page
    OpenBrowser    ${url}    ${BROWSER}
    Sleep          2s
Navigate to certificate
    ClickText       Tietoa meistä
    ClickText       Potilashoito, laatu ja potilasturvallisuus 
    ClickText       HUS Logistiikka
    ClickText       ISO 9001:2015 -standardi

Download Pdf
    ClickText     hus-logistiikka-iso-9001-sertifikaatti-2021-2024        (pdf 105.6 KB)
    UsePdf        hus-logistiikka-iso-9001-sertifikaatti-2021-2024.pdf
    VerifyPdfText     HUS Logistiikka
    VerifyPdfText     Uutistie 5, Vantaa
    VerifyPdfText     Auroran sairaala
    VerifyPdfText     Voimakeskus
    RemoveFile
    