*** Settings ***
Resource    ${EXECDIR}/pfad/zur/ressourcen
Suite Setup    Open ConfigUI, upload, start prefiljob and config reset    configUIURL=${configUIURL}    username=user_name    password=PWD    configPath=config.path

*** Variables ***
#global variables 
${TestanwendungURL}    https://url/zum/testumgebung
${configUIURL}    https://url/zum/configoberflaeche

*** Test Cases ***
Kästchenfarben von Testanwendungen ändern bei keinen untergeordneten Kinderitems
    Open Testanwendung    openTestanwendungUrl=${TestanwendungURL}
    Click    selector=SELECT_STANDARD
    Click    selector=SELECT_DROPDOWN
    Type Text    selector=INPUT_SELECTOR    txt=USER_INPUT
    Click    selector=CLICK_PANEL
    Sleep    2s
    Get Style    selector=SELECT_STYLE
    No Operation

Braunen Rahmen bei allen Testanwendungen 
    Open Testanwendung    openTestanwendungUrl=${TestanwendungURL}
    Click    selector=SELECT_TEXT_STANDARD
    Click    selector=SELECT_DROPDOWN
    Click    selector=PROPERTY_TEXT
    Sleep    2s
    No Operation

Attribute von Objekt abweichend anzeigen bei aktivierten Visualisierungsregeln
    Open Testanwendung    openTestanwendungUrl=${TestanwendungURL}
    Click    selector=SELECT_STANDARD
    Click    selector=SELECT_DROPDOWN
    Sleep    2s
    No Operation

Abweichendes Tooltip bei auf der Zelle gesetzter Mauszeiger einstellen
    Open Testanwendung    openTestanwendungUrl=${TestanwendungURL}
    Click    selector=SELECT_STANDARD
    Click    selector=SELECT_DROPDOWN
    Click    selector=SELECT_1
    Hover    selector=SELECT_69
    Sleep    2s
    No Operation

Zelleinhalte in Objekt löschen
    Open Testanwendung    openTestanwendungUrl=${TestanwendungURL}
    Click    selector=SELECT_STANDARD
    Click    selector=SELECT_DROPDOWN
    Click    selector=SELECT_1
    Click    selector=SELECT_ZOOMTOFIT
    Get current Box    BoxID=BOX_ID    BoxTyp=BOX_TYPE
    Get current Box    BoxID=BOX_ID    BoxTyp=BOX_TYPE
    Get current Box    BoxID=BOX_ID    BoxTyp=BOX_TYPE
    #prüfe werte vom Testanwendung
    Sleep    2s
    No Operation

Die verringerte Schriftgröße bei Objekten mit untergeordneten Kindboxen anpassen
    Open Testanwendung    openTestanwendungUrl=${TestanwendungURL}
    Click    selector=SELECT_STANDARD
    Click    selector=SELECT_OPTION_DROPDOWN
    Get current Box    BoxID=BOX_ID    BoxTyp=BOX_TYPE
    Get current Box    BoxID=BOX_ID    BoxTyp=BOX_TYPE
    Get current Box    BoxID=BOX_ID    BoxTyp=BOX_TYPE
    Sleep    2s
    No Operation

Die Schriftart des Testanwendunges ändern bei der letzten Ebene mit Kindern anspassen 
    Open Testanwendung    openTestanwendungUrl=${TestanwendungURL}
    Click    selector=SELECT_STANDARD
    Click    selector=SELECT_OPTION
    Get current Box    BoxID=BOX_ID    BoxTyp=BOX_TYPE
    Sleep    2s
    No Operation

Durchschnittwert als Tooltip in Objekten anzeigen lassen
    Open Testanwendung    openTestanwendungUrl=${TestanwendungURL}
    Click    selector=SELECT_STANDARD
    Click    selector=SELECT_OPTION
    Click    selector=TEXT_1
    Hover    selector=TEXT_69


