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
${language_btn}        /html/body/div/div/header/div[1]/div/div[3]/div/div/div[1]/button
${url_sw}              https://www.hus.fi/sv
${url_en}              https://www.hus.fi/en
*** Test Cases ***

Change language and verify the change
    Open browser to main page
    Change language to Swedish
    Change language to English
*** Keywords ***
Open browser to main page
    OpenBrowser    ${url}    ${BROWSER}
    Sleep          2s
Change language to Swedish
    ${finnish_text}              GetText              Ura HUSissa
    ClickElement                 ${language_btn} 
    ClickText                    På svenska  
    ${swedish_text}              GetText              Karriär inom HUS
    ShouldNotBeEqualAsStrings    ${finnish_text}      ${swedish_text}
    VerifyUrl                    ${url_sw}
    
Change language to English
    ${swedish_text}              GetText              Karriär inom HUS
    ClickElement                 ${language_btn} 
    ClickText                    In English  
    ${english_text}              GetText              Contact information
    ShouldNotBeEqualAsStrings    ${swedish_text}      ${english_text}
    VerifyUrl                    ${url_en}