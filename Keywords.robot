*** Settings ***
Documentation    This file contains the Keywords for use in automation tests for practice purposes.

Library     SeleniumLibrary
Library     String
Library     FakerLibrary

Resource    Locators.robot


*** Variables ***
${ValidEmail}       figay26843@egvoo.com
${ValidPassword}    Pass@123



*** Keywords ***
#Setup to initiate and finalize the tests
Common Setup
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    # Wait Until Element Is Visible    ${TrackingBanner}
    # Click Element    ${TrackingConsent}
    Log    Common setup executed

Common Teardown
    Close Browser
    Log    Common teardown executed


#Login keywords
The user is on the login page
    Click Element    ${MyAccountLink}
    Wait Until Page Contains Element    ${LoginPageTitle}    timeout=30s    error=User can't access to login page

The user enters valid login credentials
    [Arguments]    ${Email}    ${Password}
    Input Text    ${EmailField}    ${Email}
    Input Password    ${PasswordField}    ${Password}
    Log    Entering credentials for email: ${Email}
    Click Element    ${LoginSubmitButton}
    
The user is logged in
    Wait Until Element Is Visible    ${AccountPageTitle}
    Log    User is logged in successfully

The user enters invalid credentials
    ${fake_email} =    FakerLibrary.Email
    ${fake_password} =    FakerLibrary.Password    length=8    special_chars=True    digits=True    upper_case=True    lower_case=True
    Log    Fake Email: ${fake_email}
    Log    Fake Password: ${fake_password}
    Input Text    ${EmailField}    ${fake_email}
    Input Password    ${PasswordField}    ${fake_password}
    Log    Attempting to log in with invalid credentials
    Click Element    ${LoginSubmitButton}

The user receives error message
    ${status} =    Run Keyword And Return Status    Wait Until Page Contains Element    ${LoginErrorMessage}
    Log    ${status}

The user is on the registration page
    Click Element    ${MyAccountLink}
    Click Element    ${RegisterButton}
    Wait Until Page Contains    text=Register Account

The user enters valid details
    ${first_name}=    FakerLibrary.First Name
    ${last_name}=     FakerLibrary.Last Name

    ${email}=         FakerLibrary.Email
    ${password}=      FakerLibrary.Password    length=12    special_chars=True    digits=True    upper_case=True    lower_case=True

    ${phone_number}=    FakerLibrary.RandomNumber    digits=9
    ${formatted_phone_number}=    Set Variable    2${phone_number}

    Log    First Name: ${first_name}
    Log    Last Name: ${last_name}
    Log    Email: ${email}
    Log    Phone Number: ${formatted_phone_number}
    Log    Password: ${password}

    Input Text    ${FirstNameField}    ${first_name}
    Input Text    ${LastNameField}     ${last_name}
    Input Text    ${RegistrationEmail}        ${email}
    Input Text    ${PhoneNumberField}  ${formatted_phone_number}
    Input Password    ${RegistrationPsw}    ${password}
    Input Password    ${ConfirmPswField}    ${password}
    Click Element    ${PrivacyAgreement}
    Click Button    ${RegisterSubmit}

The user is registered
    Wait Until Page Contains    text=Congratulations!

The user is already logged in
    The user is on the login page
    The user enters valid login credentials    ${ValidEmail}    ${ValidPassword}
    The user is logged in

The user updates their telephone number
    Click Element    ${EditAccount}

    ${phone_number}=    FakerLibrary.RandomNumber    digits=9
    ${formatted_phone_number}=    Set Variable    2${phone_number}
    Input Text    ${PhoneNumberField}    ${formatted_phone_number}
    Log    Updating telephone number to: ${formatted_phone_number}
    
    Click Element    ${EditAccountSubmit}
    
The changes are saved successfully
    Wait Until Page Contains    text=Success

The user wants to reset their password
    Click Element    ${ResetPassword}
    Wait Until Page Contains    text=Forgot Your Password?

The user enters a valid email address
    [Arguments]    ${ValidEmail}
    Input Text    ${ResetEmail}    ${ValidEmail}
    Log    Entering email for password reset: ${ValidEmail}
    Click Element    ${ResetSubmit}

A password reset link is sent to the email
    Wait Until Page Contains    text=An email with a confirmation link has been sent

The user navigates to the order history page
    Click Element    ${OrderHistoryLink}

All past orders are displayed
    Wait Until Page Contains    text=Order History
