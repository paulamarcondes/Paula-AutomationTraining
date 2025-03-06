*** Settings ***

Library     SeleniumLibrary
Library     String
Library     FakerLibrary

Resource    ../Keywords.robot
Resource    ../Locators.robot
Resource    ../Setup.robot



*** Test Cases ***
04.01 Scenario: Proceed to checkout
    Given The user has products in the cart
    When The user clicks "Checkout"
    Then The checkout page is displayed

04.02 Scenario: Verify registered user checkout functionality
    Given The user has products in the cart
    When The user chooses to checkout as a guest
    Then The user can complete the purchase without creating an account

04.03 Scenario: Verify guest checkout functionality
    Given The user has products in the cart
    When The user chooses to checkout as a guest
    Then The user can complete the purchase without creating an account

04.04 Scenario: Successful payment with valid credit card
    Given The user is on the payment page
    When The user enters valid credit card details
    Then The payment is processed successfully

04.05 Scenario: Receive order confirmation
    Given The payment is successful
    When The order is placed
    Then The user receives an order confirmation email

04.06 Scenario: Apply a valid discount code
    Given The user is on the checkout page
    When The user enters a valid discount code
    Then The discount is applied to the total price

04.07 Scenario: Verify checkout process with saved payment information
    Given The user has saved payment information
    When The user selects the saved payment method during checkout
    Then The payment is processed using the saved information

04.08 Scenario: Verify checkout with invalid payment details
    Given The user has products in the cart
    When The user proceeds to checkout and enters invalid payment details
    Then The payment is declined
    And An error message is displayed