*** Settings ***
Resource    ${EXECDIR}/pfad/zur/ressourcen
Suite Setup    Open ConfigUI, upload, start prefiljob and config reset    configUIURL=${configUIURL}    username=USER_NAME    password=PASS_WD    configPath=121276_backup120825_DotNetCore_25.06.5.w4sf

*** Variables ***
#global variables 
${OpenAnwendung_Url}    https://anwendung/url
${configUIURL}    https://config/url 

*** Test Cases ***
Kästchenfarben von Objekten ändern bei keinen untergeordneten Kinderitems
    Open Anwendung    OpenAnwendungUrl=${OpenAnwendung_Url}
    Click    selector=//span[@class='CLASS' and text()='Standard']
    Click    selector=//li[@role='option' and text()='DROPDOWN_OPTION']
    Type Text    selector=input_sse    txt=TXT_Number
    Click    selector=SELECTOR_WRAP
    Sleep    2s
    Get Style    selector=STYLESTR
    No Operation

Braunen Rahmen bei allen Objekten
    Open Anwendung    OpenAnwendungUrl=${OpenAnwendung_Url}
    Click    selector=//span[@class='CLASS' and text()='Standard']
    Click    selector=//li[@role='option' and text()='DROPDOWN_OPTION']
    Click    selector=//div[@class='PropertyTXT' and text()='1']
    Sleep    2s
    No Operation

Attribute von ObjektBox abweichend anzeigen bei aktivierten Visualisierungsregeln
    Open Anwendung    OpenAnwendungUrl=${OpenAnwendung_Url}
    Click    selector=//span[@class='CLASS' and text()='Standard']
    Click    selector=//li[@role='option' and text()='DROPDOWN_OPTION2']
    Sleep    2s
    No Operation

Abweichendes Tooltip bei auf der Zelle gesetzter Mauszeiger
    Open Anwendung    OpenAnwendungUrl=${OpenAnwendung_Url}
    Click    selector=//span[@class='CLASS' and text()='Standard']
    Click    selector=//li[@role='option' and text()='DROPDOWN_OPTION2']
    #zeile 40 ansprechen und auf boxselector hovern
    Click    selector=TB_has_TEXT
    Hover    selector=//div[@data-cellid=NUM and text()=NUM]
    Sleep    2s
    No Operation

Zelleinhalte löschen in ObjektBox
    Open Anwendung    OpenAnwendungUrl=${OpenAnwendung_Url}
    Click    selector=//span[@class='CLASS' and text()='Standard']
    Click    selector=//li[@role='option' and text()='DROPDOWN_OPTION2']
    Click    selector=TB_has_TEXT
    Click    selector=ZOOMING
    #Sicherstellen, dass die BOX-Werte die Anforderungen entsprechen
    Get current Box    BoxID=BOXID    BoxTyp=Objekt
    Get current Box    BoxID=BOXID    BoxTyp=Objekt
    Get current Box    BoxID=BOXID    BoxTyp=Objekt
    Sleep    2s
    No Operation

Die Schriftgröße bei ObjektBoxen mit untergeordneten Kindboxen verringern
    Open Anwendung    OpenAnwendungUrl=${OpenAnwendung_Url}
    Click    selector=//span[@class='CLASS' and text()='Standard']
    Click    selector=//li[@role='option' and text()='DROPDOWN_OPTION2']
    Get current Box    BoxID=BOXID    BoxTyp=Objekt
    Get current Box    BoxID=BOXID    BoxTyp=Objekt
    Get current Box    BoxID=BOXID    BoxTyp=Objekt
    Sleep    2s
    No Operation

Die Schriftart in der ObjektBox ändern bei der letzten Ebene mit Kindern
    Open Anwendung    OpenAnwendungUrl=${OpenAnwendung_Url}
    Click    selector=//span[@class='CLASS' and text()='Standard']
    Click    selector=//li[@role='option' and text()='DROPDOWN_OPTION2']
    Get current Box    BoxID=BOXID    BoxTyp=Objekt
    Sleep    2s
    No Operation

Durchschnittwert als Tooltip in ObjektBoxen anzeigen lassen
    Open Anwendung    OpenAnwendungUrl=${OpenAnwendung_Url}
    Click    selector=//span[@class='CLASS' and text()='Standard']
    Click    selector=//li[@role='option' and text()='DROPDOWN_OPTION2']
    Click    selector=TB_has_TEXT
    Hover    selector=//div[@data-cellid=NUM and text()=NUM]