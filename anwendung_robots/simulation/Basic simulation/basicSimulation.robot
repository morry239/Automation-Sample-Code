*** Settings ***
Resource    ${EXECDIR}/pfad/zur/ressourcen


*** Variables ***
#global variables 
${configUIURL}    /pfad/zur/config
${OpenAnwendung_Url}    https://base/url/pfad/zur/anwendung 


*** Test Cases ***
Testcase Simulation erstellen Config
    ${uuid}    Create UUID
    VAR    ${SIMULATIONNAME}    ${SIMULATIONNAME}    ${uuid}
    Open Anwendung    OpenAnwendungUrl=${OpenAnwendung_Url}
    Open Overview
    Create Simulation    simulationName=${SIMULATIONNAME}
    Sleep    5s
    #Wait for Simulation    simulationName=${SIMULATIONNAME}
    Open Simulation Once Created    simulationName=${SIMULATIONNAME}
    Double Click Current Box    BoxID=NumBox    BoxTyp=ObjMain
    Edit In Simulation    BoxID=NumBox    BoxTyp=ObjMain    description=Pusheen    overwriteDescription=Description
    Drag and Drop Object    DragBoxID=NumBox   DragBoxTyp=ObjMain    DropBoxID=NumBox    DropBoxTyp=ObjMain
    Drag and Trash Object    BoxID=NumBox    BoxTyp=ObjMain
    Edit In Simulation    BoxID=NumBox    BoxTyp=ObjMain    description=Pastelpusheen    overwriteDescription=Description
    #Edit In Simulation    BoxID=NumBox    BoxTyp=ObjSub    description=Num    overwriteDescription=Desc
    No Operation