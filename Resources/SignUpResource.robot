*** Settings ***
Documentation    The register page objects and keywords of login page
Library    SeleniumLibrary

*** Variables ***
${fname_error}    xpath://span[@id='error']
${lname_error}    xpath://span[@id='error']
${email_error}    xpath://span[@id='error']
${password_error}    xpath://span[@id='error']
${blank_field_error}    xpath://span[@id='error']
${email_pass_error}    xpath://span[@id='error']
${exisiting_user_error}    xpath://span[@id='error']

*** Keywords ***
Fill the register form
    [Arguments]    ${fname}    ${lname}    ${email}    ${password}
    Click Button    xpath://button[@id='signup']
    Input Text    xpath://input[@placeholder="First Name"]    ${fname}
    Input Text    xpath://input[@placeholder="Last Name"]    ${lname}
    Input Text    xpath://input[@placeholder="Email"]    ${email}
    Input Password    xpath://input[@placeholder="Password"]    ${password}
    Click Button    id:submit

verify firstname is empty field
    Wait Until Element Is Visible    ${fname_error}
    Element Text Should Be    ${fname_error}    User validation failed: firstName: Path `firstName` is required.

verify lastname is empty field
    Wait Until Element Is Visible    ${lname_error}
    Element Text Should Be    ${lname_error}    User validation failed: lastName: Path `lastName` is required.

verify email is empty field
    Wait Until Element Is Visible    ${email_error}
    Element Text Should Be    ${email_error}    User validation failed: email: Email is invalid

verify password is empty field
    Wait Until Element Is Visible    ${password_error}
    Element Text Should Be    ${password_error}    User validation failed: password: Path `password` is required.

verify password is in correct length
    Wait Until Element Is Visible    ${password_error}
    Element Text Should Be    ${password_error}    User validation failed: password: Path `password` (`rrte`) is shorter than the minimum allowed length (7).

verify every field is empty
    Wait Until Element Is Visible    ${blank_field_error}
    Element Text Should Be    ${blank_field_error}    User validation failed: firstName: Path `firstName` is required., lastName: Path `lastName` is required., email: Email is invalid, password: Path `password` is required.

verify password and email is invalid
    Wait Until Element Is Visible    ${email_pass_error}
    Element Text Should Be    ${email_pass_error}    User validation failed: email: Email is invalid, password: Path `password` (`saf`) is shorter than the minimum allowed length (7)

verify exixiting user
    Wait Until Element Is Visible    ${exisiting_user_error}
    Element Text Should Be    ${exisiting_user_error}    Email address is already in use

Go to login page
    Click Button    id:cancel

Submit the page
    Click Button    id:submit