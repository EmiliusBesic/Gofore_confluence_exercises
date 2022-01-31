*** Settings ***
Documentation     Test Automation exercises part 2
Library           OperatingSystem
Library           QWeb
Library           DateTime
Library           String
Library           Collections
*** Variables ***
${BROWSER}    chrome
${url}        https://www.is.fi
*** Test Cases ***

Go to iltasanomat and get the most recent time
    Open browser to main page
    ${ilta_time}    Get time from Iltasanomat
    Compare current time to the recent news time    ${ilta_time}
*** Keywords ***
Open browser to main page
    OpenBrowser    ${url}    ${BROWSER}
    Sleep          2s
    ClickText     OK
Get time from Iltasanomat
    ClickText       Tuoreimmat
    ${tim}           GetText       //*[@id\="__next"]/div[2]/div[3]/div[1]/div[2]/main/section[2]/section/div[1]/article/a/section/div/div[2]/div[2]/time
    ${time}          SplitString   ${tim}    separator=:
    ${minutes}       GetFromList    ${time}   	 1
    [Return]         ${minutes}
Compare current time to the recent news time    
    [Arguments]    ${ilta_time}
    ${date} 	GetCurrentDate	result_format=datetime
    ${diff}       Evaluate     ${date.minute} - ${ilta_time}
    LogToConsole     ${diff}   