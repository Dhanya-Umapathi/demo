*** Settings ***
Documentation    Test Register page
Library    SeleniumLibrary
Test Setup    Open the browser with url
Test Teardown    Close Browser Session
Resource    ../Resources/GenericResource.robot    
Resource    ../Resources/SignUpResource.robot
Resource    ../Resources/ContactResource.robot

*** Test Cases ***

validate Successful login using valid credentails
   SignUpResource.Fill the register form    ${valid_fname}    ${valid_lname}    ${valid_username}    ${valid_password}
   ContactResource.verify successful login page

validate unsuccessful login using invalid credentails
    SignUpResource.Fill the register form    ${invalid_fname}    ${invalid lname}    ${invalid_username}    ${invalid_password}
    SignUpResource.verify every field is empty

validate unsuccessful login using invalid email and password
    SignUpResource.Fill the register form    ${valid_fname}    ${valid_lname}    ${invalid_email}    ${invalid_pass}
    SignUpResource.verify password and email is invalid

validate unsuccessful login using invalid password length
    SignUpResource.Fill the register form    ${valid_fname}    ${valid_lname}    ${valid_username}    ${invalid_pass}
    SignUpResource.verify password is in correct length
    
validate that user is already existing
    SignUpResource.Fill the register form    ${valid_fname}    ${valid_lname}    ${valid_username}    ${valid_password}
    SignUpResource.verify exixiting user