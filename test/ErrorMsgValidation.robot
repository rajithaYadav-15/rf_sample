*** Settings ***
Documentation    TO validate error message
Library          SeleniumLibrary
Library          webManager.py
Resource         resource.robot
*** Variables ***
${Error_Message_Login}      css:.alert-danger
#*** Test Cases ***
*** Tasks ***
Validate unSuccessful Login
        [Tags]      SMOKE
        open the browser with the url
	    provide required username and password and login
	    wait for page to load
	    Validate incorrect message
*** Keywords ***
provide required username and password and login
	Input Text    id:username   rahulshettyacademy
	Input Password    id:password   12345
	Click Button    signInBtn
wait for page to load
	Wait Until Element Is Visible       ${Error_Message_Login}
Validate incorrect message
	${result}=        Get Text    ${Error_Message_Login}
	Should Be Equal As Strings    ${result}     Incorrect username/password.

