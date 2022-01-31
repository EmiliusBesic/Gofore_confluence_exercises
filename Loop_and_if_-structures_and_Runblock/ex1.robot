*** Settings ***
Documentation     Test Automation exercises part 3
Library           OperatingSystem
Library           QWeb
Library           DateTime
Library           String
Library           Collections
*** Variables ***
${BROWSER}    chrome
${url}        https://gofore.fi
${business_duration_id}    //*[@id\="post-47914"]/div/div[4]/div/div/div[1]/div/div[1] 
${people_id}               //*[@id\="post-47914"]/div/div[4]/div/div/div[2]/div/div[1]
${revenue_id}              //*[@id\="post-47914"]/div/div[4]/div/div/div[3]/div/div[1]
${offices_id}              //*[@id\="post-47914"]/div/div[4]/div/div/div[4]/div/div[1]
*** Test Cases ***

Go to gofore and get business info
    Open browser to main page
    Go to Gofore Us and verify 
    Log Info
*** Keywords ***

#Opens the browser to gofore.com and accepts cookies.
#Variables needed are url address and browser name
Open browser to main page
    OpenBrowser    ${url}    ${BROWSER}
    Sleep          2s
    ClickText      Accept All
#Changes the website language and goes to the "Us" part and verifys that the website arrived there.

Go to Gofore Us and verify 
    ClickText       EN
    ClickText       FI
    ClickText       Meistä       doubleclick=True
    Verify Text     Uskomme, että maailma muuttuu koko ajan parempaan suuntaan
#Logs to Cosnole :business duration,people amount, revenue and office amount 
#Uses xpaths values for business duration,people amount, revenue and office amount

Log Info
    ${business_duration}    GetText         ${business_duration_id} 
    ${people}               GetText         ${people_id}
    ${revenue}              GetText         ${revenue_id}
    ${offices}              GetText         ${offices_id}
    LogToConsole            Liiketoiminnan suuruus: ${revenue}\nLiiketoimipisteiden määrä: ${offices}\nLiiketoiminnan kesto: ${business_duration}\nTyöntekijöiden määrä: ${people}