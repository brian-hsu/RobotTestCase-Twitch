*** Settings ***
Library  SeleniumLibrary
Resource  ./TwitchWeb_POM/HomePageMain.robot
Resource  ./TwitchWeb_POM/HomePageNav.robot
Resource  ./TwitchWeb_POM/SearchResultMain.robot
Resource  ./TwitchWeb_POM/VedioListMain.robot

*** Variables ***
${DEVICE_NAME} =  Pixel 2 XL  # arg: [mobile device name] like: Pixel 2 XL, iPhone 6/7/8
${LANDINGPAGE_NAVIGATE_SITE} =  https://www.twitch.tv/

*** Keywords ***
the user use phone to open the browser
  [Documentation]  Use selenium webdriver mobile Emulation
  ${DICT_MobileEmulation} =  Create Dictionary  deviceName=${DEVICE_NAME}
  ${EVALUATE_ChromeOptions} =  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
  Call Method  ${EVALUATE_ChromeOptions}  add_experimental_option  mobileEmulation  ${DICT_MobileEmulation}
  Create Webdriver  Chrome  chrome_options=${EVALUATE_ChromeOptions}

the user go to twitch home page
  HomePageMain.Loading Page
  HomePageMain.Verify Page Loaded

the user type "Monster Hunter World" from the search bar
  HomePageNav.Verify Search Button
  HomePageNav.Click Search Button Show SearchBar
  HomePageNav.Verify Search Bar
  HomePageNav.Type Text To SearchBar

press the search button
  HomePageNav.Click Search Button Show SearchResult

find the first film from the resulting film by "CervelloneRe"
  SearchResultMain.Wait Page Contains Elment of Region About Vedio
  SearchResultMain.Click Vedio Details Link
    
  VedioListMain.Wait Page Contains Elment of Region About Vedio
  VedioListMain.Scroll Element Into View test


End Test
  Close Browser