*** Settings ***
Documentation  This is some basic info about the whole suite
Resource  ../Resurces/TwitchPhoneWeb.robot
# Test Teardown  End Test


*** Variables ***
${HOMEPAGENAV_SEARCHTEXT} =  Monster Hunter World
${MY_TARGET_NAME} =  CervelloneRe
${OUTPUTDIR} =  ../../Results


*** Test Cases ***
# with Gherkin
Verify that the Twitch platform can play the author's video
  [Tags]  Major
  [Documentation]  As a mobile phone user. Users preview Twitch with a browser. Users can enter text from the search box, and then look for the author's video from the resulting past video.
  Given the user use phone to open the browser
  Given the user go to twitch home page
  When the user type "Monster Hunter World" from the search bar
  And press the search button
  And check My Target Creator or scroll three list And go to movie
  Then go to select movie and play
