*** Settings ***
Library  SeleniumLibrary
Resource  ./TwitchWeb_POM/HomePageMain.robot
Resource  ./TwitchWeb_POM/HomePageNav.robot
Resource  ./TwitchWeb_POM/SearchResultMain.robot
Resource  ./TwitchWeb_POM/VedioListMain.robot
Resource  ./TwitchWeb_POM/PlayMovie.robot


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

check My Target Creator or scroll three list And go to movie
  SearchResultMain.Wait Page Contains Elment of Region About Vedio
  SearchResultMain.Click Vedio Details Link
  VedioListMain.Wait Page Contains Elment of Result Views
  VedioListMain.Check First Result List Link By My Target Creator

go to select movie and play
  PlayMovie.Check movie is absolute or not
  PlayMovie.Check The Video is Ready
  PlayMovie.After play 5s check Video currentTime is 5s and Capture

End Test
  Close Browser