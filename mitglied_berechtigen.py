from keywords_automatisierung import *
from playwright.sync_api import sync_playwright
from dotenv import load_dotenv
import time
import os

load_dotenv("C:/Benutzername/Geraet/Projekt/py.env")

tm_admin_pwd = os.getenv("TM_ADMIN_PWD")

tm_url = TM_URL
emailadresse_tm_admin = ADMIN_EMAIL
tenant_name = TENANT_NAME
tenant_list = ['Tenant 1', 'Tenant 2', 'Tenant 3', 'Tenant 4','Tenant 5']

qs_team_member_list = ['Mitglied 1','Mitglied 2','Mitglied 3','Mitglied 4','Mitglied 5']

qs_team_member_list_copy = [qts for qts in qs_team_member_list]

#Benutzerkennung eintippen und in der Webanwendung einloggen 
def loginToTM(page):
    page.fill(LOGIN_FORMAT, emailadresse_tm_admin)
    page.click(INPUT_BTN)
    page.fill(PWD_INPUT, tm_admin_pwd)
    page.click(PWD_INPUT_FIELD)
    page.click(BTN_YES)

#Chromium-Browser öffnen
def open_chromium_browser(playwright, url):
    browser = playwright.chromium.launch(headless=False)
    context = browser.new_context(viewport={"width": 1920, "height": 1080})
    page = context.new_page()
    page.goto(url)

    loginToTM(page)

    return browser, page    

#Bestimmte Benutzer Zugriff auf der Anwendung geben
def qs_mitglied_als_contributor_berechtigen(page, row):
    page.locator(OPEN_WEBSITE).click()
    page.click(NAVIGATE_TO_PAGE1)
    page.click(NAVIGATE_TO_PAGE2)    
    page.click(CLICK_TENANT_NAME)
    for name in qs_team_member_list_copy:
        page.click(OPEN_DROPDOWN)
        page.click(CLICK_CONFIRM)
        page.fill(ENTER_TEAM_MEMBER_NAME, name)    
        page.click(SELECT_NAME)
        page.click(GRANT_ACCESS)

#die ganze Automatisierung starten
def tm_startup():
    with sync_playwright() as playwright:
        browser, page = open_chromium_browser(playwright, tm_url)
        for row in tenant_list:
            qs_mitglied_als_contributor_berechtigen(page, row)

tm_startup()      
