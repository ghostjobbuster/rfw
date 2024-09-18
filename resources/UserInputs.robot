*** Settings ***
Documentation     User Input keywords
Library           SeleniumLibrary

*** Variables ***

*** Keywords ***
Enter username and password
    Input Username  ${USERNAME}
    Submit Credentials
    Wait Until Page Contains
    ...  Enter your password to log in | ${APP_NAME}
    Title Should Be    Enter your password to log in | ${APP_NAME}
    Input Password  ${PASSWORD}
    Submit Credentials

Input Username
    [Arguments]    ${username}
    Input Text    username    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    password    ${password}

Submit Credentials
    Click Element   //*[contains(text(),'Continue')]

User Logout
    Click Element  id=logoutLink 
