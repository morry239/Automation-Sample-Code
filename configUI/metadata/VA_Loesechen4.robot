*** Settings ***
Resource    ${EXECDIR}/pfad/zur/ressourcen
Suite Setup    Open ConfigUI, upload, start prefiljob and config reset (no browser closing)    configUIURL=${configUIURL}    username=USER_NAME    password=PASS_WD    configPath=CONFIG_FILE_PATH

*** Variables ***
#global variables 
${OpenAnwendung_Url}    https://anwendung/url
${configUIURL}    https://config/url#/ 

*** Test Cases ***
Virtuelle Attributen löschen
    Openmetadata and filter, remove attribut
    No Operation