*** Settings ***

Library     SeleniumLibrary
Library     String
Library     FakerLibrary

Resource    ../Keywords.robot
Resource    ../Locators.robot
Resource    ../Setup.robot



*** Test Cases ***
05.01 Scenario: Verify header navigation links are functional
    Given The user is on the homepage
    When The user clicks on the "Shop" link in the header
    Then The user is redirected to the shop page
    When The user clicks on the "Contact" link in the header
    Then The user is redirected to the contact page

05.02 Scenario: Verify category selection displays relevant products
    Given The user is on the homepage
    When The user selects the "Electronics" category from the category menu
    Then The page displays products related to "Electronics"
    And The category menu highlights "Electronics" as the selected category

05.03 Scenario: Verify promotional banner is displayed
    Given The user is on the homepage
    When The page is fully loaded
    Then A promotional banner is visible at the top of the page

05.04 Scenario: Verify footer navigation links are functional
    When The user clicks on the "Blog" link in the header
    Then The user is redirected to the blog page
    When The user clicks on the "About" link in the header
    Then The user is redirected to the about page
    When The user clicks on the "Home" link in the header
    Then The user is redirected to the homepage

05.05 Scenario: Verify social media links are present in the footer
    Given The user is on the homepage
    When The page is fully loaded
    Then The footer contains a link to the Facebook page
    And The footer contains a link to the Twitter page
    And The footer contains a link to the Instagram page

