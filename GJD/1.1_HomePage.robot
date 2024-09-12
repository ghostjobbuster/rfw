*** Settings ***
Documentation     Home page elements
Library           SeleniumLibrary
Resource          resources/ChromeBrowser.robot
Suite Setup       Open Headless Chrome Browser
Suite Teardown    Close Browser
Force Tags        1  1.1  home

*** Variables ***
${LOGIN URL}      http://localhost:5173/
${BROWSER}        Chrome

*** Test Cases ***
Valid Home Page
    Open Browser To Home Page

*** Keywords ***
Open Browser To Home Page
    Go To  ${LOGIN URL}
    Title Should Be    Ghost Job Buster
    Page Should Contain Element    id=app
    Page Should Contain Element    id=header
    Page Should Contain Element    id=hero
    Page Should Contain Element    id=how-it-works
    Page Should Contain Element    id=how-it-works-businesses
    Page Should Contain Element    id=features
    Page Should Contain Element    id=pricing
    Page Should Contain Element    id=footer
