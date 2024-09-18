*** Settings ***
Documentation     Chrome Browser common resources.
Library           Collections
Library           SeleniumLibrary
Library           libs/ParallelLibrary.py    5

*** Variables ***
${PRICING_ENABLED}  False
@{ELEMENT_IDS}
    ...  app
    ...  header
    ...  hero
    ...  how-it-works
    ...  how-it-works-businesses
    ...  features
    ...  footer

*** Keywords ***
Open Headless Chrome Browser
    ${options}=    Evaluate    
    ...  sys.modules['selenium.webdriver'].ChromeOptions()
    ...  sys, selenium.webdriver
    
    ${options_list}=  Create list
    ...  --disable-extensions
    ...  --headless
    ...  --disable-gpu
    ...  --disable-dev-shm-usage
    ...  --no-sandbox
    ...  --disable-crash-reporter
    FOR  ${item}  IN  @{options_list}
      Call Method    ${options}    add_argument  ${item}
    END
    ${webdriver}=    Create WebDriver    Chrome    options=${options}

Open Browser To Home Page
    Go To  ${LOGIN URL}
    Title Should Be    ${APP_TITLE}
    Check Page Elements

Open Browser To Home Page Parallel
    Go To  ${LOGIN URL}
    Title Should Be    ${app_title}
    Check Page Elements In Parallel

Check Page Elements
    FOR    ${id}    IN    @{ELEMENT_IDS}
        Page Should Contain Element    id=${id}
    END
    Run Keyword If  '${PRICING_ENABLED}' != 'False' 
    ...  Page Should Contain Element    id=pricing

Check Page Elements In Parallel
    ${args_list}=    Create List
    FOR    ${id}    IN    @{ELEMENT_IDS}
        ${args}=    Create List    id=${id}
        Append To List    ${args_list}    ${args}
    END
    Execute In Parallel    Page Should Contain Element    @{args_list}

Valid Home Page User Logged In
    [Arguments]  ${app_title}
    Wait Until Page Contains
    ...  ${app_title}
    Title Should Be    ${app_title}
    Wait Until Page Contains  Logout
    Page Should Contain Element    id=logoutLink

Valid Home Page User Logged Out
    [Arguments]  ${app_title}
    Wait Until Page Contains
    ...  ${app_title}
    Title Should Be    ${app_title}
    Wait Until Page Contains  Login
    Page Should Contain Element    id=loginLink
