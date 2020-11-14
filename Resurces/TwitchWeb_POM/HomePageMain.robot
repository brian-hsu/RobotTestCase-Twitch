*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${LandingPage_HomeElement} =  css=h1.tw-c-text-base


*** Keywords ***
Loading Page
  [Tags]  Action
  Go To  ${LANDINGPAGE_NAVIGATE_SITE}

Verify Page Loaded
  [Tags]  Verify
  Wait Until Element Is Visible  ${LandingPage_HomeElement}
  Page Should Contain Element  ${LandingPage_HomeElement}