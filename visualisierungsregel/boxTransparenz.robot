*** Settings ***
Resource    ${EXECDIR}/resources
Suite Setup    Open ConfigUI, upload, start prefiljob and config reset    configUIURL=${configUIURL}    username=USER_NAME    password=PASSWD    configPath=CFGPATH
Variables    ../VAL.yaml   

*** Variables ***
#global variables 

#gesamte OrgChartAnsicht eingrenzen
${LOCATOR_ORGCHART}  .ap_OrgChart
${LOCATOR_OBJEKT}   ${LOCATOR_ORGCHART} >> //table[contains(., 'Object Name')]
${anwendungURL}    https://anwendung/url/html
${configUIURL}    https://config/public/
${objekt1OperationsA}    [id="ID"] .constructor 
${Objekt2_A}    [id="ID"] .constructor
${Objekt3_A}    [id="ID"] .constructor
${Objekt4_C}    [id="ID"] .constructor
${borderRadius_Objekt_9}   [id="ID"] .constructor
${borderRadius_Objekt_10}    [id="ID"] .constructor
${border_Objekt11}    [id="ID"] .constructor
${Object12Val}    [id="ID"] .constructor
${objekt11_E}    [id="ID"] .constructor
${CLOVal}    [id="ID"] .constructor

*** Test Cases ***
Visualisierungsregel: Box Transparenz 
    Open Anwendung    OpenAnwendungUrl=${OpenAnwendung_Url}
    Type Text    selector=TRANSPARENZ_BOX    txt=TXT_Number
    Click    selector=CLICKSELECTOR    
    ${getStyleOperationsA}    Get Style    selector=${Objekt2_A}      key=opacity    
    Should Contain     container=${getStyleOperationsA}    item=${getStyleOperationsA}
    ${getStyleObjekt2}    Get Style    selector=${Objekt4_C}     key=opacity
    Should Contain    container=${getStyleObjekt2}    item=${getStyleObjekt2}
    Type Text    selector=INPUTSEARCH    txt=TXT_Number
    Click    selector=CLICKSELECTOR
    ${getStyleOperations23}    Get Style    selector=${borderRadius_Objekt_10}     key=opacity
    Should Contain    container=${getStyleOperations23}     item=${getStyleOperations23} 
    ${getStyleSales_88}    Get Style    selector=${Object12Val}    key=opacity
    Should Contain    container=${getStyleSales_88}     item=${getStyleSales_88} 
    Sleep    2s
    No Operation

Visualisierungsregel: Box Rahmenstill    
    Open Anwendung    OpenAnwendungUrl=${OpenAnwendung_Url}
    Type Text    selector=INPUTSEARCH    txt=TEXT_NUM
    Click    selector=CLICKSELECTOR
    Type Text    selector=INPUTSEARCH    txt=TEXT_NUM
    Click    selector=CLICKSELECTOR
    FOR    ${borderstylearrayobject}    IN    @{borderStyleArrayObjects}    
        ${IterateGetstyleBorder}    Get Style    selector=${borderstylearrayobject.selector}    key=border-style
        Should Contain    container=${IterateGetstyleBorder}    item=${IterateGetstyleBorder}
    END
    Log    Exited
    Sleep    2s
    No Operation

Visualisierungsregel: Box Abrundungen 
    Open Anwendung    OpenAnwendungUrl=${OpenAnwendung_Url}
    Type Text    selector=INPUTSEARCH    txt=TEXT_NUM
    Click    selector=SELECTQUERY
    ${checkValA_B}    Get Style    selector=${borderRadiusEngineeringSe}    key=border-radius
    Should Contain    container=${checkValA_B}     item=${checkValA_B} 
    ${checkValC_B}    Get Style    selector=${borderRadiusPlanungSe}    key=border-radius
    Should Contain    container=${checkValC_B}    item=${checkValC_B}
    ${checkValPdA}    Get Style    selector=${border_Objekt11}    key=border-radius
    Should Contain    container=${checkValPdA}    item=${checkValPdA}
    Sleep    2s
    No Operation

Visualisierungsregel: Box Shatten
    Open Anwendung    OpenAnwendungUrl=${OpenAnwendung_Url}
    Type Text    selector=INPUTSEARCH    txt=TEXT_NUM
    Click    selector=SELECTQUERY
    ${checkBoxShadowProdCA}    Get Style    selector=${productionCAVal}    key=box-shadow
    Should Contain    container=${checkBoxShadowProdCA}    item=${checkBoxShadowProdCA}
    Type Text    selector=INPUTSEARCH    txt=TEXT_NUM
    Click    selector=SELECTQUERY
    ${checkBoxShadowTM}    Get Style    selector=${objekt11_E}    key=box-shadow
    Should Contain    container=${checkBoxShadowTM}    item=${checkBoxShadowTM}
    Type Text    selector=INPUTSEARCH    txt=TEXT_NUM
    Click    selector=SELECTQUERY
    ${checkBoxShadowCLO}    Get Style    selector=${CLOVal}    key=box-shadow
    Should Contain    container=${checkBoxShadowCLO}    item=${checkBoxShadowCLO}
    Sleep    2s
    No Operation

Visualisierungsregel: Box Farben
    Open Anwendung    OpenAnwendungUrl=${OpenAnwendung_Url}
    Click    selector=ICONZOOM
    Type Text    selector=INPUTQS    txt=TEXT_NUM
    Click    selector=SELECTQUERY
    FOR    ${schriftNameLastName}    IN    @{schriftNameLastNames}
        ${getStyleOpSWE}    Get style    selector=${schriftNameLastName.selector}    key=color
        Should Contain    container=${getStyleOpSWE}    item=${getStyleOpSWE}
    END
    Sleep    2s
    No Operation

Visualisierungsregel: Box Schriftfarbe
    Open Anwendung    OpenAnwendungUrl=${OpenAnwendung_Url}
    Click    selector=ICONZOOM
    Type Text    selector=INPUTQS    txt=TEXT_NUM
    Click    selector=SELECTQUERY
    ${getSelectWhiteOBJ2}    Get Style    ${LOCATOR_BOX_LEADERSHIPDD}    key=color
    ${getSelectWhiteOBJ3}    Get Style    ${LOCATOR_BOX_LEADERSHIPDD}    key=color
    Should Be Equal    first=${getSelectWhiteOBJ2}    second=${getSelectWhiteOBJ3}
    No Operation

    
    