*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${SearchResultMain_RegionAboutVedio} =  css=.tw-pd-t-1:nth-child(3)
${SearchResultMain_VedioDetailsLink} =  css=.tw-pd-t-1:nth-child(3) [href*=category\\=vods]


*** Keywords ***
Wait Page Contains Elment of Region About Vedio
  [Tags]  Wait
  Wait Until Page Contains Element  ${SearchResultMain_RegionAboutVedio}  5s

Click Vedio Details Link
  [Tags]  Action
  Click Link  ${SearchResultMain_VedioDetailsLink}

