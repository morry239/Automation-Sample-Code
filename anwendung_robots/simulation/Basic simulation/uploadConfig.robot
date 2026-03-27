*** Settings ***
Library    Browser
Resource    ${EXECDIR}/pfad/zur/ressourcen


*** Variables ***
#global variables 
${configUIURL}    https://pfad/zur/config

*** Test Cases ***
Upload, Prefiljob initialisation, and Config Reset in ConfigUI
    Open ConfigUI, upload, start prefiljob and config reset    configUIURL=${configUIURL}    username=USER_NAME    password=PASS_WD    configPath=https://pfad/zur/config4
    No Operation

