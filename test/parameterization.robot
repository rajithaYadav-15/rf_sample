*** Settings ***
Documentation   To validate the parameterize
Library         SeleniumLibrary
Resource        resource.robot
Test Teardown   Close Browser session
Test Template   Validate UnSuccesful Login
*** Test Cases ***        username        password
Invalid username          sasdasd         learning
Invalid password          rahulshetty     dsdsda
Special characters        *&^$            !!!!
*** Keywords ***
Validate UnSuccesful Login
    [Arguments]     ${username}     ${password}
    open the browser with the Mortgage payment url
    Fill the login Form    ${username}      ${password}
open the browser with the url
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
    Wait Until Element Is Visible       css:.alert-danger

