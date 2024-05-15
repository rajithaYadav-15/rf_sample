*** Settings ***
Documentation   To validate multi window
Library         SeleniumLibrary
Library         Collections
Library         String
Test Setup      open the browser with the Mortgage payment url
Test Teardown   Close Browser session
Resource        resource.robot
*** Test Cases ***
test multi window
    multiwindow switch method
*** Keywords ***
multiwindow switch method
    click element       css:.blinkingText
    switch window       NEW
    Sleep    5 sec
    switch window       MAIN
    Sleep    2 sec
