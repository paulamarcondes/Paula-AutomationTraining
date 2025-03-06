*** Settings ***

Library     SeleniumLibrary
Library     String
Library     FakerLibrary

Resource    ../Keywords.robot
Resource    ../Locators.robot
Resource    ../Setup.robot



*** Test Cases ***
02.01 Scenario: Search for a product by name
    Given The user is on the homepage
    When The user searches for "laptop"
    Then The search results display products related to "laptop"

02.02 Scenario: View product details
    Given The user is on the search results page
    When The user clicks on a product
    Then The product details page is displayed

02.03 Scenario: Add a product to the shopping cart
    Given The user is on the product details page
    When The user clicks "Add to Cart"
    Then The product is added to the shopping cart

02.04 Scenario: Add multiple products to the cart
    Given The user is on the product details page
    When The user clicks "Add to Cart" for two different products
    Then Both products are added to the cart
    And The cart icon displays a quantity of 2

02.05 Scenario: Submit a product review
    Given The user has purchased a product
    When The user submits a review
    Then The review is displayed on the product page

02.06 Scenario: Add a product to the wishlist
    Given The user is on the product details page
    When The user clicks "Add to Wishlist"
    Then The product is added to the wishlist

02.07 Scenario: Filter products by category
    Given The user is on the product listing page
    When The user selects a category filter
    Then Only products from that category are displayed

02.08 Scenario: Sort products by price
    Given The user is on the product listing page
    When The user selects "Sort by Price"
    Then Products are sorted by price in ascending order