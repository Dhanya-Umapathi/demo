*** Settings ***
Documentation    Test Login page
Library    SeleniumLibrary
Test Setup    Open the browser with url
Test Teardown    Close Browser Session
Resource    ../Resources/GenericResource.robot    
Resource    ../Resources/LoginResource.robot
Resource    ../Resources/ContactResource.robot

*** Test Cases ***
validate Successful login using valid credentails
    LoginResource.Fill the login form    ${valid_username}    ${valid_password}
    ContactResource.verify successful login page

validate Unsuccessful login using invalid credentails
    LoginResource.Fill the login form    ${invalid_username}    ${valid_password}
    LoginResource.Verify unsuccessful login page

validate Unsuccessful login using blank credentails
    LoginResource.Fill the login form    ${blank_username}    ${blank_password}
    LoginResource.Verify unsuccessful login page

validate Unsuccessful login using invalid password
    LoginResource.Fill the login form    ${valid_username}    ${invalid_password}
    LoginResource.Verify unsuccessful login page