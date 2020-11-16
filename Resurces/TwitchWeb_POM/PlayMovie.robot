*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${PlayMovie_PrimaryButton} =  css=button.tw-core-button--primary
${PlayMovie_Watching} =  css=p.tw-c-text-overlay


*** Keywords ***
Check movie is absolute or not
  Wait Until Element Is Enabled  ${PlayMovie_Watching}
  ${overlay} =  Get Text  ${PlayMovie_Watching}
  Run Keyword If  '${overlay}' == '實況主表示該影片僅適合成人觀看。'  Play primary movie

Play primary movie
  Click Button  ${PlayMovie_PrimaryButton}

Check the video
  ${video} =  Get WebElement  css=.tw-border-t .tw-stat__value
    # no solution yet

After play 5s Capture
  Sleep  5s
  Capture Page Screenshot  ${OUTPUTDIR}/AfterPlay5sCapture.png