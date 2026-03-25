*** Settings ***
Documentation       Test suite for the sf library

Library             RPA.HTTP
Library             Collections

Test Tags           sf


*** Variables ***
${ANWENDUNGURL}      https://base/url
${USERNAME}         USERNAME
${PASSWORD}         ${EMPTY}


*** Test Cases ***
First Login
    VAR    &{csrfFetchHeaders}    x-csrf-token=Fetch
    VAR    &{loginBody}    username=${USERNAME}    password=${PASSWORD}    url=https://base/url/pfad/zur/anwendung
    VAR    &{emptyDictornary}

    ${responseSFSession}    POST    url=http://localhost:8080    data=${loginBody}
    Set To Dictionary    ${csrfFetchHeaders}    Cookie=SESSION=${responseSFSession.text}

    ${responseSFCsrf}    GET    url=https://base/url/public/api/csrf    headers=${csrfFetchHeaders}

    VAR    &{loggedHeaders}    Cookie=SESSION=${responseSFSession.text}    x-csrf-token=${responseSFCsrf.headers}[x-csrf-token]
    Create Session    alias=sfLogin    url=https://base/url    headers=${loggedHeaders}

    VAR    @{perspectives}    default
    VAR    &{simulationRequestBody}
    ...    Description=MyFirstSimulation
    ...    Date=2025-05-14
    ...    RootObjectId=${None}
    ...    rootType=${None}
    ...    perspective=SimulationOverview
    ...    CanRead=${True}
    ...    CanWrite=${True}
    ...    IsAdmin=${True}
    ...    createFromPreloaded=${True}
    ...    perspectives=${perspectives}
    ...    comment=${emptyDictornary}

    POST On Session    alias=sfLogin    url=https://base/url/public/api/simulation    json=${simulationRequestBody}

    No Operation
