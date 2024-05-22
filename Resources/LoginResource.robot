*** Settings ***
Documentation    The login page objects and keywords of login page
Library    SeleniumLibrary

*** Variables ***
${error_message}    xpath://div[@class="main-content"]/span
${login_page}    xpath://h1[text()='Contact List App']

*** Keywords ***
Fill the login form
    [Arguments]    ${email}    ${password}
    Input Text    id:email    ${email}
    Input Password    id:password    ${password}
    Click Button    css:button[id=submit]

Verify unsuccessful login page
    Wait Until Element Is Visible    ${error_message}
    Element Text Should Be    ${error_message}    Incorrect username or password


Go to sign up page
    Click Button    xpath://button[@id='signup']

verify login page is back
    Element Text Should Be    ${login_page}    Contact List App