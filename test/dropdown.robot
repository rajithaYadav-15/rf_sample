*** Settings ***
Documentation   To validate drop downs
Library    SeleniumLibrary
Library    webManager.py
*** Variables ***
${url}      http://demo.automationtesting.in/Register.html
*** Test Cases ***
open the browser with the Mortgage payment url
    ${driver_path}=    webManager.Get Driver Path With Browser    chrome
    Open Browser          ${url}         chrome       executable_path=${driver_path}
    Maximize Browser Window
    Sleep    2 sec
    Go To   ${url}
test dropdown
    dropdown methods
*** Keywords ***
dropdown methods
    select from list by label    Skills      C
    Sleep    2 sec
    select from list by index    Skills      4
    Sleep    2 sec
    select from list by value    Skills     Installation
    Sleep    2 sec
    close browser