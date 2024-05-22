*** Settings ***
Documentation    A resource with resuable keywords and variables'.
Library    SeleniumLibrary

*** Variables ***
${valid_username}    aa.83@gmail.com
${valid_password}    Test143$
${invalid_username}    dhan
${invalid_password}     135
${blank_username} 
${blank_password} 
${valid_fname}    Dhanya
${invalid_fname}
${blank_fname}
${invalid lname}
${valid_lname}    Umapathi
${blank_lname}
${invalid_email}    abc
${invalid_pass}    efg
${url}      https://thinking-tester-contact-list.herokuapp.com/
${browser_name}    Chrome

*** Keywords ***

Open the browser with url
     Create Webdriver   ${browser_name}
     Go to       ${url}
     Maximize Browser Window
     Set Selenium Implicit Wait     5


Close Browser Session
      Close Browser