*** Settings ***
Documentation    The contact page object and keywords of contact page
Library    SeleniumLibrary

*** Variables ***
${Dashboard_Page}    xpath://h1[text()='Contact List']

*** Keywords ***
verify successful login page
    Element Text Should Be    ${Dashboard_Page}    Contact List

Fill the form
    [Arguments]    ${fname}    ${lname}   ${dob}     ${email}    ${phone}    ${street1}    ${street2}    ${city}    ${state}    ${postalcode}    ${country}
    Input Text    xpath://input[@placeholder="First Name"]    ${fname}
    Input Text    xpath://input[@placeholder="Last Name"]    ${lname}
    Input Text    xpath://input[@placeholder="yyyy-MM-dd"]    ${dob}
    Input Text    xpath://input[@placeholder="example@email.com"]    ${email}
    Input Text    xpath://input[@id="phone"]    ${phone}
    Input Text    xpath://input[@id="street1"]    ${street1}
    Input Text    xpath://input[@id="street2"]    ${street2}
    Input Text    xpath://input[@id="city"]    ${city}
    Input Text    xpath://input[@id="stateProvince"]    ${state}
    Input Text    xpath://input[@id="postalCode"]    ${postalcode}
    Input Text    xpath://input[@id="country"]    ${country}

validation for submit button
    Click Button    xpath://button[@id="submit"] 

validation for cancel button
    Click Button    xpath://button[@id="cancel"]
