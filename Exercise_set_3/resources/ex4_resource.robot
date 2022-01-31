*** Settings ***
Documentation     Test Automation exercises part 3
Library           OperatingSystem
Library           QWeb
Library           DateTime
Library           String
Library           Collections



*** Variables ***
${BROWSER}         chrome
${url}             https://www.foodie.fi/
${file_path}       files\\2022.1.25.txt
${product}       //*[@id\="page"]/div/div[2]/div[2]/div/div[3]/ul/li[1]/a/div/img
*** Keywords ***

#Opens the browser to gofore.com and accepts cookies.
#Variables needed are url address and browser name

GetIngNameAndAmount
    [Arguments]  ${input}
    ${file_contents}    Get File          ${input} 
    ${ing_names}        Create List    
    ${ing_amounts}      Create List 
     

    ${line_count}       Get Line Count    ${file_contents}
    FOR    ${i}   IN RANGE     ${line_count}
        ${ing} 	            Get Line	      ${file_contents}	 ${i}
        ${split_ing}        Split String      ${ing}
        ${ing_name}         Set Variable      ${split_ing}[2]
        ${ing_amount}       Set Variable      ${split_ing}[0]${split_ing}[1]
        AppendToList    ${ing_names}       ${ing_name}
        AppendToList    ${ing_amounts}     ${ing_amount}
    END
   [return]    ${ing_names}     ${ing_amounts}
Open browser to main page
    OpenBrowser    ${url}    ${BROWSER}
    Sleep          2s
    ClickText    Hyväksy kaikki evästeet
    Click Element        close       tag=button

Search for item info
    ${names}    ${amounts}     GetIngNameAndAmount     ${file_path}
    ${length}   Get Length    ${names}

    ${dict_list} 	Create List	
    FOR    ${i}    IN RANGE   ${length}
        
        TypeText    Hae tuotteita, kuten maito, leipä, juusto...   ${names}[${i}]
        ClickElement    icon icon-search3     tag=span
        ClickElement    ${product}

        ${info}    GetText     js-details      tag=div
        ${info}    Fetch From Right    ${info}    .
        ${price_num}    GetText    whole-number     tag=span 
        ${price_dec}    GetText    decimal     tag=span
        ${price}        SetVariable    ${price_num}.${price_dec}
        ${weight}    GetText    js-quantity     tag=div
    
        &{dict} =	Create Dictionary	ingredient  ${names}[${i}]    price  ${price}    weight  ${weight}  

        AppendToList   ${dict_list}     ${dict}

    END
    
    Log To Console     ${dict_list}