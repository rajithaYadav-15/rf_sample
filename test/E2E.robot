*** Settings ***
Documentation   To validate E2E
Library         SeleniumLibrary
Library         Collections
Library         Shop.py
Test Setup      open the browser with the url
Test Teardown   Close Browser session
Resource        resource.robot
Resource        ../PO/LandingPage.robot
Resource        ../PO/ShopPage.robot
Resource        ../PO/CheckoutPage.robot
Resource        ../PO/ConfirmationPage.robot
*** Variables ***
@{listofProducts}           Blackberry      Nokia Edge
${country_name}             India
*** Test Cases ***
End to end ecommerce Product validation
    [Tags]      SMOKE       REGRESSION
    LandingPage.Fill the login Form     ${user_name}    ${valid_password}
    ShopPage.wait until Element is located in the page
    ShopPage.Verify Card titles in the Shop page
    add items to cart and checkout      ${listofProducts}
    CheckoutPage.Verify items in the Checkout Page and proceed
    ConfirmationPage.Enter the Country and select the terms      ${country_name}
    ConfirmationPage.Purchase the Product and Confirm the Purchase
    Sleep    2 sec