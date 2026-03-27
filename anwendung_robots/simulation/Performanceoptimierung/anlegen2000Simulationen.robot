*** Settings ***
Resource    ${EXECDIR}/pfad/zur/ressourcen
Suite Setup    Open ConfigUI, upload, start prefiljob and config reset    configUIURL=${configUIURL}    username=USER_NAME    password=PASS_WD    configPath=https://pfad/zur/config5

*** Variables ***
#global variables 
${OpenAnwendung_Url}    https://base/url/pfad/zur/anwendung
${configUIURL}    https://pfad/zur/config6 


*** Test Cases ***
Szenario 124823 Performanceoptimierung für Simulations-Übersichtseite
#Step 1
    Open Anwendung    OpenAnwendungUrl=${OpenAnwendung_Url}
    Open Overview
#Step 2    
    Click    selector=SIM_STATUS_ICON
    Click    selector=SIM_STATUS_POP_UP
    Sleep    2s
    #danach Create Simulation manuell darauf klicken
    FOR    ${index}    IN RANGE    2000
    ${uuid}    Create UUID
    VAR    ${simulationName}    ${uuid}
    Create Simulation    simulationName=${simulationName}
    Wait for Simulation    simulationName=${simulationName}
    Click    selector=//span[text()='${uuid}']
    Sleep    1s
    Click    selector=REMOVE_ICON
    Click    selector=BTN_OK
    END

    FOR    ${index}    IN RANGE    200
    ${uuid}    Create UUID
    VAR    ${simulationName}    ${uuid}
    Create Simulation    simulationName=${simulationName}
    Sleep    5s
    END
    No Operation