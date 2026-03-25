*** Settings ***
Resource    ${EXECDIR}/pfad/zur/ressourcen
Suite Setup    Open ConfigUI, upload, start prefiljob and config reset (no browser closing)    configUIURL=${configUIURL}    username=USER_NAME    password=PASS_WD    configPath=CONFIG_FILE_PATH

*** Variables ***
#global variables 
${OpenAnwendung_Url}    https://anwendung/url
${configUIURL}    https://config/url#/ 

*** Test Cases ***
Virtuelle Attribute als Picklist anlegen
    #OpenMetadata
    vPicklistYesNoAnlegen    pickListTypeIndex=0
    vPicklistYesNoV2Anlegen    pickListTypeIndex=0
    vPicklistMajorAnlegen    pickListTypeIndex=0
    SelectFODepDataType and filter
    Show PicklistValue
    No Operation

Virtuelle Attribute als Picklist anlegen
    #OpenMetadata
    vPicklistYesNoAnlegen    pickListTypeIndex=1
    vPicklistYesNoV2Anlegen    pickListTypeIndex=1
    vPicklistMajorAnlegen    pickListTypeIndex=1
    SelectFODepDataType and filter
    Show PicklistValue
    No Operation  