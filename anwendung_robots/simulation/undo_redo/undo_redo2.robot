*** Settings ***
Resource    ${EXECDIR}/pfad/zur/ressourcen
Suite Setup    Open ConfigUI, upload, start prefiljob and config reset    configUIURL=${configUIURL}    username=USER_NAME    password=PASS_WD    configPath=https://path/zur/config

*** Variables ***
#global variables 
${OpenAnwendung_Url}    https://base/url/pfad/zur/anwendung
${configUIURL}    https://path/zur/config

*** Test Cases ***
Undo/Redo mit suchen nach gelöschten Objekten
    ${uuid}    Create UUID
    VAR    ${SIMULATIONNAME}    ${SIMULATIONNAME}    ${uuid}
    Open Anwendung    OpenAnwendungUrl=${OpenAnwendung_Url}
    Open Overview
#Step 2    
    Create Simulation    simulationName=${SIMULATIONNAME}
    Wait for Simulation    simulationName=${SIMULATIONNAME}
    Open Simulation Once Created    simulationName=${SIMULATIONNAME}
#Step 3
         
    Drag and Trash Object with Confirmation    BoxID=OBJ_NUM    BoxTyp=OBJ_MAIN
    ${GetDeletedBox}    Get current Box    BoxID=OBJ_NUM    BoxTyp=OBJ_MAIN
    Get Element States    ${GetDeletedBox}    then    value & visible 
    Get Classes    ${ClickUndoBtnInSim_CSS}    validate    "disabled" not in value
    Get Classes    ${ClickRedoBtnInSim_CSS}    *=    disabled
#Step 4    
    Initiate Quicksearch    SearchInput=OBJ_NUM
#Step 5    
    Undo Most Recent Operation
    ${GetRetrievedBox}    Get current Box    BoxID=OBJ_NUM    BoxTyp=OBJ_MAIN
    Get Element States    ${GetRetrievedBox}    then    value & visible
    Get Classes    ${ClickUndoBtnInSim_CSS}    *=    disabled
    Get Classes    ${ClickRedoBtnInSim_CSS}    validate    "disabled" not in value
#Step 6    
    Initiate Quicksearch    SearchInput=OBJ_NUM
#Step 7
    ${GetDeletedBox}    Get current Box    BoxID=OBJ_NUM    BoxTyp=OBJ_MAIN    
    Redo Most Recent Operation
    Get Element States    ${GetDeletedBox}    then    value & visible
    Get Classes    ${ClickUndoBtnInSim_CSS}    validate    "disabled" not in value
    Get Classes    ${ClickRedoBtnInSim_CSS}    *=    disabled 
    No Operation