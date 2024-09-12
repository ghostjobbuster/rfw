*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary

*** Keywords ***
Open Headless Chrome Browser
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --disable-gpu
    ${webdriver}=    Create WebDriver    Chrome    options=${options}

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
