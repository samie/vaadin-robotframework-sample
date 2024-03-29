*** Settings ***
Documentation               Using Vaadin TestBench Hub with Robot Framework

Library  SeleniumLibrary
Suite Setup  WebDriver Manager Setup   Chrome

# Local browser setup (default)
Test Setup                  Start local browser

# Setup for Vaadin TestBench Grid (uncomment to apply)
# Test Setup                  Start browser in TestBench Hub

Test Teardown               Close All Browsers

*** Variables ***
${BROWSER}                   Chrome
${ALIAS}                     None
${URL}                       https://demo.vaadin.com/dashboard/
${HUB_URL}                   http://localhost:4444/wd/hub

*** Test Cases ***

Simple Test
    [Documentation]               Click the login button and make sure the logged in
    Click Button with Caption     Sign In
    Page should contain           Top 10 Titles by Revenue

*** Keywords ***


Start browser in TestBench Hub
    [Documentation]               Start browser on TestBench Grid
    Open Browser                  ${URL}   ${BROWSER}   None   ${HUB_URL}
    Maximize Browser Window
    Wait for Vaadin

Start local browser
    [Documentation]               Start a local browser
    Open Browser                  ${URL}   ${BROWSER}   None
    Maximize Browser Window
    Wait for Vaadin

Click Button with Caption
    [Arguments]                   ${caption}
    Click Element                 xpath=//span[contains(@class,"v-button-caption") and text()[normalize-space(.)="${caption}"]]/../..
    Wait for Vaadin

Wait for Vaadin
     Wait For Condition           if (window.vaadin == null) {return true;} var clients = window.vaadin.clients; if (clients) { for (var client in clients) { if (clients[client].isActive()) {return false;}} return true; } else { return false; }

