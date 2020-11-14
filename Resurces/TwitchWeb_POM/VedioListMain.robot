*** Settings ***
Library  SeleniumLibrary
Library  OperatingSystem


*** Variables ***
${VedioListMain_InteracTable_last} =  css=a.tw-interactable:last-child
${OUTPUTDIR} =  ../../Results
${VedioListMain_ResultViews} =  css=a.tw-interactable
${int} =  1

*** Keywords ***
Wait Page Contains Elment of Region About Vedio
  Wait Until Element Is Visible  ${VedioListMain_ResultViews}
  Capture Page Screenshot  ${OUTPUTDIR}/RegionAboutVedio.png

Scroll Element Into View test
  Scroll Element Into View  ${VedioListMain_InteracTable_last}
  Wait Until Element Is Visible  ${VedioListMain_InteracTable_last}

  ${Resultlist_count} =	Get Element Count	${VedioListMain_ResultViews}
  log  ${Resultlist_count} 
  
  Capture Page Screenshot  ${OUTPUTDIR}/ScrollElementIntoView.png



# Scroll Element Into View test
#   FOR  ${i}  IN RANGE  999999
#   Scroll Element Into View  ${VedioListMain_InteracTable_last}
#   Wait Until Element Is Visible  ${VedioListMain_InteracTable_last}

#   ${Resultlist_count} =	Get Element Count	${VedioListMain_ResultViews}
#   log  ${Resultlist_count} 
#   Exit For Loop If  ${Resultlist_count} == 18
#   Log  ${i}
#   END
#   Log  Exited
  
#   Capture Page Screenshot  ${OUTPUTDIR}/ScrollElementIntoView.png
