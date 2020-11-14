*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${HomePageNav_SearchButton_ExpandBar} =  css=.tw-pd-l-0 button
${HomePageNav_SearchBar} =  css=input.tw-input
${HomePageNav_SearchButton_Next} =  css=.tw-pd-l-1 button


*** Keywords ***
Verify Search Button
  [Tags]  Verify
  Page Should Contain Button  ${HomePageNav_SearchButton_ExpandBar}

Click Search Button Show SearchBar
  [Tags]  Active
  Click Button  ${HomePageNav_SearchButton_ExpandBar}

Verify Search Bar
  [Tags]  Verify
  Page Should Contain Textfield  ${HomePageNav_SearchBar} 

Type Text To SearchBar
  [Tags]  Active
  Input Text  ${HomePageNav_SearchBar}  ${HOMEPAGENAV_SEARCHTEXT}

Click Search Button Show SearchResult
  [Tags]  Active
  Click Button  ${HomePageNav_SearchButton_Next}

