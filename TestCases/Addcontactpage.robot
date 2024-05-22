*** Settings ***
Documentation    Test addtocartpage page
Library    SeleniumLibrary
Test Setup    Open the browser with url
Test Teardown    Close Browser Session
Library    DataDriver    file=../TestData/Addtocontact.xlsx    sheet_name=contact
Resource    ../Resources/ContactResource.robot
Resource    ../Resources/GenericResource.robot    
Resource    ../Resources/LoginResource.robot
Test Template    Add to contact



*** Test Cases ***
Add to contact using    ${fname}    ${lname}   ${dob}     ${email}    ${phone}    ${street1}    ${street2}    ${city}    ${state}    ${postalcode}    ${country}


*** Keywords ***
 Add to contact
    [Arguments]    ${fname}    ${lname}   ${dob}     ${email}    ${phone}    ${street1}    ${street2}    ${city}    ${state}    ${postalcode}    ${country}
    LoginResource.Fill the login form    ${valid_username}    ${valid_password}
    ContactResource.verify successful login page
    Click Button    xpath://button[@id="add-contact"]
    #${date}    Get Date   ${dob}    result_format=%Y-%m-%d
    ContactResource.Fill the form    ${fname}    ${lname}   ${dob}     ${email}    ${phone}    ${street1}    ${street2}    ${city}    ${state}    ${postalcode}    ${country}
    Log To Console    ${dob}
    ContactResource.validation for submit button
    ContactResource.verify successful login page
    sleep 3s





