*** Settings ***

Library     SeleniumLibrary
Library     String
Library     FakerLibrary

Resource    ../Keywords.robot
Resource    ../Locators.robot
Resource    ../Setup.robot



*** Test Cases ***
06.01 Scenario: Change site locale
    Given The user is on the homepage
    When The user selects a different locale
    Then The site content is displayed in the selected locale

06.02 Scenario: Change site language
    Given The user is on the homepage
    When The user selects a different language
    Then The site content is displayed in the selected language

06.03 Scenario: Change currency
    Given The user is on the homepage
    When The user selects a different currency
    Then Product prices are displayed in the selected currency

