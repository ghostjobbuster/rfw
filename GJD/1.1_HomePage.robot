*** Settings ***
Documentation     Home page elements
Library           SeleniumLibrary
Resource          resources/ChromeBrowser.robot
Resource          resources/AppVariables.robot
Suite Setup       Open Headless Chrome Browser
Suite Teardown    Close Browser
Force Tags        1  1.1  home

*** Variables ***

*** Test Cases ***
Valid Home Page
    Open Browser To Home Page

*** Keywords ***
