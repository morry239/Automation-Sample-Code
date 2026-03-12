*** Settings ***
Resource    ${EXECDIR}/pfad/zur/ressourcen
Suite Setup    Open ConfigUI, upload, start prefiljob and config reset    configUIURL=${configUIURL}    username=user_name    password=PWD    configPath=config.path

*** Variables ***
#global variables 
${orgmanagerURL}    https://url/zum/testumgebung
${configUIURL}    https://url/zum/configoberflaeche 


*** Test Cases ***
#Undo/Redo-Operationen bestimmen und im Log aufnehmen
Undo/Redo mit Objekt anlegen und Simulationlog
    ${uuid}    Create UUID
    VAR    ${SIMULATIONNAME}    ${SIMULATIONNAME}    ${uuid}
    Open Orgmanager    openOrgmanagerUrl=${orgmanagerURL}
    Open Overview
	
#Im Testumgebung eine Simulation erstellen     
    Create Simulation    simulationName=${SIMULATIONNAME}
    Wait for Simulation    simulationName=${SIMULATIONNAME}
    Open Simulation Once Created    simulationName=${SIMULATIONNAME}
    Drag and Trash Object with Confirmation    BoxID=BOX_ID    BoxTyp=BOX_TYPE

#undo für jüngsten Operationen durchführen
    Undo Most Recent Operation
    ${GetRetrievedBox}    Get current Box    BoxID=BOX_ID    BoxTyp=BOX_TYPE
    Get Element States    ${GetRetrievedBox}    then    value & visible
    Get Classes    ${ClickUndoBtnInSim_CSS}    *=    disabled
    Get Classes    ${ClickRedoBtnInSim_CSS}    validate    "disabled" not in value

#im Log überprüfen ob die Undo fertig ist
    SimulationLog Last Step Undone    SimLogValidateText=The last step has been undone.
     ${GetRetrievedBox}    Get current Box    BoxID=BOX_ID    BoxTyp=BOX_TYPE
    Get Element States    ${GetRetrievedBox}    then    value & visible
    Get Classes    ${ClickUndoBtnInSim_CSS}    *=    disabled
    Get Classes    ${ClickRedoBtnInSim_CSS}    validate    "disabled" not in value

#redo für die jüngsten Operation durchführen 
    Redo Most Recent Operation
    SimulationLog Last Step Undone    SimLogValidateText=The last undo has been redone.
     ${GetRetrievedBox}    Get current Box    BoxID=BOX_ID    BoxTyp=BOX_TYPE
    Get Element States    ${GetRetrievedBox}    then    value & visible
    Get Classes    ${ClickUndoBtnInSim_CSS}    validate    "disabled" not in value
    Get Classes    ${ClickRedoBtnInSim_CSS}    *=    disabled
    No Operation

#Attributen ändern 
Undo/Redo mit Attributsänderung und Simulationslog 
    ${uuid}    Create UUID
    VAR    ${SIMULATIONNAME}    ${SIMULATIONNAME}    ${uuid}
    Open Orgmanager    openOrgmanagerUrl=${orgmanagerURL}
    Open Overview
	
#Eine Simulation erstellen aber undo/redo deaktivieren
    Create Simulation    simulationName=${SIMULATIONNAME}
    Wait for Simulation    simulationName=${SIMULATIONNAME}
    Open Simulation Once Created    simulationName=${SIMULATIONNAME} 
    Get Classes    ${ClickUndoBtnInSim_CSS}    *=    disabled
    Get Classes    ${ClickRedoBtnInSim_CSS}    *=    disabled
    
#Texte in der Simulation ändern
    Edit In Simulation    BoxID=BOX_ID    BoxTyp=BOX_TYPE    description=ChangeBOX_TYPE    overwriteDescription=Description
    ${displayDetailView}    Get current Box    BoxID=BOX_ID    BoxTyp=BOX_TYPE
    Click    selector=${displayDetailView}
    Assert Detailview    Attribute=Description    CheckValue=ChangeBOX_TYPE
    Get Classes    ${ClickUndoBtnInSim_CSS}    validate    "disabled" not in value
    Get Classes    ${ClickRedoBtnInSim_CSS}    *=    disabled
	
#Die Änderungen im Log überprüfen 
    SimulationLog Last Step Undone    SimLogValidateText=Attributes of FOBOX_TYPE Global Operations(BOX_ID) were updated.

#Undo nochmal durchführen
    Undo Most Recent Operation
    Click    selector=${displayDetailView}
    Assert Detailview    Attribute=Description    CheckValue=BOX_VALUE
    Get Classes    ${ClickUndoBtnInSim_CSS}    *=    disabled
    Get Classes    ${ClickRedoBtnInSim_CSS}    validate    "disabled" not in value
	
#Die Änderungen im Log nochmal überprüfen     
    SimulationLog Last Step Undone    SimLogValidateText=The last step has been undone.

#Redo nochmal durchführen    
    Redo Most Recent Operation
    Click    selector=${displayDetailView}
    Assert Detailview    Attribute=Description    CheckValue=ChangeBOX_TYPE
    Get Classes    ${ClickUndoBtnInSim_CSS}    validate    "disabled" not in value
    Get Classes    ${ClickRedoBtnInSim_CSS}    *=    disabled  

#Die Änderungen im Log nochmal überprüfen    
    SimulationLog Last Step Undone    SimLogValidateText=The last undo has been redone.
    No Operation

Undo/Redo mit suchen nach gelöschten Objekten mit Simulationslog
    ${uuid}    Create UUID
    VAR    ${SIMULATIONNAME}    ${SIMULATIONNAME}    ${uuid}
    Open Orgmanager    openOrgmanagerUrl=${orgmanagerURL}
    Open Overview

#Eine Simulation erstellen      
    Create Simulation    simulationName=${SIMULATIONNAME}
    #Wait for Simulation    simulationName=${SIMULATIONNAME}
    Open Simulation Once Created    simulationName=${SIMULATIONNAME}

#Objekte per Drag und Drop löschen in der Anwendung
    Drag and Trash Object with Confirmation    BoxID=BOX_ID    BoxTyp=BOX_TYPE
    ${GetDeletedBox}    Get current Box    BoxID=BOX_ID    BoxTyp=BOX_TYPE     
    Get Element States    ${GetDeletedBox}    then    value & visible 
    SimulationLog Last Step Undone    SimLogValidateText=The Object was deleted.

#Undo durchführen
    Undo Most Recent Operation
    ${GetRetrievedBox}    Get current Box    BoxID=BOX_ID    BoxTyp=BOX_TYPE
    Get Element States    ${GetRetrievedBox}    then    value & visible
    Get Classes    ${ClickUndoBtnInSim_CSS}    *=    disabled
    Get Classes    ${ClickRedoBtnInSim_CSS}    validate    "disabled" not in value
    SimulationLog Last Step Undone    SimLogValidateText=The last step has been undone.
	
#Redo durchführen	
    Redo Most Recent Operation
    ${GetDeletedBox}    Get current Box    BoxID=BOX_ID    BoxTyp=BOX_TYPE     
    Get Element States    ${GetDeletedBox}    then    value & visible 
    Get Classes    ${ClickUndoBtnInSim_CSS}    validate    "disabled" not in value
    Get Classes    ${ClickRedoBtnInSim_CSS}    contains    disabled
    #Verify That ${ClickRedoBtnInSim_CSS} contains disabled
    SimulationLog Last Step Undone    SimLogValidateText=The last undo has been redone.
    No Operation   






