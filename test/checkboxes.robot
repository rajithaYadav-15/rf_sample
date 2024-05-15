*** Settings ***
Documentation   To validate checkboxes
Library    SeleniumLibrary
Library    webManager.py

*** Variables ***
${url}      http://demo.automationtesting.in/Register.html
${browser}  chrome
*** Test Cases ***
open the browser with the Mortgage payment url
    ${driver_path}=    webManager.Get Driver Path With Browser    ${browser}
    Open Browser          ${url}         chrome       executable_path=${driver_path}
    Maximize Browser Window
    Sleep    2 sec
    Go To   ${url}
test checkboxes
    Validate checkbox methods
*** Keywords ***
Validate checkbox methods
    page should contain checkbox    checkbox1
    Sleep    2 sec
    page should not contain checkbox    id:checkboxes1
    Sleep    2 sec
    select checkbox    checkbox2
    Sleep    2 sec
    checkbox should be selected     checkbox2
    Sleep    2 sec
    select checkbox    checkbox1
    Sleep    2 sec
    select checkbox    checkbox3
    Sleep    2 sec
    unselect checkbox    checkbox1
    Sleep    2 sec
    checkbox should not be selected     checkbox1
    Sleep    2 sec
    close browser