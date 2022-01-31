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

Dowload tutkimus-pdf and check content and remove the file
    Open browser to main page
    Navigate to tutkimussuunnitelman muutos
    Download Pdf and check contents

*** Keywords ***
Open browser to main page
    OpenBrowser    ${url}    ${BROWSER}
    Sleep          2s
Navigate to tutkimussuunnitelman muutos
    ClickText       Tutkimus ja opetus      anchor=ammattilaiselle
    ClickText       Tutkijan ohjeet
    ClickText       Ohjeet eettisen toimikunnan lausunnon hakemiseen
    ClickText       Toimikunnan pyytämät lisäselvitykset tai tutkimussuunnitelman muutos
Download Pdf and check contents
   ClickText        Tutkimussuunnitelman merkittava muutos  
   UsePdf          tutkimussuunnitelman-merkittava-muutos_23.9.2021.pdf
   VerifyPdfText   Päivitetty  \n23.9.2021
   VerifyPdfText   Tutkimussuunnitelman merkittävä muutos ja ilmoitusvelvollisuus
   VerifyPdfText   (protocol amendment)
   RemoveFile
 