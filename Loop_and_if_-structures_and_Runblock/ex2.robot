*** Settings ***
Documentation     Test Automation exercises part 3
Library           OperatingSystem
Library           QWeb
Library           DateTime
Library           String
Library           Collections
*** Variables ***
${BROWSER}                       chrome
${url}                           https://www.verkkokauppa.com
${search_results_id}             //*[@id\="main"]/header/div/span/span[1] 
${kaapelit}                      //*[@id\="app"]/div[1]/div/aside/nav/div[1]/div[2]/ul/li[3]/span
${videokaapelit}                 //*[@id\="app"]/div[1]/div/aside/nav/div[2]/div[2]/ul/li[6]/span
${search_results_id}             //*[@id\="main"]/header/div/span/span[1]
${product}                       //*[@id\="main"]/div/div[2]/div/ol/li[1]/article
${product_name_id}               //*[@id\="main"]/section/header/h1 
${product_price_id}              //*[@id\="main"]/section/aside/div[2]/div[1]/div[2]/div[1]/span/data 
${product_supply_id}             //*[@id\="main"]/section/aside/div[2]/div[2]/div[1]/div[1]/span/b
${reviews_id}                    //*[@id\="main"]/section/header/nav/a[1]/span
${add_product_btn}               //*[@id\="main"]/div[2]/section/div[1]/div/article/div/div[2]/div/div/div[2]/div/div/div[3]/button
${remove_product_btn}            //*[@id\="main"]/div[2]/section/div[1]/div/article/div/div[2]/div/div/div[2]/div/div/div[1]/button
${combined_product_price_id}    //*[@id\="main"]/div[2]/section/div[2]/span[2]/data
${combined_product_amount_id}     //*[@id\="main"]/div[2]/section/div[2]/span[1]
*** Test Cases ***
Find the right hdmi cable and add it to shopping cart and log its relevant info
    Open browser to main page
    Find HDMI-cables and log
    Sort from the most expensive to cheapest and log info
    Add to shopping cart and change and log the product amount
*** Keywords ***
#Opens the browser to gofore.com and accepts cookies.
#Variables needed are url address and browser name
Open browser to main page
    OpenBrowser    ${url}    ${BROWSER}
    Sleep          2s
#Finds HMDI cables by the size of 0.1.9 m and log them
#Three variables needed are search results, cables' and videocables' element id 
Find HDMI-cables and log
    ClickText            Tuotealueet
    ClickElement         ${kaapelit}
    ClickElement         ${videokaapelit}
    ClickText            HDMI-kaapelit
    ClickText            Hyväksyn
    ClickText            HDMI 0-1,9 m
    ${search_results}    GetText         ${search_results_id}    
    LogToConsole         Search results: ${search_results}  
#Sorts the cables from the most expensive to cheapest. Chooses one cable from the top. Gets information about the cable and logs it to the console
#Four variables needed are search product name's, product price's, product supply's and reviews' element id 
Sort from the most expensive to cheapest and log info
    DropDown    Osuvimmat     Kalleimmat ensin
    Sleep       2s
    ClickElement    ${product} 
    ${product_name}      GetText          ${product_name_id}
    ${product_price}     GetText          ${product_price_id}          
    ${product_supply}    GetText          ${product_supply_id}
    ${reviews}           GetText          ${reviews_id}
       
    IF    "${reviews}" == "Arvostele tuote"
        ${reviews}           Setvariable    No reviews
    END

    ${match}             FetchFromLeft    ${product_supply}	    .

    IF    "${match}" == "n"
        ${product_supply}    Set variable    Not available
    END

    LogToConsole    Product name: ${product_name}\nProduct price: ${product_price}\nProduct supply: ${product_supply}\nReviews: ${reviews}
#Adds hdmi cable to the shopping cart and increases its amount in the shopping cart and logs information. After logging, the shopping cart is emptied.
#Four variables needed are search remove button's ,add button's id, combined product amount's and combined product_price's element id 
Add to shopping cart and change and log the product amount
    ClickText    Lisää ostoskoriin
    HoverText    Ostoskori    anchor=Suosikit 
    ClickText    Siirry kassalle  

    FOR    ${i}    IN RANGE    3
        ClickElement    ${add_product_btn}
        Sleep    1s
    END

    ${combined_product_amount}      GetText          ${combined_product_amount_id}
    ${combined_product_price}       GetText          ${combined_product_price_id}

    LogToConsole    combined product amount: ${combined_product_amount}[0]\ncombined product price: ${combined_product_price}
    Sleep    2s
    FOR    ${i}    IN RANGE    4
        ClickElement    ${remove_product_btn}
        Sleep    1s
    END

    Sleep    10s
    VerifyText     Ostoskori on tyhjä