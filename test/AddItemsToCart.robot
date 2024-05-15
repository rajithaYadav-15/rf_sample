*** Settings ***
Documentation   To validate adding item to cart
Library         SeleniumLibrary
Library         Collections
Test Setup      open the browser with the Mortgage payment url
Test Teardown   Close Browser session
Resource        resource.robot
*** Variables ***
${Error_Message_Login}      css:.alert-danger
${Shop_page_load}           css:.nav-link
*** Test Cases ***
Validate Cards display in the Shopping Page
    Fill the login Form     ${user_name}    ${valid_password}
    wait until Element is located in the page     ${Shop_page_load}
    Verify Card titles in the Shop page
    Select the Card     Nokia Edge
*** Keywords ***
Fill the login Form
    [arguments]     ${username}     ${password}
    Input Text          id:username     ${username}
    Input Password      id:password     ${password}
    Click Button        signInBtn
wait until Element is located in the page
    [arguments]     ${element}
    Wait Until Element Is Visible       ${element}
Verify Card titles in the Shop page
   @{expectedList} =    Create List     iphone X    Samsung Note 8      Nokia Edge       Blackberry
   ${elements} =  Get WebElements     css:.card-title
   @{actualList} =   Create List
   FOR  ${element}  IN      @{elements}
      Log   ${element.text}
      Append To List    ${actualList}     ${element.text}
   END
   Sleep    5 seconds
   Lists Should Be Equal   ${expectedList}    ${actualList}
Select the Card
    [arguments]     ${cardName}
    ${elements} =  Get WebElements     css:.card-title
    ${index}=   Set Variable    1
     FOR  ${element}  IN      @{elements}
         Exit For Loop If      '${cardName}' == '${element.text}'
         ${index}=  Evaluate   ${index} + 1
     END
    Click Button    xpath:(//*[@class='card-footer'])[${index}]/button
    Sleep    5 seconds