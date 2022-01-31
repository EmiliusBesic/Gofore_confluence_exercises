*** Settings ***
Documentation     Test Automation exercises part 1
Library           OperatingSystem
Library           QWeb

*** Variables ***
${BROWSER}                  chrome
${url}                      https://www.almamedia.fi/
${BASE_IMAGE_PATH}          ${CURDIR}${/}images
*** Test Cases ***
Get macaroni ingredients and log them to console
    Open browser to main page
    Navigate to Kotikokki
    Find Makaronilaatikko ingredients
    Check recipe amount and add to grocery list
    Log ingredients from grocery list
*** Keywords ***
Open browser to main page
    OpenBrowser    ${url}    ${BROWSER}
    Sleep          2s
    Click Text     Hyväksy
Navigate to Kotikokki
    Click Text    Palvelut
    Click Text    Tuotteet ja Palvelut
    #ClickIcon    kotikokki_logo    template_res_w=1080
    Click Item    Kotikokki_logo
    Close Window
Find Makaronilaatikko ingredients
    Type Text        Resepti tai raaka-aineen nimi...    makaronilaatikko    anchor=Alkupalat
    Click Text       Hae                                 anchor=Alkupalat
    ClickCheckbox    Makkara ja jauheliha                on
    Click Text       Pasta                  
Check recipe amount and add to grocery list
    ${text}    Get Text    Hakuehdoillasi       between=löytyi???reseptiä
    Should Be True         ${text} > 0
    Click Text             Makaronilaatikko     anchor=1
    Click Text             Ostoslistalle
Log ingredients from grocery list
    Click Item            shoppinglist-toggle
    Use List              400 g
    ${row1}    GetList    1 
    ${row2}    GetList    3 
    ${row3}    GetList    5
    ${row4}    GetList    7 
    ${row5}    GetList    9
    ${row6}    GetList    11
    ${row7}    GetList    13 
    ${row8}    GetList    15
    ${row9}    GetList    17
    ${row10}   GetList    19 
    ${row11}   GetList    21
    ${row12}   GetList    23
    Log to Console        ${row1}
    Log to Console        ${row2}
    Log to Console        ${row3}
    Log to Console        ${row4}
    Log to Console        ${row5}
    Log to Console        ${row6}
    Log to Console        ${row7}
    Log to Console        ${row8}
    Log to Console        ${row9}
    Log to Console        ${row10}
    Log to Console        ${row11}
    Log to Console        ${row12}
    
