*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary
Resource          resources/ChromeBrowser.robot

*** Variables ***
${LOGIN URL}      http://localhost:5173/
${BROWSER}        Chrome

*** Test Cases ***
Valid Home Page
    Open Browser To Login Page
    [Teardown]    Close Browser

*** Keywords ***
Open Browser To Login Page
    Open Headless Chrome Browser  ${LOGIN URL}
    Title Should Be    Ghost Job Buster
    Page Should Contain Element    id=app
    Page Should Contain Element    id=header
    Page Should Contain Element    id=hero
    Page Should Contain Element    id=how-it-works
    Page Should Contain Element    id=how-it-works-businesses
    Page Should Contain Element    id=features
    Page Should Contain Element    id=footer

Input Username
    [Arguments]    ${username}
    Input Text    username_field    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    password_field    ${password}

Submit Credentials
    Click Button    login_button

Welcome Page Should Be Open
    Title Should Be    Welcome Page
