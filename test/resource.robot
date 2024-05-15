*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary
Library           webManager.py

*** Variables ***
${user_name}             rahulshettyacademy
${invalid_password}      123445
${valid_password}        learning
${url}                   https://rahulshettyacademy.com/loginpagePractise/
${browser_name}          Chrome



*** Keywords ***
open the browser with the Mortgage payment url
    ${driver_path}=    webManager.Get Driver Path With Browser    chrome
    Open Browser          ${url}         chrome       executable_path=${driver_path}
    Maximize Browser Window
    Sleep    2 sec
    Go To   ${url}

open the browser with the url
    ${driver_path}=    webManager.Get Driver Path With Browser    chrome
    Open Browser          ${url}         chrome       executable_path=${driver_path}
    Maximize Browser Window
    Sleep    2 sec
    Go To   ${url}

Close Browser session
    Close Browser

Wait Until element passed is located on Page
    [arguments]         ${page_locator}
    Wait Until Element Is Visible        ${page_locator}        timeout=10




