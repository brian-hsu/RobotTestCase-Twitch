*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${PlayMovie_PrimaryButton} =  css=button.tw-core-button--primary
${PlayMovie_Watching} =  css=p.tw-c-text-overlay
${VideoTagElem} =  document.getElementsByTagName("video")[0]
${return_currentTime} =  return ${VideoTagElem}.currentTime;
${return_readyState} =  return ${VideoTagElem}.readyState;

*** Keywords ***
Check movie is absolute or not
  [Tags]  Check
  Wait Until Element Is Enabled  ${PlayMovie_Watching}
  ${overlay} =  Get Text  ${PlayMovie_Watching}
  Run Keyword If  '${overlay}' == '實況主表示該影片僅適合成人觀看。'  Play primary movie

Play primary movie
  [Tags]  Action
  Click Button  ${PlayMovie_PrimaryButton}

Check The Video is Ready
  FOR  ${i}  IN RANGE  999999
  ${Video_readyState} =  Execute Javascript  ${return_readyState}
  ${VideoIsReady}=  Evaluate  ${Video_readyState} == 4
  Exit For Loop If  ${VideoIsReady}
  Sleep  0.1s
  END
  log  Check The Video is Ready

After play 5s check Video currentTime is 5s and Capture
  [Tags]  Check
  Sleep  5s
  ${Video_currentTime} =  Execute Javascript  ${return_currentTime}
  ${Video_currentTime_int} =  Convert To Integer  ${Video_currentTime}
  Should Be True  ${Video_currentTime_int} >= 5
  Capture Page Screenshot  ${OUTPUTDIR}/AfterPlay5sCapture.png