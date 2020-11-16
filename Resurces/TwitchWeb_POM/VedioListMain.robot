*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${VedioListMain_BackResultLink} =  css=[href*='/search?term']
${VedioListMain_ResultListLink} =  css=.result-list a


*** Keywords ***
Wait Page Contains Elment of Result Views
  [Tags]  Wait
  Wait Until Element Is Visible  ${VedioListMain_BackResultLink}  5s

Assign robot first link Id To Result List Link Element
  [Tags]  Settings
  ${first_ResultListLink_elem} =  Get WebElement  ${VedioListMain_ResultListLink}:first-child
  Assign Id To Element  ${first_ResultListLink_elem}  robot-first_link
  Element Attribute Value Should Be  ${first_ResultListLink_elem}  id  robot-first_link
  Go to Select Movie  robot-first_link

Check First Result List Link By My Target Creator
  [Tags]  Check
  ${first_ResultListLink_elem_p} =  Get WebElement  ${VedioListMain_ResultListLink}:first-child p
  Run Keyword If  '${first_ResultListLink_elem_p.text}' == '${MY_TARGET_NAME}'  Assign robot first link Id To Result List Link Element  ELSE  Scroll up three times list then Assign robot Id To Result List Link Element

Scroll up list function
  sleep  3s
  Wait Until Element Is Enabled  ${VedioListMain_ResultListLink}:last-child  3s
  Scroll Element Into View  ${VedioListMain_ResultListLink}:last-child
  Wait Until Element Is Visible  ${VedioListMain_ResultListLink}:last-child  3s
  Mouse Down  ${VedioListMain_ResultListLink}:last-child
  Mouse Over  ${VedioListMain_ResultListLink}:nth-last-child(7)
  Mouse Out  ${VedioListMain_ResultListLink}:nth-last-child(7)

Scroll up three times list then Assign robot Id To Result List Link Element
  [Tags]  Action
  Scroll up list function
  Scroll up list function
  Scroll up list function
  Scroll Element Into View  ${VedioListMain_ResultListLink}:last-child
  Wait Until Element Is Visible  ${VedioListMain_ResultListLink}:last-child  3s
  ${last_ResultListLink_elem} =  Get WebElement  ${VedioListMain_ResultListLink}:nth-last-child(3)
  Assign Id To Element  ${last_ResultListLink_elem}  robot-last_link
  Element Attribute Value Should Be  ${last_ResultListLink_elem}  id  robot-last_link
  Go to Select Movie  robot-last_link

Go to Select Movie
  [Tags]  Action
  [Arguments]  ${robot_id}
  Click Link  id=${robot_id}
