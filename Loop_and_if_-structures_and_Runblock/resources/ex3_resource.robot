*** Settings ***
Documentation     Test Automation exercises part 3
Library           OperatingSystem
Library           QWeb
Library           DateTime
Library           String
Library           Collections



*** Variables ***
${BROWSER}         chrome
${url}             https://www.kotikokki.net
${resepti_url}     https://www.kotikokki.net/reseptit/?freeText=mustikkapiirakka

*** Keywords ***

#Opens the browser to gofore.com and accepts cookies.
#Variables needed are url address and browser name
Open browser to main page
    OpenBrowser    ${url}    ${BROWSER}
    Sleep          2s
    ClickText    Hyväksy
#Creates a text file from current date. Format: year.month.day
Create a file from date
    ${date} 	Get Current Date     result_format=datetime	
    ${date} 	Evaluate     '${date.year}'+'.'+'${date.month}'+'.'+'${date.day}'
    Create File       files/${date}.txt
    Set Global Variable	  ${global_date_file}	  files/${date}.txt	
#Goes to mustikkapiirakka section and verifies that search results are more than 0. Checks if the url is correct.
Navigate to Kotikokki mustikkapiirakka
    TypeText              Resepti tai raaka-aineen nimi...    mustikkapiirakka     anchor=Alkupalat
    ClickText             Hae                                 anchor=Alkupalat
    ${text}               GetText                             Hakuehdoillasi       between=löytyi???reseptiä
    ShouldBeTrue          ${text} > 0
    VerifyUrl             ${resepti_url}
#Gets all ingredients from shopping list and adds each to a seperate line in a file.
Get recipe ingerdients and append them to a file
    ClickText             Mustikkapiirakka                    anchor=1
    ClickText             Ostoslistalle
    ClickItem             shoppinglist-toggle
    UseList               pohja:
    ${LIST}               GetList 
    ${length}          	  GetLength	    ${LIST}

    FOR    ${i}  IN RANGE    ${length}
        ${remainder}    Evaluate    ${i}%2
        IF    ${remainder} == 0
        Append To File    ${global_date_file}    ${LIST}[${i}]\n
        END
    END
#Checks if the file contains any lines.
Check that file countains lines
    ${contents}       Get File            ${global_date_file}
    ${line_count}     Get Line Count      ${contents}

    Should Be True    ${line_count} > 0
    #Remove File       ${global_date_file}${global_date_file}