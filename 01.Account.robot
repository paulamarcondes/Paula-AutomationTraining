*** Settings ***
Documentation    This file contains the Test Cases and Scenarios related to User Accounts, for practice purposes.

Test Setup       Common Setup
Test Teardown    Common Teardown
Library          SeleniumLibrary
Library          String
Library          FakerLibrary

Resource         Keywords.robot
Resource         Locators.robot


*** Test Cases ***
01.01 Scenario: Successful login with valid credentials
    Given The user is on the login page
    When The user enters valid login credentials    ${ValidEmail}    ${ValidPassword}
    Then The user is logged in

01.02 Scenario: Unsuccessful login with invalid credentials
    Given The user is on the login page
    When The user enters invalid credentials
    Then The user receives error message

01.03 Scenario: Successful registration with valid details
    Given The user is on the registration page
    When The user enters valid details
    Then The user is registered

01.04 Scenario: Update user profile information
    Given The user is already logged in
    When The user updates their telephone number
    Then The changes are saved successfully

01.05 Scenario: Reset password with valid email
    Given The user is on the login page
    And The user wants to reset their password
    When The user enters a valid email address    ${ValidEmail}
    Then A password reset link is sent to the email

01.06 Scenario: View order history
    Given The user is already logged in
    When The user navigates to the order history page
    Then All past orders are displayed