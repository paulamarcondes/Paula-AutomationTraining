*** Settings ***

Library     SeleniumLibrary
Library     String
Library     FakerLibrary

Resource    ../Keywords.robot
Resource    ../Locators.robot
Resource    ../Setup.robot



*** Test Cases ***
03.01 Scenario: View items in the shopping cart
    Given The user has added products to the cart
    When The user navigates to the cart page
    Then The cart displays all added products

03.02 Scenario: Remove a product from the shopping cart
    Given The user has products in the cart
    When The user removes a product
    Then The product is no longer in the cart
    And The cart icon displays the updated quantity

03.03 Scenario: Verify updating product quantity in the cart
    Given The user has a product in the cart
    When The user updates the product quantity to 3
    Then The cart reflects the updated quantity
    And The total price is updated accordingly

03.04 Scenario: Verify cart is empty after removing all products
    Given The user has products in the cart
    When The user removes all products
    Then The cart is empty
    And The cart icon displays a quantity of 0

03.05 Scenario: Verify cart retains products after logout and login
    Given The user has products in the cart
    When The user logs out and logs back in
    Then The cart still contains the previously added products