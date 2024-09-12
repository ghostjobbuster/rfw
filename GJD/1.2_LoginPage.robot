*** Settings ***
Documentation     Home page elements
Library           SeleniumLibrary
Resource          resources/ChromeBrowser.robot
Suite Setup       Open Headless Chrome Browser
Suite Teardown    Close Browser
Force Tags	  1  1.2  login

*** Variables ***
${LOGIN URL}      http://localhost:5173/
${BROWSER}        Chrome

*** Test Cases ***
Valid Login Page
    Open Browser To Login Page
    Login To GJD
 
*** Keywords ***
Open Browser To Login Page
    Go To  ${LOGIN URL}
    Title Should Be    Ghost Job Buster
    Page Should Contain Element    id=header
    Page Should Contain Element    id=loginLink

Login To GJD
    Click Link			   id=loginLink
    Title Should Be    Log in | ${APP_NAME}
    Input Username  ${USERNAME}
    Submit Credentials
    Title Should Be    Enter your password to log in | ${APP_NAME}
    Input Password  ${PASSWORD}
    Submit Credentials
    Title Should Be    Ghost Job Buster

Input Username
    [Arguments]    ${username}
    Input Text    username    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    password    ${password}

Submit Credentials
    Click Element   //*[contains(text(),'Continue')]