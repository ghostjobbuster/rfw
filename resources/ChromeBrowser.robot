*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
@{ELEMENT_IDS}
    ...  app
    ...  header
    ...  hero
    ...  how-it-works
    ...  how-it-works-businesses
    ...  features
    ...  pricing
    ...  footer

*** Keywords ***
Open Headless Chrome Browser
    ${options}=    Evaluate    
    ...  sys.modules['selenium.webdriver'].ChromeOptions()
    ...  sys, selenium.webdriver
    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --disable-gpu
    ${webdriver}=    Create WebDriver    Chrome    options=${options}

Open Browser To Home Page
    Go To  ${LOGIN URL}
    Title Should Be    Ghost Job Buster
    Check Page Elements

Check Page Elements
    FOR    ${id}    IN    @{ELEMENT_IDS}
        Page Should Contain Element    id=${id}
    END

Valid Home Page User Logged In
    [Arguments]  ${app_title}
    Title Should Be    ${app_title}
    Wait Until Page Contains  Logout
    Page Should Contain Element    id=logoutLink

Valid Home Page User Logged Out
    [Arguments]  ${app_title}
    Title Should Be    ${app_title}
    Wait Until Page Contains  Login
    Page Should Contain Element    id=loginLink
