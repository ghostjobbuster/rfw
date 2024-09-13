*** Settings ***
Documentation     Log into GJD using auth0 username and password
Library           SeleniumLibrary
Resource          resources/ChromeBrowser.robot
Resource          resources/UserInputs.robot
Resource          resources/AppVariables.robot
Suite Setup       Open Headless Chrome Browser
Suite Teardown    Close Browser
Force Tags	  1  1.2  login

*** Variables ***

*** Test Cases ***
Valid Login Page
    Open Browser To Home Page
    Login To GJD with username and password

Valid Logout
    User Logout
    Valid Home Page User Logged Out  ${APP_TITLE}
 
*** Keywords ***
Login To GJD with username and password
    Click Link			   id=loginLink
    Title Should Be    Log in | ${APP_NAME}
    Enter username and password
    Valid Home Page User Logged In  ${APP_TITLE}
