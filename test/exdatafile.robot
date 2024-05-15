*** Settings ***
Documentation   To validate external data
Resource        resource.robot
Library         SeleniumLibrary
Library         DataDriver      file=data.csv     encoding=utf_8   dialect=unix
Test Teardown   Close Browser
Test Template   Validate UnSuccesful Login
*** Variables ***
${Error_Message_Login}      css:.alert-danger
*** Test Cases ***
Login with user ${username} and password ${password}        xyc     123456
*** Keywords ***
Validate UnSuccesful Login
    [Arguments]     ${username}     ${password}
    open the browser with the Mortgage payment url
    Fill the login Form    ${username}      ${password}
open the browser with the Mortgage payment url
    ${driver_path}=    webManager.Get Driver Path With Browser    chrome
    Open Browser          ${url}         chrome       executable_path=${driver_path}
    Maximize Browser Window
    Sleep    2 sec
    Go To   ${url}
Fill the login Form
    [arguments]     ${username}     ${password}
    Input Text          id:username     ${username}
    Input Password      id:password     ${password}
    Click Button        signInBtn
    Wait Until Element Is Visible       ${Error_Message_Login}
