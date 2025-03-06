*** Settings ***
Documentation    This file contains the CSS or Xpath locators for use in automation tests for practice purposes.

Library     SeleniumLibrary
Library     String
Library     FakerLibrary

Resource    Keywords.robot



*** Variables ***
#Test sites that can be used for testing:
#https://ecommerce-playground.lambdatest.io/
#https://demo.prestashop.com/#/en/front
#https://automationteststore.com/


# Common Setup
${URL}                        https://ecommerce-playground.lambdatest.io/
${BROWSER}                    chrome
# ${TrackingBanner}            css=
# ${TrackingConsent}           css=

# Login
${MyAccountLink}              css=#widget-navbar-217834 > ul > li:nth-child(6) > a > div > span
${LoginPageTitle}             css=#content > div > div:nth-child(2) > div > div > h2
${EmailField}                 css=#input-email
${PasswordField}              css=#input-password
${LoginSubmitButton}          css=input.btn.btn-primary
${AccountPageTitle}           css=#content > div:nth-child(1) > h2
${LoginErrorMessage}          css=div.alert.alert-danger.alert-dismissible

# Registration
${RegisterButton}             css=#content > div > div:nth-child(1) > div > div > a
${FirstNameField}             css=#input-firstname
${LastNameField}              css=#input-lastname
${RegistrationEmail}          css=#input-email
${PhoneNumberField}           css=#input-telephone
${RegistrationPsw}            css=#input-password
${ConfirmPswField}            css=#input-confirm
${PrivacyAgreement}           xpath=/html/body/div[1]/div[5]/div[1]/div/div/form/div/div/div
${RegisterSubmit}             css=#content > form > div > div > input.btn-primary

# Edit Account
${EditAccount}                css=#column-right > div > a:nth-child(2)
${EditAccountSubmit}          css=input.btn-primary

# Reset Password
${ResetPassword}              xpath=//a[text()="Forgotten Password"]
${ResetEmail}                 css=#input-email
${ResetSubmit}                css=button.btn-primary

# Order History
${OrderHistoryLink}           xpath=//a[contains(text(), 'Order History')]
