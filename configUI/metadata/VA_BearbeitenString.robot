*** Settings ***
Resource    ${EXECDIR}/pfad/zur/ressourcen
Suite Setup    Open ConfigUI, upload, start prefiljob and config reset (no browser closing)    configUIURL=${configUIURL}    username=USER_NAME    password=PASS_WD    configPath=CONFIGFILE

*** Variables ***
#global variables 
${OpenAnwendung_Url}    https://anwendung/url
${configUIURL}    https://pfad/zur/config

*** Test Cases ***
Virtuelle Attribute Bearbeiten
    Openmetadata and filter
    Edit vString
    Edit vPicklist
    Edit vObject
    Edit vPrimary
    No Operation
