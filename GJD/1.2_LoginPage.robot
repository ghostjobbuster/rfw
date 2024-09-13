*** Settings ***
Documentation     Log into GJD using auth0 username and password
Library           SeleniumLibrary
Resource          resources/ChromeBrowser.robot
Resource          resources/UserInputs.robot
Suite Setup       Open Headless Chrome Browser
Suite Teardown    Close Browser
Force Tags	  1  1.2  login

*** Variables ***
${LOGIN URL}      http://localhost:5173/
${BROWSER}        Chrome

*** Test Cases ***
Valid Login Page
    Open Browser To Home Page
    Login To GJD with username and password
 
*** Keywords ***
Login To GJD with username and password
    Click Link			   id=loginLink
    Title Should Be    Log in | ${APP_NAME}
    Enter username and password
    Valid Home Page User Logged In

Enter username and password
    Input Username  ${USERNAME}
    Submit Credentials
    Title Should Be    Enter your password to log in | ${APP_NAME}
    Input Password  ${PASSWORD}
    Submit Credentials

Valid Home Page User Logged In
    Title Should Be    Ghost Job Buster
    Wait Until Page Contains  Logout
    Page Should Contain Element    id=logoutLink

Input Username
    [Arguments]    ${username}
    Input Text    username    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    password    ${password}

Submit Credentials
    Click Element   //*[contains(text(),'Continue')]
