*** Settings ***
Resource    ${EXECDIR}/pfad/zur/ressourcen
Suite Setup    Open ConfigUI, upload, start prefiljob and config reset    configUIURL=${configUIURL}    username=USER_NAME    password=PASS_WD    configPath=CONFIG_PATH
*** Variables ***
#global variables 
${OpenAnwendung_Url}    https://base/url/pfad/zur/anwendung
${configUIURL}    https://path/zur/config


*** Test Cases ***
Undo/Redo mit Objekt anlegen und Simulationlog
    ${uuid}    Create UUID
    VAR    ${SIMULATIONNAME}    ${SIMULATIONNAME}    ${uuid}
    Open Anwendung    OpenAnwendungUrl=${OpenAnwendung_Url}
    Open Overview
#Step 2    
    Create Simulation    simulationName=${SIMULATIONNAME}
    Wait for Simulation    simulationName=${SIMULATIONNAME}
    Open Simulation Once Created    simulationName=${SIMULATIONNAME}
    Drag and Trash Object with Confirmation    BoxID=BOX_NUM    BoxTyp=OBJ_MAIN
#Steps 3, 4, and 5, 6
    Undo Most Recent Operation
    ${GetRetrievedBox}    Get current Box    BoxID=BOX_NUM    BoxTyp=OBJ_MAIN
    Get Element States    ${GetRetrievedBox}    then    value & visible
    Get Classes    ${ClickUndoBtnInSim_CSS}    *=    disabled
    Get Classes    ${ClickRedoBtnInSim_CSS}    validate    "disabled" not in value

    SimulationLog Last Step Undone    SimLogValidateText=The last step has been undone.
     ${GetRetrievedBox}    Get current Box    BoxID=BOX_NUM    BoxTyp=OBJ_MAIN
    Get Element States    ${GetRetrievedBox}    then    value & visible
    Get Classes    ${ClickUndoBtnInSim_CSS}    *=    disabled
    Get Classes    ${ClickRedoBtnInSim_CSS}    validate    "disabled" not in value

    Redo Most Recent Operation
    SimulationLog Last Step Undone    SimLogValidateText=The last undo has been redone.
     ${GetRetrievedBox}    Get current Box    BoxID=BOX_NUM    BoxTyp=OBJ_MAIN
    Get Element States    ${GetRetrievedBox}    then    value & visible
    Get Classes    ${ClickUndoBtnInSim_CSS}    validate    "disabled" not in value
    Get Classes    ${ClickRedoBtnInSim_CSS}    *=    disabled
    No Operation

Undo/Redo mit Attributsänderung und Simulationslog
    ${uuid}    Create UUID
    VAR    ${SIMULATIONNAME}    ${SIMULATIONNAME}    ${uuid}
    Open Anwendung    OpenAnwendungUrl=${OpenAnwendung_Url}
    Open Overview
#step 2
    Create Simulation    simulationName=${SIMULATIONNAME}
    Wait for Simulation    simulationName=${SIMULATIONNAME}
    Open Simulation Once Created    simulationName=${SIMULATIONNAME}
#step 3       
    Get Classes    ${ClickUndoBtnInSim_CSS}    *=    disabled
    Get Classes    ${ClickRedoBtnInSim_CSS}    *=    disabled
    
#step 4
        
    Edit In Simulation    BoxID=BOX_NUM    BoxTyp=OBJ_MAIN    description=ChangeOBJ_MAIN    overwriteDescription=Description
    ${displayDetailView}    Get current Box    BoxID=BOX_NUM    BoxTyp=OBJ_MAIN
    Click    selector=${displayDetailView}
    Assert Detailview    Attribute=Description    CheckValue=ChangeOBJ_MAIN
    Get Classes    ${ClickUndoBtnInSim_CSS}    validate    "disabled" not in value
    Get Classes    ${ClickRedoBtnInSim_CSS}    *=    disabled
#steps 5 und 6    
    SimulationLog Last Step Undone    SimLogValidateText=Attributes of Objekt Global Operations(BOX_NUM) were updated.
#step 7    
    Undo Most Recent Operation
    Click    selector=${displayDetailView}
    Assert Detailview    Attribute=Description    CheckValue=Global Operations
    Get Classes    ${ClickUndoBtnInSim_CSS}    *=    disabled
    Get Classes    ${ClickRedoBtnInSim_CSS}    validate    "disabled" not in value
#step 8     
    SimulationLog Last Step Undone    SimLogValidateText=The last step has been undone.
#step 9    
    Redo Most Recent Operation
    Click    selector=${displayDetailView}
    Assert Detailview    Attribute=Description    CheckValue=ChangeOBJ_MAIN
    Get Classes    ${ClickUndoBtnInSim_CSS}    validate    "disabled" not in value
    Get Classes    ${ClickRedoBtnInSim_CSS}    *=    disabled  
#step 10    
    SimulationLog Last Step Undone    SimLogValidateText=The last undo has been redone.
    No Operation

111925 Undo/Redo mit suchen nach gelöschten Objekten mit Simulationslog
    ${uuid}    Create UUID
    VAR    ${SIMULATIONNAME}    ${SIMULATIONNAME}    ${uuid}
    Open Anwendung    OpenAnwendungUrl=${OpenAnwendung_Url}
    Open Overview
#step 2     
    Create Simulation    simulationName=${SIMULATIONNAME}
    #Wait for Simulation    simulationName=${SIMULATIONNAME}
    Open Simulation Once Created    simulationName=${SIMULATIONNAME}
#step 3
    Drag and Trash Object with Confirmation    BoxID=BOX_NUM    BoxTyp=OBJ_MAIN
    ${GetDeletedBox}    Get current Box    BoxID=BOX_NUM    BoxTyp=OBJ_MAIN     
    Get Element States    ${GetDeletedBox}    then    value & visible 
    SimulationLog Last Step Undone    SimLogValidateText=Objekt Global Operations(BOX_NUM) was deleted.

    Undo Most Recent Operation
    ${GetRetrievedBox}    Get current Box    BoxID=BOX_NUM    BoxTyp=OBJ_MAIN
    Get Element States    ${GetRetrievedBox}    then    value & visible
    Get Classes    ${ClickUndoBtnInSim_CSS}    *=    disabled
    Get Classes    ${ClickRedoBtnInSim_CSS}    validate    "disabled" not in value
    SimulationLog Last Step Undone    SimLogValidateText=The last step has been undone.
    Redo Most Recent Operation
    ${GetDeletedBox}    Get current Box    BoxID=BOX_NUM    BoxTyp=OBJ_MAIN     
    Get Element States    ${GetDeletedBox}    then    value & visible 
    Get Classes    ${ClickUndoBtnInSim_CSS}    validate    "disabled" not in value
    Get Classes    ${ClickRedoBtnInSim_CSS}    contains    disabled
    #Verify That ${ClickRedoBtnInSim_CSS} contains disabled
    SimulationLog Last Step Undone    SimLogValidateText=The last undo has been redone.
    No Operation   





