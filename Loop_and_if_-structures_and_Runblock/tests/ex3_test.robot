*** Settings ***
Resource          ../resources/ex3_resource.robot
*** Test Cases ***
Go to iltasanomat and get the mSost recent time
    Create a file from date
    Open browser to main page
    Navigate to Kotikokki mustikkapiirakka
    Get recipe ingerdients and append them to a file
    Check that file countains lines
