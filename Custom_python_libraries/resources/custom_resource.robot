*** Settings ***
Documentation     Test Automation exercises part 3
Library           OperatingSystem
Library           QWeb
Library           DateTime
Library           String
Library           Collections
Library           ../libs/custom_qweb_lib.py

*** Variables ***
${BROWSER}         chrome
${url}             https://www.fida.info/11031/
${input_field}     //*[@id\="input_42_6"]
${next_day}        1
*** Keywords ***

#Opens the browser to gofore.com and accepts cookies.
#Variables needed are url address and browser name
Open browser to main page
    OpenBrowser    ${url}    ${BROWSER}
    Sleep          2s
    ClickText      Salli kaikki
Testing type text
    TypeAndLog    ${input_field}     Helsinki,Tampere,Turku
Testing type date
    TypeDate       ${input_field}
Testing type date enc
    ${date}        TypeDateEnc    ${input_field}    ${next_day}
    LogToConsole    ${date}       